----------------------------------------------------------------------------------------------------
-- Stack Overflow website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local StackOverflow = Website { "Stack Overflow", "https://stackoverflow.com" }

local URLSearchMixin = require("ki-entities/url-search")
StackOverflow.class:include(URLSearchMixin)

return StackOverflow
