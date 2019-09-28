----------------------------------------------------------------------------------------------------
-- StackOverflow URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://stackoverflow.com"

local StackOverflow = URL:new(baseURL)

function StackOverflow:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - StackOverflow", "Enter StackOverflow search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/search?q="..encodedQuery)
            else
                self.notifyError("Ki - StackOverflow", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

return StackOverflow
