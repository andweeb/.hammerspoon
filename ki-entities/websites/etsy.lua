----------------------------------------------------------------------------------------------------
-- Etsy website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local url = "https://www.etsy.com"
local URLSearchMixin = require("ki-entities/url-search")

local Etsy = Website { name = "Etsy", url = url }

-- Initialize website instance with search mixins
Etsy.class:include(URLSearchMixin)
Etsy:initURLSearch("search", "q")

return Etsy
