----------------------------------------------------------------------------------------------------
-- IINA application
--
local Application = spoon.Ki.Application
local IINA = Application:new("IINA")

IINA.about = Application.createMenuItemEvent("About IINA", { focusAfter = true })
IINA.audioTrack = Application.createMenuItemSelectionEvent({ "Audio", "Audio Track" })
IINA.audioDevice = Application.createMenuItemSelectionEvent({ "Audio", "Audio Device" })
IINA.chapters = Application.createMenuItemSelectionEvent({ "Playback", "Chapters" }, {
    focusBefore = true,
})
IINA.jumpToBeginning = Application.createMenuItemEvent("Jump to Beginning", { focusBefore = true })
IINA.jumpToTime = Application.createMenuItemEvent("Jump to...", { focusBefore = true })
IINA.open = Application.createMenuItemEvent("Open...", { focusBefore = true })
IINA.openURL = Application.createMenuItemEvent("Open URL...", { focusAfter = true })
IINA.openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" })
IINA.playbackHistory = Application.createMenuItemEvent("Playback History", { focusAfter = true })
IINA.playlist = Application.createMenuItemSelectionEvent({ "Playback", "Playlist" })
IINA.playNext = Application.createMenuItemEvent("Next Media", { focusBefore = true })
IINA.playPrevious = Application.createMenuItemEvent("Previous Media", { focusBefore = true })
IINA.preferences = Application.createMenuItemEvent("Preferences...", { focusAfter = true })
IINA.subtitle = Application.createMenuItemSelectionEvent({ "Subtitles", "Subtitle" })
IINA.togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
    isToggleable = true,
    focusBefore = true,
})

IINA:registerShortcuts({
    { nil, "a", IINA.about, { "IINA", "About IINA" } },
    { nil, "c", IINA.chapters, { "Playback", "Chapters" } },
    { nil, "j", IINA.jumpToTime, { "Playback", "Jump to..." } },
    { nil, "n", IINA.playNext, { "Playback", "Next Media" } },
    { nil, "o", IINA.open, { "File", "Open..." } },
    { nil, "p", IINA.playPrevious, { "Playback", "Previous Media" } },
    { nil, "s", IINA.subtitle, { "Subtitles", "Subtitle" } },
    { nil, ",", IINA.preferences, { "IINA", "Preferences..." } },
    { nil, "0", IINA.jumpToBeginning, { "Playback", "Jump To Beginning" } },
    { nil, "space", IINA.togglePlay, { "Playback", "Toggle Play" } },
    { { "cmd" }, "a", IINA.audioDevice, { "Audio", "Audio Device" } },
    { { "shift" }, "a", IINA.audioTrack, { "Audio", "Audio Track" } },
    { { "shift" }, "h", IINA.playbackHistory, { "File", "Playback History" } },
    { { "shift" }, "o", IINA.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "p", IINA.playlist, { "Playback", "Playlist" } },
    { { "cmd",  "shift" }, "o", IINA.openURL, { "File", "Open URL..." } },
})

return IINA
