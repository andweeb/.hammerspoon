----------------------------------------------------------------------------------------------------
-- Notification Center entity config
--
local Ki = spoon.Ki
local Entity = Ki.Entity
local filename = "notification-center.applescript"
local applescriptLocation = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/"..filename)

local function dismissNotifications()
    hs.notify.withdrawAll()

    local script = Entity.renderScriptTemplate(applescriptLocation, {
        operation = "dismiss-notifications",
    })

    local isOk, _, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Entity.notifyError("Error dismissing notifications", rawTable.NSLocalizedFailureReason)
    end
end

return Entity {
    name = "Notification Center",
    shortcuts = {
        { nil, "delete", dismissNotifications, { "Notification Center", "Dismiss Notifications" } }
    },
}
