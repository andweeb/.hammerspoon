----------------------------------------------------------------------------------------------------
-- Main init file
--

-- Start IPC module
require("hs.ipc")

-- Reload Hammerspoon hotkey
hs.hotkey.bind({ "alt", "cmd", "shift" }, "r", function() hs.reload() end)

-- Disable window animation
hs.window.animationDuration = 0

----------------------------------------------------------------------------------------------------
-- Load, initialize, and configure Ki
--
hs.loadSpoon("Ki")

-- Configure ki
require("ki-config")

-- Use local config if it exists
local loadedOk, err = pcall(function() require("local-ki-config") end)
if not loadedOk then
    print("Unable to load local ki config, received error: "..err)
end

-- Start Ki
spoon.Ki:start()
