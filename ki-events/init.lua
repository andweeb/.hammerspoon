----------------------------------------------------------------------------------------------------
-- Custom Ki Events
--
local Events = {}
local Entities = require("ki-events/entities")

function Events:init(Ki)
    local urls, files, entities = Entities:init(Ki)

    self.urls = urls
    self.files = files
    self.entities = entities

    local entityWorkflowEvents = {
        { nil, "a", entities.Alacritty, { "Entities", "Alacritty" } },
        { nil, "e", entities.MicrosoftExcel, { "Entities", "Microsoft Excel" } },
        { nil, "l", entities.BedroomLIFX, { "Entities", "Bedroom LIFX Light" } },
        { nil, "w", entities.MicrosoftWord, { "Entities", "Microsoft Word" } },
        { nil, "v", entities.VMWareFusion, { "Entities", "VMware Fusion" } },
        { { "cmd" }, "a", entities.AppStore, { "Entities", "App Store" } },
        { { "cmd" }, "c", entities.ClipboardText, { "Entities", "Clipboard Text" } },
        { { "ctrl" }, "s", entities.ScriptEditor, { "Entities", "Script Editor" } },
        { { "shift" }, "d", entities.Discord, { "Entities", "Discord" } },
        { { "shift" }, "i", entities.IINA, { "Entities", "IINA" } },
        { { "shift" }, "h", entities.Hammerspoon, { "Entities", "Hammerspoon" } },
        { { "shift" }, "p", entities.TablePlus, { "Entities", "TablePlus" } },
        { { "shift" }, "t", entities.iTerm, { "Entities", "iTerm" } },
        { { "shift" }, "v", entities.VLC, { "Entities", "VLC" } },
        { { "alt", "cmd" }, "s", entities.Simulator, { "Entities", "VMware Fusion" } },
        { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
        { { "shift", "cmd" }, "p", entities.Postico, { "Entities", "Postico" } },
        { { "shift", "cmd" }, "s", entities.Sblack, { "Entities", "Sblack" } },
    }

    local selectEntityWorkflowEvents = {
        { nil, "e", entities.MicrosoftExcel, { "Select Events", "Microsoft Excel" } },
        { nil, "w", entities.MicrosoftWord, { "Select Events", "Microsoft Word" } },
        { nil, "v", entities.VMWareFusion, { "Select Events", "VMware Fusion" } },
        { { "ctrl" }, "s", entities.ScriptEditor, { "Select Events", "Script Editor" } },
        { { "shift" }, "i", entities.IINA, { "Select Events", "Select IINA Windows" } },
        { { "shift" }, "p", entities.TablePlus, { "Select Events", "Select a DB Connection with TablePlus" } },
        { { "shift" }, "t", entities.iTerm, { "Select Events", "iTerm" } },
        { { "shift" }, "v", entities.VLC, { "Select Events", "VLC" } },
        { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Select Events", "Microsoft Outlook" } },
    }

    local urlWorkflowEvents = {
        { nil, "b", urls.BoA, { "URL Events", "Bank Of America" } },
        { nil, "c", urls.Chase, { "URL Events", "Chase" } },
        { nil, "d", urls.Dropbox, { "URL Events", "Dropbox" } },
        { nil, "m", urls.FacebookMessenger, { "URL Events", "Facebook Messenger" } },
        { nil, "s", urls.StackOverflow, { "URL Events", "Stack Overflow" } },
        { nil, "t", urls.Twitch, { "URL Events", "Twitch" } },
        { { "cmd" }, "h", urls.Hammerspoon, { "URL Events", "Hammerspoon" } },
        { { "shift" }, "a", urls.Airbnb, { "URL Events", "Airbnb" } },
    }

    local fileWorkflowEvents = {
        { nil, "c", files.Code, { "Files", "Code" } },
        { { "alt" }, "d", files.Dropbox, { "Files", "Dropbox" } },
    }

    return {
        entity = entityWorkflowEvents,
        select = selectEntityWorkflowEvents,
        url = urlWorkflowEvents,
        file = fileWorkflowEvents,
    }
end

return Events
