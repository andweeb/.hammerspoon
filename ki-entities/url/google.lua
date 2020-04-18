----------------------------------------------------------------------------------------------------
-- Google URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local Google = spoon.Ki.defaultEntities.url.Google

Google.class:include(SearchMixin)

return Google
