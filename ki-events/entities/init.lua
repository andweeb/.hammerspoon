----------------------------------------------------------------------------------------------------
-- Custom Ki entites
--
local Entities = {}

function Entities.require(file)
    return require("ki-events/entities/"..file)
end

-- Create custom Ki workflow events
function Entities:init(Ki)
    local URL = Ki.URL
    local File = Ki.File
    local Entity = Ki.Entity
    local Application = Ki.Application

    local urlEvent = function(url)
        return function()
            return hs.urlevent.openURL(url)
        end
    end

    local Hammerspoon = URL:new("http://www.hammerspoon.org/docs/index.html")

    Hammerspoon.paths = {
        "http://www.hammerspoon.org",
        "http://www.hammerspoon.org/docs/index.html",
        "https://github.com/Hammerspoon/hammerspoon",
    }

    local urls = {
        BoA = urlEvent("https://www.bankofamerica.com"),
        Chase = urlEvent("https://www.chase.com"),
        Dropbox = urlEvent("https://www.dropbox.com"),
        StackOverflow = urlEvent("https://stackoverflow.com"),
        Twitch = urlEvent("http://twitch.tv"),
        Airbnb = urlEvent("https://www.airbnb.com"),
        Hammerspoon = Hammerspoon,
    }

    local files = {
        Code = File:new("~/Code"),
        Dropbox = File:new("~/Dropbox"),
    }

    local entities = {
        -- Basic application entities
        Alacritty = Application:new("Alacritty"),
        AppStore = Application:new("App Store"),
        Discord = Application:new("Discord"),
        Hammerspoon = Application:new("Hammerspoon"),
        Sblack = Application:new("Sblack"),
        ScriptEditor = Application:new("Script Editor"),
        Simulator = Application:new("Simulator"),
        MicrosoftExcel = Application:new("Microsoft Excel"),
        MicrosoftWord = Application:new("Microsoft Word"),
        Postico = Application:new("Postico"),
        VMWareFusion = Application:new("VMware Fusion"),

        -- Require external application entities
        IINA = self.require("iina"):init(Application),
        iTerm = self.require("iterm"):init(Application),
        MicrosoftOutlook = self.require("microsoft-outlook"):init(Application),
        TablePlus = self.require("tableplus"):init(Application),
        VLC = self.require("vlc"):init(Application),

        -- Custom entities
        BedroomLIFX = self.require("lifx"):init(Entity, "label:Bedroom"),
        ClipboardText = self.require("clipboard-text"):init(Entity),
    }

    -- Configure entities locally if a local configurer file exists
    pcall(function()
        local LocalEntityConfigurer = self.require("local-entity-configurer")

        LocalEntityConfigurer:configure(Ki, entities, files, urls)
    end)

    return urls, files, entities
end

return Entities
