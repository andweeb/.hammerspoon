----------------------------------------------------------------------------------------------------
-- Scroll Mode
--
local Ki = spoon.Ki

-- Scroll action creator method
local function scrollTo(horizontalPixels, verticalPixels, modifiers)
    local offsets = { horizontalPixels, verticalPixels }
    return function()
        hs.eventtap.event.newScrollEvent(offsets, modifiers or {}, 'pixel'):post()
    end
end

-- Page scrolling
local toTop = scrollTo(0, 1e10)
local toBottom = scrollTo(0, -1e10)
local pageUp = scrollTo(0, 500)
local pageDown = scrollTo(0, -500)

-- Small directional scrolling
local up = scrollTo(0, 50)
local down = scrollTo(0, -50)
local left = scrollTo(50, 0)
local right = scrollTo(-50, 0)

Ki:Mode {
    name = "scroll",
    actions = Ki.getLocalVariables("function"),
    shortcut = { { "alt", "cmd" }, "s" },
    shortcuts = {
        { nil, "d", pageDown, "Scroll Page Down" },
        { nil, "g", toTop, "Scroll to Top" },
        { nil, "h", left, "Scroll Left" },
        { nil, "k", up, "Scroll Up" },
        { nil, "j", down, "Scroll Down" },
        { nil, "l", right, "Scroll Right" },
        { nil, "u", pageUp, "Scroll Page Up" },
        { { "ctrl" }, "d", pageDown, "Scroll Page Down" },
        { { "ctrl" }, "u", pageUp, "Scroll Page Up" },
        { { "shift" }, "g", toBottom, "Scroll to Bottom" },
    },
}
