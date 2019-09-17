----------------------------------------------------------------------------------------------------
-- Keyboard entity
--
local Entity = spoon.Ki.Entity

local actions = {}

function actions.setMethodEvent(method)
    return function()
        return hs.keycodes.setMethod(method)
    end
end

function actions.setLayoutEvent(layout)
    return function()
        return hs.keycodes.setLayout(layout)
    end
end

local shortcuts = {
    { nil, "k", actions.setMethodEvent("2-Set Korean"), { "Keyboard", "Set Keyboard Input Method to 2-Set Korean" } },
    { nil, "u", actions.setLayoutEvent("U.S."), { "Keyboard", "Set Keyboard Layout to U.S." } },
}

return Entity:new("Keyboard", shortcuts)

