----------------------------------------------------------------------------------------------------
-- NPR Website entity
--
local Website = spoon.Ki.Website
local NPR = Website:new("NPR", "https://www.npr.org")
local URLSearchMixin = require("ki-entities/url-search")

NPR.class:include(URLSearchMixin)
NPR:initURLSearch(nil, "query")

return NPR
