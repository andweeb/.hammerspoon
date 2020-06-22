----------------------------------------------------------------------------------------------------
-- Hammerspoon application config
--
local Application = spoon.Ki.Application
local Hammerspoon = Application:new("Hammerspoon")

-- File actions
Hammerspoon.openConfig = Application.createMenuItemEvent({ "File", "Open Config" })
Hammerspoon.print = Application.createMenuItemEvent({ "File", "Print…" })
Hammerspoon.console = Application.createMenuItemEvent({ "File", "Console..." })
Hammerspoon.pageSetup = Application.createMenuItemEvent({ "File", "Page Setup…" })
Hammerspoon.reloadConfig = Application.createMenuItemEvent({ "File", "Reload Config" })
-- Edit actions
Hammerspoon.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
Hammerspoon.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
Hammerspoon.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
Hammerspoon.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
Hammerspoon.undoTyping = Application.createMenuItemEvent({ "Edit", "Undo Typing" })
Hammerspoon.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
Hammerspoon.pasteAndMatchStyle = Application.createMenuItemEvent({ "Edit", "Paste and Match Style" })
Hammerspoon.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
Hammerspoon.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
Hammerspoon.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
Hammerspoon.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
Hammerspoon.speech = Application.createMenuItemChooserEvent({ "Edit", "Speech" })
Hammerspoon.spellingAndGrammar = Application.createMenuItemChooserEvent({ "Edit", "Spelling and Grammar" })
Hammerspoon.substitutions = Application.createMenuItemChooserEvent({ "Edit", "Substitutions" })
Hammerspoon.transformations = Application.createMenuItemChooserEvent({ "Edit", "Transformations" })
-- Window actions
Hammerspoon.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
Hammerspoon.close = Application.createMenuItemEvent({ "Window", "Close" })
Hammerspoon.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
Hammerspoon.closeAll = Application.createMenuItemEvent({ "Window", "Close All" })
Hammerspoon.showAllTabs = Application.createMenuItemEvent({ "Window", "Show All Tabs" })
Hammerspoon.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
Hammerspoon.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
Hammerspoon.enterFullScreen = Application.createMenuItemEvent({ "Window", "Enter Full Screen" })
Hammerspoon.hammerspoonConsole = Application.createMenuItemEvent({ "Window", "Hammerspoon Console" })
Hammerspoon.mergeAllWindows = Application.createMenuItemEvent({ "Window", "Merge All Windows" })
Hammerspoon.moveTabToNewWindow = Application.createMenuItemEvent({ "Window", "Move Tab to New Window" })
Hammerspoon.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
Hammerspoon.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
Hammerspoon.showNextTab = Application.createMenuItemEvent({ "Window", "Show Next Tab" })
Hammerspoon.showPreviousTab = Application.createMenuItemEvent({ "Window", "Show Previous Tab" })
Hammerspoon.showTabBar = Application.createMenuItemEvent({ "Window", "Show Tab Bar" })
Hammerspoon.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
Hammerspoon.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
Hammerspoon.hammerspoonHelp = Application.createMenuItemEvent({ "Help", "Hammerspoon Help" })

Hammerspoon:registerShortcuts({
    -- File
    { nil, "o", Hammerspoon.openConfig, { "File", "Open Config" } },
    { nil, "p", Hammerspoon.print, { "File", "Print…" } },
    { nil, "r", Hammerspoon.console, { "File", "Console..." } },
    { { "shift" }, "p", Hammerspoon.pageSetup, { "File", "Page Setup…" } },
    { { "shift" }, "r", Hammerspoon.reloadConfig, { "File", "Reload Config" } },
    -- Edit
    { nil, "a", Hammerspoon.selectAll, { "Edit", "Select All" } },
    { nil, "c", Hammerspoon.copy, { "Edit", "Copy" } },
    { nil, "v", Hammerspoon.paste, { "Edit", "Paste" } },
    { nil, "x", Hammerspoon.cut, { "Edit", "Cut" } },
    { nil, "z", Hammerspoon.undoTyping, { "Edit", "Undo Typing" } },
    { { "shift" }, "z", Hammerspoon.redo, { "Edit", "Redo" } },
    { { "shift", "alt" }, "v", Hammerspoon.pasteAndMatchStyle, { "Edit", "Paste and Match Style" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.speech, { "Edit", "Speech" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.spellingAndGrammar, { "Edit", "Spelling and Grammar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.substitutions, { "Edit", "Substitutions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.transformations, { "Edit", "Transformations" } },
    -- Window
    { nil, "m", Hammerspoon.minimize, { "Window", "Minimize" } },
    { nil, "w", Hammerspoon.close, { "Window", "Close" } },
    { { "alt" }, "m", Hammerspoon.minimizeAll, { "Window", "Minimize All" } },
    { { "alt" }, "w", Hammerspoon.closeAll, { "Window", "Close All" } },
    { { "shift" }, "\\", Hammerspoon.showAllTabs, { "Window", "Show All Tabs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.enterFullScreen, { "Window", "Enter Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.hammerspoonConsole, { "Window", "Hammerspoon Console" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.mergeAllWindows, { "Window", "Merge All Windows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveTabToNewWindow, { "Window", "Move Tab to New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showNextTab, { "Window", "Show Next Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showPreviousTab, { "Window", "Show Previous Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showTabBar, { "Window", "Show Tab Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.hammerspoonHelp, { "Help", "Hammerspoon Help" } },
})

return Hammerspoon
