----------------------------------------------------------------------------------------------------
-- Microsoft Outlook application
--
local Application = spoon.Ki.Application
local MicrosoftOutlook = Application:new("Microsoft Outlook")

function MicrosoftOutlook.switchToViewEvent(view)
    return function()
        hs.osascript.applescript([[
            tell application "Microsoft Outlook"
                set view of main windows to ]]..view..[[ view
            end tell
        ]])

        return true
    end
end

MicrosoftOutlook:registerShortcuts({
    { nil, "c", MicrosoftOutlook.switchToViewEvent("calendar"), { "View", "Switch to Calendar View" } },
    { nil, "m", MicrosoftOutlook.switchToViewEvent("mail"), { "View", "Switch to Mail View" } },
})

return MicrosoftOutlook
