----------------------------------------------------------------------------------------------------
-- Github.com URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://github.com"
local Github = URL:new(baseURL)

Github.paths = {
    -- Main routes
    { name = "Github", path = baseURL },
    { name = "Pull Requests", path = "/pulls" },
    { name = "Issues", path = "/issues" },
    { name = "Marketplace", path = "/marketplace" },
    { name = "Explore", path = "/explore" },
    { name = "Notifications", path = "/notifications" },
    -- Profile
    { name = "Profile", path = "/andweeb" },
    { name = "Repositories", path = "/andweeb?tab=repositories" },
    { name = "Projects", path = "/andweeb?tab=projects" },
    { name = "Stars", path = "/andweeb?tab=stars" },
    { name = "Followers", path = "/andweeb?tab=followers" },
    { name = "Following", path = "/andweeb?tab=following" },
    { name = "Gists", path = "https://gist.github.com/mine" },
    { name = "Settings", path = "/settings/profile" },
    -- Projects
    { name = "ki", path = "/andweeb/ki" },
    { name = ".hammerspoon", path = "/andweeb/.hammerspoon" },
    { name = "dotfiles", path = "/andweeb/dotfiles" },
    { name = "courier", path = "/andweeb/courier" },
    -- "Create New" Actions
    { name = "New repository", path = "/new" },
    { name = "Import repository", path = "/new/import" },
    { name = "New gist", path = "https://gist.github.com/" },
    { name = "New organization", path = "/organizations/new" },
    { name = "New project", path = "/new/project" },
}

return Github
