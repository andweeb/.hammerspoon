----------------------------------------------------------------------------------------------------
-- Wikipedia URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Wikipedia = DefaultUrlEntities.Wikipedia

Wikipedia.searchPath = "w/index.php"
Wikipedia.queryParam = "search"
Wikipedia.class:include(SearchMixin)

Wikipedia.paths = {
    { name = "Main Page", path = "/wiki/Main_Page" },
    { name = "Featured Contents", path = "/wiki/Portal:Featured_content" },
    { name = "Current Events", path = "/wiki/Portal:Current_events" },
    { name = "Random Article", path = "/wiki/Special:Random" },
}

return Wikipedia
