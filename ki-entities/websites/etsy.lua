----------------------------------------------------------------------------------------------------
-- Etsy website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local url = "https://www.etsy.com"
local URLSearchMixin = require("ki-entities/url-search")

local Etsy = Website {
    name = "Etsy",
    url = url,
    links = {
        { name = "Messages", link = "/messages" },
        { name = "Your offers", link = "/redeem" },
        { name = "Purchases and reviews", link = "/your/purchases" },
        { name = "Account settings", link = "/your/account" },
    },
}

-- Initialize website instance with search mixins
Etsy.class:include(URLSearchMixin)
Etsy:initURLSearch("search", "q")

return Etsy
