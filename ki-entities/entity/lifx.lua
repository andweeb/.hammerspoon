----------------------------------------------------------------------------------------------------
-- LIFX light entity
--
local Entity = spoon.Ki.Entity
local LIFX = Entity:subclass("LIFX")

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
            local message = "Error communicating with LIFX light (status "..tostring(status)..")"
            self.notifyError(message, hs.inspect(response))
        end
    end)
end

function LIFX:createStateEvent(data)
    local payload = hs.json.encode(data)

    return function()
        local url = "https://api.lifx.com/v1/lights/"..self.selector.."/state"
        local headers = {
            Authorization = "Bearer "..self.token,
        }

        hs.http.doAsyncRequest(url, "PUT", payload, headers, function(status, rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if acceptedRequest and success and response.results then
                for _, result in pairs(response.results) do
                    self.notifyError(result.label.." light "..result.status, "")
                end
            else
                local message = "Error communicating with LIFX light (status "..tostring(status)..")"
                self.notifyError(message, hs.inspect(response))
            end
        end)
    end
end

function LIFX:selectColors(choices)
    self.showSelectionModal(choices, function(choice)
        if choice then
            self:createStateEvent({
                duration = 2,
                color = choice.color
            })()
        end
    end)
end

function LIFX:initialize(selector, token, shortcuts)
    self.selector = selector
    self.token = token
    self.colors = {
        "white",
        "red",
        "orange",
        "yellow",
        "cyan",
        "green",
        "blue",
        "purple",
        "pink",
    }

    -- Initialize color choices
    local colorChoices = {}
    for _, color in pairs(self.colors) do
        table.insert(colorChoices, {
            color = color,
            text = color,
            subText = "Set LIFX light color to "..color,
        })
    end

    local actions = {
        noop = function() return true end,
        togglePower = function() return self:togglePower() end,
        selectColors = function() self:selectColors(colorChoices) end,
        powerOn = self:createStateEvent({ power = "on" }),
        powerOff = self:createStateEvent({ power = "off" }),
    }

    local defaultShortcuts = {
        { nil, nil, actions.noop, { "LIFX", "No-op" } },
        { nil, "c", actions.selectColors, { "LIFX", "Select and Set a Color" } },
        { nil, "o", actions.powerOn, { "LIFX", "Power On" } },
        { nil, "delete", actions.powerOff, { "LIFX", "Power Off" } },
        { nil, "space", actions.togglePower, { "Power", "Toggle Light On/Off" } },
    }

    -- Initialize events to set brightness levels
    for number = 0, 9 do
        local percent = number / 9
        table.insert(defaultShortcuts, {
            nil,
            tostring(number),
            self:createStateEvent({ brightness = percent }),
            { "LIFX", "Set Brightness to "..tostring(math.floor(percent)).."%" },
        })
    end

    local mergedShortcuts = self.mergeShortcuts(shortcuts, defaultShortcuts)

    Entity.initialize(self, "LIFX", mergedShortcuts, true)
end

return LIFX
