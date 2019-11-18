----------------------------------------------------------------------------------------------------
-- Yelp URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Yelp = DefaultUrlEntities.Yelp

Yelp.class:include(SearchMixin)

function Yelp:advancedSearch(query, location)
    local searchURL = self.url.."/search?find_desc="..query
    searchURL = searchURL.."&find_loc="..location
    self.open(searchURL)
end

return Yelp
