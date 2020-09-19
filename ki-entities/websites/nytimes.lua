----------------------------------------------------------------------------------------------------
-- The New York Times website config
--
-- JavaScript to retrieve mini nav items:
-- copy(
--     Array.prototype.map.call(
--         document.querySelectorAll("li[data-testid=mini-nav-item] > a"),
--         node => (`{ name = '${node.innerHTML}', link = '${node.href}' }`)
--     )
-- );
local Ki = spoon.Ki
local Website = Ki.Website
local URLSearchMixin = require("ki-entities/url-search")
local NYTimes = Website {
    name = "The New York Times",
    url = "https://www.nytimes.com",
    links = {
        { name = "World", link = "/section/world" },
        { name = "U.S.", link = "/section/us" },
        { name = "Politics", link = "/section/politics" },
        { name = "N.Y.", link = "/section/nyregion" },
        { name = "Business", link = "/section/business" },
        { name = "Opinion", link = "/section/opinion" },
        { name = "Tech", link = "/section/technology" },
        { name = "Science", link = "/section/science" },
        { name = "Health", link = "/section/health" },
        { name = "Sports", link = "/section/sports" },
        { name = "Arts", link = "/section/arts" },
        { name = "Books", link = "/section/books" },
        { name = "Style", link = "/section/style" },
        { name = "Food", link = "/section/food" },
        { name = "Travel", link = "/section/travel" },
        { name = "Magazine", link = "/section/magazine" },
        { name = "T Magazine", link = "/section/t-magazine" },
        { name = "Real Estate", link = "/section/realestate" },
        { name = "Video", link = "/video" },
    },
}

NYTimes.class:include(URLSearchMixin)
NYTimes:initURLSearch(nil, "query")

return NYTimes
