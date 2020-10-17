----------------------------------------------------------------------------------------------------
-- zoom.us application config
--
local Application = spoon.Ki.Application
local ZoomUs = Application:new("zoom.us")

-- zoom.us menu bar actions
ZoomUs.services = Application:createChooseMenuItemAction({ "zoom.us", "Services" })
ZoomUs.preferences = Application:createMenuItemAction({ "zoom.us", "Preferences..." })
ZoomUs.scheduleMeeting = Application:createMenuItemAction({ "zoom.us", "Schedule Meeting..." })
ZoomUs.hideZoom = Application:createMenuItemAction({ "zoom.us", "Hide Zoom" })
ZoomUs.joinMeeting = Application:createMenuItemAction({ "zoom.us", "Join Meeting..." })
ZoomUs.quitZoom = Application:createMenuItemAction({ "zoom.us", "Quit Zoom" })
ZoomUs.hideOthers = Application:createMenuItemAction({ "zoom.us", "Hide Others" })
ZoomUs.screenShare = Application:createMenuItemAction({ "zoom.us", "Screen Share..." })
ZoomUs.startMeeting = Application:createMenuItemAction({ "zoom.us", "Start Meeting" })
ZoomUs.aboutZoom = Application:createMenuItemAction({ "zoom.us", "About Zoom" })
ZoomUs.checkForUpdates = Application:createMenuItemAction({ "zoom.us", "Check for Updates..." })
ZoomUs.showAll = Application:createMenuItemAction({ "zoom.us", "Show All" })
ZoomUs.signOut = Application:createMenuItemAction({ "zoom.us", "Sign Out" })
ZoomUs.switchAccount = Application:createMenuItemAction({ "zoom.us", "Switch Account" })
ZoomUs.uninstallZoom = Application:createMenuItemAction({ "zoom.us", "Uninstall Zoom" })
-- Meeting menu bar actions
ZoomUs.invite = Application:createMenuItemAction({ "Meeting", "Invite" })
ZoomUs.muteAll = Application:createMenuItemAction({ "Meeting", "Mute All" })
ZoomUs.unmuteAll = Application:createMenuItemAction({ "Meeting", "Unmute All" })
ZoomUs.muteOrUnmuteAudio = Application:createMenuItemAction({
    { "Meeting", "Unmute Audio" },
    { "Meeting", "Mute Audio" }
}, { isToggleable = true })
ZoomUs.enterOrExitMinimalView = Application:createMenuItemAction({
    { "Meeting", "Exit Minimal View" },
    { "Meeting", "Enter Minimal View" }
}, { isToggleable = true })
ZoomUs.switchCamera = Application:createMenuItemAction({ "Meeting", "Switch Camera" })
ZoomUs.record = Application:createMenuItemAction({ "Meeting", "Record" })
ZoomUs.startOrStopShare = Application:createMenuItemAction({
    { "Meeting", "Stop Share" },
    { "Meeting", "Start Share" }
}, { isToggleable = true })
ZoomUs.startOrStopVideo = Application:createMenuItemAction({
    { "Meeting", "Stop Video" },
    { "Meeting", "Start Video" }
}, { isToggleable = true })
-- View menu bar actions
ZoomUs.showOrCloseManageParticipants = Application:createMenuItemAction({
    { "View", "Close Manage Participants" },
    { "View", "Show Manage Participants" }
}, { isToggleable = true })
ZoomUs.showOrCloseChat = Application:createMenuItemAction({
    { "View", "Close Chat" },
    { "View", "Show Chat" }
}, { isToggleable = true })
-- Edit menu bar actions
ZoomUs.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
ZoomUs.copy = Application:createMenuItemAction({ "Edit", "Copy" })
ZoomUs.find = Application:createMenuItemAction({ "Edit", "Find" })
ZoomUs.jumpToChat = Application:createMenuItemAction({ "Edit", "Jump to Chat" })
ZoomUs.screenshot = Application:createMenuItemAction({ "Edit", "Screenshot" })
ZoomUs.paste = Application:createMenuItemAction({ "Edit", "Paste" })
ZoomUs.cut = Application:createMenuItemAction({ "Edit", "Cut" })
ZoomUs.undo = Application:createMenuItemAction({ "Edit", "Undo" })
ZoomUs.redo = Application:createMenuItemAction({ "Edit", "Redo" })
ZoomUs.pasteAndMatchStyle = Application:createMenuItemAction({ "Edit", "Paste and Match Style" })
ZoomUs.delete = Application:createMenuItemAction({ "Edit", "Delete" })
ZoomUs.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
ZoomUs.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
-- Window menu bar actions
ZoomUs.moveFocusToNextWindow = Application:createMenuItemAction({ "Window", "Move Focus to Next Window" })
ZoomUs.togglePortraitLandscape = Application:createMenuItemAction({ "Window", "Toggle Portrait/Landscape" })
ZoomUs.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
ZoomUs.close = Application:createMenuItemAction({ "Window", "Close" })
ZoomUs.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
ZoomUs.closeAll = Application:createMenuItemAction({ "Window", "Close All" })
ZoomUs.alwaysShowMeetingControls = Application:createMenuItemAction({ "Window", "Always Show Meeting Controls" })
ZoomUs.switchToNextTab = Application:createMenuItemAction({ "Window", "Switch to Next Tab" })
ZoomUs.closeCurrentChatSession = Application:createMenuItemAction({ "Window", "Close Current Chat Session" })
ZoomUs.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
ZoomUs.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
ZoomUs.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({
    "Window",
    "Move Window to Left Side of Screen"
})
ZoomUs.moveWindowToRightSideOfScreen = Application:createMenuItemAction({
    "Window",
    "Move Window to Right Side of Screen"
})
ZoomUs.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
ZoomUs.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help menu bar actions
ZoomUs.helpCenter = Application:createMenuItemAction({ "Help", "Help Center" })
ZoomUs.reportProblem = Application:createMenuItemAction({ "Help", "Report Problem..." })

ZoomUs:registerShortcuts({
    -- zoom.us
    { nil, ",", ZoomUs.preferences, "Preferences..." },
    { nil, "d", ZoomUs.scheduleMeeting, "Schedule Meeting..." },
    { nil, "h", ZoomUs.hideZoom, "Hide Zoom" },
    { nil, "j", ZoomUs.joinMeeting, "Join Meeting..." },
    { nil, "n", ZoomUs.startMeeting, "Start Meeting" },
    { nil, "q", ZoomUs.quitZoom, "Quit Zoom" },
    { { "alt" }, "h", ZoomUs.hideOthers, "Hide Others" },
    { { "ctrl" }, "s", ZoomUs.screenShare, "Screen Share..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.aboutZoom, "About Zoom" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.checkForUpdates, "Check for Updates..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.services, "Services" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.showAll, "Show All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.signOut, "Sign Out" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.switchAccount, "Switch Account" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.uninstallZoom, "Uninstall Zoom" },
    -- Meeting
    { nil, "c", ZoomUs.showOrCloseChat, "Show or Close Chat" },
    { nil, "i", ZoomUs.invite, "Invite" },
    { nil, "m", ZoomUs.muteOrUnmuteAudio, "Mute Audio or Unmute Audio" },
    { nil, "r", ZoomUs.record, "Record" },
    { nil, "s", ZoomUs.startOrStopShare, "Start or Stop Share" },
    { nil, "v", ZoomUs.startOrStopVideo, "Start or Stop Video" },
    { { "ctrl" }, "m", ZoomUs.muteAll, "Mute All" },
    { { "ctrl" }, "u", ZoomUs.unmuteAll, "Unmute All" },
    { { "shift" }, "m", ZoomUs.enterOrExitMinimalView, "Enter or Exit Minimal View" },
    { { "shift" }, "n", ZoomUs.switchCamera, "Switch Camera" },
    -- View
    { nil, "u", ZoomUs.showOrCloseManageParticipants, "Show or Close Manage Participants" },
    { { "shift" }, "h", ZoomUs.showOrCloseChat, "Show or Close Chat" },
    -- Edit
    { nil, "a", ZoomUs.selectAll, "Select All" },
    { nil, "f", ZoomUs.find, "Find" },
    { nil, "k", ZoomUs.jumpToChat, "Jump to Chat" },
    { nil, "t", ZoomUs.screenshot, "Screenshot" },
    { nil, "x", ZoomUs.cut, "Cut" },
    { nil, "z", ZoomUs.undo, "Undo" },
    { { "shift" }, "z", ZoomUs.redo, "Redo" },
    { { "shift", "alt" }, "v", ZoomUs.pasteAndMatchStyle, "Paste and Match Style" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.copy, "Copy" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.paste, "Paste" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.startDictation, "Start Dictation…" },
    -- Window
    { nil, "`", ZoomUs.moveFocusToNextWindow, "Move Focus to Next Window" },
    { nil, "l", ZoomUs.togglePortraitLandscape, "Toggle Portrait/Landscape" },
    { nil, "w", ZoomUs.close, "Close" },
    { { "alt" }, "m", ZoomUs.minimizeAll, "Minimize All" },
    { { "alt" }, "w", ZoomUs.closeAll, "Close All" },
    { { "ctrl" }, "\\", ZoomUs.alwaysShowMeetingControls, "Always Show Meeting Controls" },
    { { "ctrl" }, "t", ZoomUs.switchToNextTab, "Switch to Next Tab" },
    { { "ctrl" }, "w", ZoomUs.closeCurrentChatSession, "Close Current Chat Session" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.minimize, "Minimize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.helpCenter, "Help Center" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.reportProblem, "Report Problem..." },
})

return ZoomUs
