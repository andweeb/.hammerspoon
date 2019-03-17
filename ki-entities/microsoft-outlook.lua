local MicrosoftOutlookEntity = {}

function MicrosoftOutlookEntity:init(Application)
    local outlookActions = {
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
        { nil, "c", outlookActions.switchToViewHandler("calendar"), { "View", "Switch to Calendar View" } },
        { nil, "m", outlookActions.switchToViewHandler("mail"), { "View", "Switch to Mail View" } },
    }

    return Application:new("Microsoft Outlook", shortcuts)
end

return MicrosoftOutlookEntity
