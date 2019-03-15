local LifxEntity = {}

function LifxEntity:init(Entity, token, selector)
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

        hs.http.asyncPost(url, nil, headers, function(status, response)
            if tostring(status):sub(1, 1) ~= "2" then
                self.notifyError("Unable to communicate with LIFX light (status "..tostring(status)..")", response)
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

    LIFX:initialize(selector, token, shortcuts)

    return LIFX
end

return LifxEntity
