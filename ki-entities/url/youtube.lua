----------------------------------------------------------------------------------------------------
-- YouTube URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.youtube.com"
local YouTube = URL:new(baseURL)

YouTube.paths = {
    { name = "YouTube", path = "https://youtube.com" },
    { name = "Trending", path = "/feed/trending" },
    { name = "Subscriptions", path = "/feed/subscriptions" },
    { name = "Library", path = "/feed/library" },
    { name = "History", path = "/feed/history" },
    { name = "Watch Later", path = "/playlist?list=WL" },
}

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

return YouTube
