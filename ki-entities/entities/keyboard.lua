----------------------------------------------------------------------------------------------------
-- Keyboard entity
--
local Ki = spoon.Ki
local Entity = Ki.Entity

local function setKeyboardMethod(method)
    return function()
        return hs.keycodes.setMethod(method)
    end
end

local function setKeyboardLayout(layout)
    return function()
        return hs.keycodes.setLayout(layout)
    end
end

return Entity {
    name = "Keyboard",
    shortcuts = {
        { nil, "k", setKeyboardMethod "2-Set Korean", { "Keyboard", "Set Keyboard Input Method to 2-Set Korean" } },
        { nil, "u", setKeyboardLayout "U.S.", { "Keyboard", "Set Keyboard Layout to U.S." } },
    },
}
