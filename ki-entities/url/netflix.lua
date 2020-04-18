----------------------------------------------------------------------------------------------------
-- Netflix URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local Netflix = spoon.Ki.defaultEntities.url.Netflix

Netflix.class:include(SearchMixin)

return Netflix
