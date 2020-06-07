----------------------------------------------------------------------------------------------------
-- YouTube website config
--
local URLSearchMixin = require("ki-entities/url-search")
local YouTube = spoon.Ki.defaultEntities.website.YouTube

YouTube.class:include(URLSearchMixin)
YouTube:initURLSearch("results", "search_query")

return YouTube
