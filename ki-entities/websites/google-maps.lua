----------------------------------------------------------------------------------------------------
-- Google Maps website config
--
local SearchMixin = require("ki-entities/search-mixin")
local GoogleMaps = spoon.Ki.defaultEntities.website.GoogleMaps

GoogleMaps.class:include(SearchMixin)

-- Basic address search
function GoogleMaps:basicSearch(encodedQuery)
    self.open(self.url.."/search/"..encodedQuery)
end

-- Driving directions search
function GoogleMaps:advancedSearch(origin, destination)
    local searchURL = self.url.."/dir/"..origin
    searchURL = searchURL.."/"..destination
    self.open(searchURL)
end

return GoogleMaps
