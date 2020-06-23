----------------------------------------------------------------------------------------------------
-- NPM website config
--
local Website = spoon.Ki.Website
local RESTClient = require("lib/rest-client")
local APISearchMixin = require("ki-entities/api-search")
local URLSearchMixin = require("ki-entities/url-search")

local NPM = Website:new("NPM", "https://www.npmjs.com")

-- Initialize website instance with search mixins
NPM.class:include(APISearchMixin)
NPM.class:include(URLSearchMixin)

-- Attach REST Client instance using the the https://npms.io API
-- https://api-docs.npms.io
NPM.restClient = RESTClient("https://api.npms.io")

function NPM.createSearchResultChoices(results)
    local choices = {}

    for i = 1, #results do
        local result = results[i]
        if result.package then
            local package = result.package
            table.insert(choices, {
                text = package.name,
                subText = package.description,
                url = package.links.npm,
            })
        end
    end

    return choices
end

-- Perform a search query for NPM packages
-- https://api-docs.npms.io/#api-Search-ExecuteSearchQuery
function NPM:searchPackages()
    local placeholderText = "Search for NPM packages"

    local choices = {}
    local function updateChoices()
        return choices
    end

    -- Create search input handler
    local function onInput(input)
        local uri = "/v2/search?q="..hs.http.encodeForQuery(input)

        self.restClient:get(uri, nil, function(status, rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if not acceptedRequest or not success or (response and response.code) then
                local message = "npms.io error (code "..tostring(response.code)..")"
                self.notifyError(message, response.message)
            else
                choices = self.createSearchResultChoices(response.results)
                self.chooser:choices(updateChoices)
            end
        end)
    end

    -- Create item selection handler
    local onSelection = function(choice)
        if choice then
            return self.open(choice.url)
        end
    end

    -- Start API search interface
    self:apiSearch(updateChoices, onInput, onSelection, { placeholderText = placeholderText })
end

NPM:registerShortcuts({
    { nil, "s", function(...) NPM:searchPackages(...) end, { "Search", "Search for an NPM Package" } },
})

return NPM
