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
IINA.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" }, { focusBefore = true })
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
IINA.speech = Application.createMenuItemChooserEvent({ "Edit", "Speech" }, { focusBefore = true })
IINA.transformations = Application.createMenuItemChooserEvent({ "Edit", "Transformations" }, { focusBefore = true })
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
IINA.aspectRatio = Application.createMenuItemChooserEvent({ "Video", "Aspect Ratio" }, { focusBefore = true })
IINA.crop = Application.createMenuItemChooserEvent({ "Video", "Crop" }, { focusBefore = true })
IINA.flip = Application.createMenuItemChooserEvent({ "Video", "Flip" }, { focusBefore = true })
IINA.rotation = Application.createMenuItemChooserEvent({ "Video", "Rotation" }, { focusBefore = true })
IINA.videoTrack = Application.createMenuItemChooserEvent({ "Video", "Video Track" }, { focusBefore = true })
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
IINA.audioDevice = Application.createMenuItemChooserEvent({ "Audio", "Audio Device" }, { focusBefore = true })
IINA.audioTrack = Application.createMenuItemChooserEvent({ "Audio", "Audio Track" }, { focusBefore = true })
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
IINA.encoding = Application.createMenuItemChooserEvent({ "Subtitles", "Encoding" }, { focusBefore = true })
IINA.secondSubtitle = Application.createMenuItemChooserEvent({ "Subtitles", "Second Subtitle" }, { focusBefore = true })
IINA.subtitle = Application.createMenuItemChooserEvent({ "Subtitles", "Subtitle" }, { focusBefore = true })
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

-- { nil, "o", FocusAndSelectMenuItem { "File", "Open…" } },
-- { nil, "w", FocusAndSelectMenuItem { "File", "Close" } },
-- { { "alt" }, "o", FocusAndSelectMenuItem { "File", "Open…" } },
-- { { "alt" }, "w", FocusAndSelectMenuItem { "File", "Close All" } },
-- { { "shift" }, "h", FocusAndSelectMenuItem { "File", "Playback History" } },
-- { { "shift" }, "o", FocusAndSelectMenuItem { "File", "Open Recent" } },
-- { { "cmd", "shift" }, "o", FocusAndSelectMenuItem { "File", "Open URL…" } },
-- { { "﴾unmapped﴿" }, "﴾unmapped﴿", FocusAndSelectMenuItem { "File", "Delete Current File" } },
-- { { "﴾unmapped﴿" }, "﴾unmapped﴿", FocusAndSelectMenuItem { "File", "Save Current Playlist…" } },
-- { { "﴾unmapped﴿" }, "﴾unmapped﴿", FocusAndSelectMenuItem { "File", "Share" } },

IINA:registerShortcuts({
    -- File
    { nil, "o", IINA.open, "Open…" },
    { nil, "w", IINA.close, "Close" },
    { { "alt" }, "o", IINA.open, "Open…" },
    { { "alt" }, "w", IINA.closeAll, "Close All" },
    { { "shift" }, "h", IINA.playbackHistory, "Playback History" },
    { { "shift" }, "o", IINA.openRecent, "Open Recent" },
    { { "cmd", "shift" }, "o", IINA.openURL, "Open URL…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deleteCurrentFile, "Delete Current File" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveCurrentPlaylist, "Save Current Playlist…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.share, "Share" },
    -- Playback
    { nil, "space", IINA.playPause, "Play/Pause" },
    { nil, ".", IINA.stopAndClearPlaylists, "Stop and Clear Playlists" },
    { nil, "[", IINA.speedDownBy05x, "Speed Down by 0.5x" },
    { nil, "\\", IINA.resetSpeed, "Reset Speed" },
    { nil, "]", IINA.speedUpBy20x, "Speed Up by 2.0x" },
    { nil, "0", IINA.jumpToBeginning, "Jump to Beginning" },
    { nil, "c", IINA.chapters, "Chapters" },
    { nil, "j", IINA.jumpTo, "Jump to…" },
    { nil, "l", IINA.ABLoop, "A-B Loop" },
    { nil, "n", IINA.nextMedia, "Next Media" },
    { nil, "p", IINA.previousMedia, "Previous Media" },
    { { "alt" }, "[", IINA.speedDownBy09x, "Speed Down by 0.9x" },
    { { "alt" }, "]", IINA.speedUpBy11x, "Speed Up by 1.1x" },
    { { "shift" }, "<", IINA.previousChapter, "Previous Chapter" },
    { { "shift" }, ">", IINA.nextChapter, "Next Chapter" },
    { { "shift" }, "c", IINA.showChaptersPanel, "Show Chapters Panel" },
    { { "shift" }, "l", IINA.fileLoop, "File Loop" },
    { { "shift" }, "p", IINA.playlist, "Playlist" },
    { { "cmd", "shift" }, "p", IINA.showPlaylistPanel, "Show Playlist Panel" },
    { { "cmd", "shift" }, "s", IINA.takeAScreenshot, "Take a Screenshot" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.goToScreenshotFolder, "Go to Screenshot Folder" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.nextFrame, "Next Frame" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.playlistLoop, "Playlist Loop" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.previousFrame, "Previous Frame" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.speed100x, "Speed: 1.00x" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepBackward5s, "Step Backward 5s" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepForward5s, "Step Forward 5s" },
    -- Video
    { nil, "-", IINA.smallerSize, "Smaller Size" },
    { nil, "0", IINA.halfSize, "Half Size" },
    { nil, "1", IINA.normalSize, "Normal Size" },
    { nil, "2", IINA.doubleSize, "Double Size" },
    { nil, "3", IINA.fitToScreen, "Fit to Screen" },
    { nil, "=", IINA.biggerSize, "Bigger Size" },
    { { "alt" }, "1", IINA.normalSizeRetina, "Normal Size (Retina)" },
    { { "alt" }, "m", IINA.musicMode, "Music Mode" },
    { { "ctrl" }, "f", IINA.enterFullScreen, "Enter Full Screen" },
    { { "ctrl" }, "p", IINA.enterPictureInPicture, "Enter Picture-in-Picture" },
    { { "ctrl" }, "t", IINA.floatOnTop, "Float on Top" },
    { { "ctrl" }, "v", IINA.cycleVideoTracks, "Cycle Video Tracks" },
    { { "shift" }, "f", IINA.videoFilters, "Video Filters…" },
    { { "shift" }, "v", IINA.showQuickSettingsPanel, "Show Quick Settings Panel" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deinterlace, "Deinterlace" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.delogo, "Delogo" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedVideoFilters, "Saved Video Filters" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.aspectRatio, "Aspect Ratio" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.crop, "Crop" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.flip, "Flip" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.rotation, "Rotation" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.videoTrack, "Video Track" },
    -- Audio
    { nil, "/", IINA.mute, "Mute" },
    { nil, "a", IINA.audioTrack, "Audio Track" },
    { { "cmd" }, "c", IINA.audioDevice, "Audio Device" },
    { { "ctrl" }, "a", IINA.cycleAudioTracks, "Cycle Audio Tracks" },
    { { "shift" }, "(", IINA.audioDelay05s, "Audio Delay + 0.5s" },
    { { "shift" }, ")", IINA.audioDelay05s, "Audio Delay - 0.5s" },
    { { "shift" }, "_", IINA.resetAudioDelay, "Reset Audio Delay" },
    { { "shift" }, "a", IINA.showQuickSettingsPanel, "Show Quick Settings Panel" },
    { { "shift" }, "g", IINA.audioFilters, "Audio Filters…" },
    { { "shift", "alt" }, "(", IINA.audioDelay01s, "Audio Delay + 0.1s" },
    { { "shift", "alt" }, ")", IINA.audioDelay01s, "Audio Delay - 0.1s" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.audioDelay000s, "Audio Delay: 0.00s" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedAudioFilters, "Saved Audio Filters" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus1, "Volume + 1" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus5, "Volume + 5" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus1, "Volume - 1" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus5, "Volume - 5" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volume100, "Volume: 100" },
    -- Subtitles
    { nil, "s", IINA.subtitle, "Subtitle" },
    { { "ctrl" }, "s", IINA.cycleSubtitles, "Cycle Subtitles" },
    { { "shift" }, "c", IINA.resetSubtitleDelay, "Reset Subtitle Delay" },
    { { "shift" }, "d", IINA.findOnlineSubtitles, "Find Online Subtitles…" },
    { { "shift" }, "s", IINA.showQuickSettingsPanel, "Show Quick Settings Panel" },
    { { "shift" }, "x", IINA.subtitleDelayPlus05s, "Subtitle Delay + 0.5s" },
    { { "shift" }, "z", IINA.subtitleDelayMinus05s, "Subtitle Delay - 0.5s" },
    { { "shift", "alt" }, "x", IINA.subtitleDelay01s, "Subtitle Delay + 0.1s" },
    { { "shift", "alt" }, "z", IINA.subtitleDelay01s, "Subtitle Delay - 0.1s" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.font, "Font…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.loadExternalSubtitle, "Load External Subtitle…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.resetSubtitleScale, "Reset Subtitle Scale" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveDownloadedSubtitle, "Save Downloaded Subtitle" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleDown, "Scale Down" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleUp, "Scale Up" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.subtitleDelay000s, "Subtitle Delay: 0.00s" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.encoding, "Encoding" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.secondSubtitle, "Second Subtitle" },
    -- Window
    { nil, "i", IINA.inspector, "Inspector" },
    { nil, "m", IINA.minimize, "Minimize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.enterFullScreen, "Enter Full Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.gitHub, "GitHub" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.IINAHelp, "IINA Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.website, "Website" },
})

return IINA
