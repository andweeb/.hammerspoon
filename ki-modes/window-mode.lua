----------------------------------------------------------------------------------------------------
-- Window Mode
--
local Ki = spoon.Ki
local Mode = Ki.Mode
local Entity = Ki.Entity
local frames = {}

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

-- Screen dimensions utility function
local function getScreenDimensions()
    return hs.window.focusedWindow():screen():frame()
end

-- Move window to the left half
local function moveWindowLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the right half
local function moveWindowRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w / 2
    windowFrame.h = screenDimensions.h

    window:setFrame(windowFrame)
end

-- Move window to the top half
local function moveWindowTopHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the bottom half
local function moveWindowBottomHalf()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenDimensions.h / 2)
    windowFrame.w = screenDimensions.w
    windowFrame.h = screenDimensions.h / 2

    window:setFrame(windowFrame)
end

-- Move window to the upper left
local function moveWindowUpperLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the upper right
local function moveWindowUpperRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w / 2)
    windowFrame.y = screenDimensions.y
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) - 25

    window:setFrame(windowFrame)
end

-- Move window to the bottom left
local function moveWindowBottomLeft()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Move window to the bottom right
local function moveWindowBottomRight()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local screenWidth = screenDimensions.w
    local screenHeight = screenDimensions.h
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenWidth / 2)
    windowFrame.y = screenDimensions.y + (screenHeight / 2) - 50
    windowFrame.w = screenWidth / 2
    windowFrame.h = (screenHeight / 2) + 50

    window:setFrame(windowFrame)
end

-- Maximize window
local function maximizeWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(window:frame())
    end

    window:setFrame(screenDimensions)
end

-- Toggle window fullscreen status
local function fullScreenWindow()
    local win = hs.window.focusedWindow()
    win:toggleFullScreen()
end

-- Center window
local function centerWindow()
    local window = hs.window.focusedWindow()
    local screenDimensions = getScreenDimensions()
    local windowFrame = window:frame()
    local previousFrame = frames[window:id()]
    if not previousFrame then
        frames[window:id()] = cloneTable(windowFrame)
    end

    windowFrame.x = screenDimensions.x + (screenDimensions.w * 0.25)
    windowFrame.y = screenDimensions.y + (screenDimensions.h * 0.25)
    windowFrame.w = screenDimensions.w * 0.5
    windowFrame.h = screenDimensions.h * 0.5

    window:setFrame(windowFrame)
end

-- Move window to an adjacent space (https://github.com/koekeishiya/kwm/issues/219)
local function moveWindowOneSpace(direction)
    local mouseOrigin = hs.mouse.absolutePosition()
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
local function moveWindowToNextMonitor()
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

-- Define window mode shortcuts
local function moveWindowOneSpaceLeft() moveWindowOneSpace("left") end
local function moveWindowOneSpaceRight() moveWindowOneSpace("right") end

-- Select a window
local function selectWindow()
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

    Entity.showChooser(choices, function(choice)
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
local function minimizeWindow()
    hs.window.focusedWindow():minimize()
end

-- Unminimize the last minimized window
local function unminimizeRecentWindow()
    local minimizedWindows = hs.window.minimizedWindows()
    if minimizedWindows and #minimizedWindows > 0 then
        minimizedWindows[1]:unminimize()
    end
end

Mode {
    name = "window",
    shortcut = { {"cmd"}, "w" },
    shortcuts = {
        { nil, "f", fullScreenWindow, "Full Screen Window" },
        { nil, "h", moveWindowLeft, "Move Window Left" },
        { nil, "j", centerWindow, "Center Window" },
        { nil, "k", maximizeWindow, "Maximize Window" },
        { nil, "l", moveWindowRight, "Move Window Right" },
        { nil, "m", minimizeWindow, "Minimize Focused Window" },
        { nil, "s", selectWindow, "Select Window" },
        { nil, "space", moveWindowToNextMonitor, "Move Window To Next Monitor" },
        { { "alt", "cmd" }, "k", moveWindowTopHalf, "Move Window Top Half" },
        { { "alt", "cmd" }, "j", moveWindowBottomHalf, "Move Window Bottom Half" },
        { { "ctrl" }, "h", moveWindowBottomLeft, "Move Window Bottom Left" },
        { { "ctrl" }, "l", moveWindowBottomRight, "Move Window Bottom Right" },
        { { "shift" }, "h", moveWindowUpperLeft, "Move Window Upper Left" },
        { { "shift" }, "l", moveWindowUpperRight, "Move Window Upper Right" },
        { { "shift" }, "m", unminimizeRecentWindow, "Minimize Most Recent Window" },
        { { "cmd" }, "h", moveWindowOneSpaceLeft, "Move Window One Space to the Left" },
        { { "cmd" }, "l", moveWindowOneSpaceRight, "Move Window One Space to the Right" },
    },
}
