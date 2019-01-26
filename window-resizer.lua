---------------------------
-- Custom Window Resizer --
---------------------------

local windowResizer = {}

-- Disable animation and bind all resize functions
hs.window.animationDuration = 0
hs.hotkey.bind({ "alt" }, "left", function() windowResizer.moveWindowLeft() end)
hs.hotkey.bind({ "alt" }, "right", function() windowResizer.moveWindowRight() end)
hs.hotkey.bind({ "alt" }, "up", function() windowResizer.maximizeWindow() end)
hs.hotkey.bind({ "alt" }, "down", function() windowResizer.centerWindow() end)
hs.hotkey.bind({ "alt", "shift" }, "left", function() windowResizer.moveWindowUpperLeft() end)
hs.hotkey.bind({ "alt", "shift" }, "right", function() windowResizer.moveWindowUpperRight() end)
hs.hotkey.bind({ "alt", "cmd" }, "left", function() windowResizer.moveWindowBottomLeft() end)
hs.hotkey.bind({ "alt", "cmd" }, "right", function() windowResizer.moveWindowBottomRight() end)
hs.hotkey.bind({ "ctrl", "alt" }, "left", function() windowResizer.moveWindowOneSpace("left") end)
hs.hotkey.bind({ "ctrl", "alt" }, "right", function() windowResizer.moveWindowOneSpace("right") end)
hs.hotkey.bind({ "alt" }, "space", function() windowResizer.moveWindowToNextMonitor() end)

-----------------------------
-- Window Resize Functions --
-----------------------------
-- Move left --
function windowResizer.moveWindowLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local windowFrame = window:frame()

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the right half --
function windowResizer.moveWindowRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local windowFrame = window:frame()

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the upper left --
function windowResizer.moveWindowUpperLeft()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = win:frame()

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    win:setFrame(windowFrame)
end

-- Move window to the upper right --
function windowResizer.moveWindowUpperRight()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = win:frame()

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    win:setFrame(windowFrame)
end

-- Move window to the bottom left --
function windowResizer.moveWindowBottomLeft()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local windowFrame = win:frame()

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.h / 2
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = (screenDimensions.h / 2) + 50

    win:setFrame(windowFrame)
end

-- Move window to the bottom right --
function windowResizer.moveWindowBottomRight()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = win:frame()

    windowFrame.x = screenWidth / 2
    windowFrame.y = screenHeight / 2
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    win:setFrame(windowFrame)
end

-- Maximize window --
function windowResizer.maximizeWindow()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()

    win:setFrame(screenDimensions)
end

-- Center window --
function windowResizer.centerWindow()
    local win = hs.window.focusedWindow()
    local screenDimensions = windowResizer.getScreenDimensions()
    local windowFrame = win:frame()

    windowFrame.x = screenDimensions.x + (screenDimensions.w * 0.25)
    windowFrame.y = screenDimensions.y + (screenDimensions.h * 0.25)
    windowFrame.w = screenDimensions.w * 0.5
    windowFrame.h = screenDimensions.h * 0.5

    win:setFrame(windowFrame)
end

-- Move window to an adjacent space (https://github.com/koekeishiya/kwm/issues/219) --
function windowResizer.moveWindowOneSpace(direction)
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

-- Move window to the next monitor --
function windowResizer.moveWindowToNextMonitor()
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

-----------------------
-- Utility Functions --
-----------------------
function windowResizer.getScreenDimensions()
    return hs.window.focusedWindow():screen():frame()
end
