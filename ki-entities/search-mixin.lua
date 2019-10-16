local SearchMixin = {}

local defaultSearchPath = "search"
local defaultQueryParam = "q"

-- Override default values on URL entity:
-- * searchPath
-- * queryParam
-- * handleSearch
function SearchMixin:search()
    local title = "Ki - "..self.url
    local searchPath = self.searchPath or defaultSearchPath
    local queryParam = self.queryParam or defaultQueryParam
    local handleSearch = self.handleSearch or SearchMixin.defaultSearchHandler

    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt(title, "Enter search query:", "", "Search", "Cancel")

        if choice == "Search" then
            handleSearch(SearchMixin, self, searchQuery, searchPath, queryParam)
        end
    end)
end

function SearchMixin:defaultSearchHandler(urlEntity, searchQuery, searchPath, queryParam)
    local title = "Ki - "..urlEntity.url
    local success, encodedQuery, descriptor = self.encodeSearchQuery(searchQuery)

    if success then
        urlEntity.open(urlEntity.url.."/"..searchPath.."?"..queryParam.."="..encodedQuery)
    else
        urlEntity.notifyError(title, descriptor.NSLocalizedDescription)
    end
end

function SearchMixin.encodeSearchQuery(searchQuery)
    return hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")
end

return SearchMixin
