----------------------------------------------------------------------------------------------------
-- IINA application
--
local Application = spoon.Ki.Application

local actions = {
    about = Application.createMenuItemEvent("About IINA", { focusAfter = true }),
    audioTrack = Application.createMenuItemSelectionEvent({ "Audio", "Audio Track" }),
    audioDevice = Application.createMenuItemSelectionEvent({ "Audio", "Audio Device" }),
    chapters = Application.createMenuItemSelectionEvent({ "Playback", "Chapters" }, {
        focusBefore = true,
    }),
    jumpToBeginning = Application.createMenuItemEvent("Jump to Beginning", { focusBefore = true }),
    jumpToTime = Application.createMenuItemEvent("Jump to...", { focusBefore = true }),
    open = Application.createMenuItemEvent("Open...", { focusBefore = true }),
    openURL = Application.createMenuItemEvent("Open URL...", { focusAfter = true }),
    openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" }),
    playbackHistory = Application.createMenuItemEvent("Playback History", { focusAfter = true }),
    playlist = Application.createMenuItemSelectionEvent({ "Playback", "Playlist" }),
    playNext = Application.createMenuItemEvent("Next Media", { focusBefore = true }),
    playPrevious = Application.createMenuItemEvent("Previous Media", { focusBefore = true }),
    preferences = Application.createMenuItemEvent("Preferences...", { focusAfter = true }),
    subtitle = Application.createMenuItemSelectionEvent({ "Subtitles", "Subtitle" }),
    togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
        isToggleable = true,
        focusBefore = true,
    }),
}

local shortcuts = {
    { nil, "a", actions.about, { "IINA", "About IINA" } },
    { nil, "c", actions.chapters, { "Playback", "Chapters" } },
    { nil, "j", actions.jumpToTime, { "Playback", "Jump to..." } },
    { nil, "n", actions.playNext, { "Playback", "Next Media" } },
    { nil, "o", actions.open, { "File", "Open..." } },
    { nil, "p", actions.playPrevious, { "Playback", "Previous Media" } },
    { nil, "s", actions.subtitle, { "Subtitles", "Subtitle" } },
    { nil, ",", actions.preferences, { "IINA", "Preferences..." } },
    { nil, "0", actions.jumpToBeginning, { "Playback", "Jump To Beginning" } },
    { nil, "space", actions.togglePlay, { "Playback", "Toggle Play" } },
    { { "cmd" }, "a", actions.audioDevice, { "Audio", "Audio Device" } },
    { { "shift" }, "a", actions.audioTrack, { "Audio", "Audio Track" } },
    { { "shift" }, "h", actions.playbackHistory, { "File", "Playback History" } },
    { { "shift" }, "o", actions.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "p", actions.playlist, { "Playback", "Playlist" } },
    { { "cmd",  "shift" }, "o", actions.openURL, { "File", "Open URL..." } },
}

return Application:new("IINA", shortcuts)
