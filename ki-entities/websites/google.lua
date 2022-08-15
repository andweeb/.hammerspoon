----------------------------------------------------------------------------------------------------
-- Google website config
--
local URLSearchMixin = require("ki-entities/url-search")
local Google = spoon.Ki.defaultEntities.website.Google

Google.class:include(URLSearchMixin)

local links = {
    { name = "Google Flights", link = "https://www.google.com/travel/flights" },
    { name = "Google My Maps", link = "https://mymaps.google.com" },
}

for i = 1, #links do
    local link = links[i]
    table.insert(Google.links, link)
end

return Google
