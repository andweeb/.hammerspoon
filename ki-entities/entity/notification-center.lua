----------------------------------------------------------------------------------------------------
-- Notification Center entity
--
local Entity = spoon.Ki.Entity

local applescriptLocation = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/notification-center.applescript")

local actions = {}

function actions.dismissNotifications()
    hs.notify.withdrawAll()

    local script = Entity.renderScriptTemplate(applescriptLocation, { operation = "dismiss-notifications" })
    local isOk, _, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Entity.notifyError("Error opening the connection", rawTable.NSLocalizedFailureReason)
    end
end

local shortcuts = {
    { nil, "delete", actions.dismissNotifications, { "Notification Center", "Dismiss Notifications" } }
}

return Entity:new("NotificationCenter", shortcuts)
