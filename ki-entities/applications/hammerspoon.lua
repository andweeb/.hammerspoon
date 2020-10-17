----------------------------------------------------------------------------------------------------
-- Hammerspoon application config
--
local Application = spoon.Ki.Application
local Hammerspoon = Application:new("Hammerspoon")

-- File actions
Hammerspoon.openConfig = Application:createMenuItemAction({ "File", "Open Config" })
Hammerspoon.print = Application:createMenuItemAction({ "File", "Print…" })
Hammerspoon.console = Application:createMenuItemAction({ "File", "Console..." })
Hammerspoon.pageSetup = Application:createMenuItemAction({ "File", "Page Setup…" })
Hammerspoon.reloadConfig = Application:createMenuItemAction({ "File", "Reload Config" })
-- Edit actions
Hammerspoon.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
Hammerspoon.copy = Application:createMenuItemAction({ "Edit", "Copy" })
Hammerspoon.paste = Application:createMenuItemAction({ "Edit", "Paste" })
Hammerspoon.cut = Application:createMenuItemAction({ "Edit", "Cut" })
Hammerspoon.undoTyping = Application:createMenuItemAction({ "Edit", "Undo Typing" })
Hammerspoon.redo = Application:createMenuItemAction({ "Edit", "Redo" })
Hammerspoon.pasteAndMatchStyle = Application:createMenuItemAction({ "Edit", "Paste and Match Style" })
Hammerspoon.delete = Application:createMenuItemAction({ "Edit", "Delete" })
Hammerspoon.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
Hammerspoon.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
Hammerspoon.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
Hammerspoon.speech = Application:createChooseMenuItemAction({ "Edit", "Speech" })
Hammerspoon.spellingAndGrammar = Application:createChooseMenuItemAction({ "Edit", "Spelling and Grammar" })
Hammerspoon.substitutions = Application:createChooseMenuItemAction({ "Edit", "Substitutions" })
Hammerspoon.transformations = Application:createChooseMenuItemAction({ "Edit", "Transformations" })
-- Window actions
Hammerspoon.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
Hammerspoon.close = Application:createMenuItemAction({ "Window", "Close" })
Hammerspoon.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
Hammerspoon.closeAll = Application:createMenuItemAction({ "Window", "Close All" })
Hammerspoon.showAllTabs = Application:createMenuItemAction({ "Window", "Show All Tabs" })
Hammerspoon.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
Hammerspoon.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
Hammerspoon.enterFullScreen = Application:createMenuItemAction({ "Window", "Enter Full Screen" })
Hammerspoon.hammerspoonConsole = Application:createMenuItemAction({ "Window", "Hammerspoon Console" })
Hammerspoon.mergeAllWindows = Application:createMenuItemAction({ "Window", "Merge All Windows" })
Hammerspoon.moveTabToNewWindow = Application:createMenuItemAction({ "Window", "Move Tab to New Window" })
Hammerspoon.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
Hammerspoon.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
Hammerspoon.showNextTab = Application:createMenuItemAction({ "Window", "Show Next Tab" })
Hammerspoon.showPreviousTab = Application:createMenuItemAction({ "Window", "Show Previous Tab" })
Hammerspoon.showTabBar = Application:createMenuItemAction({ "Window", "Show Tab Bar" })
Hammerspoon.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
Hammerspoon.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
Hammerspoon.hammerspoonHelp = Application:createMenuItemAction({ "Help", "Hammerspoon Help" })

Hammerspoon:registerShortcuts({
    -- File
    { nil, "o", Hammerspoon.openConfig, "Open Config" },
    { nil, "p", Hammerspoon.print, "Print…" },
    { nil, "r", Hammerspoon.console, "Console..." },
    { { "shift" }, "p", Hammerspoon.pageSetup, "Page Setup…" },
    { { "shift" }, "r", Hammerspoon.reloadConfig, "Reload Config" },
    -- Edit
    { nil, "a", Hammerspoon.selectAll, "Select All" },
    { nil, "c", Hammerspoon.copy, "Copy" },
    { nil, "v", Hammerspoon.paste, "Paste" },
    { nil, "x", Hammerspoon.cut, "Cut" },
    { nil, "z", Hammerspoon.undoTyping, "Undo Typing" },
    { { "shift" }, "z", Hammerspoon.redo, "Redo" },
    { { "shift", "alt" }, "v", Hammerspoon.pasteAndMatchStyle, "Paste and Match Style" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.speech, "Speech" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.spellingAndGrammar, "Spelling and Grammar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.substitutions, "Substitutions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.transformations, "Transformations" },
    -- Window
    { nil, "m", Hammerspoon.minimize, "Minimize" },
    { nil, "w", Hammerspoon.close, "Close" },
    { { "alt" }, "m", Hammerspoon.minimizeAll, "Minimize All" },
    { { "alt" }, "w", Hammerspoon.closeAll, "Close All" },
    { { "shift" }, "\\", Hammerspoon.showAllTabs, "Show All Tabs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.enterFullScreen, "Enter Full Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.hammerspoonConsole, "Hammerspoon Console" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.mergeAllWindows, "Merge All Windows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveTabToNewWindow, "Move Tab to New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showNextTab, "Show Next Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showPreviousTab, "Show Previous Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.showTabBar, "Show Tab Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Hammerspoon.hammerspoonHelp, "Hammerspoon Help" },
})

return Hammerspoon
