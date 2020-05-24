----------------------------------------------------------------------------------------------------
-- Airbnb website config
--
local Website = spoon.Ki.Website

return Website:new("Airbnb", "https://www.airbnb.com", {
    -- Main routes
    { name = "Wishlists", link = "/wishlists" },
    { name = "Trips", link = "/trips/v1" },
    { name = "Inbox", link = "/inbox" },
    { name = "Dashboard", link = "/dashboard" },
    { name = "Help", link = "/help" },
    -- Searches
    { name = "Stays", link = "/s/homes" },
    { name = "Experiences", link = "/s/experiences" },
    { name = "Restaurants", link = "/s/restaurants" },
})
