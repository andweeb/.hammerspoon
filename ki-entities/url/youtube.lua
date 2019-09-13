----------------------------------------------------------------------------------------------------
-- YouTube URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.youtube.com"
local YouTube = URL:new(baseURL)

function YouTube:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - YouTube", "Enter YouTube search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/results?search_query="..encodedQuery)
            else
                self.notifyError("Ki - YouTube", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

local actions = {
    search = function() YouTube:search() end,
}

local shortcuts = {
    { nil, "s", actions.search, { "YouTube", "Search" } },
}

YouTube:initialize("YouTube", shortcuts, true)

return YouTube