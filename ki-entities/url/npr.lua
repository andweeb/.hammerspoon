----------------------------------------------------------------------------------------------------
-- NPR URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local URL = spoon.Ki.URL

local baseURL = "https://www.npr.org"
local NPR = URL:new(baseURL)

NPR.queryParam = "query"
NPR.class:include(SearchMixin)

return NPR
