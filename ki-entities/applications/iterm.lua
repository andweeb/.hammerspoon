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
iTerm.broadcastInput = Application.createMenuItemChooserEvent({ "Shell", "Broadcast Input" })
iTerm.print = Application.createMenuItemChooserEvent({ "Shell", "Print" })
iTerm.tmux = Application.createMenuItemChooserEvent({ "Shell", "tmux" })
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
iTerm.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
iTerm.marksAndAnnotations = Application.createMenuItemChooserEvent({ "Edit", "Marks and Annotations" })
iTerm.pasteSpecial = Application.createMenuItemChooserEvent({ "Edit", "Paste Special" })
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
iTerm.log = Application.createMenuItemChooserEvent({ "Session", "Log" })
iTerm.terminalState = Application.createMenuItemChooserEvent({ "Session", "Terminal State" })
-- Scripts actions
iTerm.manage = Application.createMenuItemChooserEvent({ "Scripts", "Manage" })
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
iTerm.resizeSplitPane = Application.createMenuItemChooserEvent({ "Window", "Resize Split Pane" })
iTerm.resizeWindow = Application.createMenuItemChooserEvent({ "Window", "Resize Window" })
iTerm.selectSplitPane = Application.createMenuItemChooserEvent({ "Window", "Select Split Pane" })
iTerm.selectTab = Application.createMenuItemChooserEvent({ "Window", "Select Tab" })
-- Help actions
iTerm.copyModeShortcuts = Application.createMenuItemEvent({ "Help", "Copy Mode Shortcuts" })
iTerm.GPURendererAvailability = Application.createMenuItemEvent({ "Help", "GPU Renderer Availability" })
iTerm.openSourceLicenses = Application.createMenuItemEvent({ "Help", "Open Source Licenses" })
iTerm.ITerm2Help = Application.createMenuItemEvent({ "Help", "iTerm2 Help" })

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
