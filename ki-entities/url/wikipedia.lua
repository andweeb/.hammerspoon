----------------------------------------------------------------------------------------------------
-- Wikipedia URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://en.wikipedia.org"

local Wikipedia = URL:new(baseURL)

Wikipedia.paths = {
    { name = "Main Page", path = "/wiki/Main_Page" },
    { name = "Featured Contents", path = "/wiki/Portal:Featured_content" },
    { name = "Current Events", path = "/wiki/Portal:Current_events" },
    { name = "Random Article", path = "/wiki/Special:Random" },
}

function Wikipedia:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - Wikipedia", "Enter Wikipedia search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/w/index.php?search="..encodedQuery)
            else
                self.notifyError("Ki - Wikipedia", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

return Wikipedia
