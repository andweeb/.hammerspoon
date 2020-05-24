----------------------------------------------------------------------------------------------------
-- Fantastical application
--
local Application = spoon.Ki.Application
local Fantastical = Application:new("Fantastical")

function Fantastical.createUrlEvent(url)
    return function() hs.urlevent.openURL("x-fantastical3://"..url) end
end

Fantastical.openMiniCalendar = Fantastical.createUrlEvent("show/mini")
Fantastical.openCalendar = Fantastical.createUrlEvent("show/calendar")

Fantastical:registerShortcuts({
    { nil, nil, Fantastical.openMiniCalendar, { "Fantastical", "Open Mini Window" } },
    { nil, "c", Fantastical.openCalendar, { "Fantastical", "Open Calendar" } },
})

return Fantastical
