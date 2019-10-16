----------------------------------------------------------------------------------------------------
-- GitHub URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local GitHub = DefaultUrlEntities.GitHub

GitHub.class:include(SearchMixin)

GitHub.paths = {
    -- Main routes
    { name = "GitHub", path = GitHub.url },
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
    { name = "xciter", path = "/andweeb/xciter" },
    -- "Create New" Actions
    { name = "New repository", path = "/new" },
    { name = "Import repository", path = "/new/import" },
    { name = "New gist", path = "https://gist.github.com/" },
    { name = "New organization", path = "/organizations/new" },
    { name = "New project", path = "/new/project" },
}

return GitHub
