----------------------------------------------------------------------------------------------------
-- Letterboxd website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local url = "https://letterboxd.com"

return Website {
    name = "Letterboxd",
    url = url,
    links = {
        { link = "https://letterboxd.com/", name = "Letterboxd - Social film discovery." },
        { link = "https://letterboxd.com/films/", name = "Films" },
        { link = "https://letterboxd.com/lists/", name = "Lists" },
    },
}
