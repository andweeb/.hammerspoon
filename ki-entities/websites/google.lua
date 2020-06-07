----------------------------------------------------------------------------------------------------
-- Google website config
--
local URLSearchMixin = require("ki-entities/url-search")
local Google = spoon.Ki.defaultEntities.website.Google

Google.class:include(URLSearchMixin)

return Google
