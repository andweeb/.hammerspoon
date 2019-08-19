----------------------------------------------------------------------------------------------------
-- LIFX light entity
--
local Entity = spoon.Ki.Entity
local LIFX = Entity:subclass("LIFX")

function LIFX:initialize(selector, token, shortcuts)
    self.selector = selector
    self.token = token
    Entity.initialize(self, "LIFX", shortcuts, true)
end

function LIFX:togglePower()
    local url = "https://api.lifx.com/v1/lights/"..self.selector.."/toggle"
    local headers = {
        Authorization = "Bearer "..self.token,
    }

    hs.http.asyncPost(url, nil, headers, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if acceptedRequest and success and response.results then
            for _, result in pairs(response.results) do
                self.notifyError(result.label.." light "..result.status, "")
            end
        else
            self.notifyError("Error communicating with LIFX light (status "..tostring(status)..")", response)
        end
    end)
end

local actions = {
    noop = function() return true end,
    togglePower = function() return LIFX:togglePower() end,
}

local shortcuts = {
    { nil, nil, actions.noop, { "LIFX", "No-op" } },
    { nil, "space", actions.togglePower, { "Power", "Toggle Light On/Off" } },
}

LIFX:initialize("", "", shortcuts)

return LIFX
