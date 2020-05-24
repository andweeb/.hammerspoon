----------------------------------------------------------------------------------------------------
-- Stack Overflow website config
--
local Website = spoon.Ki.Website
local StackOverflow = Website:new("Stack Overflow", "https://stackoverflow.com")
local SearchMixin = require("ki-entities/search-mixin")

StackOverflow.class:include(SearchMixin)

return StackOverflow
