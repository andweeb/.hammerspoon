----------------------------------------------------------------------------------------------------
-- URL search mixin
-- Enables `basicURLSearch` and `advancedURLSearch` methods that can also be overridden
--
-- Usage:
-- local Example = Website:new("Example", "https://www.example.com")
-- Example.class:include(SearchMixin)
-- Example.initURLSearch("searchPath", "queryParam", "queryDelimiter")
--
local URLSearchMixin = {}
local Website = spoon.Ki.Website

URLSearchMixin.searchPath = "search"
URLSearchMixin.queryParam = "q"
URLSearchMixin.queryDelimiter = "|"

function URLSearchMixin:initURLSearch(searchPath, queryParam, queryDelimiter)
    self.searchPath = searchPath or URLSearchMixin.searchPath
    self.queryParam = queryParam or URLSearchMixin.queryParam
    self.queryDelimiter = queryDelimiter or URLSearchMixin.queryDelimiter
end

function URLSearchMixin:title()
    return "Ki - Search "..(Website.getDomain(self.url) or self.url)
end

-- Main search function handler
function URLSearchMixin:search()
    local handleSearch = self.handleSearch or URLSearchMixin.defaultSearchHandler

    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt(self:title(), "Enter search query:", "", "Search", "Cancel")

        if choice == "Search" then
            handleSearch(URLSearchMixin, self, searchQuery)
        end
    end)
end

-- Basic single-query search functionality
function URLSearchMixin:basicURLSearch(encodedQuery)
    return self.open(self.url.."/"..self.searchPath.."?"..self.queryParam.."="..encodedQuery)
end

-- Stubbed-out advanced search function
-- luacheck: ignore
function URLSearchMixin:advancedURLSearch(primaryEncodedQuery, secondaryEncodedQuery) end

-- Default search handler that dispatches either basic or advanced search based on query
function URLSearchMixin:defaultSearchHandler(instance, searchQuery)
    local queryDelimiter = self.queryDelimiter or instance.queryDelimiter
    local _, delimiterCount = searchQuery:gsub(instance.queryDelimiter, "")

    -- Execute advanced search for entities that have it implemented
    if delimiterCount > 0 and instance.advancedURLSearch then
        local splitRegex = "(.*)"..queryDelimiter.."(.*)"
        local primaryQuery, secondaryQuery = searchQuery:match(splitRegex)

        if primaryQuery and secondaryQuery then
            local encodedPrimaryQuery = hs.http.encodeForQuery(primaryQuery)
            local encodedSecondaryQuery = hs.http.encodeForQuery(secondaryQuery)

            return instance:advancedURLSearch(encodedPrimaryQuery, encodedSecondaryQuery)
        end
    end

    -- Dispatch basic search
    local encodedQuery = hs.http.encodeForQuery(searchQuery)
    if instance.basicURLSearch then
        instance:basicURLSearch(encodedQuery)
    else
        self:basicURLSearch(encodedQuery)
    end
end

return URLSearchMixin
