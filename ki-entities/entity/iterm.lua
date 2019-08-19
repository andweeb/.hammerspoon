----------------------------------------------------------------------------------------------------
-- iTerm application
--
local Application = spoon.Ki.Application

local actions = {
    toggleFullScreen = Application.createMenuItemEvent("Toggle Full Screen", { focusBefore = true })
}

local shortcuts = {
    { nil, "f", actions.toggleFullScreen, { "View", "Toggle Full Screen" } },
}

return Application:new("iTerm", shortcuts)
