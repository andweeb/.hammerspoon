----------------------------------------------------------------------------------------------------
-- Window Mode
--
local Ki = spoon.Ki
local Entity = spoon.Ki.Entity
local Window = {
    frames = {},
}

-- Clone utility function
local function cloneTable(input)
    if type(input) ~= "table" then return input end

    local copy = {}

    for key, value in next, input, nil do
        copy[cloneTable(key)] = cloneTable(value)
    end

    setmetatable(copy, cloneTable(getmetatable(input)))

    return copy
end

-- Move window to the left half
function Window.moveWindowLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the right half
function Window.moveWindowRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the top half
function Window.moveWindowTopHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the bottom half
function Window.moveWindowBottomHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenDimensions.h / 2)
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the upper left
function Window.moveWindowUpperLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the upper right
function Window.moveWindowUpperRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the bottom left
function Window.moveWindowBottomLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Move window to the bottom right
function Window.moveWindowBottomRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenWidth / 2)
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Maximize window
function Window.maximizeWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(window:frame())
    end

    window:setFrame(screenDimensions)
end

-- Toggle window fullscreen status
function Window.fullScreenWindow()
    local win = hs.window.focusedWindow()
    win:toggleFullScreen()
end

-- Center window
function Window.centerWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = Window.getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = Window.frames[window:id()]
    if not previousFrame then
        Window.frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w * 0.25)
    windowFrame.y = screenDimensions.y + (screenDimensions.h * 0.25)
    windowFrame.w = screenDimensions.w * 0.5
    windowFrame.h = screenDimensions.h * 0.5

    window:setFrame(windowFrame)
end

-- Move window to an adjacent space (https://github.com/koekeishiya/kwm/issues/219)
function Window.moveWindowOneSpace(direction)
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
function Window.moveWindowToNextMonitor()
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
function Window.getScreenDimensions()
    return hs.window.focusedWindow():screen():frame()
end

-- Restore previous window frame state
function Window.restorePreviousWindowSize()
    local window = hs.window.frontmostWindow()
    local previousWindowFrame = Window.frames[window:id()]

    if previousWindowFrame then
        window:setFrame(previousWindowFrame)
        Window.frames[window:id()] = nil
    end
end

-- Define window mode shortcuts
function Window.moveWindowOneSpaceLeft() Window.moveWindowOneSpace("left") end
function Window.moveWindowOneSpaceRight() Window.moveWindowOneSpace("right") end

-- Select a window
function Window.select()
    Ki.state:exitMode()

    local choices = {}

    for _, window in pairs(hs.window:allWindows()) do
        local app = window:application()
        local title = window:title()
        local name = app and app:title() or title

        table.insert(choices, {
            text = name,
            subText = title,
            id = window:id(),
        })
    end

    Entity.showSelectionModal(choices, function(choice)
        if not choice or not choice.id then return end

        local window = hs.window(choice.id)

        if not window then
            hs.notify.show("Ki", "Unable to focus window", "")
            return
        end

        window:focus()
    end)
end

-- Minimize window
function Window.minimizeWindow()
    hs.window.focusedWindow():minimize()
end

-- Unminimize the last minimized window
function Window.unminimizeRecentWindow()
    local minimizedWindows = hs.window.minimizedWindows()
    if minimizedWindows and #minimizedWindows > 0 then
        minimizedWindows[1]:unminimize()
    end
end

local enterWindowModeShortcut = {
    {"cmd"}, "w", nil, { "Normal Mode", "Enter Window Mode" },
}

Ki:registerMode("window", enterWindowModeShortcut, {
    { nil, "f", Window.fullScreenWindow, { "Window Mode", "Full Screen Window" } },
    { nil, "h", Window.moveWindowLeft, { "Window Mode", "Move Window Left" } },
    { nil, "j", Window.centerWindow, { "Window Mode", "Center Window" } },
    { nil, "k", Window.maximizeWindow, { "Window Mode", "Maximize Window" } },
    { nil, "l", Window.moveWindowRight, { "Window Mode", "Move Window Right" } },
    { nil, "m", Window.minimizeWindow, { "Window Mode", "Minimize Focused Window" } },
    { nil, "s", Window.select, { "Window Mode", "Select Window" } },
    { nil, "space", Window.moveWindowToNextMonitor, { "Window Mode", "Move Window To Next Monitor" } },
    { { "ctrl" }, "h", Window.moveWindowBottomLeft, { "Window Mode", "Move Window Bottom Left" } },
    { { "ctrl" }, "l", Window.moveWindowBottomRight, { "Window Mode", "Move Window Bottom Right" } },
    { { "shift" }, "h", Window.moveWindowUpperLeft, { "Window Mode", "Move Window Upper Left" } },
    { { "shift" }, "l", Window.moveWindowUpperRight, { "Window Mode", "Move Window Upper Right" } },
    { { "shift" }, "m", Window.unminimizeRecentWindow, { "Window Mode", "Minimize Most Recent Window" } },
    { { "cmd" }, "h", Window.moveWindowOneSpaceLeft, { "Window Mode", "Move Window One Space to the Left" } },
    { { "cmd" }, "l", Window.moveWindowOneSpaceRight, { "Window Mode", "Move Window One Space to the Right" } },
})
