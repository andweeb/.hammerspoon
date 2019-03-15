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

-- Create TablePlus application entity
local function createTablePlus(Application)
    local actions = {}

    local dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"
    local function readTablePlusPlist(filename)
        local json = hs.execute("plutil -convert json -o - "..dataPath.."/"..filename)
        return hs.json.decode(json)
    end

    -- Initialize connection groups by group id and connections list
    local connectionGroups = {}
    local connectionGroupList = readTablePlusPlist("ConnectionGroups.plist")
    for _, group in pairs(connectionGroupList) do
        connectionGroups[group.ID] = group.Name
    end
    connections = readTablePlusPlist("Connections.plist")

    function actions.open(app, choice)
        app:activate()

        if choice then
            local isOk, _, rawTable = hs.osascript.applescript([[
                open location "tableplus://?id=]]..choice.id..[["
            ]])

            if not isOk then
                Application.notifyError("Error opening the connection", rawTable.NSLocalizedFailureReason)
            end
        end
    end

    local shortcuts = {
        { nil, nil, actions.open, { "TablePlus", "Open Application or Database Connection" } },
    }

    local TablePlus = Application:new("TablePlus", shortcuts)

    function TablePlus.getSelectionItems()
        local choices = {}

        for _, connection in pairs(connections) do
            local group = connectionGroups[connection.GroupID]
            local text = connection.ConnectionName.." ["..connection.Enviroment.."]"
            local databaseInfoText = connection.DatabaseHost.." : "..connection.DatabaseName
            local subText = hs.styledtext.new(databaseInfoText, {
                color = { hex = connection.statusColor, alpha = 1 },
                font = { name = "Menlo", size = 10 },
            })

            table.insert(choices, {
                text = text,
                subText = subText,
                id = connection.ID,
            })
        end

        return choices
    end

    return TablePlus
end

-- Create ClipboardText entity
local function createClipboardTextEntity(Entity)
    local function updateTextCaseEvent(case)
        return function()
            local clipboardText = hs.pasteboard.getContents()
            hs.pasteboard.setContents(clipboardText[case](clipboardText))
        end
    end
    local function convertBase64Event(translation)
        return function()
            local clipboardText = hs.pasteboard.getContents()
            hs.pasteboard.setContents(hs.base64[translation](clipboardText))
        end
    end
    local actions = {
        lowercase = updateTextCaseEvent("lower"),
        uppercase = updateTextCaseEvent("upper"),
        encodeBase64Text = convertBase64Event("encode"),
        decodeBase64Text = convertBase64Event("decode"),
    }
    local shortcuts = {
        { nil, "d", actions.decodeBase64Text, { "Clipboard Text", "Decode Base64" } },
        { nil, "e", actions.encodeBase64Text, { "Clipboard Text", "Encode Base64" } },
        { nil, "l", actions.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
        { nil, "u", actions.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
    }

    return Entity:new("ClipboardText", shortcuts, true)
end

-- Create LIFX entity
local function createLIFXLight(Entity, selector)
    local function getenv(name)
        local handle = io.popen(". ~/.lifx && printf $"..name)
        local value = handle:read("*a")
        handle:close()
        return value
    end

    local LIFX = require("lifx-entity")

    return LIFX:init(Entity, getenv("LIFX_TOKEN"), selector)
end

-- Create custom Ki workflow events
local function createWorkflowEvents(Ki)
    local File = Ki.File
    local Entity = Ki.Entity
    local Application = Ki.Application

    -- Applications
    local Alacritty = Application:new("Alacritty")
    local AppStore = Application:new("App Store")
    local Discord = Application:new("Discord")
    local Hammerspoon = Application:new("Hammerspoon")
    local Sblack = Application:new("Sblack")
    local ScriptEditor = Application:new("Script Editor")
    local Simulator = Application:new("Simulator")
    local MicrosoftExcel = Application:new("Microsoft Excel")
    local MicrosoftWord = Application:new("Microsoft Word")
    local Postico = Application:new("Postico")
    local VMWareFusion = Application:new("VMware Fusion")

    -- Applications with custom shortcuts
    local IINA = createIINA(Application)
    local iTerm = createiTerm(Application)
    local MicrosoftOutlook = createMicrosoftOutlook(Application)
    local TablePlus = createTablePlus(Application)
    local VLC = createVLC(Application)

    -- Custom Desktop Entities
    local ClipboardText = createClipboardTextEntity(Entity)
    local BedroomLIFX = createLIFXLight(Entity, "label:Bedroom")

    local entityWorkflowEvents = {
        { nil, "a", Alacritty, { "Entities", "Alacritty" } },
        { nil, "e", MicrosoftExcel, { "Entities", "Microsoft Excel" } },
        { nil, "l", BedroomLIFX, { "Entities", "Bedroom LIFX Light" } },
        { nil, "w", MicrosoftWord, { "Entities", "Microsoft Word" } },
        { nil, "v", VMWareFusion, { "Entities", "VMware Fusion" } },
        { { "cmd" }, "a", AppStore, { "Entities", "App Store" } },
        { { "cmd" }, "c", ClipboardText, { "Entities", "Clipboard Text" } },
        { { "ctrl" }, "s", ScriptEditor, { "Entities", "Script Editor" } },
        { { "shift" }, "d", Discord, { "Entities", "Discord" } },
        { { "shift" }, "i", IINA, { "Entities", "IINA" } },
        { { "shift" }, "h", Hammerspoon, { "Entities", "Hammerspoon" } },
        { { "shift" }, "p", TablePlus, { "Entities", "TablePlus" } },
        { { "shift" }, "t", iTerm, { "Entities", "iTerm" } },
        { { "shift" }, "v", VLC, { "Entities", "VLC" } },
        { { "alt", "cmd" }, "s", Simulator, { "Entities", "VMware Fusion" } },
        { { "shift", "cmd" }, "m", MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
        { { "shift", "cmd" }, "p", Postico, { "Entities", "Postico" } },
        { { "shift", "cmd" }, "s", Sblack, { "Entities", "Sblack" } },
    }

    local selectEntityWorkflowEvents = {
        { nil, "e", MicrosoftExcel, { "Select Events", "Microsoft Excel" } },
        { nil, "w", MicrosoftWord, { "Select Events", "Microsoft Word" } },
        { nil, "v", VMWareFusion, { "Select Events", "VMware Fusion" } },
        { { "ctrl" }, "s", ScriptEditor, { "Select Events", "Script Editor" } },
        { { "shift" }, "i", IINA, { "Select Events", "Select IINA Windows" } },
        { { "shift" }, "p", TablePlus, { "Select Events", "Select a DB Connection with TablePlus" } },
        { { "shift" }, "t", iTerm, { "Select Events", "iTerm" } },
        { { "shift" }, "v", VLC, { "Select Events", "VLC" } },
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
        { nil, "d", urlEvent("https://www.dropbox.com"), { "URL Events", "Dropbox" } },
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
