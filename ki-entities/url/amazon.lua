----------------------------------------------------------------------------------------------------
-- Amazon URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Amazon = DefaultUrlEntities.Amazon

Amazon.searchPath = "s"
Amazon.queryParam = "k"
Amazon.class:include(SearchMixin)

Amazon.paths = {
    { name = "Account", path = "/gp/css/homepage.html" },
    { name = "Order History", path = "/gp/css/order-history" },
    { name = "Cart", path = "/gp/cart/view.html" },
    { name = "Today's Deals", path = "/gp/goldbox" },
}

return Amazon
