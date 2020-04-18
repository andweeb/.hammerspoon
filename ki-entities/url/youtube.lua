----------------------------------------------------------------------------------------------------
-- YouTube URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local YouTube = spoon.Ki.defaultEntities.url.YouTube

YouTube.searchPath = "results"
YouTube.queryParam = "search_query"
YouTube.class:include(SearchMixin)

return YouTube
