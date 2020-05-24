----------------------------------------------------------------------------------------------------
-- Yelp website config
--
local SearchMixin = require("ki-entities/search-mixin")
local Yelp = spoon.Ki.defaultEntities.website.Yelp

Yelp.class:include(SearchMixin)

function Yelp:advancedSearch(query, location)
    local searchURL = self.url.."/search?find_desc="..query
    searchURL = searchURL.."&find_loc="..location
    self.open(searchURL)
end

table.insert(Yelp.links, { name = "Yelp Developers Page", link = "/developers" })
table.insert(Yelp.links, { name = "Yelp GraphQL API Console", link = "/developers/graphiql" })

return Yelp
