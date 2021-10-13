----------------------------------------------------------------------------------------------------
-- TP-Link Smart Plug entity config
-- https://plasticrake.github.io/tplink-smarthome-api/classes/plug.html
--
local Ki = spoon.Ki
local Action = Ki.Action
local Entity = Ki.Entity

-- Determine TP-Link script path
local parentPathRegex = "^(.+)/.+$"
local spoonPath = hs.spoons.scriptPath()
local root = spoonPath:match(parentPathRegex):match(parentPathRegex)
local scriptPath = root.."/scripts/tplink/tplink"

local parsers = {
    togglePowerState = function(_, stdout)
        local output = stdout:gsub("%s", "")
        local powerState = output == "true" and "on" or "off"
        local message = string.format("Powered TP-Link smart plug %s", powerState)
        hs.notify.show("Ki", message, "")
        return false
    end,
    getPowerState = function(_, stdout)
        local output = stdout:gsub("%s", "")
        local powerState = output == "true" and "on" or "off"
        local message = string.format("TP-Link smart plug is currently turned %s", powerState)
        hs.notify.show("Ki", message, "")
        return false
    end,
    getInfo = function(_, stdout)
        print(stdout)
        hs.notify.show("Ki", "Logged info to Hammerspoon console", "")
        return false
    end,
}

local function createPlugAction(actionName, plugName, command)
    return Action {
        name = actionName,
        action = function()
            local args = { plugName, command }
            hs.task.new(scriptPath, nil, parsers[command], args):start()
        end,
    }
end

return Entity {
    name = "TP-Link Smart Plug",
    shortcuts = {
        { nil, "i", createPlugAction("Get System Info", "OSMC", "getInfo") },
        { nil, "s", createPlugAction("Get Power State", "OSMC", "getPowerState") },
        { nil, "space", createPlugAction("Toggle Power", "OSMC", "togglePowerState") },
    },
}
