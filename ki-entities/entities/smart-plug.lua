----------------------------------------------------------------------------------------------------
-- Smart Plug entity config
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

local function createPlugAction(actionName, plugName, command)
    local streamingCallback = function(_, stdout)
        local output = stdout:gsub("%s", "")
        local powerState = output == "true" and "on" or "off"
        local message = string.format("Powered TP-Link Plug %s", powerState)
        hs.notify.show("Ki", message, "")
        return false
    end

    return Action {
        name = actionName,
        action = function()
            local args = { plugName, command }
            hs.task.new(scriptPath, nil, streamingCallback, args):start()
        end,
    }
end

return Entity {
    name = "Smart Plug",
    shortcuts = {
        { nil, "space", createPlugAction("Toggle Power", "OSMC", "togglePowerState") },
    },
}
