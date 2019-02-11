-- Create IINA application entity
local function createIINA(Application)
    local actions = {
        playNext = Application.createMenuItemEvent("Next Media"),
        playPrevious = Application.createMenuItemEvent("Previous Media"),
        togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
            isToggleable = true,
            focusBefore = true,
        }),
    }
    local shortcuts = {
        { nil, "space", actions.togglePlay, { "Playback", "Toggle Play" } },
        { nil, "p", actions.playPrevious, { "Playback", "Previous Media" } },
        { nil, "n", actions.playNext, { "Playback", "Next Media" } },
    }

    return Application:new("IINA", shortcuts)
end

-- Create iTerm application entity
local function createiTerm(Application)
    local iTermActions = {
        toggleFullScreen = Application.createMenuItemEvent("Toggle Full Screen", { focusBefore = true })
    }
    local shortcuts = {
        { nil, "f", iTermActions.toggleFullScreen, { "View", "Toggle Full Screen" } },
    }

    return Application:new("iTerm", shortcuts)
end

-- Create Microsoft Outlook application entity
local function createMicrosoftOutlook(Application)
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

-- Create VLC application entity
local function createVLC(Application)
    local function executeApplescriptEvent(script)
        return function()
            return hs.osascript.applescript(script)
        end
    end
    local actions = {
        openFile = Application.createMenuItemEvent("Open File..."),
        playPause = executeApplescriptEvent([[ tell application "VLC" to play ]]),
        stop = executeApplescriptEvent([[ tell application "VLC" to stop ]]),
    }
    local shortcuts = {
        { nil, "space", actions.playPause, { "Playback", "Toggle Play" } },
        { nil, "o", actions.openFile, { "File", "Open File" } },
        { nil, "s", actions.stop, { "Playback", "Stop" } },
    }

    return Application:new("VLC", vlcShortcuts)
end

-- Create custom Ki workflow events
local function createWorkflowEvents(Ki)
    local File = Ki.File
    local Application = Ki.Application

    local Alacritty = Application:new("Alacritty")
    local Discord = Application:new("Discord")
    local IINA = createIINA(Application)
    local iTerm = createiTerm(Application)
    local Hammerspoon = Application:new("Hammerspoon")
    local Slack = Application:new("Sblack")
    local ScriptEditor = Application:new("Script Editor")
    local MicrosoftOutlook = createMicrosoftOutlook(Application)
    local MicrosoftExcel = Application:new("Microsoft Excel")
    local MicrosoftWord = Application:new("Microsoft Word")
    local Postico = Application:new("Postico")
    local TablePlus = Application:new("TablePlus")
    local VMWareFusion = Application:new("VMware Fusion")
    local VLC = createVLC(Application)

    local entityWorkflowEvents = {
        { nil, "a", Alacritty, { "Entities", "Alacritty" } },
        { nil, "e", MicrosoftExcel, { "Entities", "Microsoft Excel" } },
        { nil, "w", MicrosoftWord, { "Entities", "Microsoft Word" } },
        { nil, "v", VMWareFusion, { "Entities", "VMware Fusion" } },
        { { "ctrl" }, "s", ScriptEditor, { "Entities", "Script Editor" } },
        { { "shift" }, "d", Discord, { "Entities", "Discord" } },
        { { "shift" }, "i", IINA, { "Entities", "IINA" } },
        { { "shift" }, "h", Hammerspoon, { "Entities", "Hammerspoon" } },
        { { "shift" }, "p", TablePlus, { "Entities", "TablePlus" } },
        { { "shift" }, "t", iTerm, { "Entities", "iTerm" } },
        { { "shift" }, "v", VLC, { "Entities", "VLC" } },
        { { "shift", "cmd" }, "m", MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
        { { "shift", "cmd" }, "p", Postico, { "Entities", "Postico" } },
        { { "shift", "cmd" }, "s", Slack, { "Entities", "Sblack" } },
    }

    local selectEntityWorkflowEvents = {
        { nil, "e", MicrosoftExcel, { "Select Events", "Microsoft Excel" } },
        { nil, "w", MicrosoftWord, { "Select Events", "Microsoft Word" } },
        { nil, "v", VMWareFusion, { "Select Events", "VMware Fusion" } },
        { { "ctrl" }, "s", ScriptEditor, { "Select Events", "Script Editor" } },
        { { "shift" }, "v", VLC, { "Select Events", "VLC" } },
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
        { { "alt" }, "d", File:new("~/Dropbox"), { "Files", "Dropbox" } },
    }

    return {
        entity = entityWorkflowEvents,
        select = selectEntityWorkflowEvents,
        url = urlWorkflowEvents,
        file = fileWorkflowEvents,
    }
end

return createWorkflowEvents
