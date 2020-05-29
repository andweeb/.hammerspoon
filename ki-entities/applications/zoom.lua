----------------------------------------------------------------------------------------------------
-- zoom.us application
--
local Application = spoon.Ki.Application
local ZoomUs = Application:new("zoom.us")

-- Initialize menu item events
ZoomUs.alwaysShowMeetingControls = Application.createMenuItemEvent({ "Window", "Always Show Meeting Controls" })
ZoomUs.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
ZoomUs.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
ZoomUs.close = Application.createMenuItemEvent({ "Window", "Close" })
ZoomUs.closeAll = Application.createMenuItemEvent({ "Window", "Close All" })
ZoomUs.closeCurrentChatSession = Application.createMenuItemEvent({ "Window", "Close Current Chat Session" })
ZoomUs.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
ZoomUs.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
ZoomUs.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
ZoomUs.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
ZoomUs.enterFullScreen = Application.createMenuItemEvent({ "Meeting", "Enter Full Screen" })
ZoomUs.enterMinimalView = Application.createMenuItemEvent({ "Enter Minimal View", "Exit Minimal View" }, {
    isToggleable = true,
})
ZoomUs.helpCenter = Application.createMenuItemEvent({ "Help", "Help Center" })
ZoomUs.invite = Application.createMenuItemEvent({ "Meeting", "Invite" })
ZoomUs.keepOnTop = Application.createMenuItemEvent({ "Meeting", "Keep on Top" })
ZoomUs.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
ZoomUs.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
ZoomUs.moveFocusToNextWindow = Application.createMenuItemEvent({ "Window", "Move Focus to Next Window" })
ZoomUs.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({
    "Window",
    "Move Window to Left Side of Screen",
})
ZoomUs.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({
    "Window",
    "Move Window to Right Side of Screen",
})
ZoomUs.muteAudio = Application.createMenuItemEvent({ "Mute Audio", "Unmute Audio" }, { isToggleable = true })
ZoomUs.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
ZoomUs.pasteAndMatchStyle = Application.createMenuItemEvent({ "Edit", "Paste and Match Style" })
ZoomUs.record = Application.createMenuItemEvent({ "Meeting", "Record" })
ZoomUs.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
ZoomUs.reportProblem = Application.createMenuItemEvent({ "Help", "Report Problem..." })
ZoomUs.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
ZoomUs.showChat = Application.createMenuItemEvent({ "Show Chat", "Close Chat" }, { isToggleable = true })
ZoomUs.showManageParticipants = Application.createMenuItemEvent({
    "Show Manage Participants",
    "Close Manage Participants"
}, {
    isToggleable = true,
})
ZoomUs.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
ZoomUs.startShare = Application.createMenuItemEvent({ "Meeting", "Start Share" })
ZoomUs.stopVideo = Application.createMenuItemEvent({ "Meeting", "Stop Video" })
ZoomUs.switchCamera = Application.createMenuItemEvent({ "Meeting", "Switch Camera" })
ZoomUs.switchToNextTab = Application.createMenuItemEvent({ "Window", "Switch to Next Tab" })
ZoomUs.toggleGallerySpeakerView = Application.createMenuItemEvent({ "Gallery View", "Speaker View" }, {
    isToggleable = true,
})
ZoomUs.togglePortraitLandscape = Application.createMenuItemEvent({ "Window", "Toggle Portrait/Landscape" })
ZoomUs.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
ZoomUs.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
ZoomUs.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
ZoomUs.zoomMeeting = Application.createMenuItemEvent({ "Window", "Zoom Meeting" })

ZoomUs:registerShortcuts({
    -- Meeting
    { nil, "i", ZoomUs.invite, { "Meeting", "Invite" } },
    { nil, "m", ZoomUs.muteAudio, { "Meeting", "Mute or Umute Audio" } },
    { { "shift" }, "f", ZoomUs.enterFullScreen, { "Meeting", "Enter Full Screen" } },
    { { "shift" }, "m", ZoomUs.enterMinimalView, { "Meeting", "Enter or Exit Minimal View" } },
    { { "shift" }, "n", ZoomUs.switchCamera, { "Meeting", "Switch Camera" } },
    { { "shift" }, "r", ZoomUs.record, { "Meeting", "Record" } },
    { { "shift" }, "s", ZoomUs.startShare, { "Meeting", "Start Share" } },
    { { "shift" }, "v", ZoomUs.stopVideo, { "Meeting", "Stop Video" } },
    { { "shift" }, "w", ZoomUs.toggleGallerySpeakerView, { "Meeting", "Enter Gallery or Speaker View" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.keepOnTop, { "Meeting", "Keep on Top" } },
    -- View
    { nil, "u", ZoomUs.showManageParticipants, { "View", "Show or Close Manage Participants Pane" } },
    { { "shift" }, "h", ZoomUs.showChat, { "View", "Show or Close Chat" } },
    -- Edit
    { nil, "a", ZoomUs.selectAll, { "Edit", "Select All" } },
    { nil, "c", ZoomUs.copy, { "Edit", "Copy" } },
    { nil, "v", ZoomUs.paste, { "Edit", "Paste" } },
    { nil, "x", ZoomUs.cut, { "Edit", "Cut" } },
    { nil, "z", ZoomUs.undo, { "Edit", "Undo" } },
    { { "shift" }, "z", ZoomUs.redo, { "Edit", "Redo" } },
    { { "shift", "alt" }, "v", ZoomUs.pasteAndMatchStyle, { "Edit", "Paste and Match Style" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.startDictation, { "Edit", "Start Dictation…" } },
    -- Window
    { nil, "`", ZoomUs.moveFocusToNextWindow, { "Window", "Move Focus to Next Window" } },
    { nil, "l", ZoomUs.togglePortraitLandscape, { "Window", "Toggle Portrait/Landscape" } },
    { nil, "w", ZoomUs.close, { "Window", "Close" } },
    { { "alt" }, "m", ZoomUs.minimizeAll, { "Window", "Minimize All" } },
    { { "alt" }, "w", ZoomUs.closeAll, { "Window", "Close All" } },
    { { "ctrl" }, "\\", ZoomUs.alwaysShowMeetingControls, { "Window", "Always Show Meeting Controls" } },
    { { "ctrl" }, "t", ZoomUs.switchToNextTab, { "Window", "Switch to Next Tab" } },
    { { "ctrl" }, "w", ZoomUs.closeCurrentChatSession, { "Window", "Close Current Chat Session" } },
    { { "shift" }, "m", ZoomUs.minimize, { "Window", "Minimize" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.zoomMeeting, { "Window", "Zoom Meeting" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.helpCenter, { "Help", "Help Center" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ZoomUs.reportProblem, { "Help", "Report Problem..." } },
})

return ZoomUs
