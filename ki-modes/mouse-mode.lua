----------------------------------------------------------------------------------------------------
-- Mouse Mode
--
local Mouse = {}
local Ki = spoon.Ki

Mouse.PIXEL_OFFSET = 1
Mouse.INDICATOR = {
    SIZE = 100,
    STYLE = {
        radius = "45%",
        type = "circle",
        fillColor = { red = 1, alpha = 0.8 },
        strokeColor = { alpha = 0 },
    },
}

function Mouse.getScreenDimensions()
    return hs.window.focusedWindow():screen():frame()
end

-- Flash an indicator to highlight the mouse location
function Mouse.flashIndicator()
    local size = Mouse.INDICATOR.SIZE
    local mousePosition = hs.mouse.getAbsolutePosition()
    local canvasDimensions = {
        w = size,
        h = size,
        x = mousePosition.x - (size / 2),
        y = mousePosition.y - (size / 2),
    }

    hs.canvas.new(canvasDimensions)
        :insertElement(Mouse.INDICATOR.STYLE)
        :show()
        :hide(1)
end

-- Create mouse click events
function Mouse.clickEvent(clickMethod)
    return function()
        local position = hs.mouse.getAbsolutePosition()
        hs.eventtap[clickMethod](position)
    end
end

-- Create mouse movement events
function Mouse.moveEvent(setPosition)
    return function()
        local position = hs.mouse.getRelativePosition()
        local x, y = setPosition(position)
        hs.mouse.setRelativePosition({ x = x, y = y })
    end
end

-- Cycle the mouse to the next screen
function Mouse.cycleMouseToNextScreen()
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
function Mouse.moveRelativeToScreenEvent(setPosition)
    return function()
        local position = hs.mouse.getRelativePosition()
        local screen = hs.mouse.getCurrentScreen()
        local screenFrame = screen:frame()
        local x, y = setPosition(position, screenFrame)
        hs.mouse.setRelativePosition({ x = x, y = y })
    end
end

-- Click actions
Mouse.leftClick = Mouse.clickEvent("leftClick")
Mouse.rightClick = Mouse.clickEvent("rightClick")

-- Slight directional mouse movement actions
Mouse.moveMouseSlightLeft = Mouse.moveEvent(function(pos) return pos.x - 10, pos.y end)
Mouse.moveMouseSlightDown = Mouse.moveEvent(function(pos) return pos.x, pos.y + 10 end)
Mouse.moveMouseSlightUp = Mouse.moveEvent(function(pos) return pos.x, pos.y - 10 end)
Mouse.moveMouseSlightRight = Mouse.moveEvent(function(pos) return pos.x + 10, pos.y end)

-- Standard directional mouse movement actions
Mouse.moveMouseStandardLeft = Mouse.moveEvent(function(pos) return pos.x - 100, pos.y end)
Mouse.moveMouseStandardDown = Mouse.moveEvent(function(pos) return pos.x, pos.y + 100 end)
Mouse.moveMouseStandardUp = Mouse.moveEvent(function(pos) return pos.x, pos.y - 100 end)
Mouse.moveMouseStandardRight = Mouse.moveEvent(function(pos) return pos.x + 100, pos.y end)

-- Vertical high/medium/low mouse movement
Mouse.moveMouseHigh = Mouse.moveRelativeToScreenEvent(function(pos) return pos.x, 0 end)
Mouse.moveMouseMiddle = Mouse.moveRelativeToScreenEvent(function(pos, frame) return pos.x, frame.h / 2 end)
Mouse.moveMouseLow = Mouse.moveRelativeToScreenEvent(function(pos, frame) return pos.x, frame.h end)

Mouse.shortcuts = {
    { nil, "space", Mouse.cycleMouseToNextScreen, { "Mouse Mode", "Cycle Mouse to Next Screen" } },
    -- Mouse clicks
    { nil, "return", Mouse.leftClick, { "Mouse Mode", "Left Click" } },
    { { "shift" }, "return", Mouse.rightClick, { "Mouse Mode", "Right Click" } },
    { { "shift" }, "/", Mouse.flashIndicator, { "Mouse Mode", "Flash the Mouse Indicator" } },
    -- Slight directional movement shortcuts
    { nil, "h", Mouse.moveMouseSlightLeft, { "Mouse Mode", "Move Mouse Left Slightly" } },
    { nil, "j", Mouse.moveMouseSlightDown, { "Mouse Mode", "Move Mouse Down Slightly" } },
    { nil, "k", Mouse.moveMouseSlightUp, { "Mouse Mode", "Move Mouse Up Slightly" } },
    { nil, "l", Mouse.moveMouseSlightRight, { "Mouse Mode", "Move Mouse Right Slightly" } },
    -- Standard directional movement shortcuts
    { nil, "b", Mouse.moveMouseStandardLeft, { "Mouse Mode", "Move Mouse Left" } },
    { nil, "d", Mouse.moveMouseStandardDown, { "Mouse Mode", "Move Mouse Down" } },
    { nil, "u", Mouse.moveMouseStandardUp, { "Mouse Mode", "Move Mouse Up" } },
    { nil, "w", Mouse.moveMouseStandardRight, { "Mouse Mode", "Move Mouse Right" } },
    -- Vertical high/medium/low mouse movement shortcuts
    { { "shift" }, "h", Mouse.moveMouseHigh, { "Mouse Mode", "Move Mouse to Top of Screen" } },
    { { "shift" }, "m", Mouse.moveMouseMiddle, { "Mouse Mode", "Move Mouse to Middle of Screen" } },
    { { "shift" }, "l", Mouse.moveMouseLow, { "Mouse Mode", "Move Mouse to Bottom of Screen" } },
}

-- Dynamically create 0-9 shortcuts to move mouse to numbered "columns" of the screen
for i = 0, 9 do
    local action = Mouse.moveRelativeToScreenEvent(function(pos, frame)
        if i == 0 then
            return frame.w - Mouse.PIXEL_OFFSET, pos.y
        else
            local part = frame.w / 9
            local x = part * (i - 1)
            return x + Mouse.PIXEL_OFFSET, pos.y
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
    table.insert(Mouse.shortcuts, { nil, tostring(i), action, { "Mouse Mode", description } })
end

local enterMouseModeShortcut = {
    {"cmd"}, "m", nil, { "Mouse Mode", "Enter Mouse Mode" },
}

Ki:registerMode("mouse", enterMouseModeShortcut, Mouse.shortcuts)
