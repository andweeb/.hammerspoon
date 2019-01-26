local function createApplicationShortcuts(Application)
    local iinaActions = {
        playNext = Application.createMenuItemEvent("Next Media"),
        playPrevious = Application.createMenuItemEvent("Previous Media"),
        togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
            isToggleable = true,
            focusBefore = true,
        }),
    }
    local iTermActions = {
        toggleFullScreen = Application.createMenuItemEvent("Toggle Full Screen", { focusBefore = true })
    }
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

    return {
        IINA = {
            { nil, "space", iinaActions.togglePlay, { "Playback", "Toggle Play" } },
            { nil, "p", iinaActions.playPrevious, { "Playback", "Previous Media" } },
            { nil, "n", iinaActions.playNext, { "Playback", "Next Media" } },
        },
        iTerm = {
            { nil, "f", iTermActions.toggleFullScreen, { "View", "Toggle Full Screen" } },
        },
        MicrosoftOutlook = {
            { nil, "c", outlookActions.switchToViewHandler("calendar"), { "View", "Switch to Calendar View" } },
            { nil, "m", outlookActions.switchToViewHandler("mail"), { "View", "Switch to Mail View" } },
        },
    }
end

local function createWorkflowEvents(Ki)
    local File = Ki.File
    local Application = Ki.Application
    local shortcuts = createApplicationShortcuts(Application)

    local Alacritty = Application:new("Alacritty")
    local Discord = Application:new("Discord")
    local IINA = Application:new("IINA", shortcuts.IINA)
    local iTerm = Application:new("iTerm", shortcuts.iTerm)
    local Hammerspoon = Application:new("Hammerspoon")
    local Slack = Application:new("Sblack")
    local ScriptEditor = Application:new("Script Editor")
    local MicrosoftOutlook = Application:new("Microsoft Outlook", shortcuts.MicrosoftOutlook)
    local MicrosoftExcel = Application:new("Microsoft Excel")
    local Postico = Application:new("Postico")
    local TablePlus = Application:new("TablePlus")
    local VMWareFusion = Application:new("VMware Fusion")

    local entityWorkflowEvents = {
        { nil, "a", Alacritty, { "Entities", "Alacritty" } },
        { nil, "e", MicrosoftExcel, { "Entities", "Microsoft Excel" } },
        { nil, "v", VMWareFusion, { "Entities", "VMware Fusion" } },
        { { "ctrl" }, "s", ScriptEditor, { "Entities", "Script Editor" } },
        { { "shift" }, "d", Discord, { "Entities", "Discord" } },
        { { "shift" }, "i", IINA, { "Entities", "IINA" } },
        { { "shift" }, "h", Hammerspoon, { "Entities", "Hammerspoon" } },
        { { "shift" }, "p", TablePlus, { "Entities", "TablePlus" } },
        { { "shift" }, "t", iTerm, { "Entities", "iTerm" } },
        { { "shift", "cmd" }, "m", MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
        { { "shift", "cmd" }, "p", Postico, { "Entities", "Postico" } },
        { { "shift", "cmd" }, "s", Slack, { "Entities", "Sblack" } },
    }

    local selectEntityWorkflowEvents = {
        { nil, "e", MicrosoftExcel, { "Select Events", "Microsoft Excel" } },
        { nil, "v", VMWareFusion, { "Select Events", "VMware Fusion" } },
        { { "ctrl" }, "s", ScriptEditor, { "Select Events", "Script Editor" } },
        { { "shift" }, "i", IINA, { "Select Events", "Select IINA Windows" } },
        { { "shift" }, "t", iTerm, { "Select Events", "iTerm" } },
        { { "shift", "cmd" }, "m", MicrosoftOutlook, { "Select Events", "Microsoft Outlook" } },
    }

    local urlEvent = function(url)
        return function()
            return hs.urlevent.openURL(url)
        end
    end

    local urlWorkflowEvents = {
        { nil, "b", urlEvent("https://www.bankofamerica.com"), { "URL Events", "Bank Of America" } },
        { nil, "c", urlEvent("https://www.chase.com"), { "URL Events", "Chase" } },
        { { "cmd" }, "h", urlEvent("http://www.hammerspoon.org"), { "URL Events", "Hammerspoon" } },
        { { "shift" }, "a", urlEvent("https://www.airbnb.com"), { "URL Events", "Airbnb" } },
    }

    local fileWorkflowEvents = {
        { nil, "c", File:new("~/Code"), { "Files", "Code" } },
    }

    return {
        entity = entityWorkflowEvents,
        select = selectEntityWorkflowEvents,
        url = urlWorkflowEvents,
        file = fileWorkflowEvents,
    }
end

return createWorkflowEvents
