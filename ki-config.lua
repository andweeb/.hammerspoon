----------------------------------------------------------------------------------------------------
-- Ki Config File
--
local Ki = spoon.Ki
local Mode = Ki.Mode
local Remaps = Ki.Remaps
local ModeTransitions = Ki.ModeTransitions

local File = spoon.Ki.File
local Website = spoon.Ki.Website
local Application = spoon.Ki.Application
local defaultEntities = spoon.Ki.defaultEntities.entity

-- Helper function to require entity config
local function requireEntity(type, file)
    local directory = type == "entity" and "entities" or type.."s"
    return require("ki-entities/"..directory.."/"..file)
end

----------------------------------------------------------------------------------------------------
-- Remap Website Mode transition shortcuts
--
Remaps {
    -- NORMAL --
    {
        mode = "normal",
        name = "Enter Website Mode",
        shortcut = { { "cmd" }, "u" },
    },
    -- ENTITY --
    {
        mode = "entity",
        name = "Enter Website Mode",
        shortcut = { { "cmd" }, "u" },
    },
    {
        mode = "entity",
        name = "App Store",
        shortcut = { { "cmd" }, "a" },
    },
    -- SELECT --
    {
        mode = "select",
        name = "Enter Website Mode",
        shortcut = { { "cmd" }, "u" },
    },
}

----------------------------------------------------------------------------------------------------
-- Create custom ki entities
--

-- Create custom Website entities
local websites = {
    -- Basic inline Website entities
    APNews            = Website { name = "AP News"         , url = "https://www.apnews.com"        },
    BoA               = Website { name = "Bank of America" , url = "https://www.bankofamerica.com" },
    Chase             = Website { name = "Chase"           , url = "https://www.chase.com"         },
    CapitalOne        = Website { name = "Capital One"     , url = "https://www.capitalone.com"    },
    Dropbox           = Website { name = "Dropbox"         , url = "https://www.dropbox.com"       },
    Lobsters          = Website { name = "Lobsters"        , url = "http://lobste.rs"              },
    TempMail          = Website { name = "Temp Mail"       , url = "https://temp-mail.org/en/"     },

    -- Externally defined Website entities
    Airbnb            = requireEntity("website", "airbnb"),
    Amazon            = requireEntity("website", "amazon"),
    BBC               = requireEntity("website", "bbc"),
    Crunchbase        = requireEntity("website", "crunchbase"),
    DuckDuckGo        = requireEntity("website", "duckduckgo"),
    Etsy              = requireEntity("website", "etsy"),
    FacebookMessenger = requireEntity("website", "messenger"),
    Github            = requireEntity("website", "github"),
    Glassdoor         = requireEntity("website", "glassdoor"),
    Google            = requireEntity("website", "google"),
    GoogleMaps        = requireEntity("website", "google-maps"),
    Hammerspoon       = requireEntity("website", "hammerspoon"),
    HammerspoonDocs   = requireEntity("website", "hammerspoon-docs"),
    LearnXInYMinutes  = requireEntity("website", "learnxinyminutes"),
    Letterboxd        = requireEntity("website", "letterboxd"),
    LinkedIn          = requireEntity("website", "linkedin"),
    MapleLegends      = requireEntity("website", "maplelegends"),
    MyAnimeList       = requireEntity("website", "myanimelist"),
    NPM               = requireEntity("website", "npm"),
    NPR               = requireEntity("website", "npr"),
    NYTimes           = requireEntity("website", "nytimes"),
    Netflix           = requireEntity("website", "netflix"),
    OwlRepo           = requireEntity("website", "owlrepo"),
    Reddit            = requireEntity("website", "reddit"),
    StackOverflow     = requireEntity("website", "stackoverflow"),
    Wikipedia         = requireEntity("website", "wikipedia"),
    Yelp              = requireEntity("website", "yelp"),
    YouTube           = requireEntity("website", "youtube"),
    ZeroTier          = requireEntity("website", "zerotier"),
}

-- Create custom file entities
local files = {
    Code    = File "~/Code",
    TV      = File "~/Movies/TV",
    Dropbox = File "~/Dropbox",
}

-- Initialize LIFX light
local LIFX = requireEntity("entity", "lifx")
local BedroomLIFX = LIFX {
    name          = "Bedroom Light",
    selector      = "label:Bedroom Lamp",
}

-- Create custom application entities
local entities = {
    -- Initialize basic application entities inline
    Alacritty          = Application "Alacritty",
    BlueJeans          = Application "BlueJeans",
    Discord            = Application "Discord",
    Firefox            = Application "Firefox",
    Gitter             = Application "Gitter",
    Messenger          = Application "Messenger",
    LimeChat           = Application "LimeChat",
    Obsidian           = Application "Obsidian",
    Plex               = Application "Plex",
    Postico            = Application "Postico",
    Slack              = Application "Slack",
    VisualStudioCode   = Application "Visual Studio Code",

    -- Require externally defined application entities
    ["1Password"]      = requireEntity("application", "1password"),
    Fantastical        = requireEntity("application", "fantastical"),
    IINA               = requireEntity("application", "iina"),
    Hammerspoon        = requireEntity("application", "hammerspoon"),
    iTerm              = requireEntity("application", "iterm"),
    Java               = requireEntity("application", "java"),
    LINE               = requireEntity("application", "line"),
    MicrosoftExcel     = requireEntity("application", "microsoft-excel"),
    MicrosoftOutlook   = requireEntity("application", "microsoft-outlook"),
    MicrosoftWord      = requireEntity("application", "microsoft-word"),
    ScriptEditor       = requireEntity("application", "script-editor"),
    Steam              = requireEntity("application", "steam"),
    TablePlus          = requireEntity("application", "tableplus"),
    VMWareFusion       = requireEntity("application", "vmware-fusion"),
    VLC                = requireEntity("application", "vlc"),
    Zoom               = requireEntity("application", "zoom"),

    -- Require other (non-application) entities
    BedroomLIFX        = BedroomLIFX,
    ClipboardText      = requireEntity("entity", "clipboard-text"),
    EmojiPicker        = requireEntity("entity", "emoji-picker"),
    FSVolume           = requireEntity("entity", "fs-volume"),
    GlyphPicker        = requireEntity("entity", "glyph-picker"),
    KaomojiPicker      = requireEntity("entity", "kaomoji-picker"),
    Keyboard           = requireEntity("entity", "keyboard"),
    NotificationCenter = requireEntity("entity", "notification-center"),
    SmartPlug          = requireEntity("entity", "tplink-smart-plug"),
    Soundboard         = requireEntity("entity", "soundboard"),

    -- Add default Ki application entities that are to be remapped
    FaceTime           = defaultEntities.FaceTime,
    TextEdit           = defaultEntities.TextEdit,

    -- Add default Ki application entities that have been configured
    Safari             = requireEntity("application", "safari"),
    Spotify            = requireEntity("application", "spotify"),
}

----------------------------------------------------------------------------------------------------
-- Register custom shortcuts for various modes
--

-- Register entity mode shortcuts
Mode {
    name = "entity",
    shortcuts = {
        { nil                , "1" , entities["1Password"]       },
        { nil                , "a" , entities.Alacritty          },
        { nil                , "b" , entities.BlueJeans          },
        { nil                , "c" , entities.Fantastical        },
        { nil                , "e" , entities.MicrosoftExcel     },
        { nil                , "j" , entities.Java               },
        { nil                , "k" , entities.Keyboard           },
        { nil                , "l" , entities.BedroomLIFX        },
        { nil                , "o" , entities.Obsidian           },
        { nil                , "v" , entities.VMWareFusion       },
        { nil                , "w" , entities.MicrosoftWord      },
        { nil                , "z" , entities.Zoom               },
        { { "alt" }          , "p" , entities.SmartPlug          },
        { { "alt", "cmd" }   , "p" , entities.Plex               },
        { { "alt", "cmd" }   , "s" , entities.Steam              },
        { { "cmd" }          , "c" , entities.ClipboardText      },
        { { "cmd" }          , "e" , entities.EmojiPicker        },
        { { "cmd" }          , "g" , entities.GlyphPicker        },
        { { "cmd" }          , "k" , entities.KaomojiPicker      },
        { { "cmd" }          , "t" , entities.TextEdit           },
        { { "cmd" }          , "v" , entities.FSVolume           },
        { { "ctrl" }         , "n" , entities.NotificationCenter },
        { { "ctrl" }         , "s" , entities.ScriptEditor       },
        { { "shift" }        , "d" , entities.Discord            },
        { { "shift" }        , "f" , entities.Firefox            },
        { { "shift" }        , "g" , entities.Gitter             },
        { { "shift" }        , "h" , entities.Hammerspoon        },
        { { "shift" }        , "i" , entities.IINA               },
        { { "shift" }        , "l" , entities.LINE               },
        { { "shift" }        , "m" , entities.Messenger          },
        { { "shift" }        , "p" , entities.TablePlus          },
        { { "shift" }        , "t" , entities.iTerm              },
        { { "shift" }        , "v" , entities.VLC                },
        { { "shift", "cmd" } , "f" , entities.FaceTime           },
        { { "shift", "cmd" } , "l" , entities.LimeChat           },
        { { "shift", "cmd" } , "m" , entities.MicrosoftOutlook   },
        { { "shift", "cmd" } , "p" , entities.Postico            },
        { { "shift", "cmd" } , "s" , entities.Slack              },
        { { "shift", "cmd" } , "v" , entities.VisualStudioCode   },
    },
}

-- Register select mode shortcuts
Mode {
    name = "select",
    shortcuts = {
        { nil                , "e" , entities.MicrosoftExcel   , "Select a Microsoft Excel window"   },
        { nil                , "j" , entities.Java             , "Select a Java app"                 },
        { nil                , "w" , entities.MicrosoftWord    , "Select a Microsoft Word window"    },
        { nil                , "v" , entities.VMWareFusion     , "Select VMware Fusion window"       },
        { { "cmd" }          , "t" , entities.TextEdit         , "Select a TextEdit window"          },
        { { "cmd" }          , "v" , entities.FSVolume         , "Select a filesystem volume"        },
        { { "ctrl" }         , "s" , entities.ScriptEditor     , "Select a Script Editor window"     },
        { { "shift" }        , "i" , entities.IINA             , "Select an IINA window"             },
        { { "shift" }        , "p" , entities.TablePlus        , "Select a Database Connection"      },
        { { "shift" }        , "t" , entities.iTerm            , "Select an iTerm window"            },
        { { "shift" }        , "v" , entities.VLC              , "Select a VLC window"               },
        { { "shift", "cmd" } , "m" , entities.MicrosoftOutlook , "Select a Microsoft Outlook window" },
    },
}

-- Register Website mode shortcuts
Mode {
    name = "website",
    shortcuts = {
        { nil                , "a" , websites.Amazon            },
        { nil                , "b" , websites.BoA               },
        { nil                , "c" , websites.Chase             },
        { nil                , "d" , websites.DuckDuckGo        },
        { nil                , "e" , websites.Etsy              },
        { nil                , "g" , websites.Google            },
        { nil                , "m" , websites.FacebookMessenger },
        { nil                , "n" , websites.Netflix           },
        { nil                , "r" , websites.Reddit            },
        { nil                , "s" , websites.StackOverflow     },
        { nil                , "w" , websites.Wikipedia         },
        { nil                , "y" , websites.YouTube           },
        { { "alt" }          , "d" , websites.Dropbox           },
        { { "shift", "cmd" } , "c" , websites.Crunchbase        },
        { { "cmd" }          , "a" , websites.APNews            },
        { { "cmd" }          , "b" , websites.BBC               },
        { { "cmd" }          , "h" , websites.Hammerspoon       },
        { { "cmd" }          , "n" , websites.NYTimes           },
        { { "ctrl" }         , "l" , websites.Lobsters          },
        { { "ctrl", "cmd" }  , "m" , websites.MapleLegends      },
        { { "shift" }        , "a" , websites.Airbnb            },
        { { "shift" }        , "c" , websites.CapitalOne        },
        { { "shift" }        , "g" , websites.Github            },
        { { "shift", "cmd" } , "g" , websites.Glassdoor         },
        { { "shift" }        , "l" , websites.LearnXInYMinutes  },
        { { "shift" }        , "m" , websites.GoogleMaps        },
        { { "shift" }        , "n" , websites.NPM               },
        { { "shift" }        , "o" , websites.OwlRepo           },
        { { "shift" }        , "t" , websites.TempMail          },
        { { "shift" }        , "y" , websites.Yelp              },
        { { "shift" }        , "z" , websites.ZeroTier          },
        { { "shift", "cmd" } , "a" , websites.MyAnimeList       },
        { { "shift", "cmd" } , "h" , websites.HammerspoonDocs   },
        { { "shift", "cmd" } , "l" , websites.Letterboxd        },
        { { "shift", "cmd" } , "n" , websites.NPR               },
    },
}

-- Register file mode shortcuts
Mode {
    name = "file",
    shortcuts = {
        { nil         , "c" , files.Code    },
        { { "alt" }   , "d" , files.Dropbox },
        { { "shift" } , "t" , files.TV      },
    },
}

----------------------------------------------------------------------------------------------------
-- Register custom modes and their shortcuts
--

-- Register custom Ki modes
require("ki-modes/mouse-mode")
require("ki-modes/scroll-mode")
require("ki-modes/search-mode")
require("ki-modes/window-mode")

-- Register mode transitions between mouse and scroll mode
ModeTransitions {
    { "mouse", "scroll", { { "alt", "cmd" }, "s" } },
    { "scroll", "mouse", { { "cmd" }, "m" } },
}

-- Register shortcuts for the custom search mode
Mode {
    name = "search",
    shortcuts = {
        { nil                , "a" , websites.Amazon        },
        { nil                , "d" , websites.DuckDuckGo    },
        { nil                , "e" , websites.Etsy          },
        { nil                , "g" , websites.Google        },
        { nil                , "l" , websites.LinkedIn      },
        { nil                , "n" , websites.Netflix       },
        { nil                , "r" , websites.Reddit        },
        { nil                , "s" , websites.StackOverflow },
        { nil                , "w" , websites.Wikipedia     },
        { nil                , "y" , websites.YouTube       },
        { { "cmd" }          , "b" , websites.BBC           },
        { { "cmd" }          , "n" , websites.NYTimes       },
        { { "ctrl", "cmd" }  , "m" , websites.MapleLegends  },
        { { "shift" }        , "g" , websites.Github        },
        { { "shift", "cmd" } , "c" , websites.Crunchbase    },
        { { "shift", "cmd" } , "g" , websites.Glassdoor     },
        { { "shift" }        , "m" , websites.GoogleMaps    },
        { { "shift" }        , "n" , websites.NPM           },
        { { "shift" }        , "y" , websites.Yelp          },
        { { "shift" }        , "z" , websites.ZeroTier      },
        { { "shift", "cmd" } , "a" , websites.MyAnimeList   },
        { { "shift", "cmd" } , "n" , websites.NPR           },
    },
}

----------------------------------------------------------------------------------------------------
-- Save custom entities to reference in local configs
--
Ki.customEntities = entities
Ki.customFiles = files
Ki.customWebsites = websites
