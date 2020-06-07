----------------------------------------------------------------------------------------------------
-- DuckDuckGo website config
--
local Website = spoon.Ki.Website
local DuckDuckGo = Website:new("DuckDuckGo", "https://duckduckgo.com")
local URLSearchMixin = require("ki-entities/url-search")

DuckDuckGo.class:include(URLSearchMixin)
DuckDuckGo:initURLSearch("")

return DuckDuckGo
