----------------------------------------------------------------------------------------------------
-- Ki Config File
--
local Ki = spoon.Ki
local URL = spoon.Ki.URL
local File = spoon.Ki.File
local Application = spoon.Ki.Application
local defaultEntities = spoon.Ki.defaultEntities.entity

require("mouse-mode")
require("window-mode")

-- Helper functions
local function requireEntity(type, file)
    return require("ki-entities/"..type.."/"..file)
end
local function getEnvironmentVariable(name)
    local variable = hs.execute("printenv "..name, true)
    return variable:gsub("\n", "")
end

----------------------------------------------------------------------------------------------------
-- Create custom ki entities
--

-- Create custom URL entities
local urls = {
    -- Basic inline URL entities
    APNews = URL:new("https://www.apnews.com"),
    BoA = URL:new("https://www.bankofamerica.com"),
    Chase = URL:new("https://www.chase.com"),
    CapitalOne = URL:new("https://www.capitalone.com"),
    Dropbox = URL:new("https://www.dropbox.com"),

    -- Externally defined URL entities
    Airbnb = requireEntity("url", "airbnb"),
    Amazon = requireEntity("url", "amazon"),
    BBC = requireEntity("url", "bbc"),
    DuckDuckGo = requireEntity("url", "duckduckgo"),
    FacebookMessenger = requireEntity("url", "messenger"),
    Github = requireEntity("url", "github"),
    Google = requireEntity("url", "google"),
    GoogleMaps = requireEntity("url", "google-maps"),
    Hammerspoon = requireEntity("url", "hammerspoon"),
    LearnXInYMinutes = requireEntity("url", "learnxinyminutes"),
    Netflix = requireEntity("url", "netflix"),
    NPR = requireEntity("url", "npr"),
    NYTimes = requireEntity("url", "nytimes"),
    Reddit = requireEntity("url", "reddit"),
    StackOverflow = requireEntity("url", "stackoverflow"),
    Wikipedia = requireEntity("url", "wikipedia"),
    Yelp = requireEntity("url", "yelp"),
    YouTube = requireEntity("url", "youtube"),
}

-- Create custom file entities
local files = {
    Code = File:new("~/Code"),
    Dropbox = File:new("~/Dropbox"),
}

-- Initialize LIFX light
local LIFX = requireEntity("entity", "lifx")
local lifxToken = getEnvironmentVariable("LIFX_TOKEN")
local BedroomLIFX = LIFX:new("label:Bedroom", lifxToken)

-- Create custom application entities
local entities = {
    -- Initialize basic application entities inline
    Alacritty = Application:new("Alacritty"),
    AppStore = Application:new("App Store"),
    Discord = Application:new("Discord"),
    Firefox = Application:new("Firefox"),
    Hammerspoon = Application:new("Hammerspoon"),
    LINE = Application:new("LINE"),
    Messenger = Application:new("Messenger"),
    MicrosoftWord = Application:new("Microsoft Word"),
    Postico = Application:new("Postico"),
    Slack = Application:new("Slack"),
    ScriptEditor = Application:new("Script Editor"),
    Simulator = Application:new("Simulator"),
    VMWareFusion = Application:new("VMware Fusion"),
    VisualStudioCode = Application:new("Visual Studio Code"),

    -- Require externally defined application entities
    Fantastical = requireEntity("entity", "fantastical"),
    IINA = requireEntity("entity", "iina"),
    iTerm = requireEntity("entity", "iterm"),
    Java = requireEntity("entity", "java"),
    Keyboard = requireEntity("entity", "keyboard"),
    MicrosoftExcel = requireEntity("entity", "microsoft-excel"),
    MicrosoftOutlook = requireEntity("entity", "microsoft-outlook"),
    NotificationCenter = requireEntity("entity", "notification-center"),
    Soundboard = requireEntity("entity", "soundboard"),
    TablePlus = requireEntity("entity", "tableplus"),
    VLC = requireEntity("entity", "vlc"),
    Zoom = requireEntity("entity", "zoom"),

    -- Require other (non-application) entities
    BedroomLIFX = BedroomLIFX,
    ClipboardText = requireEntity("entity", "clipboard-text"),
    EmojiPicker = requireEntity("entity", "emoji-picker"),
    FSVolume = requireEntity("entity", "fs-volume"),
    GlyphPicker = requireEntity("entity", "glyph-picker"),
    KaomojiPicker = requireEntity("entity", "kaomoji-picker"),

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
    { nil, "w", entities.MicrosoftWord, { "Entities", "Microsoft Word" } },
    { nil, "v", entities.VMWareFusion, { "Entities", "VMware Fusion" } },
    { nil, "z", entities.Zoom, { "Entities", "Zoom" } },
    { { "cmd" }, "a", entities.AppStore, { "Entities", "App Store" } },
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
    { { "alt", "cmd" }, "s", entities.Simulator, { "Entities", "Simulator" } },
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

-- Register URL mode shortcuts
Ki:registerModeShortcuts("url", {
    { nil, "a", urls.Amazon, { "URL Events", "Amazon" } },
    { nil, "b", urls.BoA, { "URL Events", "Bank Of America" } },
    { nil, "c", urls.Chase, { "URL Events", "Chase" } },
    { nil, "d", urls.DuckDuckGo, { "URL Events", "DuckDuckGo" } },
    { nil, "g", urls.Google, { "URL Events", "Google" } },
    { nil, "m", urls.FacebookMessenger, { "URL Events", "Facebook Messenger" } },
    { nil, "n", urls.Netflix, { "URL Events", "Netflix" } },
    { nil, "r", urls.Reddit, { "URL Events", "Reddit" } },
    { nil, "s", urls.StackOverflow, { "URL Events", "Stack Overflow" } },
    { nil, "w", urls.Wikipedia, { "URL Events", "Wikipedia" } },
    { nil, "y", urls.YouTube, { "URL Events", "YouTube" } },
    { { "cmd" }, "a", urls.APNews, { "URL Events", "APNews" } },
    { { "cmd" }, "b", urls.BBC, { "URL Events", "BBC" } },
    { { "cmd" }, "h", urls.Hammerspoon, { "URL Events", "Hammerspoon" } },
    { { "cmd" }, "n", urls.NYTimes, { "URL Events", "NYTimes" } },
    { { "shift" }, "a", urls.Airbnb, { "URL Events", "Airbnb" } },
    { { "shift" }, "c", urls.CapitalOne, { "URL Events", "Capital One" } },
    { { "shift" }, "d", urls.Dropbox, { "URL Events", "Dropbox" } },
    { { "shift" }, "g", urls.Github, { "URL Events", "Github" } },
    { { "shift" }, "l", urls.LearnXInYMinutes, { "URL Events", "Learn X In Y Minutes" } },
    { { "shift" }, "m", urls.GoogleMaps, { "URL Events", "Google Maps" } },
    { { "shift" }, "y", urls.Yelp, { "URL Events", "Yelp" } },
    { { "shift", "cmd" }, "n", urls.NPR, { "URL Events", "NPR" } },
})

-- Register file mode shortcuts
Ki:registerModeShortcuts("file", {
    { nil, "c", files.Code, { "Files", "Code" } },
    { { "alt" }, "d", files.Dropbox, { "Files", "Dropbox" } },
})

----------------------------------------------------------------------------------------------------
-- Register a custom search mode and register its shortcuts for searchable entities
--
local enterSearchModeShortcut = {
    {"shift", "cmd"}, "s", nil, { "Normal Mode", "Enter Search Mode" },
}
Ki:registerMode("search", enterSearchModeShortcut, {
    { nil, "a", urls.Amazon, { "Search URL Events", "Amazon" } },
    { nil, "d", urls.DuckDuckGo, { "Search URL Events", "DuckDuckGo" } },
    { nil, "g", urls.Google, { "Search URL Events", "Google" } },
    { nil, "n", urls.Netflix, { "Search URL Events", "Netflix" } },
    { nil, "r", urls.Reddit, { "Search URL Events", "Reddit" } },
    { nil, "s", urls.StackOverflow, { "Search URL Events", "Stack Overflow" } },
    { nil, "w", urls.Wikipedia, { "Search URL Events", "Wikipedia" } },
    { nil, "y", urls.YouTube, { "Search URL Events", "YouTube" } },
    { { "cmd" }, "b", urls.BBC, { "Search URL Events", "BBC" } },
    { { "cmd" }, "n", urls.NYTimes, { "Search URL Events", "NYTimes" } },
    { { "shift" }, "g", urls.Github, { "Search URL Events", "Github" } },
    { { "shift" }, "m", urls.GoogleMaps, { "Search URL Events", "Google Maps" } },
    { { "shift" }, "y", urls.Yelp, { "Search URL Events", "Yelp" } },
    { { "shift", "cmd" }, "n", urls.NPR, { "Search URL Events", "NPR" } },
})

-- Add URL entity behavior for search mode to invoke
-- a `search` method implemented on searchable URL entities
URL.behaviors.search = function(self) self:search() end

----------------------------------------------------------------------------------------------------
-- Save custom entities to reference in local configs
--
Ki.customEntities = entities
Ki.customFiles = files
Ki.customURLs = urls
