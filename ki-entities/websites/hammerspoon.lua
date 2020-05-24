----------------------------------------------------------------------------------------------------
-- Hammerspoon website config
--
local Website = spoon.Ki.Website
local githubPage = "https://github.com/Hammerspoon/hammerspoon"

return Website:new("Hammerspoon", "http://www.hammerspoon.org", {
    -- Main routes
    { name = "Download", link = githubPage.."/releases/latest" },
    { name = "Getting Started Guide", link = "/go" },
    { name = "Release Notes", link = "/releasenotes" },
    { name = "FAQ", link = "/faq" },
    { name = "API Documentation", link = "/docs/index.html" },
    { name = "Spoons", link = "/Spoons" },
    -- Github Links
    { name = "Github Page", link = githubPage },
    { name = "Github Issues", link = githubPage.."/issues" },
    { name = "Github Releases", link = githubPage.."/releases" },
    { name = "Github Wiki", link = githubPage.."/wiki" },
    { name = "Github Sample Configurations", link = githubPage.."/wiki/Sample-Configurations" },
})
