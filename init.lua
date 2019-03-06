require("window-resizer")

local createWorkflowEvents = require("ki-events")

-- Reload Hammerspoon hotkey
hs.hotkey.bind({ "alt", "cmd", "shift" }, "r", function() hs.reload() end)

-- Load & initialize Ki spoon
hs.loadSpoon("Ki")

local workflowEvents = createWorkflowEvents(spoon.Ki)

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

-- Start Emojis spoon if available
if pcall(hs.loadSpoon("Emojis")) then
    spoon.Emojis:bindHotkeys({ toggle = { {"cmd"}, ";" } })
end
