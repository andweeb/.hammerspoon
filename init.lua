require "window-resizer"
local createWorkflowEvents = require "ki-events"

-- Reload Hammerspoon hotkey
hs.hotkey.bind({"alt", "cmd", "shift"}, "r", function() hs.reload() end)

-- Load & initialize Ki spoon
hs.loadSpoon("Ki")

-- Set custom workflows
spoon.Ki.workflowEvents = createWorkflowEvents(spoon.Ki)

-- Start Ki
spoon.Ki:start()
