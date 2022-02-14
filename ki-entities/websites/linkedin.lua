----------------------------------------------------------------------------------------------------
-- LinkedIn website config
--
local LinkedIn = spoon.Ki.defaultEntities.website.LinkedIn
local URLSearchMixin = require("ki-entities/url-search")

-- Initialize website instance with search mixins
LinkedIn.class:include(URLSearchMixin)
LinkedIn:initURLSearch("search/results/all/", "keywords")

return LinkedIn
