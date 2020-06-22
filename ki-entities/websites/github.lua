----------------------------------------------------------------------------------------------------
-- GitHub website config
--
local GitHub = spoon.Ki.defaultEntities.website.GitHub
local APISearchMixin = require("ki-entities/api-search")
local URLSearchMixin = require("ki-entities/url-search")
local GraphQLClient = require("lib/graphql/client")
local apiToken = GraphQLClient.getEnvironmentVariable("GITHUB_TOKEN")

-- Initialize website instance with search mixins
GitHub.class:include(APISearchMixin)
GitHub.class:include(URLSearchMixin)

-- Attach GraphQL Client instance initialized with auth header
GitHub.graphqlClient = GraphQLClient("https://api.github.com/graphql", {
    Authorization = "Bearer "..apiToken,
})

-- Add some custom GitHub links
local customLinks = {
    -- Profile
    { name = "Profile", link = "/andweeb" },
    { name = "Repositories", link = "/andweeb?tab=repositories" },
    { name = "Projects", link = "/andweeb?tab=projects" },
    { name = "Stars", link = "/andweeb?tab=stars" },
    { name = "Followers", link = "/andweeb?tab=followers" },
    { name = "Following", link = "/andweeb?tab=following" },
    { name = "Trending", link = "/trending?since=daily" },
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

-- Parameter-based advanced search using the URL search mixin
function GitHub:advancedURLSearch(query, language)
    local searchURL = self.url.."/search?q="..query
    searchURL = searchURL.."&l="..language.."&type=Code"
    self.open(searchURL)
end

-- Create repository page actions
function GitHub:createRepositoryPageAction(path)
    return function(chooser)
        local selectedRow = chooser:selectedRow()
        local choice = chooser:selectedRowContents(selectedRow)

        chooser:cancel()
        self.open(choice.url.."/"..path)

        return true
    end
end

GitHub:registerChooserShortcuts({
    { { "cmd", "shift" }, "a", GitHub:createRepositoryPageAction("actions") },
    { { "cmd" }, "b", GitHub:createRepositoryPageAction("branches") },
    { { "cmd" }, "g", GitHub:createRepositoryPageAction("graphs") },
    { { "cmd" }, "i", GitHub:createRepositoryPageAction("issues") },
    { { "cmd" }, "p", GitHub:createRepositoryPageAction("projects") },
    { { "cmd" }, "r", GitHub:createRepositoryPageAction("releases") },
    { { "cmd" }, "s", GitHub:createRepositoryPageAction("settings") },
    { { "cmd" }, "t", GitHub:createRepositoryPageAction("graphs/traffic") },
    { { "cmd" }, "w", GitHub:createRepositoryPageAction("wiki") },
    { { "cmd", "shift" }, "c", GitHub:createRepositoryPageAction("commits/master") },
    { { "cmd", "shift" }, "i", GitHub:createRepositoryPageAction("pulse") },
})

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
        self:loadChooserRowImage(choices, repository.imageURL, index)

        table.insert(choices, {
            url = repository.url,
            imageURL = repository.imageURL,
            text = repository.owner.name.." / "..repository.name,
            subText = repository.description,
        })
    end

    return choices
end

-- Create choice objects for each issue result with the following fragment:
-- ... on Issue {
--     repository {
--         name
--         imageURL: openGraphImageUrl
--     }
--     title
--     url
-- }
function GitHub:createIssueChoices(issues)
    local choices = {}

    for index, issue in pairs(issues) do
        self:loadChooserRowImage(choices, issue.repository.imageURL, index)

        table.insert(choices, {
            url = issue.url,
            text = issue.title.." ("..issue.state..")",
            subText = issue.repository.nameWithOwner,
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
        self:loadChooserRowImage(choices, user.imageURL, index)

        table.insert(choices, {
            url = user.url,
            text = user.name and user.name.." ("..user.login..")" or user.login,
            subText = user.bio,
        })
    end

    return choices
end

-- Create response handler functions that invoke a callback on successful responses or notifies errors
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

-- Create actions to show a chooser of results on the viewer object
function GitHub:createViewerResultAction(queryName, field, variables, placeholderText, choicesGenerator)
    return function()
        local choices = {}
        local function updateChoices()
            return choices
        end

        -- Create response handler to display the viewer's repository results in a chooser
        local handleResponse = self:createResponseHandler(function(response)
            local results = response.data.viewer[field].results
            choices = choicesGenerator(self, results)

            local options = { placeholderText = placeholderText }
            local function onChoice(choice)
                if choice then
                    return self.open(choice.url)
                end
            end

            self:showChooser(updateChoices, onChoice, options)
        end)

        local graphql = self.graphqlClient:readGraphQLDocument("github/"..queryName)

        self.graphqlClient:query(graphql, variables, nil, handleResponse)
    end
end

local orderByCreatedAt = {
    orderBy = {
        field = "CREATED_AT",
        direction = "DESC",
    },
}
local orderByStarredAt = {
    orderBy = {
        field = "STARRED_AT",
        direction = "DESC",
    },
}

-- Initialize show viewer repository actions
GitHub.showFollowers = GitHub:createViewerResultAction("followers", "followers", nil,
    "Your followers", GitHub.createUserChoices)

GitHub.showFollowing = GitHub:createViewerResultAction("following", "following", nil,
    "Your following", GitHub.createUserChoices)

GitHub.showIssues = GitHub:createViewerResultAction("issues", "issues", orderByCreatedAt,
    "Your issues", GitHub.createIssueChoices)

GitHub.showRepositories = GitHub:createViewerResultAction("repositories", "repositories",
    orderByCreatedAt, "Owned repositories", GitHub.createRepositoryChoices)

GitHub.showStarredRepositories = GitHub:createViewerResultAction("starred-repositories", "starredRepositories",
    orderByStarredAt, "Starred repositories", GitHub.createRepositoryChoices)

GitHub.showWatchingRepositories = GitHub:createViewerResultAction("watching-repositories", "watching",
    orderByCreatedAt, "Watched repositories", GitHub.createRepositoryChoices)

-- Create an action to show a chooser of user connection items on the viewer
function GitHub:showGists()
    -- Create response handler to display gist results in a chooser
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

        self:showChooser(choices, onChoice, { placeholderText = "Gists" })
    end)

    local graphql = self.graphqlClient:readGraphQLDocument("github/gists")

    self.graphqlClient:query(graphql, nil, nil, handleResponse)
end

-- Create an action to show a chooser of user connection items on the viewer
function GitHub:showProjects()
    -- Create repsonse handler to show project results in a chooser
    local handleResponse = self:createResponseHandler(function(response)
        local repositories = response.data.viewer.repositories.results
        local choices = {}
        local function updateChoices()
            return choices
        end
        local function onChoice(choice)
            if choice then
                return self.open(choice.url)
            end
        end

        for i = 1, #repositories do
            local repository = repositories[i]
            local projects = repository.projects.results

            for projectIndex = 1, #projects do
                local project = projects[projectIndex]

                self:loadChooserRowImage(choices, repository.imageURL, projectIndex)

                table.insert(choices, {
                    url = project.url,
                    text = repository.name.." | "..project.name,
                    subText = project.body,
                })
            end
        end

        self:showChooser(updateChoices, onChoice, { placeholderText = "Repository Projects" })
    end)

    local graphql = self.graphqlClient:readGraphQLDocument("github/repository-projects")

    self.graphqlClient:query(graphql, nil, nil, handleResponse)
end

-- Create API search actions
function GitHub:createAPISearchAction(type, choicesGenerator)
    return function()
        local choices = {}
        local function updateChoices()
            return choices
        end

        -- Create search input handler
        local function onInput(query)
            local variables = { type = type, query = query }
            local graphql = self.graphqlClient:readGraphQLDocument("github/search")

            self.graphqlClient:query(graphql, variables, nil, self:createResponseHandler(function(response)
                local results = response.data.search.results
                choices = choicesGenerator(self, results)
                self.chooser:refreshChoicesCallback()
            end))
        end

        -- Create item selection handler
        local onSelection = function(choice)
            if choice then
                return self.open(choice.url)
            end
        end

        -- Start API search interface
        self:apiSearch(updateChoices, onInput, onSelection, {
            placeholderText = "Search for a GitHub "..type:lower()
        })
    end
end

-- Initialize API search actions
GitHub.searchRepositories = GitHub:createAPISearchAction("REPOSITORY", GitHub.createRepositoryChoices)
GitHub.searchUsers = GitHub:createAPISearchAction("USER", GitHub.createUserChoices)

GitHub:registerShortcuts({
    { nil, "f", GitHub.showFollowers, { "GitHub", "Show GitHub Followers" } },
    { nil, "g", function() GitHub:showGists() end, { "GitHub", "Show GitHub Gists" } },
    { nil, "i", GitHub.showIssues, { "GitHub", "Show GitHub Issues" } },
    { nil, "p", function() GitHub:showProjects() end, { "GitHub", "Show Projects" } },
    { nil, "r", GitHub.showRepositories, { "GitHub", "Show Repositories" } },
    { nil, "s", GitHub.searchRepositories, { "GitHub", "Search GitHub Repositories" } },
    { nil, "u", GitHub.searchUsers, { "GitHub", "Search GitHub Users" } },
    { nil, "w", GitHub.showWatchingRepositories, { "GitHub", "Show Watched Repositories" } },
    { { "shift" }, "f", GitHub.showFollowing, { "GitHub", "Show GitHub Following" } },
    { { "shift" }, "s", GitHub.showStarredRepositories, { "GitHub", "Show Starred Repositories" } },
})

return GitHub
