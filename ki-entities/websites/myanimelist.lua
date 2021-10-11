----------------------------------------------------------------------------------------------------
-- MyAnimeList website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local RESTClient = require("lib/rest-client")
local URLSearchMixin = require("ki-entities/url-search")
local AsyncSearchMixin = require("ki-entities/async-search")

local MyAnimeList = Website { "MyAnimeList", "https://myanimelist.net" }
MyAnimeList.class:include(AsyncSearchMixin)
MyAnimeList.class:include(URLSearchMixin)
MyAnimeList:initURLSearch("search/all", "q")

-- Basic site search
function MyAnimeList:basicURLSearch(encodedQuery)
    self.open(self.url.."/search/all?cat=all&q="..encodedQuery)
end

-- Attach REST Client instance using the Jikan API
-- https://jikan.docs.apiary.io/#reference
MyAnimeList.restClient = RESTClient("https://api.jikan.moe/v3")

function MyAnimeList.createSearchResultChoices(results)
    local choices = {}

    for i = 1, #results do
        local result = results[i]
        table.insert(choices, {
            text = result.title,
            subText = result.synopsis,
            url = result.url,
            imageURL = result.image_url,
        })
    end

    return choices
end

-- Perform a search query for anime
-- https://jikan.docs.apiary.io/#reference/0/search
function MyAnimeList:searchAnime()
    local placeholderText = "Search for anime"

    local choices = {}
    local function updateChoices()
        return choices
    end

    -- Create search input handler
    local function onInput(input)
        local uri = "/search/anime?q="..hs.http.encodeForQuery(input)

        self.restClient:get(uri, nil, function(status, rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if not acceptedRequest or not success or (response and response.code) then
                local message = "Jikan error (code "..tostring(response.code)..")"
                self.notifyError(message, response.message)
            else
                choices = self.createSearchResultChoices(response.results)
                self:loadChooserRowImages(choices, false)
                self.chooser:choices(updateChoices)
            end
        end)
    end

    -- Create item selection handler
    local onSelection = function(choice)
        if choice then
            return self.open(choice.url)
        end
    end

    -- Start API search interface
    self:asyncSearch(updateChoices, onInput, onSelection, { placeholderText = placeholderText })
end

MyAnimeList:registerShortcuts({
    { nil, "s", function(...) MyAnimeList:searchAnime(...) end, "Search for anime" },
})

return MyAnimeList
