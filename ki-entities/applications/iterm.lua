----------------------------------------------------------------------------------------------------
-- iTerm application config
--
local Application = spoon.Ki.Application
local iTerm = Application:new("iTerm")

-- Shell actions
iTerm.splitVerticallyWithCurrentProfile = Application:createMenuItemAction({ "Shell", "Split Vertically with Current Profile" })
iTerm.newWindow = Application:createMenuItemAction({ "Shell", "New Window" })
iTerm.saveSelectedText = Application:createMenuItemAction({ "Shell", "Save Selected Text…" })
iTerm.newTab = Application:createMenuItemAction({ "Shell", "New Tab" })
iTerm.close = Application:createMenuItemAction({ "Shell", "Close" })
iTerm.closeAllPanesInTab = Application:createMenuItemAction({ "Shell", "Close All Panes in Tab" })
iTerm.splitHorizontallyWithCurrentProfile = Application:createMenuItemAction({ "Shell", "Split Horizontally with Current Profile" })
iTerm.pageSetup = Application:createMenuItemAction({ "Shell", "Page Setup..." })
iTerm.closeTerminalWindow = Application:createMenuItemAction({ "Shell", "Close Terminal Window" })
iTerm.splitHorizontally = Application:createMenuItemAction({ "Shell", "Split Horizontally…" })
iTerm.newTabWithCurrentProfile = Application:createMenuItemAction({ "Shell", "New Tab with Current Profile" })
iTerm.splitVertically = Application:createMenuItemAction({ "Shell", "Split Vertically…" })
iTerm.duplicateTab = Application:createMenuItemAction({ "Shell", "Duplicate Tab" })
iTerm.broadcastInput = Application:createChooseMenuItemAction({ "Shell", "Broadcast Input" })
iTerm.print = Application:createChooseMenuItemAction({ "Shell", "Print" })
iTerm.tmux = Application:createChooseMenuItemAction({ "Shell", "tmux" })
-- Edit actions
iTerm.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
iTerm.copy = Application:createMenuItemAction({ "Edit", "Copy" })
iTerm.clearBuffer = Application:createMenuItemAction({ "Edit", "Clear Buffer" })
iTerm.paste = Application:createMenuItemAction({ "Edit", "Paste" })
iTerm.cut = Application:createMenuItemAction({ "Edit", "Cut" })
iTerm.undoCloseSession = Application:createMenuItemAction({ "Edit", "Undo Close Session" })
iTerm.copyWithStyles = Application:createMenuItemAction({ "Edit", "Copy with Styles" })
iTerm.openSelection = Application:createMenuItemAction({ "Edit", "Open Selection" })
iTerm.selectOutputOfLastCommand = Application:createMenuItemAction({ "Edit", "Select Output of Last Command" })
iTerm.copyMode = Application:createMenuItemAction({ "Edit", "Copy Mode" })
iTerm.clearScrollbackBuffer = Application:createMenuItemAction({ "Edit", "Clear Scrollback Buffer" })
iTerm.redo = Application:createMenuItemAction({ "Edit", "Redo" })
iTerm.selectionRespectsSoftBoundaries = Application:createMenuItemAction({ "Edit", "Selection Respects Soft Boundaries" })
iTerm.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
iTerm.selectCurrentCommand = Application:createMenuItemAction({ "Edit", "Select Current Command" })
iTerm.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
iTerm.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
iTerm.marksAndAnnotations = Application:createChooseMenuItemAction({ "Edit", "Marks and Annotations" })
iTerm.pasteSpecial = Application:createChooseMenuItemAction({ "Edit", "Paste Special" })
-- View actions
iTerm.makeTextBigger = Application:createMenuItemAction({ "View", "Make Text Bigger" })
iTerm.makeTextSmaller = Application:createMenuItemAction({ "View", "Make Text Smaller" })
iTerm.findCursor = Application:createMenuItemAction({ "View", "Find Cursor" })
iTerm.makeTextNormalSize = Application:createMenuItemAction({ "View", "Make Text Normal Size" })
iTerm.showAnnotations = Application:createMenuItemAction({ "View", "Show Annotations" })
iTerm.useTransparency = Application:createMenuItemAction({ "View", "Use Transparency" })
iTerm.restoreTextAndSessionSize = Application:createMenuItemAction({ "View", "Restore Text and Session Size" })
iTerm.showCursorGuide = Application:createMenuItemAction({ "View", "Show Cursor Guide" })
iTerm.startInstantReplay = Application:createMenuItemAction({ "View", "Start Instant Replay" })
iTerm.zoomInOnSelection = Application:createMenuItemAction({ "View", "Zoom In on Selection" })
iTerm.showTimestamps = Application:createMenuItemAction({ "View", "Show Timestamps" })
iTerm.openQuickly = Application:createMenuItemAction({ "View", "Open Quickly" })
iTerm.showTabsInFullscreen = Application:createMenuItemAction({ "View", "Show Tabs in Fullscreen" })
iTerm.autoCommandCompletion = Application:createMenuItemAction({ "View", "Auto Command Completion" })
iTerm.maximizeActivePane = Application:createMenuItemAction({ "View", "Maximize Active Pane" })
iTerm.sizeChangesUpdateProfile = Application:createMenuItemAction({ "View", "Size Changes Update Profile" })
iTerm.toggleFullScreen = Application:createMenuItemAction({ "View", "Toggle Full Screen" })
iTerm.zoomOut = Application:createMenuItemAction({ "View", "Zoom Out" })
-- Session actions
iTerm.openAutocomplete = Application:createMenuItemAction({ "Session", "Open Autocomplete…" })
iTerm.editSession = Application:createMenuItemAction({ "Session", "Edit Session…" })
iTerm.reset = Application:createMenuItemAction({ "Session", "Reset" })
iTerm.openRecentDirectories = Application:createMenuItemAction({ "Session", "Open Recent Directories…" })
iTerm.runCoprocess = Application:createMenuItemAction({ "Session", "Run Coprocess…" })
iTerm.openCommandHistory = Application:createMenuItemAction({ "Session", "Open Command History…" })
iTerm.openPasteHistory = Application:createMenuItemAction({ "Session", "Open Paste History…" })
iTerm.burySession = Application:createMenuItemAction({ "Session", "Bury Session" })
iTerm.stopCoprocess = Application:createMenuItemAction({ "Session", "Stop Coprocess" })
iTerm.buriedSessions = Application:createMenuItemAction({ "Session", "Buried Sessions" })
iTerm.resetCharacterSet = Application:createMenuItemAction({ "Session", "Reset Character Set" })
iTerm.restartSession = Application:createMenuItemAction({ "Session", "Restart Session" })
iTerm.log = Application:createChooseMenuItemAction({ "Session", "Log" })
iTerm.terminalState = Application:createChooseMenuItemAction({ "Session", "Terminal State" })
-- Scripts actions
iTerm.manage = Application:createChooseMenuItemAction({ "Scripts", "Manage" })
-- Profiles actions
iTerm.openProfiles = Application:createMenuItemAction({ "Profiles", "Open Profiles…" })
iTerm.default = Application:createMenuItemAction({ "Profiles", "Default" })
iTerm.default = Application:createMenuItemAction({ "Profiles", "Default" })
iTerm.openInNewWindow = Application:createMenuItemAction({ "Profiles", "Open In New Window" })
iTerm.pressOptionForNewWindow = Application:createMenuItemAction({ "Profiles", "Press Option for New Window" })
-- Toolbelt actions
iTerm.showToolbelt = Application:createMenuItemAction({ "Toolbelt", "Show Toolbelt" })
iTerm.actions = Application:createMenuItemAction({ "Toolbelt", "Actions" })
iTerm.capturedOutput = Application:createMenuItemAction({ "Toolbelt", "Captured Output" })
iTerm.commandHistory = Application:createMenuItemAction({ "Toolbelt", "Command History" })
iTerm.jobs = Application:createMenuItemAction({ "Toolbelt", "Jobs" })
iTerm.notes = Application:createMenuItemAction({ "Toolbelt", "Notes" })
iTerm.pasteHistory = Application:createMenuItemAction({ "Toolbelt", "Paste History" })
iTerm.profiles = Application:createMenuItemAction({ "Toolbelt", "Profiles" })
iTerm.recentDirectories = Application:createMenuItemAction({ "Toolbelt", "Recent Directories" })
iTerm.setDefaultWidth = Application:createMenuItemAction({ "Toolbelt", "Set Default Width" })
-- Window actions
iTerm.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
iTerm.exposAllTabs = Application:createMenuItemAction({ "Window", "Exposé all Tabs" })
iTerm.passwordManager = Application:createMenuItemAction({ "Window", "Password Manager" })
iTerm.pinHotkeyWindow = Application:createMenuItemAction({ "Window", "Pin Hotkey Window" })
iTerm.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
iTerm.selectPreviousTab = Application:createMenuItemAction({ "Window", "Select Previous Tab" })
iTerm.selectNextTab = Application:createMenuItemAction({ "Window", "Select Next Tab" })
iTerm.saveWindowArrangement = Application:createMenuItemAction({ "Window", "Save Window Arrangement" })
iTerm.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
iTerm.moveTabLeft = Application:createMenuItemAction({ "Window", "Move Tab Left" })
iTerm.moveTabRight = Application:createMenuItemAction({ "Window", "Move Tab Right" })
iTerm.saveCurrentWindowAsArrangement = Application:createMenuItemAction({ "Window", "Save Current Window as Arrangement" })
iTerm.arrangeSplitPanesEvenly = Application:createMenuItemAction({ "Window", "Arrange Split Panes Evenly" })
iTerm.arrangeWindowsHorizontally = Application:createMenuItemAction({ "Window", "Arrange Windows Horizontally" })
iTerm.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
iTerm.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All To Front" })
iTerm.editTabTitle = Application:createMenuItemAction({ "Window", "Edit Tab Title" })
iTerm.editWindowTitle = Application:createMenuItemAction({ "Window", "Edit Window Title" })
iTerm.mergeAllWindows = Application:createMenuItemAction({ "Window", "Merge All Windows" })
iTerm.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
iTerm.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
iTerm.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
iTerm.restoreWindowArrangementAsTabs = Application:createMenuItemAction({ "Window", "Restore Window Arrangement as Tabs" })
iTerm.restoreWindowArrangement = Application:createMenuItemAction({ "Window", "Restore Window Arrangement" })
iTerm.resizeSplitPane = Application:createChooseMenuItemAction({ "Window", "Resize Split Pane" })
iTerm.resizeWindow = Application:createChooseMenuItemAction({ "Window", "Resize Window" })
iTerm.selectSplitPane = Application:createChooseMenuItemAction({ "Window", "Select Split Pane" })
iTerm.selectTab = Application:createChooseMenuItemAction({ "Window", "Select Tab" })
-- Help actions
iTerm.copyModeShortcuts = Application:createMenuItemAction({ "Help", "Copy Mode Shortcuts" })
iTerm.GPURendererAvailability = Application:createMenuItemAction({ "Help", "GPU Renderer Availability" })
iTerm.openSourceLicenses = Application:createMenuItemAction({ "Help", "Open Source Licenses" })
iTerm.ITerm2Help = Application:createMenuItemAction({ "Help", "iTerm2 Help" })

iTerm:registerShortcuts({
    -- Shell
    { nil, "d", iTerm.splitVerticallyWithCurrentProfile, "Split Vertically with Current Profile" },
    { nil, "n", iTerm.newWindow, "New Window" },
    { nil, "s", iTerm.saveSelectedText, "Save Selected Text…" },
    { nil, "t", iTerm.newTab, "New Tab" },
    { nil, "w", iTerm.close, "Close" },
    { { "alt" }, "w", iTerm.closeAllPanesInTab, "Close All Panes in Tab" },
    { { "shift" }, "d", iTerm.splitHorizontallyWithCurrentProfile, "Split Horizontally with Current Profile" },
    { { "shift" }, "p", iTerm.pageSetup, "Page Setup..." },
    { { "shift" }, "w", iTerm.closeTerminalWindow, "Close Terminal Window" },
    { { "shift", "alt" }, "h", iTerm.splitHorizontally, "Split Horizontally…" },
    { { "shift", "alt" }, "t", iTerm.newTabWithCurrentProfile, "New Tab with Current Profile" },
    { { "shift", "alt" }, "v", iTerm.splitVertically, "Split Vertically…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.duplicateTab, "Duplicate Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.broadcastInput, "Broadcast Input" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.print, "Print" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.tmux, "tmux" },
    -- Edit
    { nil, "a", iTerm.selectAll, "Select All" },
    { nil, "c", iTerm.copy, "Copy" },
    { nil, "k", iTerm.clearBuffer, "Clear Buffer" },
    { nil, "v", iTerm.paste, "Paste" },
    { nil, "x", iTerm.cut, "Cut" },
    { nil, "z", iTerm.undoCloseSession, "Undo Close Session" },
    { { "alt" }, "c", iTerm.copyWithStyles, "Copy with Styles" },
    { { "alt" }, "o", iTerm.openSelection, "Open Selection" },
    { { "shift" }, "a", iTerm.selectOutputOfLastCommand, "Select Output of Last Command" },
    { { "shift" }, "c", iTerm.copyMode, "Copy Mode" },
    { { "shift" }, "k", iTerm.clearScrollbackBuffer, "Clear Scrollback Buffer" },
    { { "shift" }, "z", iTerm.redo, "Redo" },
    { { "shift", "alt" }, "a", iTerm.selectionRespectsSoftBoundaries, "Selection Respects Soft Boundaries" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectCurrentCommand, "Select Current Command" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.marksAndAnnotations, "Marks and Annotations" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pasteSpecial, "Paste Special" },
    -- View
    { nil, "+", iTerm.makeTextBigger, "Make Text Bigger" },
    { nil, "-", iTerm.makeTextSmaller, "Make Text Smaller" },
    { nil, "/", iTerm.findCursor, "Find Cursor" },
    { nil, "0", iTerm.makeTextNormalSize, "Make Text Normal Size" },
    { nil, "\\", iTerm.showAnnotations, "Show Annotations" },
    { nil, "u", iTerm.useTransparency, "Use Transparency" },
    { { "alt" }, "0", iTerm.restoreTextAndSessionSize, "Restore Text and Session Size" },
    { { "alt" }, ";", iTerm.showCursorGuide, "Show Cursor Guide" },
    { { "alt" }, "b", iTerm.startInstantReplay, "Start Instant Replay" },
    { { "alt" }, "z", iTerm.zoomInOnSelection, "Zoom In on Selection" },
    { { "shift" }, "e", iTerm.showTimestamps, "Show Timestamps" },
    { { "shift" }, "o", iTerm.openQuickly, "Open Quickly" },
    { { "shift" }, "t", iTerm.showTabsInFullscreen, "Show Tabs in Fullscreen" },
    { { "shift", "alt" }, "y", iTerm.autoCommandCompletion, "Auto Command Completion" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.maximizeActivePane, "Maximize Active Pane" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.sizeChangesUpdateProfile, "Size Changes Update Profile" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.toggleFullScreen, "Toggle Full Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.zoomOut, "Zoom Out" },
    -- Session
    { nil, ";", iTerm.openAutocomplete, "Open Autocomplete…" },
    { nil, "i", iTerm.editSession, "Edit Session…" },
    { nil, "r", iTerm.reset, "Reset" },
    { { "alt" }, "/", iTerm.openRecentDirectories, "Open Recent Directories…" },
    { { "alt" }, "r", iTerm.runCoprocess, "Run Coprocess…" },
    { { "shift" }, ";", iTerm.openCommandHistory, "Open Command History…" },
    { { "shift" }, "h", iTerm.openPasteHistory, "Open Paste History…" },
    { { "shift", "alt" }, "b", iTerm.burySession, "Bury Session" },
    { { "shift", "alt" }, "r", iTerm.stopCoprocess, "Stop Coprocess" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.buriedSessions, "Buried Sessions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resetCharacterSet, "Reset Character Set" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restartSession, "Restart Session" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.log, "Log" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.terminalState, "Terminal State" },
    -- Scripts
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.manage, "Manage" },
    -- Profiles
    { nil, "o", iTerm.openProfiles, "Open Profiles…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.default, "Default" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.default, "Default" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.openInNewWindow, "Open In New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pressOptionForNewWindow, "Press Option for New Window" },
    -- Toolbelt
    { { "shift" }, "b", iTerm.showToolbelt, "Show Toolbelt" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.actions, "Actions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.capturedOutput, "Captured Output" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.commandHistory, "Command History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.jobs, "Jobs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.notes, "Notes" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pasteHistory, "Paste History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.profiles, "Profiles" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.recentDirectories, "Recent Directories" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.setDefaultWidth, "Set Default Width" },
    -- Window
    { nil, "m", iTerm.minimize, "Minimize" },
    { { "alt" }, "e", iTerm.exposAllTabs, "Exposé all Tabs" },
    { { "alt" }, "f", iTerm.passwordManager, "Password Manager" },
    { { "shift" }, "-", iTerm.pinHotkeyWindow, "Pin Hotkey Window" },
    { { "shift" }, "0", iTerm.zoom, "Zoom" },
    { { "shift" }, "[", iTerm.selectPreviousTab, "Select Previous Tab" },
    { { "shift" }, "]", iTerm.selectNextTab, "Select Next Tab" },
    { { "shift" }, "s", iTerm.saveWindowArrangement, "Save Window Arrangement" },
    { { "shift", "alt" }, "0", iTerm.zoomAll, "Zoom All" },
    { { "shift", "alt" }, "[", iTerm.moveTabLeft, "Move Tab Left" },
    { { "shift", "alt" }, "]", iTerm.moveTabRight, "Move Tab Right" },
    { { "shift", "alt" }, "s", iTerm.saveCurrentWindowAsArrangement, "Save Current Window as Arrangement" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeSplitPanesEvenly, "Arrange Split Panes Evenly" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeWindowsHorizontally, "Arrange Windows Horizontally" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.bringAllToFront, "Bring All To Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.editTabTitle, "Edit Tab Title" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.editWindowTitle, "Edit Window Title" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.mergeAllWindows, "Merge All Windows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restoreWindowArrangementAsTabs, "Restore Window Arrangement as Tabs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restoreWindowArrangement, "Restore Window Arrangement" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resizeSplitPane, "Resize Split Pane" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resizeWindow, "Resize Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectSplitPane, "Select Split Pane" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectTab, "Select Tab" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.copyModeShortcuts, "Copy Mode Shortcuts" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.GPURendererAvailability, "GPU Renderer Availability" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.openSourceLicenses, "Open Source Licenses" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.ITerm2Help, "iTerm2 Help" },
})

return iTerm
