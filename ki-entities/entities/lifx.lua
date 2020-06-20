----------------------------------------------------------------------------------------------------
-- LIFX light entity
--
local Entity = spoon.Ki.Entity
local LIFX = Entity:subclass("LIFX")
local RESTClient = require("lib/rest-client")

-- Attach REST Client instance initialized with auth header
LIFX.restClient = RESTClient("https://api.lifx.com/v1", {
    Authorization = "Bearer "..RESTClient.getEnvironmentVariable("LIFX_TOKEN"),
})

-- Action to toggle the power of the LIFX light
-- https://api.developer.lifx.com/docs/toggle-power
function LIFX:togglePower()
    self.restClient:post("/lights/"..self.selector.."/toggle", nil, nil, function(status, rawResponse)
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

-- Generate action functions that change the state of the LIFX light
-- https://api.developer.lifx.com/docs/set-state
function LIFX:createStateChangeAction(data)
    local body = hs.json.encode(data)

    return function()
        self.restClient:put("/lights/"..self.selector.."/state", body, nil, function(status, rawResponse)
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

-- Action to update the LIFX light color upon a preset color selection from a modal
function LIFX:selectColors(choices)
    self:showSelectionModal(choices, function(choice)
        if choice then
            self:createStateChangeAction({
                duration = 2,
                color = choice.color
            })()
        end
    end)
end

-- Define preset LIFX light colors
-- https://api.developer.lifx.com/docs/colors
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

-- Extend the Entity class to allow for creating individual LIFX light instances
function LIFX:initialize(name, selector, shortcuts)
    shortcuts = shortcuts or {}

    self.selector = selector

    local defaultShortcuts = {
        { nil, nil, function() self:showActions() end, { "LIFX", "Show LIFX actions" } },
        { nil, "c", function() self:selectColors(colorChoices) end, { "Colors", "Select and Set a Color" } },
        { nil, "delete", self:createStateChangeAction({ power = "off" }), { "Power", "Power Off" } },
        { nil, "return", self:createStateChangeAction({ power = "on" }), { "Power", "Power On" } },
        { nil, "space", function() return self:togglePower() end, { "Power", "Toggle Light On/Off" } },
    }

    -- Initialize events to set brightness levels
    for number = 0, 9 do
        local percent = number / 9
        local setBrightnessEvent = self:createStateChangeAction({ brightness = percent })
        local eventDescription = "Set Brightness to "..tostring(math.floor(percent * 100)).."%"
        local shortcut = { nil, tostring(number), setBrightnessEvent, { "Brightness", eventDescription } }

        table.insert(defaultShortcuts, shortcut)
    end

    Entity.initialize(self, name, self:mergeShortcuts(shortcuts, defaultShortcuts))
end

return LIFX
