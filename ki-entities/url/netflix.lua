----------------------------------------------------------------------------------------------------
-- Netflix URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Netflix = DefaultUrlEntities.Netflix

Netflix.class:include(SearchMixin)

return Netflix
