----------------------------------------------------------------------------------------------------
-- GitHub website config
--
local GitHub = spoon.Ki.defaultEntities.website.GitHub
local URLSearchMixin = require("ki-entities/url-search")
local GraphQLClient = require("lib/graphql-client")
local apiToken = GraphQLClient.getEnvironmentVariable("GITHUB_TOKEN")

-- Initialize website instance with search mixin and GraphQL Client
GitHub.class:include(URLSearchMixin)
GitHub.graphqlClient = GraphQLClient("https://api.github.com/graphql", {
    Authorization = "Bearer "..apiToken,
})

local customLinks = {
    -- Profile
    { name = "Profile", link = "/andweeb" },
    { name = "Repositories", link = "/andweeb?tab=repositories" },
    { name = "Projects", link = "/andweeb?tab=projects" },
    { name = "Stars", link = "/andweeb?tab=stars" },
    { name = "Followers", link = "/andweeb?tab=followers" },
    { name = "Following", link = "/andweeb?tab=following" },
    -- Projects
    { name = "ki", link = "/andweeb/ki" },
    { name = ".hammerspoon", link = "/andweeb/.hammerspoon" },
    { name = "dotfiles", link = "/andweeb/dotfiles" },
    { name = "courier", link = "/andweeb/courier" },
    { name = "xciter", link = "/andweeb/xciter" },
    -- Watching projects
    { name = "Hammerspoon", link = "/Hammerspoon/hammerspoon" },
    { name = "TablePlus", link = "/TablePlus/TablePlus" },
    { name = "Tridactyl", link = "/tridactyl/tridactyl" },
    { name = "fzf", link = "/junegunn/fzf" },
    -- GitHub API Docs
    { name = "GraphQL API v4", link = "https://developer.github.com/v4/" },
    { name = "GraphQL API Explorer", link = "https://developer.github.com/v4/explorer/" },
}

for i = 1, #customLinks do
    table.insert(GitHub.links, customLinks[i])
end

-- Parameter-based advanced search using the search mixin
function GitHub:advancedURLSearch(query, language)
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

-- Search on GitHub with debounced input for some SearchType enum (repository, user, etc.):
-- https://developer.github.com/v4/enum/searchtype/
function GitHub:apiSearch(type, createChoices)
    local graphql = self.graphqlClient:readGraphQLDocument("github/search")

    local lastMs = 0
    local elapsedMs = 0
    local debounceMs = 500
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
        local variables = { type = type, query = query }
        self.graphqlClient:query(graphql, variables, nil, self:createResponseHandler(function(response)
            local results = response.data.search.results
            local choices = createChoices(self, results)
            self.selectionModal:choices(choices)
        end))
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

-- Wrapper function to either notify on error or invoke a callback on a successful response
function GitHub:createResponseHandler(callback)
    return function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if acceptedRequest and success and response and not response.errors then
            callback(response)
        else
            local message = "Error communicating with Github (status "..tostring(status)..")"
            self.notifyError(message, hs.inspect(response))
        end
    end
end

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:createViewerRepositorySelection(queryName, field, variables, placeholderText)
    return function()
        -- Create response handler to display the viewer's repository results in a selection modal
        local handleResponse = self:createResponseHandler(function(response)
            local repositories = response.data.viewer[field].results
            local choices = self:createRepositoryChoices(repositories)
            local options = { placeholderText = placeholderText }

            self:showSelectionModal(choices, function(choice)
                if choice then
                    return self.open(choice.url)
                end
            end, options)
        end)

        local graphql = self.graphqlClient:readGraphQLDocument("github/"..queryName)

        self.graphqlClient:query(graphql, variables, nil, handleResponse)
    end
end

-- Initialize show viewer repository actions
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
function GitHub:createViewerConnectionSelectionAction(queryName)
    return function()
        -- Create response handler to display user connection results in a selection modal
        local handleResponse = self:createResponseHandler(function(response)
            local following = response.data.viewer[queryName].results
            local choices = self:createUserChoices(following)
            local function onChoice(choice)
                if choice then
                    return self.open(choice.url)
                end
            end

            self:showSelectionModal(choices, onChoice, {
                placeholderText = "Your "..queryName:gsub('^%l', string.upper)
            })
        end)

        local graphql = self.graphqlClient:readGraphQLDocument("github/"..queryName)

        self.graphqlClient:query(graphql, nil, nil, handleResponse)
    end
end

GitHub.showFollowers = GitHub:createViewerConnectionSelectionAction("followers")
GitHub.showFollowing = GitHub:createViewerConnectionSelectionAction("following")

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:showGists()
    -- Create response handler to display gist results in a selection modal
    local handleResponse = self:createResponseHandler(function(response)
        local gists = response.data.viewer.gists.results
        local choices = {}

        for i = 1, #gists do
            local gist = gists[i]
            table.insert(choices, {
                url = gist.url,
                text = gist.description,
                subText = gist.name,
            })
        end

        local function onChoice(choice)
            if choice then
                return self.open(choice.url)
            end
        end

        self:showSelectionModal(choices, onChoice, { placeholderText = "Gists" })
    end)

    local graphql = self.graphqlClient:readGraphQLDocument("github/gists")

    self.graphqlClient:query(graphql, nil, nil, handleResponse)
end

-- Create an action to show a selection modal of user connection items on the viewer
function GitHub:showProjects()
    -- Create repsonse handler to show project results in a selection modal
    local handleResponse = self:createResponseHandler(function(response)
        local repositories = response.data.viewer.repositories.results
        local choices = {}

        for i = 1, #repositories do
            local repository = repositories[i]
            local projects = repository.projects.results

            for j = 1, #projects do
                local project = projects[j]

                hs.image.imageFromURL(repository.imageURL, function(image)
                    if not self.selectionModal then return end

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

        local function onChoice(choice)
            if choice then
                return self.open(choice.url)
            end
        end

        self:showSelectionModal(choices, onChoice, { placeholderText = "Repository Projects" })
    end)

    local graphql = self.graphqlClient:readGraphQLDocument("github/repository-projects")

    self.graphqlClient:query(graphql, nil, nil, handleResponse)
end

GitHub.searchRepositories = function() GitHub:apiSearch("REPOSITORY", GitHub.createRepositoryChoices) end
GitHub.searchUsers = function() GitHub:apiSearch("USER", GitHub.createUserChoices) end

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

function GitHub:openRepositoryPage(path)
    return function(modal)
        local selectedRow = modal:selectedRow()
        local choice = modal:selectedRowContents(selectedRow)

        modal:cancel()
        self.open(choice.url.."/"..path)

        return true
    end
end

GitHub:registerSelectionModalShortcuts({
    { { "cmd", "shift" }, "a", GitHub:openRepositoryPage("actions") },
    { { "cmd" }, "b", GitHub:openRepositoryPage("branches") },
    { { "cmd" }, "c", GitHub:openRepositoryPage("commits/master") },
    { { "cmd" }, "g", GitHub:openRepositoryPage("graphs") },
    { { "cmd" }, "i", GitHub:openRepositoryPage("issues") },
    { { "cmd" }, "p", GitHub:openRepositoryPage("projects") },
    { { "cmd" }, "r", GitHub:openRepositoryPage("releases") },
    { { "cmd" }, "s", GitHub:openRepositoryPage("settings") },
    { { "cmd" }, "t", GitHub:openRepositoryPage("graphs/traffic") },
    { { "cmd" }, "w", GitHub:openRepositoryPage("wiki") },
    { { "cmd", "shift" }, "i", GitHub:openRepositoryPage("pulse") },
})

return GitHub
