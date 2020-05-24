----------------------------------------------------------------------------------------------------
-- NPR Website entity
--
local Website = spoon.Ki.Website
local NPR = Website:new("NPR", "https://www.npr.org")
local SearchMixin = require("ki-entities/search-mixin")

NPR.queryParam = "query"
NPR.class:include(SearchMixin)

return NPR
