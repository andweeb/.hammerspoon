----------------------------------------------------------------------------------------------------
-- GitHub URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local scriptPath = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/graphql")
local GitHub = spoon.Ki.defaultEntities.url.GitHub

GitHub.class:include(SearchMixin)
GitHub.API_ENDPOINT = "https://api.github.com/graphql"

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
    -- GitHub API Docs
    { name = "GraphQL API v4", path = "https://developer.github.com/v4/" },
    { name = "GraphQL API Explorer", path = "https://developer.github.com/v4/explorer/" },
}

for _, path in pairs(customPaths) do
    table.insert(GitHub.paths, path)
end

function GitHub:advancedSearch(query, language)
    local searchURL = self.url.."/search?q="..query
    searchURL = searchURL.."&l="..language.."&type=Code"
    self.open(searchURL)
end

-- Create choice objects for each repository result with the following fragment:
-- ... on Repository {
--     name
--     owner {
--         name: login
--     }
--     url
--     description
--     imageURL: openGraphImageUrl
-- }
function GitHub:createRepositoryChoices(repositories)
    local choices = {}

    for index, repository in pairs(repositories) do
        hs.image.imageFromURL(repository.imageURL, function(image)
            if not self.selectionModal then
                return
            end

            if choices[index] then
                choices[index].image = image
                self.selectionModal:choices(choices)
            end
        end)

        table.insert(choices, {
            url = repository.url,
            text = repository.owner.name.." / "..repository.name,
            subText = repository.description,
        })
    end

    return choices
end

-- Create choice objects for each user result with the following fragment:
-- ... on User {
--     name
--     url
--     login
--     bio
--     avatarUrl
-- }
function GitHub:createUserChoices(users)
    local choices = {}

    for index, user in pairs(users) do
        local name = user.name and user.name.." ("..user.login..")" or user.login

        hs.image.imageFromURL(user.imageURL, function(image)
            if not self.selectionModal then
                return
            end

            if choices[index] then
                choices[index].image = image
                self.selectionModal:choices(choices)
            end
        end)

        table.insert(choices, {
            url = user.url,
            text = name,
            subText = user.bio,
        })
    end

    return choices
end

-- Read the GraphQL file
function GitHub.readGraphQL(name)
    local file = io.open(scriptPath.."/"..name..".graphql", "rb")
    local graphql = file:read("*all")

    file:close()

    return graphql
end

-- Fetch the GitHub GraphQL API v4
function GitHub:fetch(graphql, variables, callback)
    local headers = { Authorization = "Bearer "..self.token }
    local requestBody = { query = graphql }

    if variables then
        requestBody.variables = variables
    end

    hs.http.asyncPost(self.API_ENDPOINT, hs.json.encode(requestBody), headers, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if acceptedRequest and success and response and not response.errors then
            callback(response)
        else
            local message = "Error communicating with Github (status "..tostring(status)..")"
            self.notifyError(message, hs.inspect(response))
        end
    end)
end

-- Search GitHub repositories
function GitHub:search(type, createChoices)
    local graphql = self.readGraphQL("search")

    local lastMs = 0
    local elapsedMs = 0
    local debounceMs = 1000
    local debounceSeconds = debounceMs / 1000
    local debounceTimer = hs.timer.doEvery(0.001, function() elapsedMs = elapsedMs + 1 end)
    local lagTimer = nil

    local function onChoice(choice)
        if choice then
            debounceTimer:stop()
            debounceTimer = nil
            return self.open(choice.url)
        end
    end

    local function search(query)
        self:fetch(graphql, { type = type, query = query }, function(response)
            local results = response.data.search.results
            local choices = createChoices(self, results)
            self.selectionModal:choices(choices)
        end)
    end

    self:showSelectionModal({}, onChoice, {
        placeholderText = "Search for a GitHub "..type:lower()
    })

    self.selectionModal:queryChangedCallback(function(query)
        if lagTimer then lagTimer:stop() end

        if lastMs ~= 0 and elapsedMs - lastMs >= debounceMs then
            search(query)
        elseif #query:gsub("%s+", "") > 0 then
            lagTimer = hs.timer.doAfter(debounceSeconds, function()
                lastMs = 0
                search(query)
            end)
        end

        lastMs = elapsedMs
    end)
end

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:createViewerRepositorySelection(queryName, field, variables, placeholderText)
    return function()
        self:fetch(self.readGraphQL(queryName), variables, function(response)
            local repositories = response.data.viewer[field].results
            local choices = self:createRepositoryChoices(repositories)
            local options = { placeholderText = placeholderText }

            self:showSelectionModal(choices, function(choice)
                if choice then
                    return self.open(choice.url)
                end
            end, options)
        end)
    end
end

-- Show repository actions
GitHub.showRepositories = GitHub:createViewerRepositorySelection("repositories", "repositories", {
    orderBy = {
        field = "CREATED_AT",
        direction = "DESC",
    },
}, "Owned repositories")
GitHub.showStarredRepositories = GitHub:createViewerRepositorySelection("starred-repositories", "starredRepositories", {
    orderBy = {
        field = "STARRED_AT",
        direction = "DESC",
    },
}, "Starred repositories")
GitHub.showWatchingRepositories = GitHub:createViewerRepositorySelection("watching-repositories", "watching", {
    orderBy = {
        field = "CREATED_AT",
        direction = "DESC",
    },
}, "Watched repositories")

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:createViewerUserSelectionAction(field)
    return function()
        self:fetch(self.readGraphQL(field), nil, function(response)
            local following = response.data.viewer[field].results
            local choices = self:createUserChoices(following)
            local function onChoice(choice)
                if choice then
                    return self.open(choice.url)
                end
            end

            self:showSelectionModal(choices, onChoice, {
                placeholderText = "Your "..field:gsub('^%l', string.upper)
            })
        end)
    end
end

GitHub.showFollowers = GitHub:createViewerUserSelectionAction("followers")
GitHub.showFollowing = GitHub:createViewerUserSelectionAction("following")

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:showGists()
    self:fetch(self.readGraphQL("gists"), nil, function(response)
        local gists = response.data.viewer.gists.results
        local choices = {}

        for i = 1, #gists do
            local gist = gists[i]
            table.insert(choices, {
                url = gist.url,
                text = gist.name,
                subText = gist.description,
            })
        end

        local options = { placeholderText = "Gists" }

        self:showSelectionModal(choices, function(choice)
            if choice then
                return self.open(choice.url)
            end
        end, options)
    end)
end

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:showProjects()
    self:fetch(self.readGraphQL("repository-projects"), nil, function(response)
        local repositories = response.data.viewer.repositories.results
        local choices = {}

        for i = 1, #repositories do
            local repository = repositories[i]
            local projects = repository.projects.results

            for j = 1, #projects do
                local project = projects[j]

                hs.image.imageFromURL(repository.imageURL, function(image)
                    if not self.selectionModal then
                        return
                    end

                    if choices[j] then
                        choices[j].image = image
                        self.selectionModal:choices(choices)
                    end
                end)

                table.insert(choices, {
                    url = project.url,
                    text = repository.name.." | "..project.name,
                    subText = project.body,
                })
            end
        end

        local options = { placeholderText = "Repository Projects" }

        self:showSelectionModal(choices, function(choice)
            if choice then
                return self.open(choice.url)
            end
        end, options)
    end)
end

GitHub.searchRepositories = function() GitHub:search("REPOSITORY", GitHub.createRepositoryChoices) end
GitHub.searchUsers = function() GitHub:search("USER", GitHub.createUserChoices) end

GitHub:registerShortcuts({
    { nil, "f", GitHub.showFollowers, { "GitHub", "Show GitHub Followers" } },
    { nil, "g", function() GitHub:showGists() end, { "GitHub", "Show GitHub Gists" } },
    { nil, "p", function() GitHub:showProjects() end, { "GitHub", "Show Projects" } },
    { nil, "r", GitHub.showRepositories, { "GitHub", "Show Repositories" } },
    { nil, "s", GitHub.searchRepositories, { "GitHub", "Search GitHub Repositories" } },
    { nil, "u", GitHub.searchUsers, { "GitHub", "Search GitHub Users" } },
    { nil, "w", GitHub.showWatchingRepositories, { "GitHub", "Show Watched Repositories" } },
    { { "shift" }, "f", function() GitHub.showFollowing() end, { "GitHub", "Show GitHub Following" } },
    { { "shift" }, "s", function() GitHub:showStarredRepositories() end, { "GitHub", "Show Starred Repositories" } },
})

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
    { { "cmd" }, "a", GitHub:openRepositoryPathEvent("actions") },
    { { "cmd" }, "b", GitHub:openRepositoryPathEvent("branches") },
    { { "cmd" }, "c", GitHub:openRepositoryPathEvent("commits/master") },
    { { "cmd" }, "g", GitHub:openRepositoryPathEvent("graphs") },
    { { "cmd" }, "i", GitHub:openRepositoryPathEvent("issues") },
    { { "cmd" }, "p", GitHub:openRepositoryPathEvent("projects") },
    { { "cmd" }, "r", GitHub:openRepositoryPathEvent("releases") },
    { { "cmd" }, "s", GitHub:openRepositoryPathEvent("settings") },
    { { "cmd" }, "t", GitHub:openRepositoryPathEvent("graphs/traffic") },
    { { "cmd" }, "w", GitHub:openRepositoryPathEvent("wiki") },
    { { "cmd", "shift" }, "i", GitHub:openRepositoryPathEvent("pulse") },
})

return GitHub
