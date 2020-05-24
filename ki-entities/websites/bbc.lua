----------------------------------------------------------------------------------------------------
-- BBC website config
--
local Website = spoon.Ki.Website
local BBC = Website:new("BBC", "https://www.bbc.com")
local SearchMixin = require("ki-entities/search-mixin")

BBC.class:include(SearchMixin)

return BBC
