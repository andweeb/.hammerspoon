----------------------------------------------------------------------------------------------------
-- Configure Ki
--
local Ki = spoon.Ki
local URL = spoon.Ki.URL
local File = spoon.Ki.File
local Application = spoon.Ki.Application
local WindowResizer = require("window-resizer")

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
    Airbnb = requireEntity("url", "airbnb"),
    Amazon = requireEntity("url", "amazon"),
    BoA = URL:new("https://www.bankofamerica.com"),
    Chase = URL:new("https://www.chase.com"),
    Dropbox = URL:new("https://www.dropbox.com"),
    DuckDuckGo = requireEntity("url", "duckduckgo"),
    FacebookMessenger = requireEntity("url", "messenger"),
    Github = requireEntity("url", "github"),
    Hammerspoon = requireEntity("url", "hammerspoon"),
    Reddit = requireEntity("url", "reddit"),
    StackOverflow = URL:new("https://stackoverflow.com"),
    Twitch = URL:new("http://twitch.tv"),
    Wikipedia = requireEntity("url", "wikipedia"),
    Yelp = requireEntity("url", "yelp"),
    YouTube = requireEntity("url", "youtube"),
}

-- Create custom file entities
local files = {
    Code = File:new("~/Code"),
    Dropbox = File:new("~/Dropbox"),
}

-- Create custom application entities
local BedroomLIFX = requireEntity("entity", "lifx")
local entities = {
    -- Basic application entities
    Alacritty = Application:new("Alacritty"),
    AppStore = Application:new("App Store"),
    Discord = Application:new("Discord"),
    Firefox = Application:new("Firefox"),
    Hammerspoon = Application:new("Hammerspoon"),
    Slack = Application:new("Slack"),
    ScriptEditor = Application:new("Script Editor"),
    Simulator = Application:new("Simulator"),
    MicrosoftExcel = Application:new("Microsoft Excel"),
    MicrosoftWord = Application:new("Microsoft Word"),
    Postico = Application:new("Postico"),
    VMWareFusion = Application:new("VMware Fusion"),

    -- Require externally defined application entities
    IINA = requireEntity("entity", "iina"),
    iTerm = requireEntity("entity", "iterm"),
    Keyboard = requireEntity("entity", "keyboard"),
    MicrosoftOutlook = requireEntity("entity", "microsoft-outlook"),
    NotificationCenter = requireEntity("entity", "notification-center"),
    TablePlus = requireEntity("entity", "tableplus"),
    VLC = requireEntity("entity", "vlc"),

    -- Custom non-application entities
    BedroomLIFX = BedroomLIFX:new("label:Bedroom", getEnvironmentVariable("LIFX_TOKEN"), {}),
    ClipboardText = requireEntity("entity", "clipboard-text"),
    Emoji = requireEntity("entity", "emoji"),
}

----------------------------------------------------------------------------------------------------
-- Define state and transition events for custom modes
--

-- Set custom state and transition events
Ki.stateEvents = {
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
Ki.transitionEvents = {
    normal = {
        {
            {"cmd"}, "w",
            function() Ki.state:enterWindowMode() end,
            { "Normal Mode", "Transition to Window Mode" },
        },
        {
            {"shift", "cmd"}, "s",
            function() Ki.state:enterSearchMode() end,
            { "Normal Mode", "Transition to Search Mode" },
        },
    },
    search = {
        {
            nil, "escape",
            function() Ki.state:exitMode() end,
            { "Search Mode", "Exit to Desktop Mode" },
        },
    },
    window = {
        {
            nil, "escape",
            function() Ki.state:exitMode() end,
            { "Window Mode", "Exit to Desktop Mode" },
        },
        {
            {"cmd"}, "e",
            function() Ki.state:enterEntityMode() end,
            { "Window Mode", "Transition to Entity Mode" },
        },
    },
    entity = {
        {
            {"cmd"}, "w",
            function() Ki.state:enterWindowMode() end,
            { "Entity Mode", "Transition to Window Mode" },
        },
    },
    select = {
        {
            {"cmd"}, "w",
            function() Ki.state:enterWindowMode() end,
            { "Select Mode", "Transition to Window Mode" },
        },
    }
}

-- Add URL entity behavior for search mode to invoke
-- a `search` method implemented on searchable URL entities
URL.behaviors.search = function(self)
    self:search()
end

----------------------------------------------------------------------------------------------------
-- Define custom workflow events for various modes
--

-- Define entity mode workflow events
local entityWorkflowEvents = {
    { nil, "a", entities.Alacritty, { "Entities", "Alacritty" } },
    { nil, "e", entities.MicrosoftExcel, { "Entities", "Microsoft Excel" } },
    { nil, "k", entities.Keyboard, { "Entities", "Keyboard" } },
    { nil, "l", entities.BedroomLIFX, { "Entities", "Bedroom LIFX Light" } },
    { nil, "w", entities.MicrosoftWord, { "Entities", "Microsoft Word" } },
    { nil, "v", entities.VMWareFusion, { "Entities", "VMware Fusion" } },
    { { "cmd" }, "a", entities.AppStore, { "Entities", "App Store" } },
    { { "cmd" }, "e", entities.Emoji, { "Entities", "Emoji" } },
    { { "cmd" }, "c", entities.ClipboardText, { "Entities", "Clipboard Text" } },
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
    { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Entities", "Microsoft Outlook" } },
    { { "shift", "cmd" }, "p", entities.Postico, { "Entities", "Postico" } },
    { { "shift", "cmd" }, "s", entities.Slack, { "Entities", "Slack" } },
}

-- Define select mode workflow events
local selectEntityWorkflowEvents = {
    { nil, "e", entities.MicrosoftExcel, { "Select Events", "Select a Microsoft Excel window" } },
    { nil, "w", entities.MicrosoftWord, { "Select Events", "Select a Microsoft Word window" } },
    { nil, "v", entities.VMWareFusion, { "Select Events", "VMware Fusion" } },
    { { "ctrl" }, "s", entities.ScriptEditor, { "Select Events", "Select a Script Editor window" } },
    { { "shift" }, "i", entities.IINA, { "Select Events", "Select an IINA window" } },
    { { "shift" }, "p", entities.TablePlus, { "Select Events", "Select a Database Connection" } },
    { { "shift" }, "t", entities.iTerm, { "Select Events", "Select an iTerm window" } },
    { { "shift" }, "v", entities.VLC, { "Select Events", "Select a VLC window" } },
    { { "shift", "cmd" }, "m", entities.MicrosoftOutlook, { "Select Events", "Select a Microsoft Outlook window" } },
}

-- Define URL mode workflow events
local urlWorkflowEvents = {
    { nil, "a", urls.Amazon, { "URL Events", "Amazon" } },
    { nil, "b", urls.BoA, { "URL Events", "Bank Of America" } },
    { nil, "c", urls.Chase, { "URL Events", "Chase" } },
    { nil, "d", urls.DuckDuckGo, { "URL Events", "DuckDuckGo" } },
    { nil, "m", urls.FacebookMessenger, { "URL Events", "Facebook Messenger" } },
    { nil, "r", urls.Reddit, { "URL Events", "Reddit" } },
    { nil, "s", urls.StackOverflow, { "URL Events", "Stack Overflow" } },
    { nil, "t", urls.Twitch, { "URL Events", "Twitch" } },
    { nil, "w", urls.Wikipedia, { "URL Events", "Wikipedia" } },
    { nil, "y", urls.YouTube, { "URL Events", "YouTube" } },
    { { "cmd" }, "h", urls.Hammerspoon, { "URL Events", "Hammerspoon" } },
    { { "shift" }, "d", urls.Dropbox, { "URL Events", "Dropbox" } },
    { { "shift" }, "a", urls.Airbnb, { "URL Events", "Airbnb" } },
    { { "shift" }, "g", urls.Github, { "URL Events", "Github" } },
    { { "shift" }, "y", urls.Yelp, { "URL Events", "Yelp" } },
}

-- Define search mode workflow events
local searchWorkflowEvents = {
    { nil, "a", urls.Amazon, { "Search Events", "Amazon" } },
    { nil, "d", urls.DuckDuckGo, { "Search Events", "DuckDuckGo" } },
    { nil, "r", urls.Reddit, { "Search Events", "Reddit" } },
    { nil, "w", urls.Wikipedia, { "URL Events", "Wikipedia" } },
    { nil, "y", urls.YouTube, { "Search Events", "YouTube" } },
    { { "shift" }, "g", urls.Github, { "Search Events", "Github" } },
    { { "shift" }, "y", urls.Yelp, { "Search Events", "Yelp" } },
}

-- Define file mode workflow events
local fileWorkflowEvents = {
    { nil, "c", files.Code, { "Files", "Code" } },
    { { "alt" }, "d", files.Dropbox, { "Files", "Dropbox" } },
}

-- Define window mode workflow events
local function moveWindowOneSpaceLeft() WindowResizer.moveWindowOneSpace("left") end
local function moveWindowOneSpaceRight() WindowResizer.moveWindowOneSpace("right") end
local windowWorkflowEvents = {
    { nil, "h", WindowResizer.moveWindowLeft, { "Window Mode", "Move Window Left" } },
    { nil, "j", WindowResizer.centerWindow, { "Window Mode", "Center Window" } },
    { nil, "k", WindowResizer.maximizeWindow, { "Window Mode", "Maximize Window" } },
    { nil, "l", WindowResizer.moveWindowRight, { "Window Mode", "Move Window Right" } },
    { nil, "space", WindowResizer.moveWindowToNextMonitor, { "Window Mode", "Move Window To Next Monitor" } },
    { { "ctrl" }, "h", WindowResizer.moveWindowBottomLeft, { "Window Mode", "Move Window Bottom Left" } },
    { { "ctrl" }, "l", WindowResizer.moveWindowBottomRight, { "Window Mode", "Move Window Bottom Right" } },
    { { "shift" }, "h", WindowResizer.moveWindowUpperLeft, { "Window Mode", "Move Window Upper Left" } },
    { { "shift" }, "l", WindowResizer.moveWindowUpperRight,{ "Window Mode", "Move Window Upper Right" } },
    { { "cmd" }, "h", moveWindowOneSpaceLeft, { "Window Mode", "Move Window One Space to the Left" } },
    { { "cmd" }, "l", moveWindowOneSpaceRight, { "Window Mode", "Move Window One Space to the Right" } },
}

----------------------------------------------------------------------------------------------------
-- Finish up and finally set custom shortcuts
--

-- Save custom entities to reference in local configs
Ki.customEntities = entities
Ki.customFiles = files
Ki.customURLs = urls

-- Set custom workflow shortcuts
Ki.workflowEvents = {
    entity = entityWorkflowEvents,
    select = selectEntityWorkflowEvents,
    url = urlWorkflowEvents,
    file = fileWorkflowEvents,
    window = windowWorkflowEvents,
    search = searchWorkflowEvents,
}
