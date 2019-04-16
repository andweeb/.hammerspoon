----------------------------------------------------------------------------------------------------
-- Custom Ki events
--
local KiEvents = {}

function KiEvents.require(file)
    return require("ki-events/entities/"..file)
end

-- Create custom Ki workflow events
function KiEvents:init(Ki)
    local File = Ki.File
    local Entity = Ki.Entity
    local Application = Ki.Application

    -- Basic application entities
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

    -- Application entities with custom shortcuts
    local IINA = self.require("iina"):init(Application)
    local iTerm = self.require("iterm"):init(Application)
    local MicrosoftOutlook = self.require("microsoft-outlook"):init(Application)
    local TablePlus = self.require("tableplus"):init(Application)
    local VLC = self.require("vlc"):init(Application)

    -- Custom entities
    local BedroomLIFX = self.require("lifx"):init(Entity, "label:Bedroom")
    local ClipboardText = self.require("clipboard-text"):init(Entity)

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
        { nil, "s", urlEvent("https://stackoverflow.com"), { "URL Events", "Stack Overflow" } },
        { nil, "t", urlEvent("http://twitch.tv"), { "URL Events", "Twitch" } },
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

return KiEvents
