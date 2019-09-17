----------------------------------------------------------------------------------------------------
-- Yelp URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.yelp.com"
local Yelp = URL:new(baseURL)

function Yelp:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - Yelp", "Enter search query for Yelp:", "", "Search", "Cancel")

        if choice == "Search" then
            local mainQuery, locationQuery = searchQuery:match("(.*)|(.*)")

            if mainQuery and locationQuery then
                local success, encodedQueries, descriptor =
                    hs.osascript.javascript([[
                        [
                            encodeURIComponent(`]]..mainQuery..[[`),
                            encodeURIComponent(`]]..locationQuery..[[`),
                        ]
                    ]])

                if success then
                    local searchURL = baseURL.."/search?find_desc="..encodedQueries[1]
                    searchURL = searchURL.."&find_loc="..encodedQueries[2]
                    self.open(searchURL)
                else
                    self.notifyError("Ki - Yelp", descriptor.NSLocalizedDescription)
                end
            else
                local success, encodedQuery, descriptor =
                    hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

                if success then
                    self.open(baseURL.."/search?find_desc="..encodedQuery)
                else
                    self.notifyError("Ki - Yelp", descriptor.NSLocalizedDescription)
                end
            end
        end
    end)
end

return Yelp
