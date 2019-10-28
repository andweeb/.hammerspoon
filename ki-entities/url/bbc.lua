----------------------------------------------------------------------------------------------------
-- BBC URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local URL = spoon.Ki.URL

local baseURL = "https://www.bbc.com"
local BBC = URL:new(baseURL)

BBC.class:include(SearchMixin)

return BBC
