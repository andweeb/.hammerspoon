----------------------------------------------------------------------------------------------------
-- Google Maps website config
--
local URLSearchMixin = require("ki-entities/url-search")
local GoogleMaps = spoon.Ki.defaultEntities.website.GoogleMaps

GoogleMaps.class:include(URLSearchMixin)

-- Basic address search
function GoogleMaps:basicURLSearch(encodedQuery)
    self.open(self.url.."/search/"..encodedQuery)
end

-- Driving directions search
function GoogleMaps:advancedURLSearch(origin, destination)
    local searchURL = self.url.."/dir/"..origin
    searchURL = searchURL.."/"..destination
    self.open(searchURL)
end

return GoogleMaps
