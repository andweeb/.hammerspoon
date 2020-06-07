----------------------------------------------------------------------------------------------------
-- BBC website config
--
local Website = spoon.Ki.Website
local BBC = Website:new("BBC", "https://www.bbc.com")
local URLSearchMixin = require("ki-entities/url-search")

BBC.class:include(URLSearchMixin)

return BBC
