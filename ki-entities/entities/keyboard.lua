----------------------------------------------------------------------------------------------------
-- Keyboard entity
--
local Entity = spoon.Ki.Entity
local Keyboard = Entity:new("Keyboard")

function Keyboard.setMethodEvent(method)
    return function()
        return hs.keycodes.setMethod(method)
    end
end

function Keyboard.setLayoutEvent(layout)
    return function()
        return hs.keycodes.setLayout(layout)
    end
end

Keyboard:registerShortcuts({
    { nil, "k", Keyboard.setMethodEvent("2-Set Korean"), { "Keyboard", "Set Keyboard Input Method to 2-Set Korean" } },
    { nil, "u", Keyboard.setLayoutEvent("U.S."), { "Keyboard", "Set Keyboard Layout to U.S." } },
})

return Keyboard
