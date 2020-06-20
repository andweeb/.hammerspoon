----------------------------------------------------------------------------------------------------
-- Ki Config File
--
local Ki = spoon.Ki
local Website = spoon.Ki.Website
local File = spoon.Ki.File
local Application = spoon.Ki.Application
local defaultEntities = spoon.Ki.defaultEntities.entity

-- Require Ki modes
require("ki-modes/mouse-mode")
require("ki-modes/search-mode")
require("ki-modes/window-mode")

-- Helper function to require entity config
local function requireEntity(type, file)
    local directory = type == "entity" and "entities" or type.."s"
    return require("ki-entities/"..directory.."/"..file)
end

----------------------------------------------------------------------------------------------------
-- Create custom ki entities
--

-- Create custom Website entities
local websites = {
    -- Basic inline Website entities
    APNews = Website:new("AP News", "https://www.apnews.com"),
    BoA = Website:new("Bank of America", "https://www.bankofamerica.com"),
    Chase = Website:new("Chase", "https://www.chase.com"),
    CapitalOne = Website:new("Capital One", "https://www.capitalone.com"),
    Dropbox = Website:new("Dropbox", "https://www.dropbox.com"),
    TempMail = Website:new("Temp Mail", "https://temp-mail.org/en/"),

    -- Externally defined Website entities
    Airbnb = requireEntity("website", "airbnb"),
    Amazon = requireEntity("website", "amazon"),
    BBC = requireEntity("website", "bbc"),
    DuckDuckGo = requireEntity("website", "duckduckgo"),
    FacebookMessenger = requireEntity("website", "messenger"),
    Github = requireEntity("website", "github"),
    Google = requireEntity("website", "google"),
    GoogleMaps = requireEntity("website", "google-maps"),
    Hammerspoon = requireEntity("website", "hammerspoon"),
    HammerspoonDocs = requireEntity("website", "hammerspoon-docs"),
    LearnXInYMinutes = requireEntity("website", "learnxinyminutes"),
    Netflix = requireEntity("website", "netflix"),
    NPM = requireEntity("website", "npm"),
    NPR = requireEntity("website", "npr"),
    NYTimes = requireEntity("website", "nytimes"),
    Reddit = requireEntity("website", "reddit"),
    StackOverflow = requireEntity("website", "stackoverflow"),
    Wikipedia = requireEntity("website", "wikipedia"),
    Yelp = requireEntity("website", "yelp"),
    YouTube = requireEntity("website", "youtube"),
}

-- Create custom file entities
local files = {
    Code = File:new("~/Code"),
    Dropbox = File:new("~/Dropbox"),
}

-- Initialize LIFX light
local LIFX = requireEntity("entity", "lifx")
local BedroomLIFX = LIFX:new("Bedroom Light", "label:Bedroom")

-- Create custom application entities
local entities = {
    -- Initialize basic application entities inline
    Alacritty = Application:new("Alacritty"),
    Discord = Application:new("Discord"),
    Firefox = Application:new("Firefox"),
    Messenger = Application:new("Messenger"),
    Obsidian = Application:new("Obsidian"),
    Postico = Application:new("Postico"),
    Slack = Application:new("Slack"),
    VisualStudioCode = Application:new("Visual Studio Code"),

    -- Require externally defined application entities
    Fantastical = requireEntity("application", "fantastical"),
    IINA = requireEntity("application", "iina"),
    Hammerspoon = requireEntity("application", "hammerspoon"),
    iTerm = requireEntity("application", "iterm"),
    Java = requireEntity("application", "java"),
    LINE = requireEntity("application", "line"),
    MicrosoftExcel = requireEntity("application", "microsoft-excel"),
    MicrosoftOutlook = requireEntity("application", "microsoft-outlook"),
    MicrosoftWord = requireEntity("application", "microsoft-word"),
    ScriptEditor = requireEntity("application", "script-editor"),
    Steam = requireEntity("application", "steam"),
    TablePlus = requireEntity("application", "tableplus"),
    VMWareFusion = requireEntity("application", "vmware-fusion"),
    VLC = requireEntity("application", "vlc"),
    Zoom = requireEntity("application", "zoom"),

    -- Require other (non-entity) entities
    BedroomLIFX = BedroomLIFX,
    ClipboardText = requireEntity("entity", "clipboard-text"),
    EmojiPicker = requireEntity("entity", "emoji-picker"),
    FSVolume = requireEntity("entity", "fs-volume"),
    GlyphPicker = requireEntity("entity", "glyph-picker"),
    KaomojiPicker = requireEntity("entity", "kaomoji-picker"),
    Keyboard = requireEntity("entity", "keyboard"),
    NotificationCenter = requireEntity("entity", "notification-center"),
    Soundboard = requireEntity("entity", "soundboard"),

    -- Add default Ki application entities that are to be configured
    FaceTime = defaultEntities.FaceTime,
    TextEdit = defaultEntities.TextEdit,
}

----------------------------------------------------------------------------------------------------
-- Register custom shortcuts for various modes
--

-- Register entity mode shortcuts
Ki:registerModeShortcuts("entity", {
    { nil, "a", entities.Alacritty, { "Entities", "Alacritty" } },
    { nil, "c", entities.Fantastical, { "Entities", "Fantastical" } },
    { nil, "e", entities.MicrosoftExcel, { "Entities", "Microsoft Excel" } },
    { nil, "j", entities.Java, { "Entities", "Java" } },
    { nil, "k", entities.Keyboard, { "Entities", "Keyboard" } },
    { nil, "l", entities.BedroomLIFX, { "Entities", "Bedroom LIFX Light" } },
    { nil, "o", entities.Obsidian, { "Entities", "Obsidian" } },
    { nil, "w", entities.MicrosoftWord, { "Entities", "Microsoft Word" } },
    { nil, "v", entities.VMWareFusion, { "Entities", "VMware Fusion" } },
    { nil, "z", entities.Zoom, { "Entities", "Zoom" } },
    { { "cmd" }, "c", entities.ClipboardText, { "Entities", "Clipboard Text" } },
    { { "cmd" }, "e", entities.EmojiPicker, { "Entities", "Emoji Picker" } },
    { { "cmd" }, "g", entities.GlyphPicker, { "Entities", "Glyph Picker" } },
    { { "cmd" }, "k", entities.KaomojiPicker, { "Entities", "Kaomoji Picker" } },
    { { "cmd" }, "t", entities.TextEdit, { "Entities", "TextEdit" } },
    { { "cmd" }, "v", entities.FSVolume, { "Entities", "Filesystem Volume" } },
    { { "ctrl" }, "n", entities.NotificationCenter, { "Entities", "Notification Center" } },
    { { "ctrl" }, "s", entities.ScriptEditor, { "Entities", "Script Editor" } },
    { { "shift" }, "d", entities.Discord, { "Entities", "Discord" } },
    { { "shift" }, "f", entities.Firefox, { "Entities", "Firefox" } },
    { { "shift" }, "i", entities.IINA, { "Entities", "IINA" } },
    { { "shift" }, "h", entities.Hammerspoon, { "Entities", "Hammerspoon" } },
    { { "shift" }, "l", entities.LINE, { "Entities", "LINE" } },
    { { "shift" }, "m", entities.Messenger, { "Entities", "Messenger" } },
    { { "shift" }, "p", entities.TablePlus, { "Entities", "TablePlus" } },
    { { "shift" }, "t", entities.iTerm, { "Entities", "iTerm" } },
    { { "shift" }, "v", entities.VLC, { "Entities", "VLC" } },
    { { "alt", "cmd" }, "s", entities.Steam, { "Entities", "Steam" } },
    { { "shift", "cmd" }, "f", entities.FaceTime, { "Entities", "FaceTime" } },
    { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
    { { "shift", "cmd" }, "p", entities.Postico, { "Entities", "Postico" } },
    { { "shift", "cmd" }, "s", entities.Slack, { "Entities", "Slack" } },
    { { "shift", "cmd" }, "v", entities.VisualStudioCode, { "Entities", "Visual Studio Code" } },
})

-- Register select mode shortcuts
Ki:registerModeShortcuts("select", {
    { nil, "e", entities.MicrosoftExcel, { "Select Events", "Select a Microsoft Excel window" } },
    { nil, "j", entities.Java, { "Select Events", "Select a Java app" } },
    { nil, "w", entities.MicrosoftWord, { "Select Events", "Select a Microsoft Word window" } },
    { nil, "v", entities.VMWareFusion, { "Select Events", "Select VMware Fusion window" } },
    { { "cmd" }, "t", entities.TextEdit, { "Select Events", "Select a TextEdit window" } },
    { { "cmd" }, "v", entities.FSVolume, { "Entities", "Select a filesystem volume" } },
    { { "ctrl" }, "s", entities.ScriptEditor, { "Select Events", "Select a Script Editor window" } },
    { { "shift" }, "i", entities.IINA, { "Select Events", "Select an IINA window" } },
    { { "shift" }, "p", entities.TablePlus, { "Select Events", "Select a Database Connection" } },
    { { "shift" }, "t", entities.iTerm, { "Select Events", "Select an iTerm window" } },
    { { "shift" }, "v", entities.VLC, { "Select Events", "Select a VLC window" } },
    { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Select Events", "Select a Microsoft Outlook window" } },
})

-- Register Website mode shortcuts
Ki:registerModeShortcuts("website", {
    { nil, "a", websites.Amazon, { "Websites", "Amazon" } },
    { nil, "b", websites.BoA, { "Websites", "Bank Of America" } },
    { nil, "c", websites.Chase, { "Websites", "Chase" } },
    { nil, "d", websites.DuckDuckGo, { "Websites", "DuckDuckGo" } },
    { nil, "g", websites.Google, { "Websites", "Google" } },
    { nil, "m", websites.FacebookMessenger, { "Websites", "Facebook Messenger" } },
    { nil, "n", websites.Netflix, { "Websites", "Netflix" } },
    { nil, "r", websites.Reddit, { "Websites", "Reddit" } },
    { nil, "s", websites.StackOverflow, { "Websites", "Stack Overflow" } },
    { nil, "w", websites.Wikipedia, { "Websites", "Wikipedia" } },
    { nil, "y", websites.YouTube, { "Websites", "YouTube" } },
    { { "cmd" }, "a", websites.APNews, { "Websites", "APNews" } },
    { { "cmd" }, "b", websites.BBC, { "Websites", "BBC" } },
    { { "cmd" }, "h", websites.Hammerspoon, { "Websites", "Hammerspoon" } },
    { { "cmd" }, "n", websites.NYTimes, { "Websites", "NYTimes" } },
    { { "shift" }, "a", websites.Airbnb, { "Websites", "Airbnb" } },
    { { "shift" }, "c", websites.CapitalOne, { "Websites", "Capital One" } },
    { { "shift" }, "d", websites.Dropbox, { "Websites", "Dropbox" } },
    { { "shift" }, "g", websites.Github, { "Websites", "Github" } },
    { { "shift" }, "l", websites.LearnXInYMinutes, { "Websites", "Learn X In Y Minutes" } },
    { { "shift" }, "m", websites.GoogleMaps, { "Websites", "Google Maps" } },
    { { "shift" }, "n", websites.NPM, { "Websites", "NPM" } },
    { { "shift" }, "t", websites.TempMail, { "Websites", "Temp Mail" } },
    { { "shift" }, "y", websites.Yelp, { "Websites", "Yelp" } },
    { { "shift", "cmd" }, "h", websites.HammerspoonDocs, { "Websites", "Hammerspoon Docs" } },
    { { "shift", "cmd" }, "n", websites.NPR, { "Websites", "NPR" } },
})

-- Register file mode shortcuts
Ki:registerModeShortcuts("file", {
    { nil, "c", files.Code, { "Files", "Code" } },
    { { "alt" }, "d", files.Dropbox, { "Files", "Dropbox" } },
})

-- Register shortcuts for the custom search mode
Ki:registerModeShortcuts("search", {
    { nil, "a", websites.Amazon, { "Searchable Websites", "Amazon" } },
    { nil, "d", websites.DuckDuckGo, { "Searchable Websites", "DuckDuckGo" } },
    { nil, "g", websites.Google, { "Searchable Websites", "Google" } },
    { nil, "n", websites.Netflix, { "Searchable Websites", "Netflix" } },
    { nil, "r", websites.Reddit, { "Searchable Websites", "Reddit" } },
    { nil, "s", websites.StackOverflow, { "Searchable Websites", "Stack Overflow" } },
    { nil, "w", websites.Wikipedia, { "Searchable Websites", "Wikipedia" } },
    { nil, "y", websites.YouTube, { "Searchable Websites", "YouTube" } },
    { { "cmd" }, "b", websites.BBC, { "Searchable Websites", "BBC" } },
    { { "cmd" }, "n", websites.NYTimes, { "Searchable Websites", "NYTimes" } },
    { { "shift" }, "g", websites.Github, { "Searchable Websites", "Github" } },
    { { "shift" }, "m", websites.GoogleMaps, { "Searchable Websites", "Google Maps" } },
    { { "shift" }, "n", websites.NPM, { "Searchable Websites", "NPM" } },
    { { "shift" }, "y", websites.Yelp, { "Searchable Websites", "Yelp" } },
    { { "shift", "cmd" }, "n", websites.NPR, { "Searchable Websites", "NPR" } },
})

----------------------------------------------------------------------------------------------------
-- Save custom entities to reference in local configs
--
Ki.customEntities = entities
Ki.customFiles = files
Ki.customWebsites = websites
