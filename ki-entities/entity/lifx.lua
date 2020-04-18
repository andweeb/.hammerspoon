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
    self:showSelectionModal(choices, function(choice)
        if choice then
            self:createStateEvent({
                duration = 2,
                color = choice.color
            })()
        end
    end)
end

LIFX.colors = {
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
for _, color in pairs(LIFX.colors) do
    table.insert(colorChoices, {
        color = color,
        text = color,
        subText = "Set LIFX light color to "..color,
    })
end

function LIFX:initialize(selector, token, shortcuts)
    shortcuts = shortcuts or {}

    self.selector = selector
    self.token = token

    local defaultShortcuts = {
        { nil, nil, function() return true end, { "LIFX", "No-op" } },
        { nil, "c", function() self:selectColors(colorChoices) end, { "LIFX", "Select and Set a Color" } },
        { nil, "delete", self:createStateEvent({ power = "off" }), { "LIFX", "Power Off" } },
        { nil, "return", self:createStateEvent({ power = "on" }), { "LIFX", "Power On" } },
        { nil, "space", function() return self:togglePower() end, { "Power", "Toggle Light On/Off" } },
    }

    -- Initialize events to set brightness levels
    for number = 0, 9 do
        local percent = number / 9
        local setBrightnessEvent = self:createStateEvent({ brightness = percent })
        local eventDescription = "Set Brightness to "..tostring(math.floor(percent * 100)).."%"
        local shortcut = { nil, tostring(number), setBrightnessEvent, { "LIFX", eventDescription } }

        table.insert(defaultShortcuts, shortcut)
    end

    Entity.initialize(self, "LIFX", self.mergeShortcuts(shortcuts, defaultShortcuts), true)
end

return LIFX
