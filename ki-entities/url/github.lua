----------------------------------------------------------------------------------------------------
-- GitHub URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local GitHub = spoon.Ki.defaultEntities.url.GitHub

GitHub.class:include(SearchMixin)

local customPaths = {
    -- Projects
    { name = "ki", path = "/andweeb/ki" },
    { name = ".hammerspoon", path = "/andweeb/.hammerspoon" },
    { name = "dotfiles", path = "/andweeb/dotfiles" },
    { name = "courier", path = "/andweeb/courier" },
    { name = "xciter", path = "/andweeb/xciter" },
    -- Watching projects
    { name = "Hammerspoon", path = "/Hammerspoon/hammerspoon" },
    { name = "TablePlus", path = "/TablePlus/TablePlus" },
    { name = "Tridactyl", path = "/tridactyl/tridactyl" },
    { name = "fzf", path = "/junegunn/fzf" },
}

for _, path in pairs(customPaths) do
    table.insert(GitHub.paths, path)
end

function GitHub:advancedSearch(query, language)
    local searchURL = self.url.."/search?q="..query
    searchURL = searchURL.."&l="..language.."&type=Code"
    self.open(searchURL)
end

function GitHub:openRepositoryPathEvent(path)
    return function(modal)
        local selectedRow = modal:selectedRow()
        local choice = modal:selectedRowContents(selectedRow)

        modal:cancel()
        self.open(choice.url.."/"..path)

        return true
    end
end

GitHub:registerSelectionModalShortcuts({
    { { "cmd" }, "b", GitHub:openRepositoryPathEvent("branches") },
    { { "cmd" }, "c", GitHub:openRepositoryPathEvent("commits/master") },
    { { "cmd" }, "i", GitHub:openRepositoryPathEvent("issues") },
    { { "cmd" }, "r", GitHub:openRepositoryPathEvent("releases") },
    { { "cmd" }, "s", GitHub:openRepositoryPathEvent("settings") },
    { { "cmd" }, "t", GitHub:openRepositoryPathEvent("graphs/traffic") },
    { { "cmd" }, "w", GitHub:openRepositoryPathEvent("wiki") },
})

return GitHub
