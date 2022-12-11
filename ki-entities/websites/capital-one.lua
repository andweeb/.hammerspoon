----------------------------------------------------------------------------------------------------
-- Capital One website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local CapitalOne = Website { "CapitalOne", "https://www.capitalone.com" }

-- Retrieve minified offer scraping code from `~/.hammerspoon/scripts/offers`: `npm run capital-one`
function CapitalOne.getOffers()
    return hs.osascript.applescript([[
        set info to ""

        tell application "Safari" to tell current tab of front window
            set info to do JavaScript "window.rows=[];var getTarget=(e,r,t)=>{e=e.querySelector(r);return t?e?e[t]:null:e},offerItems=(Date.prototype.addDays=function(e){var r=new Date(this.valueOf());return r.setDate(r.getDate()+e),r},Array.from(document.querySelectorAll(`.item`))),parseOffer=e=>{var r,e=getTarget(e,`a[role='button'] > div`,`innerText`);return e?([,r=e]=e.match(/Get (.+) back/)||[],r.includes(`up to`)?([,e=e]=r.match(/up to (.+)/)||[],e):r):``};window.rows.push(...offerItems.map(e=>({card:`Capital One Savor One`,name:getTarget(e,`.merchantCleanName`,`innerText`),offer:parseOffer(e),expiry:getTarget(e,`:scope div > div > div`,`innerText`)})).map(e=>[e.card,e.name,e.offer,e.expiry,``].join(`\\t`))),window.rows.join(`\\n`);" as text
        end tell

        return info
    ]])
end

function CapitalOne:copyOffers()
    local isOk, output = self.getOffers()
    if isOk then
        hs.pasteboard.setContents(output)
        hs.notify.show("Ki", "Copied Capital One offers to clipboard", "")
    else
        hs.notify.show("Ki", "Unable to copy Capital One offers to clipboard", "")
    end
end

CapitalOne:registerShortcuts({
    { nil, "c", function() CapitalOne:copyOffers() end },
})

return CapitalOne
