----------------------------------------------------------------------------------------------------
-- Mouse Mode
--
local Ki = spoon.Ki
local Mode = Ki.Mode
local Action = Ki.Action
local Passthrough = Action.Passthrough

local PIXEL_OFFSET = 1
local INDICATOR = {
    SIZE = 100,
    STYLE = {
        radius = "45%",
        type = "circle",
        fillColor = { red = 1, alpha = 0.8 },
        strokeColor = { alpha = 0 },
    },
}

-- Flash an indicator to highlight the mouse location
local function flashIndicator()
    local size = INDICATOR.SIZE
    local mousePosition = hs.mouse.absolutePosition()
    local canvasDimensions = {
        w = size,
        h = size,
        x = mousePosition.x - (size / 2),
        y = mousePosition.y - (size / 2),
    }

    hs.canvas.new(canvasDimensions)
        :insertElement(INDICATOR.STYLE)
        :show()
        :hide(1)
end

-- Create mouse click events
local function clickEvent(clickMethod)
    return function()
        local position = hs.mouse.absolutePosition()
        hs.eventtap[clickMethod](position)
    end
end

-- Create mouse movement events
local function moveEvent(setPosition)
    return function()
        local position = hs.mouse.getRelativePosition()
        local x, y = setPosition(position)
        hs.mouse.setRelativePosition({ x = x, y = y })
    end
end

-- Cycle the mouse to the next screen
local function cycleMouseToNextScreen()
    local screen = hs.mouse.getCurrentScreen()
    local screenFrame = screen:frame()
    local nextScreenFrame = screen:next():frame()
    local position = hs.mouse.getRelativePosition()
    hs.mouse.setRelativePosition({
        x = ((((position.x - screenFrame.x) / screenFrame.w) * nextScreenFrame.w) + nextScreenFrame.x),
        y = ((((position.y - screenFrame.y) / screenFrame.h) * nextScreenFrame.h) + nextScreenFrame.y),
    })
end

-- Move the mouse to a position relative to the screen
local function moveRelativeToScreenEvent(setPosition)
    return function()
        local position = hs.mouse.getRelativePosition()
        local screen = hs.mouse.getCurrentScreen()
        local screenFrame = screen:frame()
        local x, y = setPosition(position, screenFrame)
        hs.mouse.setRelativePosition({ x = x, y = y })
    end
end

-- Click actions
local leftClick = clickEvent("leftClick")
local rightClick = clickEvent("rightClick")

-- Slight directional mouse movement actions
local moveMouseSlightLeft = moveEvent(function(pos) return pos.x - 10, pos.y end)
local moveMouseSlightDown = moveEvent(function(pos) return pos.x, pos.y + 10 end)
local moveMouseSlightUp = moveEvent(function(pos) return pos.x, pos.y - 10 end)
local moveMouseSlightRight = moveEvent(function(pos) return pos.x + 10, pos.y end)

-- Standard directional mouse movement actions
local moveMouseStandardLeft = moveEvent(function(pos) return pos.x - 100, pos.y end)
local moveMouseStandardDown = moveEvent(function(pos) return pos.x, pos.y + 100 end)
local moveMouseStandardUp = moveEvent(function(pos) return pos.x, pos.y - 100 end)
local moveMouseStandardRight = moveEvent(function(pos) return pos.x + 100, pos.y end)

-- Vertical high/medium/low mouse movement
local moveMouseHigh = moveRelativeToScreenEvent(function(pos) return pos.x, 0 end)
local moveMouseMiddle = moveRelativeToScreenEvent(function(pos, frame) return pos.x, frame.h / 2 end)
local moveMouseLow = moveRelativeToScreenEvent(function(pos, frame) return pos.x, frame.h end)

local shortcuts = {
    { nil, "space", cycleMouseToNextScreen, "Cycle Mouse to Next Screen" },
    -- Mouse clicks
    { nil, "return", leftClick, "Left Click" },
    { { "shift" }, "return", rightClick, "Right Click" },
    { { "shift" }, "/", flashIndicator, "Flash the Mouse Indicator" },
    -- Slight directional movement shortcuts
    { nil, "h", moveMouseSlightLeft, "Move Mouse Left Slightly" },
    { nil, "j", moveMouseSlightDown, "Move Mouse Down Slightly" },
    { nil, "k", moveMouseSlightUp, "Move Mouse Up Slightly" },
    { nil, "l", moveMouseSlightRight, "Move Mouse Right Slightly" },
    -- Standard directional movement shortcuts
    { nil, "b", moveMouseStandardLeft, "Move Mouse Left" },
    { nil, "d", moveMouseStandardDown, "Move Mouse Down" },
    { nil, "u", moveMouseStandardUp, "Move Mouse Up" },
    { nil, "w", moveMouseStandardRight, "Move Mouse Right" },
    -- Vertical high/medium/low mouse movement shortcuts
    { { "shift" }, "h", moveMouseHigh, "Move Mouse to Top of Screen" },
    { { "shift" }, "m", moveMouseMiddle, "Move Mouse to Middle of Screen" },
    { { "shift" }, "l", moveMouseLow, "Move Mouse to Bottom of Screen" },
    { { "alt", "cmd" }, "8", Passthrough "Toggle Zoom" },
}

-- Dynamically create 0-9 shortcuts to move mouse to numbered "columns" of the screen
for i = 0, 9 do
    local action = moveRelativeToScreenEvent(function(pos, frame)
        if i == 0 then
            return frame.w - PIXEL_OFFSET, pos.y
        else
            local part = frame.w / 9
            local x = part * (i - 1)
            return x + PIXEL_OFFSET, pos.y
        end
    end)

    local columnText = i.."th"
    if i == 0 then
        columnText = "Leftmost"
    elseif i == 9 then
        columnText = "Rightmost"
    elseif i == 1 then
        columnText = "1st"
    elseif i == 2 then
        columnText = "2nd"
    elseif i == 3 then
        columnText = "3rd"
    end

    local description = "Move Mouse to "..columnText.." Column of Current Screen"
    table.insert(shortcuts, { nil, tostring(i), action, description })
end

Mode {
    name = "mouse",
    shortcut = { { "cmd" }, "m" },
    shortcuts = shortcuts,
}
