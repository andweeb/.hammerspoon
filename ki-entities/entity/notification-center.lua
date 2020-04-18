----------------------------------------------------------------------------------------------------
-- Notification Center entity
--
local Entity = spoon.Ki.Entity
local NotificationCenter = Entity:new("Notification Center")
local applescriptLocation = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/notification-center.applescript")

function NotificationCenter.dismissNotifications()
    hs.notify.withdrawAll()

    local script = Entity.renderScriptTemplate(applescriptLocation, { operation = "dismiss-notifications" })
    local isOk, _, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Entity.notifyError("Error opening the connection", rawTable.NSLocalizedFailureReason)
    end
end

NotificationCenter:registerShortcuts({
    { nil, "delete", NotificationCenter.dismissNotifications, { "Notification Center", "Dismiss Notifications" } }
})

return NotificationCenter
