----------------------------------------------------------------------------------------------------
-- Main init file
--

-- Start IPC module
require("hs.ipc")

-- Reload Hammerspoon hotkey
hs.hotkey.bind({ "alt", "cmd", "shift" }, "r", function()
    hs.console.clearConsole()
    hs.reload()
end)

-- Disable window animation
hs.window.animationDuration = 0

----------------------------------------------------------------------------------------------------
-- Load, initialize, and configure Ki
--
hs.loadSpoon("Ki")

-- Use default config
spoon.Ki:useDefaultConfig()

-- Configure ki
require("ki-config")

-- Use local config if it exists
local _, err = pcall(function() require("local-ki-config") end)
if err and not err:find("module '.*' not found") then
    print("Error loading local ki config: "..err)
end

-- Start Ki
spoon.Ki:start()

----------------------------------------------------------------------------------------------------
-- Watch for mounted volumes to store local directory trees
--
local FSVolume = require("ki-entities/entity/volume")
local VolumeWatcher = hs.fs.volume.new(function(event, volume)
    if event == hs.fs.volume.didMount then
        local name = volume.path:match(".+/(.+)")
        FSVolume.writeContentsToFile(name, volume.path)
    end
end)

VolumeWatcher:start()
