----------------------------------------------------------------------------------------------------
-- Netflix website config
--
local URLSearchMixin = require("ki-entities/url-search")
local Netflix = spoon.Ki.defaultEntities.website.Netflix

Netflix.class:include(URLSearchMixin)

return Netflix
