----------------------------------------------------------------------------------------------------
-- Glassdoor website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local URLSearchMixin = require("ki-entities/url-search")
local url = "https://www.glassdoor.com"

local Glassdoor = Website {
    name = "Glassdoor",
    url = url,
    links = {
        { name = "Profile", link = "/member/profile/index.htm" },
        { name = "Resumes", link = "/member/resumes/index.htm" },
        { name = "Account Settings", link = "/member/account/settings_input.htm" },
    },
}

function Glassdoor.getCompanyInfo()
    return hs.osascript.applescript([[
        set info to ""

        tell application "Safari"
            tell current tab of window 1
                set info to do JavaScript "test=`${document.querySelector('.css-1c86vvj').innerText} (${document.querySelector('.eiCell.cell.reviews > .num.eiHeaderLink').innerText})`" as text
            end tell
        end tell

        return info
    ]])
end

function Glassdoor:copyCompanyInfo()
    local isOk, output = self.getCompanyInfo()
    if isOk then
        hs.pasteboard.setContents(output)
        hs.notify.show("Ki", "Copied copy company info to clipboard", "")
    else
        hs.notify.show("Ki", "Unable to copy company info to clipboard", "")
    end
end

Glassdoor:registerShortcuts({
    { nil, "c", function() Glassdoor:copyCompanyInfo() end },
})

-- Initialize website instance with search mixins
Glassdoor.class:include(URLSearchMixin)
Glassdoor:initURLSearch("Search/results.htm", "keyword")

return Glassdoor
