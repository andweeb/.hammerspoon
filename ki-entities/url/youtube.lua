----------------------------------------------------------------------------------------------------
-- YouTube URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local YouTube = DefaultUrlEntities.YouTube

YouTube.searchPath = "results"
YouTube.queryParam = "search_query"
YouTube.class:include(SearchMixin)

YouTube.paths = {
    { name = "YouTube", path = "https://youtube.com" },
    { name = "Trending", path = "/feed/trending" },
    { name = "Subscriptions", path = "/feed/subscriptions" },
    { name = "Library", path = "/feed/library" },
    { name = "History", path = "/feed/history" },
    { name = "Watch Later", path = "/playlist?list=WL" },
}

return YouTube
