----------------------------------------------------------------------------------------------------
-- Custom Window Resizer
--
local WindowResizer = {
    frames = {},
}

function WindowResizer:cloneTable(input)
    local copy

    if type(input) ~= "table" then
        return input
    end

    copy = {}

    for key, value in next, input, nil do
        copy[self:cloneTable(key)] = self:cloneTable(value)
    end

    setmetatable(copy, self:cloneTable(getmetatable(input)))

    return copy
end

-- Move window to the left half
function WindowResizer.moveWindowLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the right half
function WindowResizer.moveWindowRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the top half
function WindowResizer.moveWindowTopHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the bottom half
function WindowResizer.moveWindowBottomHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenDimensions.h / 2)
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the upper left
function WindowResizer.moveWindowUpperLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the upper right
function WindowResizer.moveWindowUpperRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the bottom left
function WindowResizer.moveWindowBottomLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Move window to the bottom right
function WindowResizer.moveWindowBottomRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenWidth / 2)
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Maximize window
function WindowResizer.maximizeWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(window:frame())
    end

    window:setFrame(screenDimensions)
end

-- Toggle window fullscreen status
function WindowResizer.fullScreenWindow()
    local win = hs.window.focusedWindow()
    win:toggleFullScreen()
end

-- Center window
function WindowResizer.centerWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = WindowResizer.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = WindowResizer.frames[window:id()]
    if not previousFrame then
        WindowResizer.frames[window:id()] = WindowResizer:cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w * 0.25)
    windowFrame.y = screenDimensions.y + (screenDimensions.h * 0.25)
    windowFrame.w = screenDimensions.w * 0.5
    windowFrame.h = screenDimensions.h * 0.5

    window:setFrame(windowFrame)
end

-- Move window to an adjacent space (https://github.com/koekeishiya/kwm/issues/219)
function WindowResizer.moveWindowOneSpace(direction)
    local mouseOrigin = hs.mouse.getAbsolutePosition()
    local win = hs.window.frontmostWindow()
    local clickPoint = win:zoomButtonRect()

    clickPoint.x = clickPoint.x + clickPoint.w + 3
    clickPoint.y = clickPoint.y + (clickPoint.h / 2)

    local mouseClickEvent = hs.eventtap.event.newMouseEvent(
        hs.eventtap.event.types.leftMouseDown,
        clickPoint
    )

    mouseClickEvent:post()
    hs.timer.usleep(300000)

    local nextSpaceDownEvent = hs.eventtap.event.newKeyEvent({ "ctrl" }, direction, true)
    nextSpaceDownEvent:post()
    hs.timer.usleep(150000)

    local nextSpaceUpEvent = hs.eventtap.event.newKeyEvent({ "ctrl" }, direction, false)
    nextSpaceUpEvent:post()
    hs.timer.usleep(150000)

    local mouseReleaseEvent = hs.eventtap.event.newMouseEvent(
        hs.eventtap.event.types.leftMouseUp,
        clickPoint
    )

    mouseReleaseEvent:post()
    hs.timer.usleep(150000)

    hs.mouse.setAbsolutePosition(mouseOrigin)
end

-- Move window to the next monitor
function WindowResizer.moveWindowToNextMonitor()
    local win = hs.window.focusedWindow()
    local screenFrame = win:screen():frame()
    local nextScreenFrame = win:screen():next():frame()
    local windowFrame = win:frame()

    windowFrame.x = ((((windowFrame.x - screenFrame.x) / screenFrame.w) * nextScreenFrame.w) + nextScreenFrame.x)
    windowFrame.y = ((((windowFrame.y - screenFrame.y) / screenFrame.h) * nextScreenFrame.h) + nextScreenFrame.y)
    windowFrame.h = ((windowFrame.h / screenFrame.h) * nextScreenFrame.h)
    windowFrame.w = ((windowFrame.w / screenFrame.w) * nextScreenFrame.w)

    win:setFrame(windowFrame)
end

-- Screen dimensions utility function
function WindowResizer.getScreenDimensions()
    return hs.window.focusedWindow():screen():frame()
end

-- Restore previous window frame state
function WindowResizer.restorePreviousWindowSize()
    local window = hs.window.frontmostWindow()
    local previousWindowFrame = WindowResizer.frames[window:id()]

    if previousWindowFrame then
        window:setFrame(previousWindowFrame)
        WindowResizer.frames[window:id()] = nil
    end
end

return WindowResizer
