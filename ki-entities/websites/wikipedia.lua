----------------------------------------------------------------------------------------------------
-- Wikipedia website config
--
local URLSearchMixin = require("ki-entities/url-search")
local Wikipedia = spoon.Ki.defaultEntities.website.Wikipedia

Wikipedia.class:include(URLSearchMixin)
Wikipedia:initURLSearch("w/index.php", "search")

return Wikipedia
