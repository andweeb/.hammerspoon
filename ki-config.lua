----------------------------------------------------------------------------------------------------
-- Ki Config File
--
local Ki = spoon.Ki
local URL = spoon.Ki.URL
local File = spoon.Ki.File
local Entity = spoon.Ki.Entity
local Application = spoon.Ki.Application
local defaultEntities = spoon.Ki.defaultEntities.entity

local WindowResizer = require("window-resizer")

-- Helper functions
local function requireEntity(type, file)
    return require("ki-entities/"..type.."/"..file)
end
local function getEnvironmentVariable(name)
    local variable = hs.execute("printenv "..name, true)
    return variable:gsub("\n", "")
end

-- Set custom status display
Ki.statusDisplay = require("ki-menubar-item")

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
-- Define state transitions and transition shortcuts for custom modes
--

-- Set custom state and transition events
local modeTransitionEvents = {
    -- Window Mode
    { name = "enterWindowMode", from = "normal", to = "window" },
    { name = "enterWindowMode", from = "entity", to = "window" },
    { name = "enterWindowMode", from = "select", to = "window" },
    { name = "enterSelectMode", from = "window", to = "select" },
    { name = "exitMode", from = "window", to = "desktop" },
    -- Search Mode
    { name = "enterSearchMode", from = "normal", to = "search" },
    { name = "exitMode", from = "search", to = "desktop" },
}
local normalTransitionShortcuts = {
    { {"cmd"}, "w", function() Ki.state:enterWindowMode() end, { "Normal Mode", "Transition to Window Mode" } },
    {
        {"shift", "cmd"}, "s",
        function() Ki.state:enterSearchMode() end,
        { "Normal Mode", "Transition to Search Mode" },
    },
}
local searchTransitionShortcuts = {
    { nil, "escape", function() Ki.state:exitMode() end, { "Search Mode", "Exit to Desktop Mode" } },
}
local windowTransitionShortcuts = {
    { nil, "escape", function() Ki.state:exitMode() end, { "Window Mode", "Exit to Desktop Mode" } },
    { {"cmd"}, "e", function() Ki.state:enterEntityMode() end, { "Window Mode", "Transition to Entity Mode" } },
}
local entityTransitionShortcuts = {
    { {"cmd"}, "w", function() Ki.state:enterWindowMode() end, { "Entity Mode", "Transition to Window Mode" } },
}
local selectTransitionShortcuts = {
    { {"cmd"}, "w", function() Ki.state:enterWindowMode() end, { "Select Mode", "Transition to Window Mode" } },
}
Ki:registerModes(modeTransitionEvents, {
    normal = normalTransitionShortcuts,
    search = searchTransitionShortcuts,
    window = windowTransitionShortcuts,
    entity = entityTransitionShortcuts,
    select = selectTransitionShortcuts
})

-- Add URL entity behavior for search mode to invoke
-- a `search` method implemented on searchable URL entities
URL.behaviors.search = function(self)
    self:search()
end

----------------------------------------------------------------------------------------------------
-- Define custom shortcuts for various modes
--

-- Define entity mode shortcuts
local entityShortcuts = {
    { nil, "a", entities.Alacritty, { "Entities", "Alacritty" } },
    { nil, "c", entities.Fantastical, { "Entities", "Fantastical" } },
    { nil, "e", entities.MicrosoftExcel, { "Entities", "Microsoft Excel" } },
    { nil, "j", entities.Java, { "Entities", "Java" } },
    { nil, "k", entities.Keyboard, { "Entities", "Keyboard" } },
    { nil, "l", entities.BedroomLIFX, { "Entities", "Bedroom LIFX Light" } },
    { nil, "w", entities.MicrosoftWord, { "Entities", "Microsoft Word" } },
    { nil, "v", entities.VMWareFusion, { "Entities", "VMware Fusion" } },
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
    { { "shift" }, "p", entities.TablePlus, { "Entities", "TablePlus" } },
    { { "shift" }, "t", entities.iTerm, { "Entities", "iTerm" } },
    { { "shift" }, "v", entities.VLC, { "Entities", "VLC" } },
    { { "alt", "cmd" }, "s", entities.Simulator, { "Entities", "Simulator" } },
    { { "shift", "cmd" }, "f", entities.FaceTime, { "Entities", "FaceTime" } },
    { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
    { { "shift", "cmd" }, "p", entities.Postico, { "Entities", "Postico" } },
    { { "shift", "cmd" }, "s", entities.Slack, { "Entities", "Slack" } },
    { { "shift", "cmd" }, "v", entities.VisualStudioCode, { "Entities", "Visual Studio Code" } },
}

-- Define select mode shortcuts
local selectEntityShortcuts = {
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
}

-- Define URL mode shortcuts
local urlShortcuts = {
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
    { { "shift" }, "m", urls.GoogleMaps, { "URL Events", "Google Maps" } },
    { { "shift" }, "y", urls.Yelp, { "URL Events", "Yelp" } },
    { { "shift", "cmd" }, "n", urls.NPR, { "URL Events", "NPR" } },
}

-- Define search mode shortcuts
local searchShortcuts = {
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
}

-- Define file mode shortcuts
local fileShortcuts = {
    { nil, "c", files.Code, { "Files", "Code" } },
    { { "alt" }, "d", files.Dropbox, { "Files", "Dropbox" } },
}

-- Define window mode shortcuts
local function moveWindowOneSpaceLeft() WindowResizer.moveWindowOneSpace("left") end
local function moveWindowOneSpaceRight() WindowResizer.moveWindowOneSpace("right") end
local function selectWindow()
    Ki.state:exitMode()

    local choices = {}

    for _, window in pairs(hs.window:allWindows()) do
        local app = window:application()
        local title = window:title()
        local name = app and app:title() or title

        table.insert(choices, {
            text = name,
            subText = title,
            id = window:id(),
        })
    end

    Entity.showSelectionModal(choices, function(choice)
        if not choice or not choice.id then return end

        local window = hs.window(choice.id)

        if not window then
            hs.notify.show("Ki", "Unable to focus window", "")
            return
        end

        window:focus()
    end)
end
local function minimizeWindow() hs.window.focusedWindow():minimize() end
local function unminimizeRecentWindow()
    local minimizedWindows = hs.window.minimizedWindows()
    if minimizedWindows and #minimizedWindows > 0 then
        minimizedWindows[1]:unminimize()
    end
end

local windowShortcuts = {
    { nil, "f", WindowResizer.fullScreenWindow, { "Window Mode", "Full Screen Window" } },
    { nil, "h", WindowResizer.moveWindowLeft, { "Window Mode", "Move Window Left" } },
    { nil, "j", WindowResizer.centerWindow, { "Window Mode", "Center Window" } },
    { nil, "k", WindowResizer.maximizeWindow, { "Window Mode", "Maximize Window" } },
    { nil, "l", WindowResizer.moveWindowRight, { "Window Mode", "Move Window Right" } },
    { nil, "m", minimizeWindow, { "Window Mode", "Minimize Focused Window" } },
    { nil, "s", selectWindow, { "Window Mode", "Select Window" } },
    { nil, "space", WindowResizer.moveWindowToNextMonitor, { "Window Mode", "Move Window To Next Monitor" } },
    { { "ctrl" }, "h", WindowResizer.moveWindowBottomLeft, { "Window Mode", "Move Window Bottom Left" } },
    { { "ctrl" }, "l", WindowResizer.moveWindowBottomRight, { "Window Mode", "Move Window Bottom Right" } },
    { { "shift" }, "h", WindowResizer.moveWindowUpperLeft, { "Window Mode", "Move Window Upper Left" } },
    { { "shift" }, "l", WindowResizer.moveWindowUpperRight, { "Window Mode", "Move Window Upper Right" } },
    { { "shift" }, "m", unminimizeRecentWindow, { "Window Mode", "Minimize Most Recent Window" } },
    { { "cmd" }, "h", moveWindowOneSpaceLeft, { "Window Mode", "Move Window One Space to the Left" } },
    { { "cmd" }, "l", moveWindowOneSpaceRight, { "Window Mode", "Move Window One Space to the Right" } },
}

-- Default style
hs.alert.defaultStyle.radius = 7
hs.alert.defaultStyle.textSize = 20
hs.alert.defaultStyle.atScreenEdge = 1
hs.alert.defaultStyle.strokeColor = { black = 0, alpha = 0 }
hs.alert.defaultStyle.strokeWidth = 0
hs.alert.defaultStyle.textStyle = { paragraphStyle = { alignment = 'center' } }

----------------------------------------------------------------------------------------------------
-- Finish up and finally set custom shortcuts
--

-- Save custom entities to reference in local configs
Ki.customEntities = entities
Ki.customFiles = files
Ki.customURLs = urls

-- Register configured shortcuts
Ki:registerShortcuts({
    entity = entityShortcuts,
    select = selectEntityShortcuts,
    url = urlShortcuts,
    file = fileShortcuts,
    window = windowShortcuts,
    search = searchShortcuts,
})
