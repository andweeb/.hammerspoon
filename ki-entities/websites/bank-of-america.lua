----------------------------------------------------------------------------------------------------
-- Bank of America website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local BankOfAmerica = Website { "BankOfAmerica", "" }

-- Retrieve minified offer scraping code from `~/.hammerspoon/scripts/offers`: `npm run bank-of-america`
function BankOfAmerica.getOffers()
    return hs.osascript.applescript([[
        set info to ""

        tell application "Safari" to tell current tab of front window
            set info to do JavaScript "window.rows=[];const getTarget=(e,r,t)=>{e=e.querySelector(r);return t?e?e[t]:null:e},offerItems=(Date.prototype.addDays=function(e){var r=new Date(this.valueOf());return r.setDate(r.getDate()+e),r},Array.from(document.querySelectorAll(`.deal-tile`)));window.rows.push(...offerItems.map(e=>{let r=getTarget(e,`.deal-logo > img`,`alt`),t=(r=r?r.replace(` Logo`,``):``,getTarget(e,`[class^=deal-exp]`,`innerText`));return t=t.replace(`Exp. `,``),{card:`Bank of America Cash Rewards`,name:r,offer:getTarget(e,`[class^=deal-offer]`,`innerText`),expiry:t}}).map(e=>[e.card,e.name,e.offer,e.expiry,``].join(`\\t`))),window.rows=window.rows.join(`\\n`);" as text
        end tell

        return info
    ]])
end

function BankOfAmerica:copyOffers()
    local isOk, output = self.getOffers()
    if isOk then
        hs.pasteboard.setContents(output)
        hs.notify.show("Ki", "Copied BankAmeriDeals to clipboard", "")
    else
        hs.notify.show("Ki", "Unable to copy BankAmeriDeals to clipboard", "")
    end
end

BankOfAmerica:registerShortcuts({
    { nil, "c", function() BankOfAmerica:copyOffers() end },
})

return BankOfAmerica
