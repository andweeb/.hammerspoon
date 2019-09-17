----------------------------------------------------------------------------------------------------
-- Amazon URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.amazon.com"

local Amazon = URL:new(baseURL)

Amazon.paths = {
    { name = "Account", path = "/gp/css/homepage.html" },
    { name = "Order History", path = "/gp/css/order-history" },
    { name = "Cart", path = "/gp/cart/view.html" },
    { name = "Today's Deals", path = "/gp/goldbox" },
}

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

return Amazon
