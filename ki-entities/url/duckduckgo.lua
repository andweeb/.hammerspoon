----------------------------------------------------------------------------------------------------
-- DuckDuckGo URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local URL = spoon.Ki.URL

local baseURL = "https://duckduckgo.com"
local DuckDuckGo = URL:new(baseURL)

DuckDuckGo.searchPath = ""
DuckDuckGo.class:include(SearchMixin)

return DuckDuckGo
