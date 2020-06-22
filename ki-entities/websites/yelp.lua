----------------------------------------------------------------------------------------------------
-- Yelp website config
--
local Yelp = spoon.Ki.defaultEntities.website.Yelp
local APISearchMixin = require("ki-entities/api-search")
local URLSearchMixin = require("ki-entities/url-search")
local GraphQLClient = require("lib/graphql/client")
local usCities = require("lib/us-cities")

-- Initialize website instance with search mixins
Yelp.class:include(APISearchMixin)
Yelp.class:include(URLSearchMixin)

-- Attach GraphQL Client instance initialized with auth header
local apiToken = GraphQLClient.getEnvironmentVariable("YELP_TOKEN")
Yelp.graphqlClient = GraphQLClient("https://api.yelp.com/v3/graphql", {
    Authorization = "Bearer "..apiToken,
    ["Content-Type"] = "application/json",
    ["Accept-Language"] = "en_US",
})
Yelp.defaultCurrentLocation = "Orange County, CA"

-- URL search using location query parameters
function Yelp:advancedURLSearch(query, location)
    local searchURL = self.url.."/search?find_desc="..query
    searchURL = searchURL.."&find_loc="..location
    self.open(searchURL)
end

-- Add some Yelp developer links
table.insert(Yelp.links, { name = "Yelp Developers Page", link = "/developers" })
table.insert(Yelp.links, { name = "Yelp GraphQL API Console", link = "/developers/graphiql" })

-- Convert military time to standard time
function Yelp.militaryToStandardTime(time)
    local mHour = time:sub(1, -3)
    local hour = math.floor(12 - ((12 - mHour) % 12))
    local minutes = time:sub(3, 4)
    local meridiem = mHour ~= "24" and mHour + 0 > 11 and "PM" or "AM"
    return hour..":"..minutes.." "..meridiem
end

-- Create choice objects with Yelp business name, address, reviews, and open hours information
function Yelp:createChoices(businesses)
    local choices = {}

    -- Yelp's day number ranges from 0 to 6, representing day of the week from Monday to Sunday,
    -- whereas os.date's weekday number starts from 1 with Sunday
    -- Yelp:    M T W T F S S
    --          0 1 2 3 4 5 6
    -- os.date: S M T W T F S
    --          1 2 3 4 5 6 7
    local yelpDayOffset = 2
    local dateTable = os.date("*t")
    local currentDay = dateTable.wday == 1 and 6 or dateTable.wday - yelpDayOffset

    for i = 1, #businesses do
        local business = businesses[i]

        if #business.photos > 0 then
            self:loadChooserRowImage(choices, business.photos[1], i)
        end

        local address = business.location.formatted_address:gsub("\n", " ")
        local subTexts = {
            address,
            business.review_count.." reviews"
        }

        if #business.hours > 0 then
            local openHoursInfo = ""
            local dailyOpenHours = business.hours[1].open

            for j = 1, #dailyOpenHours do
                local openHours = dailyOpenHours[j]
                if openHours.day == currentDay then
                    local startTime = self.militaryToStandardTime(openHours.start)
                    local endTime = self.militaryToStandardTime(openHours["end"])
                    openHoursInfo = startTime.." - "..endTime
                end
            end

            table.insert(subTexts, "Open Hours: "..openHoursInfo)
        end

        table.insert(choices, {
            url = business.url,
            text = business.name,
            subText = table.concat(subTexts, " • "),
            businessName = business.name,
            address = address,
        })
    end

    return choices
end

-- Search for businesses in city
function Yelp:searchBusinessInCity()
    local options = { placeholderText = "Select a city" }
    local function onChoice(choice)
        if choice then
            self:searchBusinesses(choice.text)
        end
    end

    self:showChooser(usCities, onChoice, options)
end

-- Use location services to search businesses using the current location
function Yelp:searchBusinessWithCurrentLocation()
    -- Start local tracking if location services are enabled
    if hs.location.servicesEnabled() and hs.location.start() then
        -- Add slight delay for tracking to start
        hs.timer.doAfter(0.5, function()
            local location = hs.location.get()
            hs.location.stop()

            self:searchBusinesses(location)
        end)
    else
        -- Default location to OC
        self:searchBusinesses(self.defaultCurrentLocation)
    end
end

-- Search and display businesses in a chooser using the Yelp GraphQL API
-- for some location string or latitude/longitude table
function Yelp:searchBusinesses(location)
    local placeholderText = "Search Yelp for businesses"
    local isLatLonLocation = location.latitude and location.longitude
    placeholderText = isLatLonLocation and placeholderText or placeholderText.." in "..location

    local choices = {}
    local function updateChoices()
        return choices
    end

    -- Create search input handler
    local function onInput(input)
        local graphql = self.graphqlClient:readGraphQLDocument("yelp/search-businesses")

        -- Create variables with either location string or coordinates
        local variables = { term = input, limit = 25 }
        if isLatLonLocation then
            variables.latitude = location.latitude
            variables.longitude = location.longitude
        else
            variables.location = location.location
        end

        -- Query the GraphQL API
        self.graphqlClient:query(graphql, variables, nil, function(status, rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if acceptedRequest and success and response and not response.errors then
                local businesses = response.data.search.business
                choices = self:createChoices(businesses)
                self.chooser:choices(updateChoices)
            else
                local message = "Error communicating with Yelp (status "..tostring(status)..")"
                self.notifyError(message, hs.inspect(response))
            end
        end)
    end

    -- Create item selection handler
    local onSelection = function(choice)
        if choice then
            return self.open(choice.url)
        end
    end

    -- Start API search interface
    self:apiSearch(updateChoices, onInput, onSelection, { placeholderText = placeholderText })
end

-- Open address of selected row item in Google Maps
function Yelp:openGoogleMaps(chooser)
    local selectedRow = chooser:selectedRow()
    local choice = chooser:selectedRowContents(selectedRow)
    local query = choice.businessName.." "..choice.address
    self.open("https://www.google.com/maps/search/"..hs.http.encodeForQuery(query))
end

Yelp:registerChooserShortcuts({
    { { "cmd" }, "d", function(...) Yelp:openGoogleMaps(...) end },
})

Yelp:registerShortcuts({
    { nil, "c", function() Yelp:searchBusinessInCity() end },
    { nil, "s", function() Yelp:searchBusinessWithCurrentLocation() end },
})

return Yelp
