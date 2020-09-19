----------------------------------------------------------------------------------------------------
-- NPR Website entity
--
local Ki = spoon.Ki
local Website = Ki.Website
local NPR = Website { "NPR", "https://www.npr.org" }

local URLSearchMixin = require("ki-entities/url-search")
NPR.class:include(URLSearchMixin)
NPR:initURLSearch(nil, "query")

return NPR
