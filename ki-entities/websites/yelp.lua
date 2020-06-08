----------------------------------------------------------------------------------------------------
-- Yelp website config
--
local Yelp = spoon.Ki.defaultEntities.website.Yelp
local APISearchMixin = require("ki-entities/api-search")
local URLSearchMixin = require("ki-entities/url-search")
local GraphQLClient = require("lib/graphql/client")

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

-- Set a default location
Yelp.location = "California"

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
            hs.image.imageFromURL(business.photos[1], function(image)
                if not self.selectionModal then
                    return
                end

                if choices[i] then
                    choices[i].image = image
                    self.selectionModal:choices(choices)
                end
            end)
        end

        local subTexts = {
            business.location.formatted_address:gsub("\n", " "),
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
        })
    end

    return choices
end

-- Search and display businesses in a selection modal using the Yelp GraphQL API
function Yelp:searchBusinesses()
    -- Create search input handler
    local function onInput(input)
        local variables = { term = input, location = self.location, limit = 25 }
        local graphql = self.graphqlClient:readGraphQLDocument("yelp/search-businesses")

        self.graphqlClient:query(graphql, variables, nil, function(status, rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if acceptedRequest and success and response and not response.errors then
                local businesses = response.data.search.business
                local choices = self:createChoices(businesses)
                self.selectionModal:choices(choices)
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
    self:apiSearch(onInput, onSelection, { placeholderText = "Search businesses on Yelp" })
end

Yelp:registerShortcuts({
    { nil, "s", function() Yelp:searchBusinesses() end },
})

return Yelp
