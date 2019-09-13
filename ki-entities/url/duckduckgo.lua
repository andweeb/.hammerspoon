----------------------------------------------------------------------------------------------------
-- DuckDuckGo URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://duckduckgo.com"
local DuckDuckGo = URL:new(baseURL)

function DuckDuckGo:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - DuckDuckGo", "Enter DuckDuckGo search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/?q="..encodedQuery)
            else
                self.notifyError("Ki - DuckDuckGo", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

local actions = {
    search = function() DuckDuckGo:search() end,
}

local shortcuts = {
    { nil, "s", actions.search, { "DuckDuckGo", "Search" } },
}

DuckDuckGo:initialize("DuckDuckGo", shortcuts, true)

return DuckDuckGo
