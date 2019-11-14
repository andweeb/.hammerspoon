----------------------------------------------------------------------------------------------------
-- Google Maps URL entity
--
local SearchMixin = require("ki-entities/search-mixin")
local DefaultUrlEntities = spoon.Ki.defaultUrlEntities
local GoogleMaps = DefaultUrlEntities.GoogleMaps
GoogleMaps.url = "https://www.google.com/maps"

GoogleMaps.class:include(SearchMixin)

function GoogleMaps:searchDirections(mixin, origin, destination)
    local originSuccess, encodedOriginQuery, originDescriptor =
        mixin.encodeSearchQuery(origin)
    local destinationSuccess, encodedDestinationQuery, destinationDescriptor =
        mixin.encodeSearchQuery(destination)

    if originSuccess and destinationSuccess then
        local searchURL = self.url.."/dir/"..encodedOriginQuery
        searchURL = searchURL.."/"..encodedDestinationQuery
        self.open(searchURL)
    else
        local description = originDescriptor and originDescriptor.NSLocalizedDescription
            or destinationDescriptor and destinationDescriptor.NSLocalizedDescription
        self.notifyError("Ki - Google Maps", description)
    end
end

function GoogleMaps:searchAddress(mixin, searchQuery)
    local success, encodedQuery, descriptor = mixin.encodeSearchQuery(searchQuery)

    if success then
        self.open(self.url.."/search/"..encodedQuery)
    else
        self.notifyError("Ki - Google Maps", descriptor.NSLocalizedDescription)
    end
end

function GoogleMaps.handleSearch(mixin, self, searchQuery)
    local origin, destination = searchQuery:match("(.*)|(.*)")

    if origin and destination then
        self:searchDirections(mixin, origin, destination)
        return
    end

    self:searchAddress(mixin, searchQuery)
end

return GoogleMaps
