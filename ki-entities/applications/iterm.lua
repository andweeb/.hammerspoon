----------------------------------------------------------------------------------------------------
-- iTerm application config
--
local Application = spoon.Ki.Application
local iTerm = Application:new("iTerm")

-- Shell actions
iTerm.splitVerticallyWithCurrentProfile = Application.createMenuItemEvent({ "Shell", "Split Vertically with Current Profile" })
iTerm.newWindow = Application.createMenuItemEvent({ "Shell", "New Window" })
iTerm.saveSelectedText = Application.createMenuItemEvent({ "Shell", "Save Selected Text…" })
iTerm.newTab = Application.createMenuItemEvent({ "Shell", "New Tab" })
iTerm.close = Application.createMenuItemEvent({ "Shell", "Close" })
iTerm.closeAllPanesInTab = Application.createMenuItemEvent({ "Shell", "Close All Panes in Tab" })
iTerm.splitHorizontallyWithCurrentProfile = Application.createMenuItemEvent({ "Shell", "Split Horizontally with Current Profile" })
iTerm.pageSetup = Application.createMenuItemEvent({ "Shell", "Page Setup..." })
iTerm.closeTerminalWindow = Application.createMenuItemEvent({ "Shell", "Close Terminal Window" })
iTerm.splitHorizontally = Application.createMenuItemEvent({ "Shell", "Split Horizontally…" })
iTerm.newTabWithCurrentProfile = Application.createMenuItemEvent({ "Shell", "New Tab with Current Profile" })
iTerm.splitVertically = Application.createMenuItemEvent({ "Shell", "Split Vertically…" })
iTerm.duplicateTab = Application.createMenuItemEvent({ "Shell", "Duplicate Tab" })
iTerm.broadcastInput = Application.createMenuItemSelectionEvent({ "Shell", "Broadcast Input" })
iTerm.print = Application.createMenuItemSelectionEvent({ "Shell", "Print" })
iTerm.tmux = Application.createMenuItemSelectionEvent({ "Shell", "tmux" })
-- Edit actions
iTerm.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
iTerm.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
iTerm.clearBuffer = Application.createMenuItemEvent({ "Edit", "Clear Buffer" })
iTerm.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
iTerm.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
iTerm.undoCloseSession = Application.createMenuItemEvent({ "Edit", "Undo Close Session" })
iTerm.copyWithStyles = Application.createMenuItemEvent({ "Edit", "Copy with Styles" })
iTerm.openSelection = Application.createMenuItemEvent({ "Edit", "Open Selection" })
iTerm.selectOutputOfLastCommand = Application.createMenuItemEvent({ "Edit", "Select Output of Last Command" })
iTerm.copyMode = Application.createMenuItemEvent({ "Edit", "Copy Mode" })
iTerm.clearScrollbackBuffer = Application.createMenuItemEvent({ "Edit", "Clear Scrollback Buffer" })
iTerm.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
iTerm.selectionRespectsSoftBoundaries = Application.createMenuItemEvent({ "Edit", "Selection Respects Soft Boundaries" })
iTerm.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
iTerm.selectCurrentCommand = Application.createMenuItemEvent({ "Edit", "Select Current Command" })
iTerm.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
iTerm.find = Application.createMenuItemSelectionEvent({ "Edit", "Find" })
iTerm.marksAndAnnotations = Application.createMenuItemSelectionEvent({ "Edit", "Marks and Annotations" })
iTerm.pasteSpecial = Application.createMenuItemSelectionEvent({ "Edit", "Paste Special" })
-- View actions
iTerm.makeTextBigger = Application.createMenuItemEvent({ "View", "Make Text Bigger" })
iTerm.makeTextSmaller = Application.createMenuItemEvent({ "View", "Make Text Smaller" })
iTerm.findCursor = Application.createMenuItemEvent({ "View", "Find Cursor" })
iTerm.makeTextNormalSize = Application.createMenuItemEvent({ "View", "Make Text Normal Size" })
iTerm.showAnnotations = Application.createMenuItemEvent({ "View", "Show Annotations" })
iTerm.useTransparency = Application.createMenuItemEvent({ "View", "Use Transparency" })
iTerm.restoreTextAndSessionSize = Application.createMenuItemEvent({ "View", "Restore Text and Session Size" })
iTerm.showCursorGuide = Application.createMenuItemEvent({ "View", "Show Cursor Guide" })
iTerm.startInstantReplay = Application.createMenuItemEvent({ "View", "Start Instant Replay" })
iTerm.zoomInOnSelection = Application.createMenuItemEvent({ "View", "Zoom In on Selection" })
iTerm.showTimestamps = Application.createMenuItemEvent({ "View", "Show Timestamps" })
iTerm.openQuickly = Application.createMenuItemEvent({ "View", "Open Quickly" })
iTerm.showTabsInFullscreen = Application.createMenuItemEvent({ "View", "Show Tabs in Fullscreen" })
iTerm.autoCommandCompletion = Application.createMenuItemEvent({ "View", "Auto Command Completion" })
iTerm.maximizeActivePane = Application.createMenuItemEvent({ "View", "Maximize Active Pane" })
iTerm.sizeChangesUpdateProfile = Application.createMenuItemEvent({ "View", "Size Changes Update Profile" })
iTerm.toggleFullScreen = Application.createMenuItemEvent({ "View", "Toggle Full Screen" })
iTerm.zoomOut = Application.createMenuItemEvent({ "View", "Zoom Out" })
-- Session actions
iTerm.openAutocomplete = Application.createMenuItemEvent({ "Session", "Open Autocomplete…" })
iTerm.editSession = Application.createMenuItemEvent({ "Session", "Edit Session…" })
iTerm.reset = Application.createMenuItemEvent({ "Session", "Reset" })
iTerm.openRecentDirectories = Application.createMenuItemEvent({ "Session", "Open Recent Directories…" })
iTerm.runCoprocess = Application.createMenuItemEvent({ "Session", "Run Coprocess…" })
iTerm.openCommandHistory = Application.createMenuItemEvent({ "Session", "Open Command History…" })
iTerm.openPasteHistory = Application.createMenuItemEvent({ "Session", "Open Paste History…" })
iTerm.burySession = Application.createMenuItemEvent({ "Session", "Bury Session" })
iTerm.stopCoprocess = Application.createMenuItemEvent({ "Session", "Stop Coprocess" })
iTerm.buriedSessions = Application.createMenuItemEvent({ "Session", "Buried Sessions" })
iTerm.resetCharacterSet = Application.createMenuItemEvent({ "Session", "Reset Character Set" })
iTerm.restartSession = Application.createMenuItemEvent({ "Session", "Restart Session" })
iTerm.log = Application.createMenuItemSelectionEvent({ "Session", "Log" })
iTerm.terminalState = Application.createMenuItemSelectionEvent({ "Session", "Terminal State" })
-- Scripts actions
iTerm.manage = Application.createMenuItemSelectionEvent({ "Scripts", "Manage" })
-- Profiles actions
iTerm.openProfiles = Application.createMenuItemEvent({ "Profiles", "Open Profiles…" })
iTerm.default = Application.createMenuItemEvent({ "Profiles", "Default" })
iTerm.default = Application.createMenuItemEvent({ "Profiles", "Default" })
iTerm.openInNewWindow = Application.createMenuItemEvent({ "Profiles", "Open In New Window" })
iTerm.pressOptionForNewWindow = Application.createMenuItemEvent({ "Profiles", "Press Option for New Window" })
-- Toolbelt actions
iTerm.showToolbelt = Application.createMenuItemEvent({ "Toolbelt", "Show Toolbelt" })
iTerm.actions = Application.createMenuItemEvent({ "Toolbelt", "Actions" })
iTerm.capturedOutput = Application.createMenuItemEvent({ "Toolbelt", "Captured Output" })
iTerm.commandHistory = Application.createMenuItemEvent({ "Toolbelt", "Command History" })
iTerm.jobs = Application.createMenuItemEvent({ "Toolbelt", "Jobs" })
iTerm.notes = Application.createMenuItemEvent({ "Toolbelt", "Notes" })
iTerm.pasteHistory = Application.createMenuItemEvent({ "Toolbelt", "Paste History" })
iTerm.profiles = Application.createMenuItemEvent({ "Toolbelt", "Profiles" })
iTerm.recentDirectories = Application.createMenuItemEvent({ "Toolbelt", "Recent Directories" })
iTerm.setDefaultWidth = Application.createMenuItemEvent({ "Toolbelt", "Set Default Width" })
-- Window actions
iTerm.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
iTerm.exposAllTabs = Application.createMenuItemEvent({ "Window", "Exposé all Tabs" })
iTerm.passwordManager = Application.createMenuItemEvent({ "Window", "Password Manager" })
iTerm.pinHotkeyWindow = Application.createMenuItemEvent({ "Window", "Pin Hotkey Window" })
iTerm.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
iTerm.selectPreviousTab = Application.createMenuItemEvent({ "Window", "Select Previous Tab" })
iTerm.selectNextTab = Application.createMenuItemEvent({ "Window", "Select Next Tab" })
iTerm.saveWindowArrangement = Application.createMenuItemEvent({ "Window", "Save Window Arrangement" })
iTerm.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
iTerm.moveTabLeft = Application.createMenuItemEvent({ "Window", "Move Tab Left" })
iTerm.moveTabRight = Application.createMenuItemEvent({ "Window", "Move Tab Right" })
iTerm.saveCurrentWindowAsArrangement = Application.createMenuItemEvent({ "Window", "Save Current Window as Arrangement" })
iTerm.arrangeSplitPanesEvenly = Application.createMenuItemEvent({ "Window", "Arrange Split Panes Evenly" })
iTerm.arrangeWindowsHorizontally = Application.createMenuItemEvent({ "Window", "Arrange Windows Horizontally" })
iTerm.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
iTerm.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All To Front" })
iTerm.editTabTitle = Application.createMenuItemEvent({ "Window", "Edit Tab Title" })
iTerm.editWindowTitle = Application.createMenuItemEvent({ "Window", "Edit Window Title" })
iTerm.mergeAllWindows = Application.createMenuItemEvent({ "Window", "Merge All Windows" })
iTerm.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
iTerm.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
iTerm.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
iTerm.restoreWindowArrangementAsTabs = Application.createMenuItemEvent({ "Window", "Restore Window Arrangement as Tabs" })
iTerm.restoreWindowArrangement = Application.createMenuItemEvent({ "Window", "Restore Window Arrangement" })
iTerm.resizeSplitPane = Application.createMenuItemSelectionEvent({ "Window", "Resize Split Pane" })
iTerm.resizeWindow = Application.createMenuItemSelectionEvent({ "Window", "Resize Window" })
iTerm.selectSplitPane = Application.createMenuItemSelectionEvent({ "Window", "Select Split Pane" })
iTerm.selectTab = Application.createMenuItemSelectionEvent({ "Window", "Select Tab" })
-- Help actions
iTerm.copyModeShortcuts = Application.createMenuItemEvent({ "Help", "Copy Mode Shortcuts" })
iTerm.GPURendererAvailability = Application.createMenuItemEvent({ "Help", "GPU Renderer Availability" })
iTerm.openSourceLicenses = Application.createMenuItemEvent({ "Help", "Open Source Licenses" })
iTerm.ITerm2Help = Application.createMenuItemEvent({ "Help", "iTerm2 Help" })

iTerm:registerShortcuts({
    -- Shell
    { nil, "d", iTerm.splitVerticallyWithCurrentProfile, { "Shell", "Split Vertically with Current Profile" } },
    { nil, "n", iTerm.newWindow, { "Shell", "New Window" } },
    { nil, "s", iTerm.saveSelectedText, { "Shell", "Save Selected Text…" } },
    { nil, "t", iTerm.newTab, { "Shell", "New Tab" } },
    { nil, "w", iTerm.close, { "Shell", "Close" } },
    { { "alt" }, "w", iTerm.closeAllPanesInTab, { "Shell", "Close All Panes in Tab" } },
    { { "shift" }, "d", iTerm.splitHorizontallyWithCurrentProfile, { "Shell", "Split Horizontally with Current Profile" } },
    { { "shift" }, "p", iTerm.pageSetup, { "Shell", "Page Setup..." } },
    { { "shift" }, "w", iTerm.closeTerminalWindow, { "Shell", "Close Terminal Window" } },
    { { "shift", "alt" }, "h", iTerm.splitHorizontally, { "Shell", "Split Horizontally…" } },
    { { "shift", "alt" }, "t", iTerm.newTabWithCurrentProfile, { "Shell", "New Tab with Current Profile" } },
    { { "shift", "alt" }, "v", iTerm.splitVertically, { "Shell", "Split Vertically…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.duplicateTab, { "Shell", "Duplicate Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.broadcastInput, { "Shell", "Broadcast Input" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.print, { "Shell", "Print" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.tmux, { "Shell", "tmux" } },
    -- Edit
    { nil, "a", iTerm.selectAll, { "Edit", "Select All" } },
    { nil, "c", iTerm.copy, { "Edit", "Copy" } },
    { nil, "k", iTerm.clearBuffer, { "Edit", "Clear Buffer" } },
    { nil, "v", iTerm.paste, { "Edit", "Paste" } },
    { nil, "x", iTerm.cut, { "Edit", "Cut" } },
    { nil, "z", iTerm.undoCloseSession, { "Edit", "Undo Close Session" } },
    { { "alt" }, "c", iTerm.copyWithStyles, { "Edit", "Copy with Styles" } },
    { { "alt" }, "o", iTerm.openSelection, { "Edit", "Open Selection" } },
    { { "shift" }, "a", iTerm.selectOutputOfLastCommand, { "Edit", "Select Output of Last Command" } },
    { { "shift" }, "c", iTerm.copyMode, { "Edit", "Copy Mode" } },
    { { "shift" }, "k", iTerm.clearScrollbackBuffer, { "Edit", "Clear Scrollback Buffer" } },
    { { "shift" }, "z", iTerm.redo, { "Edit", "Redo" } },
    { { "shift", "alt" }, "a", iTerm.selectionRespectsSoftBoundaries, { "Edit", "Selection Respects Soft Boundaries" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectCurrentCommand, { "Edit", "Select Current Command" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.marksAndAnnotations, { "Edit", "Marks and Annotations" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pasteSpecial, { "Edit", "Paste Special" } },
    -- View
    { nil, "+", iTerm.makeTextBigger, { "View", "Make Text Bigger" } },
    { nil, "-", iTerm.makeTextSmaller, { "View", "Make Text Smaller" } },
    { nil, "/", iTerm.findCursor, { "View", "Find Cursor" } },
    { nil, "0", iTerm.makeTextNormalSize, { "View", "Make Text Normal Size" } },
    { nil, "\\", iTerm.showAnnotations, { "View", "Show Annotations" } },
    { nil, "u", iTerm.useTransparency, { "View", "Use Transparency" } },
    { { "alt" }, "0", iTerm.restoreTextAndSessionSize, { "View", "Restore Text and Session Size" } },
    { { "alt" }, ";", iTerm.showCursorGuide, { "View", "Show Cursor Guide" } },
    { { "alt" }, "b", iTerm.startInstantReplay, { "View", "Start Instant Replay" } },
    { { "alt" }, "z", iTerm.zoomInOnSelection, { "View", "Zoom In on Selection" } },
    { { "shift" }, "e", iTerm.showTimestamps, { "View", "Show Timestamps" } },
    { { "shift" }, "o", iTerm.openQuickly, { "View", "Open Quickly" } },
    { { "shift" }, "t", iTerm.showTabsInFullscreen, { "View", "Show Tabs in Fullscreen" } },
    { { "shift", "alt" }, "y", iTerm.autoCommandCompletion, { "View", "Auto Command Completion" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.maximizeActivePane, { "View", "Maximize Active Pane" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.sizeChangesUpdateProfile, { "View", "Size Changes Update Profile" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.toggleFullScreen, { "View", "Toggle Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.zoomOut, { "View", "Zoom Out" } },
    -- Session
    { nil, ";", iTerm.openAutocomplete, { "Session", "Open Autocomplete…" } },
    { nil, "i", iTerm.editSession, { "Session", "Edit Session…" } },
    { nil, "r", iTerm.reset, { "Session", "Reset" } },
    { { "alt" }, "/", iTerm.openRecentDirectories, { "Session", "Open Recent Directories…" } },
    { { "alt" }, "r", iTerm.runCoprocess, { "Session", "Run Coprocess…" } },
    { { "shift" }, ";", iTerm.openCommandHistory, { "Session", "Open Command History…" } },
    { { "shift" }, "h", iTerm.openPasteHistory, { "Session", "Open Paste History…" } },
    { { "shift", "alt" }, "b", iTerm.burySession, { "Session", "Bury Session" } },
    { { "shift", "alt" }, "r", iTerm.stopCoprocess, { "Session", "Stop Coprocess" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.buriedSessions, { "Session", "Buried Sessions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resetCharacterSet, { "Session", "Reset Character Set" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restartSession, { "Session", "Restart Session" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.log, { "Session", "Log" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.terminalState, { "Session", "Terminal State" } },
    -- Scripts
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.manage, { "Scripts", "Manage" } },
    -- Profiles
    { nil, "o", iTerm.openProfiles, { "Profiles", "Open Profiles…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.default, { "Profiles", "Default" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.default, { "Profiles", "Default" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.openInNewWindow, { "Profiles", "Open In New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pressOptionForNewWindow, { "Profiles", "Press Option for New Window" } },
    -- Toolbelt
    { { "shift" }, "b", iTerm.showToolbelt, { "Toolbelt", "Show Toolbelt" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.actions, { "Toolbelt", "Actions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.capturedOutput, { "Toolbelt", "Captured Output" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.commandHistory, { "Toolbelt", "Command History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.jobs, { "Toolbelt", "Jobs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.notes, { "Toolbelt", "Notes" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.pasteHistory, { "Toolbelt", "Paste History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.profiles, { "Toolbelt", "Profiles" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.recentDirectories, { "Toolbelt", "Recent Directories" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.setDefaultWidth, { "Toolbelt", "Set Default Width" } },
    -- Window
    { nil, "m", iTerm.minimize, { "Window", "Minimize" } },
    { { "alt" }, "e", iTerm.exposAllTabs, { "Window", "Exposé all Tabs" } },
    { { "alt" }, "f", iTerm.passwordManager, { "Window", "Password Manager" } },
    { { "shift" }, "-", iTerm.pinHotkeyWindow, { "Window", "Pin Hotkey Window" } },
    { { "shift" }, "0", iTerm.zoom, { "Window", "Zoom" } },
    { { "shift" }, "[", iTerm.selectPreviousTab, { "Window", "Select Previous Tab" } },
    { { "shift" }, "]", iTerm.selectNextTab, { "Window", "Select Next Tab" } },
    { { "shift" }, "s", iTerm.saveWindowArrangement, { "Window", "Save Window Arrangement" } },
    { { "shift", "alt" }, "0", iTerm.zoomAll, { "Window", "Zoom All" } },
    { { "shift", "alt" }, "[", iTerm.moveTabLeft, { "Window", "Move Tab Left" } },
    { { "shift", "alt" }, "]", iTerm.moveTabRight, { "Window", "Move Tab Right" } },
    { { "shift", "alt" }, "s", iTerm.saveCurrentWindowAsArrangement, { "Window", "Save Current Window as Arrangement" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeSplitPanesEvenly, { "Window", "Arrange Split Panes Evenly" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeWindowsHorizontally, { "Window", "Arrange Windows Horizontally" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.bringAllToFront, { "Window", "Bring All To Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.editTabTitle, { "Window", "Edit Tab Title" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.editWindowTitle, { "Window", "Edit Window Title" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.mergeAllWindows, { "Window", "Merge All Windows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restoreWindowArrangementAsTabs, { "Window", "Restore Window Arrangement as Tabs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.restoreWindowArrangement, { "Window", "Restore Window Arrangement" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resizeSplitPane, { "Window", "Resize Split Pane" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.resizeWindow, { "Window", "Resize Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectSplitPane, { "Window", "Select Split Pane" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.selectTab, { "Window", "Select Tab" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.copyModeShortcuts, { "Help", "Copy Mode Shortcuts" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.GPURendererAvailability, { "Help", "GPU Renderer Availability" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.openSourceLicenses, { "Help", "Open Source Licenses" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", iTerm.ITerm2Help, { "Help", "iTerm2 Help" } },
})

return iTerm
