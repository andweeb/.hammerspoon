local SearchMixin = {}
local URL = spoon.Ki.URL

-- Following default values can be overriden on URL entity:
SearchMixin.url = ""
SearchMixin.searchPath = "search"
SearchMixin.queryParam = "q"
SearchMixin.queryDelimiter = "|"

function SearchMixin:title()
    return "Ki - Search "..(URL.getDomain(self.url) or self.url)
end

function SearchMixin.encodeSearchQuery(primaryQuery, secondaryQuery)
    local script = secondaryQuery == nil
        and "encodeURIComponent(`"..primaryQuery.."`)"
        or "[ encodeURIComponent(`"..primaryQuery.."`), encodeURIComponent(`"..secondaryQuery.."`) ]"
    return hs.osascript.javascript(script)
end

-- Main search function handler
function SearchMixin:search()
    local handleSearch = self.handleSearch or SearchMixin.defaultSearchHandler

    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt(self:title(), "Enter search query:", "", "Search", "Cancel")

        if choice == "Search" then
            handleSearch(SearchMixin, self, searchQuery)
        end
    end)
end

-- Basic single-query search functionality
function SearchMixin:basicSearch(encodedQuery)
    return self.open(self.url.."/"..self.searchPath.."?"..self.queryParam.."="..encodedQuery)
end

-- Stubbed-out advanced search function
-- luacheck: ignore
function SearchMixin:advancedSearch(primaryEncodedQuery, secondaryEncodedQuery) end

-- Default search handler that dispatches either basic or advanced search based on query
function SearchMixin:defaultSearchHandler(URLEntity, searchQuery)
    local _, delimiterCount = searchQuery:gsub(self.queryDelimiter, "")

    -- Execute advanced search for entities that have it implemented
    if delimiterCount > 0 and URLEntity.advancedSearch then
        local splitRegex = "(.*)"..self.queryDelimiter.."(.*)"
        local primaryQuery, secondaryQuery = searchQuery:match(splitRegex)

        if primaryQuery and secondaryQuery then
            local success, encodedQueries, descriptor =
                self.encodeSearchQuery(primaryQuery, secondaryQuery )

            if success then
                return URLEntity:advancedSearch(encodedQueries[1], encodedQueries[2])
            else
                URLEntity.notifyError(self:title(), descriptor.NSLocalizedDescription)
            end
        end
    end

    -- Dispatch basic search
    local success, encodedQuery, descriptor = self.encodeSearchQuery(searchQuery)
    if success then
        if URLEntity.basicSearch then
            URLEntity:basicSearch(encodedQuery)
        else
            self:basicSearch(self, URLEntity, encodedQuery)
        end
    else
        URLEntity.notifyError(self:title(), descriptor.NSLocalizedDescription)
    end
end

return SearchMixin
