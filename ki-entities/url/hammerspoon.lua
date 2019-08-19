----------------------------------------------------------------------------------------------------
-- Hammerspoon.org URL entity
--
local URL = spoon.Ki.URL

local baseURL = "http://www.hammerspoon.org"
local baseGithubURL = "https://github.com/Hammerspoon/hammerspoon"
local Hammerspoon = URL:new(baseURL.."/docs/index.html")

Hammerspoon.paths = {
    -- Main routes
    { name = "Main Page", path = baseURL },
    { name = "Download", path = baseGithubURL.."/releases/latest" },
    { name = "Getting Started Guide", path = "/go" },
    { name = "Release Notes", path = "/releasenotes" },
    { name = "FAQ", path = "/faq" },
    { name = "API Documentation", path = "/docs/index.html" },
    { name = "Spoons", path = "/Spoons" },
    -- Github Links
    { name = "Github Page", path = baseGithubURL },
    { name = "Github Issues", path = baseGithubURL.."/issues" },
    { name = "Github Releases", path = baseGithubURL.."/releases" },
    { name = "Github Wiki", path = baseGithubURL.."/wiki" },
    { name = "Github Sample Configurations", path = baseGithubURL.."/wiki/Sample-Configurations" },
}

return Hammerspoon
