----------------------------------------------------------------------------------------------------
-- Netflix website config
--
local SearchMixin = require("ki-entities/search-mixin")
local Netflix = spoon.Ki.defaultEntities.website.Netflix

Netflix.class:include(SearchMixin)

return Netflix
