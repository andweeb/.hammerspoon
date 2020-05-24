----------------------------------------------------------------------------------------------------
-- Google website config
--
local SearchMixin = require("ki-entities/search-mixin")
local Google = spoon.Ki.defaultEntities.website.Google

Google.class:include(SearchMixin)

return Google
