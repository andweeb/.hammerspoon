----------------------------------------------------------------------------------------------------
-- Microsoft Outlook application
--
local Application = spoon.Ki.Application

local actions = {
    switchToViewHandler = function(view)
        return function()
            hs.osascript.applescript([[
                tell application "Microsoft Outlook"
                    set view of main windows to ]]..view..[[ view
                end tell
            ]])

            return true
        end
    end
}

local shortcuts = {
    { nil, "c", actions.switchToViewHandler("calendar"), { "View", "Switch to Calendar View" } },
    { nil, "m", actions.switchToViewHandler("mail"), { "View", "Switch to Mail View" } },
}

return Application:new("Microsoft Outlook", shortcuts)
