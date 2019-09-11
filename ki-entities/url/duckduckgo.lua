----------------------------------------------------------------------------------------------------
-- DuckDuckGo URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://duckduckgo.com"
local DuckDuckGo = URL:new(baseURL)

function DuckDuckGo.open(url)
    return hs.urlevent.openURL(url)
end

function DuckDuckGo:search()
    spoon.Ki.state:exitMode()

    local choice, searchQuery =
        hs.dialog.textPrompt("Ki - DuckDuckGo", "Enter search query for DuckDuckGo:", "", "Search", "Cancel")

    if choice == "Search" then
        local success, encodedQuery, descriptor =
            hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

        if success then
            self.open(baseURL.."/?q="..encodedQuery)
        else
            self.notifyError("Ki - DuckDuckGo", descriptor.NSLocalizedDescription)
        end
    end
end

local actions = {
    search = function() DuckDuckGo:search() end,
    open = function() DuckDuckGo.open(baseURL) end,
}

local shortcuts = {
    { nil, nil, actions.open, { "DuckDuckGo", "Open URL" } },
    { nil, "s", actions.search, { "DuckDuckGo", "Search" } },
}

DuckDuckGo:initialize("DuckDuckGo", shortcuts, true)

return DuckDuckGo
