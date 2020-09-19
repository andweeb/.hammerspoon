----------------------------------------------------------------------------------------------------
-- Airbnb website config
--
local Ki = spoon.Ki
local Website = Ki.Website

return Website {
    name = "Airbnb",
    url = "https://www.airbnb.com",
    links = {
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
    },
}
