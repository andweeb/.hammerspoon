----------------------------------------------------------------------------------------------------
-- BBC website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local BBC = Website { "BBC", "https://www.bbc.com" }
local URLSearchMixin = require("ki-entities/url-search")

BBC.class:include(URLSearchMixin)

return BBC
