----------------------------------------------------------------------------------------------------
-- Stack Overflow website config
--
local Website = spoon.Ki.Website
local StackOverflow = Website:new("Stack Overflow", "https://stackoverflow.com")
local URLSearchMixin = require("ki-entities/url-search")

StackOverflow.class:include(URLSearchMixin)

return StackOverflow
