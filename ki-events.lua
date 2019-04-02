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
    local IINA = require("ki-entities/iina"):init(Application)
    local iTerm = require("ki-entities/iterm"):init(Application)
    local MicrosoftOutlook = require("ki-entities/microsoft-outlook"):init(Application)
    local TablePlus = require("ki-entities/tableplus"):init(Application)
    local VLC = require("ki-entities/vlc"):init(Application)

    -- Custom Desktop Entities
    local BedroomLIFX = require("ki-entities/lifx"):init(Entity, "label:Bedroom")
    local ClipboardText = require("ki-entities/clipboard-text"):init(Entity)

    -- Add some emoticons :^)
    ClipboardText.shortcuts = ClipboardText.mergeShortcuts(shortcuts, {
        { { "shift" }, "d", function() hs.pasteboard.setContents("(งツ)ว") end, "(งツ)ว" },
        { { "shift" }, "s", function() hs.pasteboard.setContents("¯\\_(ツ)_/¯") end, "¯\\_(ツ)_/¯" },
    })

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
