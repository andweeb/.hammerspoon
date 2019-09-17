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

function Github:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - Github", "Enter Github search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/search?q="..encodedQuery)
            else
                self.notifyError("Ki - Github", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

return Github
