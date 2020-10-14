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

-- Remap Website Mode transition shortcuts
spoon.Ki:remapShortcuts({
    -- NORMAL --
    {
        mode = "normal",
        name = "Enter Website Mode",
        shortcut = { {"cmd"}, "u" },
    },
    -- ENTITY --
    {
        mode = "entity",
        name = "Enter Website Mode",
        shortcut = { {"cmd"}, "u" },
    },
    {
        mode = "entity",
        name = "App Store",
        shortcut = { { "cmd" }, "a" },
    },
    -- SELECT --
    {
        mode = "select",
        name = "Enter Website Mode",
        shortcut = { {"cmd"}, "u" },
    },
})

-- Configure ki
require("ki-config")

-- Use local config if it exists
local _, err = pcall(function() require("local-ki-config") end)
if err and not err:find("module '.*' not found") then
    print("Error loading local ki config: "..err)
end

-- Start Ki
spoon.Ki:start()
