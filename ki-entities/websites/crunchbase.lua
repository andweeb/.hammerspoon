----------------------------------------------------------------------------------------------------
-- Crunchbase website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local URLSearchMixin = require("ki-entities/url-search")
local url = "https://www.crunchbase.com"

local Crunchbase = Website {
    name = "Crunchbase",
    url = url,
}

function Crunchbase.getCompanyInfo()
    return hs.osascript.applescript([[
        set info to ""

        tell application "Safari"
            tell current tab of window 1
                set info to do JavaScript "test=`${document.querySelector('.field-type-date_precision').innerText} / ${Array.from(document.querySelectorAll('.component--field-formatter.field-type-enum.link-accent.ng-star-inserted')).map(e => e.innerText).join(' / ')} / ${document.querySelector('.component--field-formatter.field-type-money.ng-star-inserted').innerText}`" as text
            end tell
        end tell

        return info
    ]])
end

function Crunchbase:copyCompanyInfo()
    local isOk, output = self.getCompanyInfo()
    if isOk then
        hs.pasteboard.setContents(output)
        hs.notify.show("Ki", "Copied copy company info to clipboard", "")
    else
        hs.notify.show("Ki", "Unable to copy company info to clipboard", "")
    end
end

Crunchbase:registerShortcuts({
    { nil, "c", function() Crunchbase:copyCompanyInfo() end },
})

-- Initialize website instance with search mixins
Crunchbase.class:include(URLSearchMixin)
Crunchbase:initURLSearch("Search/results.htm", "keyword")

function Crunchbase:basicURLSearch(encodedQuery)
    local formatURL = "https://www.google.com/search?q=%s%%20site%%3Acrunchbase.com"
    local searchURL = string.format(formatURL, encodedQuery)
    return self.open(searchURL)
end

return Crunchbase
