----------------------------------------------------------------------------------------------------
-- Yelp website config
--
local URLSearchMixin = require("ki-entities/url-search")
local Yelp = spoon.Ki.defaultEntities.website.Yelp

Yelp.class:include(URLSearchMixin)

function Yelp:advancedURLSearch(query, location)
    local searchURL = self.url.."/search?find_desc="..query
    searchURL = searchURL.."&find_loc="..location
    self.open(searchURL)
end

table.insert(Yelp.links, { name = "Yelp Developers Page", link = "/developers" })
table.insert(Yelp.links, { name = "Yelp GraphQL API Console", link = "/developers/graphiql" })

return Yelp
