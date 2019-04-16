----------------------------------------------------------------------------------------------------
-- Main init file
--
local KiEvents = require("ki-events")
local WindowResizer = require("window-resizer")

-- Reload Hammerspoon hotkey
hs.hotkey.bind({ "alt", "cmd", "shift" }, "r", function() hs.reload() end)

----------------------------------------------------------------------------------------------------
-- Load, initialize, and configure Ki
--
hs.loadSpoon("Ki")

local workflowEvents = KiEvents:init(spoon.Ki)

-- Merge any untracked local workflow events to the list of default ones if a local file exists
if io.open("local-ki-events.lua", "rb") then
    local createLocalWorkflowEvents = require("local-ki-events")
    local localWorkflowEvents = createLocalWorkflowEvents(spoon.Ki)

    setmetatable(localWorkflowEvents, spoon.Ki:_createEventsMetatable(true))

    workflowEvents = localWorkflowEvents + workflowEvents
end

-- Set custom workflows
spoon.Ki.workflowEvents = workflowEvents

-- Start Ki
spoon.Ki:start()

----------------------------------------------------------------------------------------------------
-- Bind window resizer hotkeys
--
-- Disable animation and bind all resize functions
hs.window.animationDuration = 0
hs.hotkey.bind({ "alt" }, "left", function() WindowResizer.moveWindowLeft() end)
hs.hotkey.bind({ "alt" }, "right", function() WindowResizer.moveWindowRight() end)
hs.hotkey.bind({ "alt" }, "up", function() WindowResizer.maximizeWindow() end)
hs.hotkey.bind({ "alt" }, "down", function() WindowResizer.centerWindow() end)
hs.hotkey.bind({ "alt", "shift" }, "left", function() WindowResizer.moveWindowUpperLeft() end)
hs.hotkey.bind({ "alt", "shift" }, "right", function() WindowResizer.moveWindowUpperRight() end)
hs.hotkey.bind({ "alt", "cmd" }, "left", function() WindowResizer.moveWindowBottomLeft() end)
hs.hotkey.bind({ "alt", "cmd" }, "right", function() WindowResizer.moveWindowBottomRight() end)
hs.hotkey.bind({ "ctrl", "alt" }, "left", function() WindowResizer.moveWindowOneSpace("left") end)
hs.hotkey.bind({ "ctrl", "alt" }, "right", function() WindowResizer.moveWindowOneSpace("right") end)
hs.hotkey.bind({ "alt" }, "space", function() WindowResizer.moveWindowToNextMonitor() end)

----------------------------------------------------------------------------------------------------
