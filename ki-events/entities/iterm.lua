local iTermEntity = {}

function iTermEntity:init(Application)
    local iTermActions = {
        toggleFullScreen = Application.createMenuItemEvent("Toggle Full Screen", { focusBefore = true })
    }
    local shortcuts = {
        { nil, "f", iTermActions.toggleFullScreen, { "View", "Toggle Full Screen" } },
    }

    return Application:new("iTerm", shortcuts)
end

return iTermEntity
