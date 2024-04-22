----------------------------------------------------------------------------------------------------
-- Chase website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local Chase = Website { "Chase", "https://www.chase.com" }

-- Retrieve minified offer scraping code from `~/.hammerspoon/scripts/offers`: `npm run chase`
function Chase.getOffers()
    return hs.osascript.applescript([[
        set info to ""

        tell application "Arc" to tell active tab of front window
            set info to execute JavaScript "window.rows=[];var getTarget=(e,r,a)=>{e=e.querySelector(r);return a?e?e[a]:null:e},OFFER_SELECTOR=(Date.prototype.addDays=function(e){var r=new Date(this.valueOf());return r.setDate(r.getDate()+e),r},`[class$='one']`),EXPIRY_SELECTOR=`[class$='two']`,NAME_SELECTOR=`[class$='img-container'] > img`,STATUS_SELECTOR=`.iconAddToCard`,CARD_SELECTOR=`[name='accountSelector']`,getCardInfo=()=>{var e=document.querySelector(CARD_SELECTOR).children,[e]=Array.from(e).filter(e=>e.selected);return``+e.accessibleText},cardInfo=getCardInfo(),offerItems=Array.from(document.querySelector(`.offerList`).children),parseOffer=e=>{var e=getTarget(e,OFFER_SELECTOR,`innerText`);return e?([,e=e]=e.match(/(.+) back/)||[],e):``},parseExpiry=e=>{var e=getTarget(e,EXPIRY_SELECTOR,`innerText`),[,r=``]=e.match(/(.+) days left/)||[];return isNaN(Number(r))?e:(new Date).addDays(Number(r)).toLocaleDateString(`en-US`)};window.rows.push(...offerItems.map(e=>({card:cardInfo,name:getTarget(e,NAME_SELECTOR,`alt`),offer:parseOffer(e),expiry:parseExpiry(e),added:!getTarget(e,STATUS_SELECTOR)})).map(e=>[e.card,e.name,e.offer,e.expiry,e.added?1:0].join(`\\t`))),window.rows.join(`\\n`);" as text
        end tell

        return info
    ]])
end

function Chase.runJavaScriptInActiveArcTab(javascript)
    hs.osascript.applescript([[
        tell application "Arc" to tell active tab of front window
            execute JavaScript "]]..javascript..[[" 
        end tell
    ]])
end

function Chase:copyOffers()
    -- Click the "See more offers" button
    local clickButtonJS = "var btn=document.querySelector(`a[blue-click='requestMoreOffers'`); btn && btn.click()"
    self.runJavaScriptInActiveArcTab(clickButtonJS)

    -- Copy offers after a second delay
    hs.timer.doAfter(1, function()
        local isOk, output = self.getOffers()
        if isOk then
            hs.pasteboard.setContents(output)
            hs.notify.show("Ki", "Copied copy Chase offers to clipboard", "")
        else
            hs.notify.show("Ki", "Unable to copy Chase offers to clipboard", "")
        end
    end)
end

Chase:registerShortcuts({
    { nil, "c", function() Chase:copyOffers() end },
})

return Chase
