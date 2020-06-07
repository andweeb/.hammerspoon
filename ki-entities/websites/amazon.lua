----------------------------------------------------------------------------------------------------
-- Amazon website config
--
local SearchMixin = require("ki-entities/url-search")
local Amazon = spoon.Ki.defaultEntities.website.Amazon

Amazon.class:include(SearchMixin)
Amazon:initURLSearch("s", "field-keywords")

return Amazon
