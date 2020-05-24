----------------------------------------------------------------------------------------------------
-- Amazon website config
--
local SearchMixin = require("ki-entities/search-mixin")
local Amazon = spoon.Ki.defaultEntities.website.Amazon

Amazon.searchPath = "s"
Amazon.queryParam = "k"
Amazon.class:include(SearchMixin)

return Amazon
