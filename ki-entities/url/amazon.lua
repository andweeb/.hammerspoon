----------------------------------------------------------------------------------------------------
-- Amazon URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local Amazon = spoon.Ki.defaultEntities.url.Amazon

Amazon.searchPath = "s"
Amazon.queryParam = "k"
Amazon.class:include(SearchMixin)

return Amazon
