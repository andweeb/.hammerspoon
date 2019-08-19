----------------------------------------------------------------------------------------------------
-- Airbnb.org URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.airbnb.com"
local Airbnb = URL:new(baseURL)

Airbnb.paths = {
    -- Main routes
    { name = "Main Page", path = baseURL },
    { name = "Wishlists", path = "/wishlists" },
    { name = "Trips", path = "/trips/v1" },
    { name = "Inbox", path = "/inbox" },
    { name = "Dashboard", path = "/dashboard" },
    { name = "Help", path = "/help" },
    -- Searches
    { name = "Stays", path = "/s/homes" },
    { name = "Experiences", path = "/s/experiences" },
    { name = "Restaurants", path = "/s/restaurants" },
}

return Airbnb
