----------------------------------------------------------------------------------------------------
-- Google URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Google = DefaultUrlEntities.Google

Google.class:include(SearchMixin)

return Google
