local Ki = spoon.Ki
local Spotify = Ki.defaultEntities.entity.Spotify
local RESTClient = require("lib/rest-client")
local AsyncSearchMixin = require("ki-entities/async-search")

Spotify.class:include(AsyncSearchMixin)

local apiEndpoint = "https://api.spotify.com/v1"
local authEndpoint = "https://accounts.spotify.com"
Spotify.userID = RESTClient.getEnvironmentVariable("SPOTIFY_USER")
Spotify.clientID = RESTClient.getEnvironmentVariable("SPOTIFY_CLIENT_ID")
Spotify.clientSecret = RESTClient.getEnvironmentVariable("SPOTIFY_CLIENT_SECRET")

-- Attach Spotify API and auth REST Client instances:
-- https://developer.spotify.com/documentation/general/guides/
Spotify.authClient = RESTClient(authEndpoint)
Spotify.apiClient = RESTClient(apiEndpoint)

local scopes = {
    "user-read-playback-state",
    "user-modify-playback-state",
    "user-read-currently-playing",
    "streaming",
    "app-remote-control",
    "user-read-email",
    "user-read-private",
    "playlist-read-collaborative",
    "playlist-modify-public",
    "playlist-read-private",
    "playlist-modify-private",
    "user-library-modify",
    "user-library-read",
    "user-top-read",
    "user-read-playback-position",
    "user-read-recently-played",
    "user-follow-read",
    "user-follow-modify",
}

function Spotify.createAuthCallbackHandler(state, callback)
    local pathRegex = "/(.*)?.*"

    return function(requestMethod, path)
        if requestMethod == "GET" and path:match(pathRegex) == "callback" then
            local authorizationCode = ""

            -- Parse the path query parameters
            local urlParts = hs.http.urlParts(path)
            local queryItems = urlParts.queryItems

            for _, item in pairs(queryItems) do
                -- Check for errors or invalid state
                if item.error then return callback(item.error) end
                if item.state and item.state ~= state then
                    return callback("Invalid state: "..item.state)
                end

                -- Retrieve authorization code
                if item.code then authorizationCode = item.code end
            end

            return callback(nil, authorizationCode)
        end

        return callback("Unexpected path "..path)
    end
end

-- Start up an ephemeral auth server
function Spotify:createAuthServer(interface, port, state, webview, onAuthorizationCode)
    local authserver = hs.httpserver.new()

    local function callback(...)
        local response = { self.createAuthCallbackHandler(state, onAuthorizationCode)(...) }
        authserver:stop()
        webview:hide(0.5)
        return table.unpack(response)
    end

    authserver
        :setCallback(callback)
        :setInterface(interface)
        :setPort(port)

    return authserver
end

function Spotify.createAuthorizeWebview(url)
    local view = hs.webview.newBrowser({ x = 0, y = 0, w = 0, h = 0 })
        :windowStyle({ "utility", "titled", "closable" })
        :level(hs.drawing.windowLevels.modalPanel)
        :deleteOnClose(true)
        :darkMode(true)
        :shadow(true)
        :url(url)

    local frame = hs.screen.mainScreen():fullFrame()
    view:frame({
        x = frame.x + frame.w * 0.7 / 2,
        y = frame.y + frame.h * 0.5 / 2,
        w = frame.w * 0.3,
        h = frame.h * 0.5,
    })

    return view
end

function Spotify:fetchUserID(callback)
    self.apiClient:get("/me", nil, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success then
            return self.notifyError("Failed to request user info (status "..status..")", hs.inspect(response))
        end

        callback(response.id)
    end)
end

-- Request refresh and access tokens and create API client
function Spotify:createAPIClient(redirectURI, authorizationCode)
    local formData = {
        grant_type = "authorization_code",
        redirect_uri = hs.http.encodeForQuery(redirectURI),
        code = authorizationCode,
    }
    local headers = {
        ["Content-Type"] = "application/x-www-form-urlencoded",
        Authorization = "Basic "..hs.base64.encode(self.clientID..":"..self.clientSecret),
    }

    -- Create query parameters string
    local requestBody = ""
    for name, value in pairs(formData) do
        requestBody = requestBody..(requestBody == "" and "" or "&")..name.."="..value
    end

    self.authClient:post("/api/token", requestBody, headers, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success then
            return self.notifyError("Failed to request tokens (status "..status..")", hs.inspect(response))
        end

        local accessToken = response.access_token
        self.accessToken = accessToken
        self.apiClient = RESTClient(apiEndpoint, {
            Authorization = response.token_type.." "..accessToken,
        })
    end)
end

-- Request authorization code
function Spotify:authorize(interface, port)
    -- Construct auth endpoint
    local redirectURI = "http://"..interface..":"..port.."/callback"
    local requestState = hs.hash.MD5(os.clock())
    local queryParameterMap = {
        client_id = self.clientID,
        response_type = "code",
        redirect_uri = hs.http.encodeForQuery(redirectURI),
        state = requestState,
        scope = hs.http.encodeForQuery(table.concat(scopes, " ")),
    }

    -- Create query parameters string
    local queryParameters = ""
    for name, value in pairs(queryParameterMap) do
        queryParameters = queryParameters..(queryParameters == "" and "?" or "&")..name.."="..value
    end

    -- Initialize auth webview and autofill hotkey
    local authview = self.createAuthorizeWebview(self.authClient.baseEndpoint.."/authorize"..queryParameters)
    local autofillHotkey = hs.hotkey.bind({ "alt", "cmd", "shift" }, "s", function()
        local user = RESTClient.getEnvironmentVariable("SPOTIFY_EMAIL")
        local pass = RESTClient.getEnvironmentVariable("SPOTIFY_PASS")
        hs.eventtap.keyStrokes(user.."\t"..pass)
    end)

    -- Create authorization server
    local authserver = self:createAuthServer(interface, port, requestState, authview, function(err, code)
        autofillHotkey:delete()

        if err or not code or code == "" then
            local message = "Failed to retrieve authorization code"
            self.notifyError(message, err or "")
            return message..": "..(err or ""), 500, {}
        end

        hs.timer.doAfter(0, function() self:createAPIClient(redirectURI, code) end)

        return "Success", 200, {}
    end)

    -- Start auth server and open webview
    authserver:start()
    authview:show(0.5)
end

function Spotify:transferPlaybackToDevice(deviceID)
    local requestBody = hs.json.encode({ device_ids = { deviceID } })

    self.apiClient:put("/me/player", requestBody, nil, function(status, rawResponse)
        if status ~= 204 then
            local errorMessage = "Failed to transfer playback to device (status "..status..")"
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local errorDetails = success and response.error.message or ""
            return self.notifyError(errorMessage, errorDetails)
        end
    end)
end

function Spotify:showMyDevices()
    self.apiClient:get("/me/player/devices", nil, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success then
            return self.notifyError("Failed to show devices (status "..status..")", hs.inspect(response))
        end

        local choices = {}
        for i = 1, #response.devices do
            local device = response.devices[i]
            table.insert(choices, {
                id = device.id,
                text = device.name,
                subText = device.type..(device.is_active and " (Active)" or ""),
            })
        end

        local function onChoice(choice)
            if choice then
                return self:transferPlaybackToDevice(choice.id)
            end
        end

        self:showChooser(choices, onChoice, { placeholderText = "Devices" })
    end)
end

function Spotify:chooseMyPlaylist(onChoice)
    self.apiClient:get("/me/playlists?limit=50", nil, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success then
            return self.notifyError("Failed to show playlists (status "..status..")", hs.inspect(response))
        end

        local choices = {}
        local function updateChoices()
            return choices
        end

        for i = 1, #response.items do
            local playlist = response.items[i]
            table.insert(choices, {
                id = playlist.id,
                uri = playlist.uri,
                text = playlist.name,
                subText = hs.http.convertHtmlEntities(playlist.description),
                imageURL = playlist.images[1] and playlist.images[1].url or "",
            })
        end

        self:loadChooserRowImages(choices, false)
        self:showChooser(updateChoices, onChoice, { placeholderText = "Spotify Playlists" })
    end)
end

function Spotify:openMyPlaylist()
    self:chooseMyPlaylist(function (choice)
        if choice then
            return os.execute("open "..choice.uri)
        end
    end)
end

function Spotify:playTrackFromMyPlaylist()
    self:chooseMyPlaylist(function (playlist)
        if playlist then
            local uri = string.format("/playlists/%s/tracks?limit=50", playlist.id)
            self.apiClient:get(uri, nil, function(status, rawResponse)
                local success, response = pcall(function() return hs.json.decode(rawResponse) end)
                local acceptedRequest = tostring(status):sub(1, 1) == "2"

                if not acceptedRequest or not success then
                    return self.notifyError("Failed to get playlist tracks (status "..status..")", hs.inspect(response))
                end

                local choices = {}
                local function updateChoices()
                    return choices
                end

                for i = 1, #response.items do
                    local item = response.items[i]
                    local album = item.track.album

                    local albumImageURL = ""
                    if album then
                        local albumImage = #album.images > 0 and album.images[#album.images] or {}
                        albumImageURL = albumImage.url or ""
                    end

                    local artists = item.track.artists
                    local artistsText = "Unknown artist"
                    if #artists > 0 then
                        local featuring = {}
                        for j = 1, #artists do
                            local artistName = artists[j].name
                            if j == 1 then
                                artistsText = artistName
                            else
                                table.insert(featuring, artistName)
                            end
                        end

                        if #featuring > 0 then
                            artistsText = string.format("%s (ft. %s)", artistsText, table.concat(featuring, ", "))
                        end
                    end

                    table.insert(choices, {
                        id = item.track.id,
                        playlist = playlist,
                        text = item.track.name,
                        subText = artistsText,
                        imageURL = albumImageURL
                    })
                end

                local function onChoice(choice)
                    if choice then
                        local cmd = string.format("open 'spotify:track:%s?context=spotify%%3Aplaylist%%3A%s'", choice.id, choice.playlist.id)
                        return os.execute(cmd)
                    end
                end

                self:loadChooserRowImages(choices, false)
                self:showChooser(updateChoices, onChoice, { placeholderText = playlist.name })
            end)
        end
    end)
end

function Spotify:playSavedTrack(onChoice)
    self.apiClient:get("/me/playlists?limit=50", nil, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success then
            return self.notifyError("Failed to show playlists (status "..status..")", hs.inspect(response))
        end

        local choices = {}
        local function updateChoices()
            return choices
        end

        for i = 1, #response.items do
            local playlist = response.items[i]
            table.insert(choices, {
                id = playlist.id,
                uri = playlist.uri,
                text = playlist.name,
                subText = hs.http.convertHtmlEntities(playlist.description),
                imageURL = playlist.images[1] and playlist.images[1].url or "",
            })
        end

        self:loadChooserRowImages(choices, false)
        self:showChooser(updateChoices, onChoice, { placeholderText = "Spotify Playlists" })
    end)
end

function Spotify:createSearchAction(searchType, createChoice)
    return function()
        local vowelIndex = searchType:find("[aAeEiIoOuU]")
        local article = vowelIndex and vowelIndex == 1 and "an" or "a"
        local placeholderText = "Search for "..article.." "..searchType

        local choices = {}
        local function updateChoices()
            return choices
        end

        -- Create search input handler
        local function onInput(input)
            local uri = "/search?q="..hs.http.encodeForQuery(input).."&type="..searchType.."&limit=25"

            self.apiClient:get(uri, nil, function(status, rawResponse)
                local success, response = pcall(function() return hs.json.decode(rawResponse) end)
                local acceptedRequest = tostring(status):sub(1, 1) == "2"

                if not acceptedRequest or not success or (response and response.code) then
                    local errorMessage = "Failed to search "..searchType.."s (status "..status..")"
                    return self.notifyError(errorMessage, hs.inspect(response))
                end

                local newChoices = {}
                local key = searchType.."s"
                for i = 1, #response[key].items do
                    local item = response[key].items[i]
                    table.insert(newChoices, createChoice(item))
                end

                choices = newChoices
                self:loadChooserRowImages(choices, false)
                self.chooser:choices(updateChoices)
            end)
        end

        -- Create item selection handler
        local onSelection = function(choice)
            if choice then
                return os.execute("open "..choice.uri)
            end
        end

        -- Start API search interface
        self:asyncSearch(updateChoices, onInput, onSelection, { placeholderText = placeholderText })
    end
end

Spotify.searchTracks = Spotify:createSearchAction("track", function(item)
    local artistsText = ""
    for i = 1, #item.artists do
        local artist = item.artists[i]
        artistsText = artistsText ~= ""
            and artistsText..", "..artist.name
            or artist.name
    end

    return {
        uri = item.uri,
        text = item.name,
        subText = artistsText,
        imageURL = item.album and item.album.images and #item.album.images > 0
            and item.album.images[1].url
            or "",
    }
end)

Spotify.searchArtists = Spotify:createSearchAction("artist", function(item)
    return {
        uri = item.uri,
        text = item.name,
        subText = item.genres and #item.genres > 0
            and "("..table.concat(item.genres, ", ")..")"
            or "",
        imageURL = item.images and #item.images > 0
            and item.images[1].url
            or "",
    }
end)

Spotify:registerShortcuts({
    { nil, "d", function() Spotify:showMyDevices() end, "Show My Devices" },
    { nil, "s", Spotify.searchTracks, "Search Tracks" },
    { { "shift" }, "p", function() Spotify:openMyPlaylist() end, "Open My Playlist" },
    { { "shift" }, "s", Spotify.searchArtists, "Search Artists" },
    { { "shift" }, "t", function() Spotify:playTrackFromMyPlaylist() end, "Play Track From My Playlist" },
    { { "alt", "cmd" }, "a", function() Spotify:authorize("localhost", 8888) end, "Authorize" }
})
