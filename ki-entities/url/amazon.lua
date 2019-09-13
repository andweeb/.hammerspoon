----------------------------------------------------------------------------------------------------
-- Amazon URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.amazon.com"
local Amazon = URL:new(baseURL)

function Amazon:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - Amazon", "Enter Amazon search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/s?k="..encodedQuery)
            else
                self.notifyError("Ki - Amazon", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

local actions = {
    search = function() Amazon:search() end,
}

local shortcuts = {
    { nil, "s", actions.search, { "Amazon", "Search" } },
}

Amazon:initialize("Amazon", shortcuts, true)

return Amazon
