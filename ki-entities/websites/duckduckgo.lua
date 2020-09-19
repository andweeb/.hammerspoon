----------------------------------------------------------------------------------------------------
-- DuckDuckGo website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local DuckDuckGo = Website { "DuckDuckGo", "https://duckduckgo.com" }

local URLSearchMixin = require("ki-entities/url-search")
DuckDuckGo.class:include(URLSearchMixin)
DuckDuckGo:initURLSearch("")

return DuckDuckGo
