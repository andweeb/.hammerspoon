----------------------------------------------------------------------------------------------------
-- StackOverflow URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local URL = spoon.Ki.URL

local baseURL = "https://stackoverflow.com"
local StackOverflow = URL:new(baseURL)

StackOverflow.class:include(SearchMixin)

return StackOverflow
