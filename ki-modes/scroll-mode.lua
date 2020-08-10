----------------------------------------------------------------------------------------------------
-- Scroll Mode
--
local Scroll = {}
local Ki = spoon.Ki

-- Scroll action creator method
local function createScrollAction(horizontalPixels, verticalPixels, modifiers)
    local offsets = { horizontalPixels, verticalPixels }
    return function()
        hs.eventtap.event.newScrollEvent(offsets, modifiers, 'pixel'):post()
    end
end

-- Page scrolling
Scroll.toTop = createScrollAction(0, 1e10)
Scroll.toBottom = createScrollAction(0, -1e10)
Scroll.pageUp = createScrollAction(0, 500)
Scroll.pageDown = createScrollAction(0, -500)

-- Small directional scrolling
Scroll.up = createScrollAction(0, 50)
Scroll.down = createScrollAction(0, -50)
Scroll.left = createScrollAction(50, 0)
Scroll.right = createScrollAction(-50, 0)

local enterScrollModeShortcut = {
    { "alt", "cmd" }, "s", nil, { "Scroll Mode", "Enter Scroll Mode" },
}

Ki:registerMode("scroll", enterScrollModeShortcut, {
    { nil, "d", Scroll.pageDown, { "Scroll Events", "Scroll Page Down" } },
    { nil, "g", Scroll.toTop, { "Scroll Events", "Scroll to Top" } },
    { nil, "h", Scroll.left, { "Scroll Events", "Scroll Left" } },
    { nil, "k", Scroll.up, { "Scroll Events", "Scroll Up" } },
    { nil, "j", Scroll.down, { "Scroll Events", "Scroll Down" } },
    { nil, "l", Scroll.right, { "Scroll Events", "Scroll Right" } },
    { nil, "u", Scroll.pageUp, { "Scroll Events", "Scroll Page Up" } },
    { { "ctrl" }, "d", Scroll.pageDown, { "Scroll Events", "Scroll Page Down" } },
    { { "ctrl" }, "u", Scroll.pageUp, { "Scroll Events", "Scroll Page Up" } },
    { { "shift" }, "g", Scroll.toBottom, { "Scroll Events", "Scroll to Bottom" } },
})
