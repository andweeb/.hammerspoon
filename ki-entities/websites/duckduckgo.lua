----------------------------------------------------------------------------------------------------
-- DuckDuckGo website config
--
local Website = spoon.Ki.Website
local DuckDuckGo = Website:new("DuckDuckGo", "https://duckduckgo.com")
local SearchMixin = require("ki-entities/search-mixin")

DuckDuckGo.searchPath = ""
DuckDuckGo.class:include(SearchMixin)

return DuckDuckGo
