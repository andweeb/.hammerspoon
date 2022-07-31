----------------------------------------------------------------------------------------------------
-- Cite As entity config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Entity = Ki.Entity
local RESTClient = require("lib/rest-client")

local CiteAs = Entity { "Cite As" }

-- Attach REST Client instance using the Cite As API
-- https://citeas.org/api
CiteAs.restClient = RESTClient("https://api.citeas.org")

function CiteAs.createSearchResultChoices(results)
    local choices = {}

    for i = 1, #results do
        local result = results[i]
        if result then
            table.insert(choices, {
                text = result.citation,
                subText = string.format("%s (%s)", result.style_fullname, result.style_shortname),
                citation = result.citation,
            })
        end
    end

    return choices
end

-- Get a citation from some DOI, URL, or keyword
function CiteAs:cite()
    spoon.Ki.state:exitMode()

    hs.focus()

    local choices = {}
    local function updateChoices()
        return choices
    end
    local function onChoice(choice)
        local success = hs.pasteboard.setContents(choice.citation)
        if not success then
            self.notifyError("Unable to copy citation to clipboard", "")
            return
        end

        self.notifyError("Copied citation to clipboard", "")
    end

    local choice, input =
        hs.dialog.textPrompt("Cite As", "Enter DOI, URL, or keyword:", "", "Cite", "Cancel")

    if choice == "Cite" then
        local uri = "/product/"..hs.http.encodeForQuery(input)

        self.restClient:get(uri, nil, function(status, rawResponse)
            print(rawResponse)
            local success, response = pcall(function() return hs.json.decode(rawResponse) end)
            local acceptedRequest = tostring(status):sub(1, 1) == "2"

            if not acceptedRequest or not success or (response and response.code) then
                local message = "Cite As API error (code "..tostring(response.code)..")"
                self.notifyError(message, response.message)
            else
                choices = self.createSearchResultChoices(response.citations)
                self:showChooser(updateChoices, onChoice, {
                    placeholderText = "Copy a citation to clipboard"
                })
            end
        end)
    end

    return true
end

CiteAs.citeSite = Action {
    name = "Cite a Site article",
    action = function()
        spoon.Ki.state:exitMode()

        hs.focus()

        local choice, url =
            hs.dialog.textPrompt("Cite Site article", "Enter URL", "", "Cite", "Cancel")

        if choice == "Cite" then
            local siteName = url:match("//.+[?%.](.+)%.") or url:match("//(.+)%.")
            siteName = siteName:gsub('^%l', string.upper)

            local articleName = url:match("^.+/(.+)$"):gsub('%W+', ' '):gsub('^%l', string.upper)

            articleName = (" "..articleName:lower()):gsub("%W%l", string.upper):sub(2)

            local citation = string.format("%s – %s. Retrieved from %s", articleName, siteName, url)

            local success = hs.pasteboard.setContents(citation)
            if not success then
                CiteAs.notifyError("Unable to copy citation to clipboard", "")
                return
            end

            CiteAs.notifyError("Copied citation to clipboard", "")
        end
    end,
}

CiteAs:registerShortcuts({
    { nil, nil, CiteAs.citeSite },
    { nil, "c", function(...) return CiteAs:cite(...) end, "Select a Citation to Copy to Clipboard" },
})

return CiteAs
