----------------------------------------------------------------------------------------------------
-- zoom.us application config
--
local Application = spoon.Ki.Application
local ZoomUs = Application:new("zoom.us")

-- zoom.us menu bar actions
ZoomUs.services = Application.createMenuItemChooserEvent({ "zoom.us", "Services" })
ZoomUs.preferences = Application.createMenuItemEvent({ "zoom.us", "Preferences..." })
ZoomUs.scheduleMeeting = Application.createMenuItemEvent({ "zoom.us", "Schedule Meeting..." })
ZoomUs.hideZoom = Application.createMenuItemEvent({ "zoom.us", "Hide Zoom" })
ZoomUs.joinMeeting = Application.createMenuItemEvent({ "zoom.us", "Join Meeting..." })
ZoomUs.quitZoom = Application.createMenuItemEvent({ "zoom.us", "Quit Zoom" })
ZoomUs.hideOthers = Application.createMenuItemEvent({ "zoom.us", "Hide Others" })
ZoomUs.screenShare = Application.createMenuItemEvent({ "zoom.us", "Screen Share..." })
ZoomUs.startMeeting = Application.createMenuItemEvent({ "zoom.us", "Start Meeting" })
ZoomUs.aboutZoom = Application.createMenuItemEvent({ "zoom.us", "About Zoom" })
ZoomUs.checkForUpdates = Application.createMenuItemEvent({ "zoom.us", "Check for Updates..." })
ZoomUs.showAll = Application.createMenuItemEvent({ "zoom.us", "Show All" })
ZoomUs.signOut = Application.createMenuItemEvent({ "zoom.us", "Sign Out" })
ZoomUs.switchAccount = Application.createMenuItemEvent({ "zoom.us", "Switch Account" })
ZoomUs.uninstallZoom = Application.createMenuItemEvent({ "zoom.us", "Uninstall Zoom" })
-- Meeting menu bar actions
ZoomUs.invite = Application.createMenuItemEvent({ "Meeting", "Invite" })
ZoomUs.muteAll = Application.createMenuItemEvent({ "Meeting", "Mute All" })
ZoomUs.unmuteAll = Application.createMenuItemEvent({ "Meeting", "Unmute All" })
ZoomUs.muteOrUnmuteAudio = Application.createMenuItemEvent({
    { "Meeting", "Unmute Audio" },
    { "Meeting", "Mute Audio" }
}, { isToggleable = true })
ZoomUs.enterOrExitMinimalView = Application.createMenuItemEvent({
    { "Meeting", "Exit Minimal View" },
    { "Meeting", "Enter Minimal View" }
}, { isToggleable = true })
ZoomUs.switchCamera = Application.createMenuItemEvent({ "Meeting", "Switch Camera" })
ZoomUs.record = Application.createMenuItemEvent({ "Meeting", "Record" })
ZoomUs.startOrStopShare = Application.createMenuItemEvent({
    { "Meeting", "Stop Share" },
    { "Meeting", "Start Share" }
}, { isToggleable = true })
ZoomUs.startOrStopVideo = Application.createMenuItemEvent({
    { "Meeting", "Stop Video" },
    { "Meeting", "Start Video" }
}, { isToggleable = true })
-- View menu bar actions
ZoomUs.showOrCloseManageParticipants = Application.createMenuItemEvent({
    { "View", "Close Manage Participants" },
    { "View", "Show Manage Participants" }
}, { isToggleable = true })
ZoomUs.showOrCloseChat = Application.createMenuItemEvent({
    { "View", "Close Chat" },
    { "View", "Show Chat" }
}, { isToggleable = true })
-- Edit menu bar actions
ZoomUs.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
ZoomUs.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
ZoomUs.find = Application.createMenuItemEvent({ "Edit", "Find" })
ZoomUs.jumpToChat = Application.createMenuItemEvent({ "Edit", "Jump to Chat" })
ZoomUs.screenshot = Application.createMenuItemEvent({ "Edit", "Screenshot" })
ZoomUs.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
ZoomUs.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
ZoomUs.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
ZoomUs.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
ZoomUs.pasteAndMatchStyle = Application.createMenuItemEvent({ "Edit", "Paste and Match Style" })
ZoomUs.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
ZoomUs.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
ZoomUs.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
-- Window menu bar actions
ZoomUs.moveFocusToNextWindow = Application.createMenuItemEvent({ "Window", "Move Focus to Next Window" })
ZoomUs.togglePortraitLandscape = Application.createMenuItemEvent({ "Window", "Toggle Portrait/Landscape" })
ZoomUs.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
ZoomUs.close = Application.createMenuItemEvent({ "Window", "Close" })
ZoomUs.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
ZoomUs.closeAll = Application.createMenuItemEvent({ "Window", "Close All" })
ZoomUs.alwaysShowMeetingControls = Application.createMenuItemEvent({ "Window", "Always Show Meeting Controls" })
ZoomUs.switchToNextTab = Application.createMenuItemEvent({ "Window", "Switch to Next Tab" })
ZoomUs.closeCurrentChatSession = Application.createMenuItemEvent({ "Window", "Close Current Chat Session" })
ZoomUs.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
ZoomUs.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
ZoomUs.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({
    "Window",
    "Move Window to Left Side of Screen"
})
ZoomUs.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({
    "Window",
    "Move Window to Right Side of Screen"
})
ZoomUs.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
ZoomUs.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help menu bar actions
ZoomUs.helpCenter = Application.createMenuItemEvent({ "Help", "Help Center" })
ZoomUs.reportProblem = Application.createMenuItemEvent({ "Help", "Report Problem..." })

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
