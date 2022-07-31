----------------------------------------------------------------------------------------------------
-- MEGAsync application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem
local unmapped = Application.unmapped

local menubarIconPosition =  {
    x = 1193,
    y = 19.5,
}

local transferManagerIconPosition = {
    x = 1360.40234375,
    y = 588.3203125,
}

local OpenTransferManager = Action {
    name = "Open Transfer Manager",
    action = function(app)
        app:activate()

        hs.eventtap.leftClick(menubarIconPosition)
        hs.timer.doAfter(.5, function()
            hs.eventtap.leftClick(transferManagerIconPosition)
        end)
    end
}

local OpenLinks = Action {
    name = "Open Links",
    action = function(app)
        app:activate()

        local AXElement = hs.axuielement.applicationElement(app)
        local addButtonSearchFunc = hs.axuielement.searchCriteriaFunction({
            attribute = "AXTitle",
            value = "Add…",
        })
        AXElement:elementSearch(function(status, object, count)
            if status == "completed" and count > 0 then
                -- Click "Add..." button
                local AddButton = object[1]
                AddButton:performAction("AXPress")

                -- Attempt to click "Open Links" button
                local position = AddButton:attributeValue("AXPosition")
                position.y = position.y + 50
                hs.eventtap.leftClick(position)
                hs.eventtap.leftClick(position)
            end
        end, addButtonSearchFunc)
    end,
}

return Application {
    name = "MEGAsync",
    shortcuts = {
        MEGAsync = {
            { nil, "h", SelectMenuItem { "MEGAsync", "Hide" } },
            { nil, "q", SelectMenuItem { "MEGAsync", "Quit" } },
            { nil, "l", OpenLinks },
            { nil, "o", OpenTransferManager },
            { { "alt" }, "h", SelectMenuItem { "MEGAsync", "Hide Others" } },
            { unmapped, unmapped, ChooseMenuItem { "MEGAsync", "Services" } },
            { unmapped, unmapped, SelectMenuItem { "MEGAsync", "Show All" } },
        },
    },
}
