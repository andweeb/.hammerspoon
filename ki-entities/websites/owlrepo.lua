----------------------------------------------------------------------------------------------------
-- MapleLegends website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local RESTClient = require("lib/rest-client")
local OwlRepo = Website { "OwlRepo", "http://owlrepo.com" }

-- Attach REST Client instance using the v1 Owl Repo API
-- https://storage.googleapis.com/owlrepo/
OwlRepo.restClient = RESTClient("https://storage.googleapis.com/owlrepo/v1")

local function formatMesos(amount)
    local formatted = amount
    local k

    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')

        if k == 0 then
            break
        end
    end

    return formatted
end

local function formatPercentiles(p25, p50, p75)
    local p25f = "p25: "..formatMesos(p25)
    local p50f = "p50: "..formatMesos(p50)
    local p75f = "p75: "..formatMesos(p75)
    return "("..p25f..", "..p50f..", "..p75f..")"
end

function OwlRepo:searchItems()
    local indexURI = "/queries/search_item_index.json"

    self.restClient:get(indexURI, nil, function(status, rawResponse)
        local success, response = pcall(function() return hs.json.decode(rawResponse) end)
        local acceptedRequest = tostring(status):sub(1, 1) == "2"

        if not acceptedRequest or not success or (response and response.code) then
            local message = "Owl Repo error (code "..tostring(response.code)..")"
            self.notifyError(message, response)
        else
            local choices = {}
            for _, result in pairs(response) do
                table.insert(choices, {
                    text = result.search_item,
                    subText = formatPercentiles(result.p25, result.p50, result.p75),
                })
            end
            self:showChooser(choices, function() end)
        end
    end)
end

OwlRepo:Shortcut { nil, "s", function(...) OwlRepo:searchItems(...) end, "Search for an FM item" }

return OwlRepo
