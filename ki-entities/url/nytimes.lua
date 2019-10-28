----------------------------------------------------------------------------------------------------
-- NYTimes URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local URL = spoon.Ki.URL

local baseURL = "https://www.nytimes.com"
local NYTimes = URL:new(baseURL)

NYTimes.queryParam = "query"
NYTimes.class:include(SearchMixin)

-- JavaScript to retrieve mini nav items:
-- copy(
--     Array.prototype.map.call(
--         document.querySelectorAll("li[data-testid=mini-nav-item] > a"),
--         node => (`{ name = '${node.innerHTML}', path = '${node.href}' }`)
--     )
-- );
NYTimes.paths = {
    { name = "World", path = "/section/world" },
    { name = "U.S.", path = "/section/us" },
    { name = "Politics", path = "/section/politics" },
    { name = "N.Y.", path = "/section/nyregion" },
    { name = "Business", path = "/section/business" },
    { name = "Opinion", path = "/section/opinion" },
    { name = "Tech", path = "/section/technology" },
    { name = "Science", path = "/section/science" },
    { name = "Health", path = "/section/health" },
    { name = "Sports", path = "/section/sports" },
    { name = "Arts", path = "/section/arts" },
    { name = "Books", path = "/section/books" },
    { name = "Style", path = "/section/style" },
    { name = "Food", path = "/section/food" },
    { name = "Travel", path = "/section/travel" },
    { name = "Magazine", path = "/section/magazine" },
    { name = "T Magazine", path = "/section/t-magazine" },
    { name = "Real Estate", path = "/section/realestate" },
    { name = "Video", path = "/video" },
}

return NYTimes
