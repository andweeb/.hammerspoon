----------------------------------------------------------------------------------------------------
-- Letterboxd website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local URLSearchMixin = require("ki-entities/url-search")
local url = "https://letterboxd.com"

local Letterboxd = Website {
    name = "Letterboxd",
    url = url,
    links = {
        { link = "https://letterboxd.com/", name = "Letterboxd - Social film discovery." },
        { link = "https://letterboxd.com/films/", name = "Films" },
        { link = "https://letterboxd.com/lists/", name = "Lists" },
        { link = "https://letterboxd.com/likes/", name = "Likes" },
        { link = "https://letterboxd.com/watchlist/", name = "Watchlist" },
    },
}

Letterboxd.class:include(URLSearchMixin)

function Letterboxd:basicURLSearch(encodedQuery)
    return self.open(self.url.."/search/"..encodedQuery)
end

return Letterboxd
