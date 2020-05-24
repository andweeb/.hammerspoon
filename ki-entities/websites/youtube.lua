----------------------------------------------------------------------------------------------------
-- YouTube website config
--
local SearchMixin = require("ki-entities/search-mixin")
local YouTube = spoon.Ki.defaultEntities.website.YouTube

YouTube.searchPath = "results"
YouTube.queryParam = "search_query"
YouTube.class:include(SearchMixin)

return YouTube
