----------------------------------------------------------------------------------------------------
-- iTerm application
--
local Application = spoon.Ki.Application
local iTerm = Application:new("iTerm")

iTerm.toggleFullScreen = Application.createMenuItemEvent("Toggle Full Screen", { focusBefore = true })

iTerm:registerShortcuts({
    { nil, "f", iTerm.toggleFullScreen, { "View", "Toggle Full Screen" } },
})

return iTerm
