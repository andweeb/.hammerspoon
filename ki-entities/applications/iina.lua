----------------------------------------------------------------------------------------------------
-- IINA application config
--
local Application = spoon.Ki.Application
local IINA = Application:new("IINA")

-- File actions
IINA.open = Application.createMenuItemEvent({ "File", "Open…" }, { focusBefore = true })
IINA.close = Application.createMenuItemEvent({ "File", "Close" }, { focusBefore = true })
IINA.open = Application.createMenuItemEvent({ "File", "Open…" }, { focusBefore = true })
IINA.closeAll = Application.createMenuItemEvent({ "File", "Close All" }, { focusBefore = true })
IINA.playbackHistory = Application.createMenuItemEvent({ "File", "Playback History" }, { focusBefore = true })
IINA.openURL = Application.createMenuItemEvent({ "File", "Open URL…" }, { focusBefore = true })
IINA.deleteCurrentFile = Application.createMenuItemEvent({ "File", "Delete Current File" }, { focusBefore = true })
IINA.saveCurrentPlaylist = Application.createMenuItemEvent({ "File", "Save Current Playlist…" }, { focusBefore = true })
IINA.share = Application.createMenuItemEvent({ "File", "Share" }, { focusBefore = true })
IINA.openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" }, { focusBefore = true })
-- Edit actions
IINA.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" }, { focusBefore = true })
IINA.copy = Application.createMenuItemEvent({ "Edit", "Copy" }, { focusBefore = true })
IINA.paste = Application.createMenuItemEvent({ "Edit", "Paste" }, { focusBefore = true })
IINA.cut = Application.createMenuItemEvent({ "Edit", "Cut" }, { focusBefore = true })
IINA.undo = Application.createMenuItemEvent({ "Edit", "Undo" }, { focusBefore = true })
IINA.redo = Application.createMenuItemEvent({ "Edit", "Redo" }, { focusBefore = true })
IINA.delete = Application.createMenuItemEvent({ "Edit", "Delete" }, { focusBefore = true })
IINA.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" }, { focusBefore = true })
IINA.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" }, { focusBefore = true })
IINA.speech = Application.createMenuItemSelectionEvent({ "Edit", "Speech" }, { focusBefore = true })
IINA.transformations = Application.createMenuItemSelectionEvent({ "Edit", "Transformations" }, { focusBefore = true })
-- Playback actions
IINA.stopAndClearPlaylists = Application.createMenuItemEvent({ "Playback", "Stop and Clear Playlists" }, { focusBefore = true })
IINA.speedDownBy05x = Application.createMenuItemEvent({ "Playback", "Speed Down by 0.5x" }, { focusBefore = true })
IINA.resetSpeed = Application.createMenuItemEvent({ "Playback", "Reset Speed" }, { focusBefore = true })
IINA.speedUpBy20x = Application.createMenuItemEvent({ "Playback", "Speed Up by 2.0x" }, { focusBefore = true })
IINA.jumpTo = Application.createMenuItemEvent({ "Playback", "Jump to…" }, { focusBefore = true })
IINA.ABLoop = Application.createMenuItemEvent({ "Playback", "A-B Loop" }, { focusBefore = true })
IINA.takeAScreenshot = Application.createMenuItemEvent({ "Playback", "Take a Screenshot" }, { focusBefore = true })
IINA.speedDownBy09x = Application.createMenuItemEvent({ "Playback", "Speed Down by 0.9x" }, { focusBefore = true })
IINA.speedUpBy11x = Application.createMenuItemEvent({ "Playback", "Speed Up by 1.1x" }, { focusBefore = true })
IINA.previousChapter = Application.createMenuItemEvent({ "Playback", "Previous Chapter" }, { focusBefore = true })
IINA.nextChapter = Application.createMenuItemEvent({ "Playback", "Next Chapter" }, { focusBefore = true })
IINA.showChaptersPanel = Application.createMenuItemEvent({ "Playback", "Show Chapters Panel" }, { focusBefore = true })
IINA.fileLoop = Application.createMenuItemEvent({ "Playback", "File Loop" }, { focusBefore = true })
IINA.showPlaylistPanel = Application.createMenuItemEvent({ "Playback", "Show Playlist Panel" }, { focusBefore = true })
IINA.chapters = Application.createMenuItemEvent({ "Playback", "Chapters" }, { focusBefore = true })
IINA.goToScreenshotFolder = Application.createMenuItemEvent({ "Playback", "Go to Screenshot Folder" }, { focusBefore = true })
IINA.jumpToBeginning = Application.createMenuItemEvent({ "Playback", "Jump to Beginning" }, { focusBefore = true })
IINA.nextFrame = Application.createMenuItemEvent({ "Playback", "Next Frame" }, { focusBefore = true })
IINA.nextMedia = Application.createMenuItemEvent({ "Playback", "Next Media" }, { focusBefore = true })
IINA.playPause = Application.createMenuItemEvent({ "Pause", "Resume" }, {
    isToggleable = true,
    focusBefore = true,
})
IINA.playlistLoop = Application.createMenuItemEvent({ "Playback", "Playlist Loop" }, { focusBefore = true })
IINA.playlist = Application.createMenuItemEvent({ "Playback", "Playlist" }, { focusBefore = true })
IINA.previousFrame = Application.createMenuItemEvent({ "Playback", "Previous Frame" }, { focusBefore = true })
IINA.previousMedia = Application.createMenuItemEvent({ "Playback", "Previous Media" }, { focusBefore = true })
IINA.speed100x = Application.createMenuItemEvent({ "Playback", "Speed: 1.00x" }, { focusBefore = true })
IINA.stepBackward5s = Application.createMenuItemEvent({ "Playback", "Step Backward 5s" }, { focusBefore = true })
IINA.stepForward5s = Application.createMenuItemEvent({ "Playback", "Step Forward 5s" }, { focusBefore = true })
-- Video actions
IINA.smallerSize = Application.createMenuItemEvent({ "Video", "Smaller Size" }, { focusBefore = true })
IINA.halfSize = Application.createMenuItemEvent({ "Video", "Half Size" }, { focusBefore = true })
IINA.normalSize = Application.createMenuItemEvent({ "Video", "Normal Size" }, { focusBefore = true })
IINA.doubleSize = Application.createMenuItemEvent({ "Video", "Double Size" }, { focusBefore = true })
IINA.fitToScreen = Application.createMenuItemEvent({ "Video", "Fit to Screen" }, { focusBefore = true })
IINA.biggerSize = Application.createMenuItemEvent({ "Video", "Bigger Size" }, { focusBefore = true })
IINA.normalSizeRetina = Application.createMenuItemEvent({ "Video", "Normal Size (Retina)" }, { focusBefore = true })
IINA.musicMode = Application.createMenuItemEvent({ "Video", "Music Mode" }, { focusBefore = true })
IINA.enterFullScreen = Application.createMenuItemEvent({ "Video", "Enter Full Screen" }, { focusBefore = true })
IINA.enterPictureInPicture = Application.createMenuItemEvent({ "Video", "Enter Picture-in-Picture" }, { focusBefore = true })
IINA.floatOnTop = Application.createMenuItemEvent({ "Video", "Float on Top" }, { focusBefore = true })
IINA.cycleVideoTracks = Application.createMenuItemEvent({ "Video", "Cycle Video Tracks" }, { focusBefore = true })
IINA.videoFilters = Application.createMenuItemEvent({ "Video", "Video Filters…" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application.createMenuItemEvent({ "Video", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.deinterlace = Application.createMenuItemEvent({ "Video", "Deinterlace" }, { focusBefore = true })
IINA.delogo = Application.createMenuItemEvent({ "Video", "Delogo" }, { focusBefore = true })
IINA.savedVideoFilters = Application.createMenuItemEvent({ "Video", "Saved Video Filters" }, { focusBefore = true })
IINA.aspectRatio = Application.createMenuItemSelectionEvent({ "Video", "Aspect Ratio" }, { focusBefore = true })
IINA.crop = Application.createMenuItemSelectionEvent({ "Video", "Crop" }, { focusBefore = true })
IINA.flip = Application.createMenuItemSelectionEvent({ "Video", "Flip" }, { focusBefore = true })
IINA.rotation = Application.createMenuItemSelectionEvent({ "Video", "Rotation" }, { focusBefore = true })
IINA.videoTrack = Application.createMenuItemSelectionEvent({ "Video", "Video Track" }, { focusBefore = true })
-- Audio actions
IINA.mute = Application.createMenuItemEvent({ "Audio", "Mute" }, { focusBefore = true })
IINA.cycleAudioTracks = Application.createMenuItemEvent({ "Audio", "Cycle Audio Tracks" }, { focusBefore = true })
IINA.audioDelay05s = Application.createMenuItemEvent({ "Audio", "Audio Delay + 0.5s" }, { focusBefore = true })
IINA.audioDelay05s = Application.createMenuItemEvent({ "Audio", "Audio Delay - 0.5s" }, { focusBefore = true })
IINA.resetAudioDelay = Application.createMenuItemEvent({ "Audio", "Reset Audio Delay" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application.createMenuItemEvent({ "Audio", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.audioFilters = Application.createMenuItemEvent({ "Audio", "Audio Filters…" }, { focusBefore = true })
IINA.audioDelay01s = Application.createMenuItemEvent({ "Audio", "Audio Delay + 0.1s" }, { focusBefore = true })
IINA.audioDelay01s = Application.createMenuItemEvent({ "Audio", "Audio Delay - 0.1s" }, { focusBefore = true })
IINA.audioDelay000s = Application.createMenuItemEvent({ "Audio", "Audio Delay: 0.00s" }, { focusBefore = true })
IINA.savedAudioFilters = Application.createMenuItemEvent({ "Audio", "Saved Audio Filters" }, { focusBefore = true })
IINA.volumePlus1 = Application.createMenuItemEvent({ "Audio", "Volume + 1" }, { focusBefore = true })
IINA.volumePlus5 = Application.createMenuItemEvent({ "Audio", "Volume + 5" }, { focusBefore = true })
IINA.volumeMinus1 = Application.createMenuItemEvent({ "Audio", "Volume - 1" }, { focusBefore = true })
IINA.volumeMinus5 = Application.createMenuItemEvent({ "Audio", "Volume - 5" }, { focusBefore = true })
IINA.volume100 = Application.createMenuItemEvent({ "Audio", "Volume: 100" }, { focusBefore = true })
IINA.audioDevice = Application.createMenuItemSelectionEvent({ "Audio", "Audio Device" }, { focusBefore = true })
IINA.audioTrack = Application.createMenuItemSelectionEvent({ "Audio", "Audio Track" }, { focusBefore = true })
-- Subtitles actions
IINA.cycleSubtitles = Application.createMenuItemEvent({ "Subtitles", "Cycle Subtitles" }, { focusBefore = true })
IINA.resetSubtitleDelay = Application.createMenuItemEvent({ "Subtitles", "Reset Subtitle Delay" }, { focusBefore = true })
IINA.findOnlineSubtitles = Application.createMenuItemEvent({ "Subtitles", "Find Online Subtitles…" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application.createMenuItemEvent({ "Subtitles", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.subtitleDelayPlus05s = Application.createMenuItemEvent({ "Subtitles", "Subtitle Delay + 0.5s" }, { focusBefore = true })
IINA.subtitleDelayMinus05s = Application.createMenuItemEvent({ "Subtitles", "Subtitle Delay - 0.5s" }, { focusBefore = true })
IINA.subtitleDelay01s = Application.createMenuItemEvent({ "Subtitles", "Subtitle Delay + 0.1s" }, { focusBefore = true })
IINA.subtitleDelay01s = Application.createMenuItemEvent({ "Subtitles", "Subtitle Delay - 0.1s" }, { focusBefore = true })
IINA.font = Application.createMenuItemEvent({ "Subtitles", "Font…" }, { focusBefore = true })
IINA.loadExternalSubtitle = Application.createMenuItemEvent({ "Subtitles", "Load External Subtitle…" }, { focusBefore = true })
IINA.resetSubtitleScale = Application.createMenuItemEvent({ "Subtitles", "Reset Subtitle Scale" }, { focusBefore = true })
IINA.saveDownloadedSubtitle = Application.createMenuItemEvent({ "Subtitles", "Save Downloaded Subtitle" }, { focusBefore = true })
IINA.scaleDown = Application.createMenuItemEvent({ "Subtitles", "Scale Down" }, { focusBefore = true })
IINA.scaleUp = Application.createMenuItemEvent({ "Subtitles", "Scale Up" }, { focusBefore = true })
IINA.subtitleDelay000s = Application.createMenuItemEvent({ "Subtitles", "Subtitle Delay: 0.00s" }, { focusBefore = true })
IINA.encoding = Application.createMenuItemSelectionEvent({ "Subtitles", "Encoding" }, { focusBefore = true })
IINA.secondSubtitle = Application.createMenuItemSelectionEvent({ "Subtitles", "Second Subtitle" }, { focusBefore = true })
IINA.subtitle = Application.createMenuItemSelectionEvent({ "Subtitles", "Subtitle" }, { focusBefore = true })
-- Window actions
IINA.inspector = Application.createMenuItemEvent({ "Window", "Inspector" }, { focusBefore = true })
IINA.minimize = Application.createMenuItemEvent({ "Window", "Minimize" }, { focusBefore = true })
IINA.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" }, { focusBefore = true })
IINA.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" }, { focusBefore = true })
IINA.enterFullScreen = Application.createMenuItemEvent({ "Window", "Enter Full Screen" }, { focusBefore = true })
IINA.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" }, { focusBefore = true })
IINA.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" }, { focusBefore = true })
IINA.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" }, { focusBefore = true })
IINA.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" }, { focusBefore = true })
IINA.zoom = Application.createMenuItemEvent({ "Window", "Zoom" }, { focusBefore = true })
-- Help actions
IINA.gitHub = Application.createMenuItemEvent({ "Help", "GitHub" }, { focusBefore = true })
IINA.IINAHelp = Application.createMenuItemEvent({ "Help", "IINA Help" }, { focusBefore = true })
IINA.website = Application.createMenuItemEvent({ "Help", "Website" }, { focusBefore = true })

IINA:registerShortcuts({
    -- File
    { nil, "o", IINA.open, { "File", "Open…" } },
    { nil, "w", IINA.close, { "File", "Close" } },
    { { "alt" }, "o", IINA.open, { "File", "Open…" } },
    { { "alt" }, "w", IINA.closeAll, { "File", "Close All" } },
    { { "shift" }, "h", IINA.playbackHistory, { "File", "Playback History" } },
    { { "shift" }, "o", IINA.openRecent, { "File", "Open Recent" } },
    { { "cmd", "shift" }, "o", IINA.openURL, { "File", "Open URL…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deleteCurrentFile, { "File", "Delete Current File" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveCurrentPlaylist, { "File", "Save Current Playlist…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.share, { "File", "Share" } },
    -- Playback
    { nil, "space", IINA.playPause, { "Playback", "Pause" } },
    { nil, ".", IINA.stopAndClearPlaylists, { "Playback", "Stop and Clear Playlists" } },
    { nil, "[", IINA.speedDownBy05x, { "Playback", "Speed Down by 0.5x" } },
    { nil, "\\", IINA.resetSpeed, { "Playback", "Reset Speed" } },
    { nil, "]", IINA.speedUpBy20x, { "Playback", "Speed Up by 2.0x" } },
    { nil, "0", IINA.jumpToBeginning, { "Playback", "Jump to Beginning" } },
    { nil, "c", IINA.chapters, { "Playback", "Chapters" } },
    { nil, "j", IINA.jumpTo, { "Playback", "Jump to…" } },
    { nil, "l", IINA.ABLoop, { "Playback", "A-B Loop" } },
    { nil, "n", IINA.nextMedia, { "Playback", "Next Media" } },
    { nil, "p", IINA.previousMedia, { "Playback", "Previous Media" } },
    { { "alt" }, "[", IINA.speedDownBy09x, { "Playback", "Speed Down by 0.9x" } },
    { { "alt" }, "]", IINA.speedUpBy11x, { "Playback", "Speed Up by 1.1x" } },
    { { "shift" }, "<", IINA.previousChapter, { "Playback", "Previous Chapter" } },
    { { "shift" }, ">", IINA.nextChapter, { "Playback", "Next Chapter" } },
    { { "shift" }, "c", IINA.showChaptersPanel, { "Playback", "Show Chapters Panel" } },
    { { "shift" }, "l", IINA.fileLoop, { "Playback", "File Loop" } },
    { { "shift" }, "p", IINA.playlist, { "Playback", "Playlist" } },
    { { "cmd", "shift" }, "p", IINA.showPlaylistPanel, { "Playback", "Show Playlist Panel" } },
    { { "cmd", "shift" }, "s", IINA.takeAScreenshot, { "Playback", "Take a Screenshot" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.goToScreenshotFolder, { "Playback", "Go to Screenshot Folder" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.nextFrame, { "Playback", "Next Frame" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.playlistLoop, { "Playback", "Playlist Loop" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.previousFrame, { "Playback", "Previous Frame" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.speed100x, { "Playback", "Speed: 1.00x" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepBackward5s, { "Playback", "Step Backward 5s" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepForward5s, { "Playback", "Step Forward 5s" } },
    -- Video
    { nil, "-", IINA.smallerSize, { "Video", "Smaller Size" } },
    { nil, "0", IINA.halfSize, { "Video", "Half Size" } },
    { nil, "1", IINA.normalSize, { "Video", "Normal Size" } },
    { nil, "2", IINA.doubleSize, { "Video", "Double Size" } },
    { nil, "3", IINA.fitToScreen, { "Video", "Fit to Screen" } },
    { nil, "=", IINA.biggerSize, { "Video", "Bigger Size" } },
    { { "alt" }, "1", IINA.normalSizeRetina, { "Video", "Normal Size (Retina)" } },
    { { "alt" }, "m", IINA.musicMode, { "Video", "Music Mode" } },
    { { "ctrl" }, "f", IINA.enterFullScreen, { "Video", "Enter Full Screen" } },
    { { "ctrl" }, "p", IINA.enterPictureInPicture, { "Video", "Enter Picture-in-Picture" } },
    { { "ctrl" }, "t", IINA.floatOnTop, { "Video", "Float on Top" } },
    { { "ctrl" }, "v", IINA.cycleVideoTracks, { "Video", "Cycle Video Tracks" } },
    { { "shift" }, "f", IINA.videoFilters, { "Video", "Video Filters…" } },
    { { "shift" }, "v", IINA.showQuickSettingsPanel, { "Video", "Show Quick Settings Panel" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deinterlace, { "Video", "Deinterlace" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.delogo, { "Video", "Delogo" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedVideoFilters, { "Video", "Saved Video Filters" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.aspectRatio, { "Video", "Aspect Ratio" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.crop, { "Video", "Crop" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.flip, { "Video", "Flip" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.rotation, { "Video", "Rotation" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.videoTrack, { "Video", "Video Track" } },
    -- Audio
    { nil, "/", IINA.mute, { "Audio", "Mute" } },
    { nil, "a", IINA.audioTrack, { "Audio", "Audio Track" } },
    { { "cmd" }, "c", IINA.audioDevice, { "Audio", "Audio Device" } },
    { { "ctrl" }, "a", IINA.cycleAudioTracks, { "Audio", "Cycle Audio Tracks" } },
    { { "shift" }, "(", IINA.audioDelay05s, { "Audio", "Audio Delay + 0.5s" } },
    { { "shift" }, ")", IINA.audioDelay05s, { "Audio", "Audio Delay - 0.5s" } },
    { { "shift" }, "_", IINA.resetAudioDelay, { "Audio", "Reset Audio Delay" } },
    { { "shift" }, "a", IINA.showQuickSettingsPanel, { "Audio", "Show Quick Settings Panel" } },
    { { "shift" }, "g", IINA.audioFilters, { "Audio", "Audio Filters…" } },
    { { "shift", "alt" }, "(", IINA.audioDelay01s, { "Audio", "Audio Delay + 0.1s" } },
    { { "shift", "alt" }, ")", IINA.audioDelay01s, { "Audio", "Audio Delay - 0.1s" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.audioDelay000s, { "Audio", "Audio Delay: 0.00s" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedAudioFilters, { "Audio", "Saved Audio Filters" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus1, { "Audio", "Volume + 1" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus5, { "Audio", "Volume + 5" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus1, { "Audio", "Volume - 1" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus5, { "Audio", "Volume - 5" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volume100, { "Audio", "Volume: 100" } },
    -- Subtitles
    { nil, "s", IINA.subtitle, { "Subtitles", "Subtitle" } },
    { { "ctrl" }, "s", IINA.cycleSubtitles, { "Subtitles", "Cycle Subtitles" } },
    { { "shift" }, "c", IINA.resetSubtitleDelay, { "Subtitles", "Reset Subtitle Delay" } },
    { { "shift" }, "d", IINA.findOnlineSubtitles, { "Subtitles", "Find Online Subtitles…" } },
    { { "shift" }, "s", IINA.showQuickSettingsPanel, { "Subtitles", "Show Quick Settings Panel" } },
    { { "shift" }, "x", IINA.subtitleDelayPlus05s, { "Subtitles", "Subtitle Delay + 0.5s" } },
    { { "shift" }, "z", IINA.subtitleDelayMinus05s, { "Subtitles", "Subtitle Delay - 0.5s" } },
    { { "shift", "alt" }, "x", IINA.subtitleDelay01s, { "Subtitles", "Subtitle Delay + 0.1s" } },
    { { "shift", "alt" }, "z", IINA.subtitleDelay01s, { "Subtitles", "Subtitle Delay - 0.1s" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.font, { "Subtitles", "Font…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.loadExternalSubtitle, { "Subtitles", "Load External Subtitle…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.resetSubtitleScale, { "Subtitles", "Reset Subtitle Scale" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveDownloadedSubtitle, { "Subtitles", "Save Downloaded Subtitle" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleDown, { "Subtitles", "Scale Down" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleUp, { "Subtitles", "Scale Up" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.subtitleDelay000s, { "Subtitles", "Subtitle Delay: 0.00s" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.encoding, { "Subtitles", "Encoding" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.secondSubtitle, { "Subtitles", "Second Subtitle" } },
    -- Window
    { nil, "i", IINA.inspector, { "Window", "Inspector" } },
    { nil, "m", IINA.minimize, { "Window", "Minimize" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.enterFullScreen, { "Window", "Enter Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.gitHub, { "Help", "GitHub" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.IINAHelp, { "Help", "IINA Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.website, { "Help", "Website" } },
})

return IINA
