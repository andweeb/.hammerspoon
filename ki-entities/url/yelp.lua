----------------------------------------------------------------------------------------------------
-- Yelp URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local Yelp = DefaultUrlEntities.Yelp

Yelp.class:include(SearchMixin)

function Yelp.handleSearch(mixin, self, searchQuery)
    local mainQuery, locationQuery = searchQuery:match("(.*)|(.*)")

    if mainQuery and locationQuery then
        local mainSuccess, encodedMainQuery, mainDescriptor = mixin.encodeSearchQuery(mainQuery)
        local locationSuccess, encodedLocationQuery, locationDescriptor = mixin.encodeSearchQuery(locationQuery)

        if mainSuccess and locationSuccess then
            local searchURL = self.url.."/search?find_desc="..encodedMainQuery
            searchURL = searchURL.."&find_loc="..encodedLocationQuery
            self.open(searchURL)
        else
            local description = mainDescriptor and mainDescriptor.NSLocalizedDescription
                or locationDescriptor and locationDescriptor.NSLocalizedDescription
            self.notifyError("Ki - Yelp", description)
        end
    else
        local success, encodedQuery, descriptor = mixin.encodeSearchQuery(searchQuery)

        if success then
            self.open(self.url.."/search?find_desc="..encodedQuery)
        else
            self.notifyError("Ki - Yelp", descriptor.NSLocalizedDescription)
        end
    end
end

return Yelp
