----------------------------------------------------------------------------------------------------
-- IINA application config
--
local Application = spoon.Ki.Application
local IINA = Application:new("IINA")

local FocusAndChooseMenuItem = Application.FocusAndChooseMenuItem

-- File actions
IINA.open = Application:createMenuItemAction({ "File", "Open…" }, { focusBefore = true })
IINA.close = Application:createMenuItemAction({ "File", "Close" }, { focusBefore = true })
IINA.open = Application:createMenuItemAction({ "File", "Open…" }, { focusBefore = true })
IINA.closeAll = Application:createMenuItemAction({ "File", "Close All" }, { focusBefore = true })
IINA.playbackHistory = Application:createMenuItemAction({ "File", "Playback History" }, { focusBefore = true })
IINA.openURL = Application:createMenuItemAction({ "File", "Open URL…" }, { focusBefore = true })
IINA.deleteCurrentFile = Application:createMenuItemAction({ "File", "Delete Current File" }, { focusBefore = true })
IINA.saveCurrentPlaylist = Application:createMenuItemAction({ "File", "Save Current Playlist…" }, { focusBefore = true })
IINA.share = Application:createMenuItemAction({ "File", "Share" }, { focusBefore = true })
IINA.openRecent = FocusAndChooseMenuItem { "File", "Open Recent" }
-- Edit actions
IINA.selectAll = Application:createMenuItemAction({ "Edit", "Select All" }, { focusBefore = true })
IINA.copy = Application:createMenuItemAction({ "Edit", "Copy" }, { focusBefore = true })
IINA.paste = Application:createMenuItemAction({ "Edit", "Paste" }, { focusBefore = true })
IINA.cut = Application:createMenuItemAction({ "Edit", "Cut" }, { focusBefore = true })
IINA.undo = Application:createMenuItemAction({ "Edit", "Undo" }, { focusBefore = true })
IINA.redo = Application:createMenuItemAction({ "Edit", "Redo" }, { focusBefore = true })
IINA.delete = Application:createMenuItemAction({ "Edit", "Delete" }, { focusBefore = true })
IINA.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" }, { focusBefore = true })
IINA.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" }, { focusBefore = true })
IINA.speech = Application:createChooseMenuItemAction({ "Edit", "Speech" }, { focusBefore = true })
IINA.transformations = Application:createChooseMenuItemAction({ "Edit", "Transformations" }, { focusBefore = true })
-- Playback actions
IINA.stopAndClearPlaylists = Application:createMenuItemAction({ "Playback", "Stop and Clear Playlists" }, { focusBefore = true })
IINA.speedDownBy05x = Application:createMenuItemAction({ "Playback", "Speed Down by 0.5x" }, { focusBefore = true })
IINA.resetSpeed = Application:createMenuItemAction({ "Playback", "Reset Speed" }, { focusBefore = true })
IINA.speedUpBy20x = Application:createMenuItemAction({ "Playback", "Speed Up by 2.0x" }, { focusBefore = true })
IINA.jumpTo = Application:createMenuItemAction({ "Playback", "Jump to…" }, { focusBefore = true })
IINA.ABLoop = Application:createMenuItemAction({ "Playback", "A-B Loop" }, { focusBefore = true })
IINA.takeAScreenshot = Application:createMenuItemAction({ "Playback", "Take a Screenshot" }, { focusBefore = true })
IINA.speedDownBy09x = Application:createMenuItemAction({ "Playback", "Speed Down by 0.9x" }, { focusBefore = true })
IINA.speedUpBy11x = Application:createMenuItemAction({ "Playback", "Speed Up by 1.1x" }, { focusBefore = true })
IINA.previousChapter = Application:createMenuItemAction({ "Playback", "Previous Chapter" }, { focusBefore = true })
IINA.nextChapter = Application:createMenuItemAction({ "Playback", "Next Chapter" }, { focusBefore = true })
IINA.showChaptersPanel = Application:createMenuItemAction({ "Playback", "Show Chapters Panel" }, { focusBefore = true })
IINA.fileLoop = Application:createMenuItemAction({ "Playback", "File Loop" }, { focusBefore = true })
IINA.showPlaylistPanel = Application:createMenuItemAction({ "Playback", "Show Playlist Panel" }, { focusBefore = true })
IINA.chapters = Application:createMenuItemAction({ "Playback", "Chapters" }, { focusBefore = true })
IINA.goToScreenshotFolder = Application:createMenuItemAction({ "Playback", "Go to Screenshot Folder" }, { focusBefore = true })
IINA.jumpToBeginning = Application:createMenuItemAction({ "Playback", "Jump to Beginning" }, { focusBefore = true })
IINA.nextFrame = Application:createMenuItemAction({ "Playback", "Next Frame" }, { focusBefore = true })
IINA.nextMedia = Application:createMenuItemAction({ "Playback", "Next Media" }, { focusBefore = true })
IINA.playPause = Application:createMenuItemAction({ "Pause", "Resume" }, {
    isToggleable = true,
    focusBefore = true,
})
IINA.playlistLoop = Application:createMenuItemAction({ "Playback", "Playlist Loop" }, { focusBefore = true })
IINA.playlist = Application:createMenuItemAction({ "Playback", "Playlist" }, { focusBefore = true })
IINA.previousFrame = Application:createMenuItemAction({ "Playback", "Previous Frame" }, { focusBefore = true })
IINA.previousMedia = Application:createMenuItemAction({ "Playback", "Previous Media" }, { focusBefore = true })
IINA.speed100x = Application:createMenuItemAction({ "Playback", "Speed: 1.00x" }, { focusBefore = true })
IINA.stepBackward5s = Application:createMenuItemAction({ "Playback", "Step Backward 5s" }, { focusBefore = true })
IINA.stepForward5s = Application:createMenuItemAction({ "Playback", "Step Forward 5s" }, { focusBefore = true })
-- Video actions
IINA.smallerSize = Application:createMenuItemAction({ "Video", "Smaller Size" }, { focusBefore = true })
IINA.halfSize = Application:createMenuItemAction({ "Video", "Half Size" }, { focusBefore = true })
IINA.normalSize = Application:createMenuItemAction({ "Video", "Normal Size" }, { focusBefore = true })
IINA.doubleSize = Application:createMenuItemAction({ "Video", "Double Size" }, { focusBefore = true })
IINA.fitToScreen = Application:createMenuItemAction({ "Video", "Fit to Screen" }, { focusBefore = true })
IINA.biggerSize = Application:createMenuItemAction({ "Video", "Bigger Size" }, { focusBefore = true })
IINA.normalSizeRetina = Application:createMenuItemAction({ "Video", "Normal Size (Retina)" }, { focusBefore = true })
IINA.musicMode = Application:createMenuItemAction({ "Video", "Music Mode" }, { focusBefore = true })
IINA.enterFullScreen = Application:createMenuItemAction({ "Video", "Enter Full Screen" }, { focusBefore = true })
IINA.enterPictureInPicture = Application:createMenuItemAction({ "Video", "Enter Picture-in-Picture" }, { focusBefore = true })
IINA.floatOnTop = Application:createMenuItemAction({ "Video", "Float on Top" }, { focusBefore = true })
IINA.cycleVideoTracks = Application:createMenuItemAction({ "Video", "Cycle Video Tracks" }, { focusBefore = true })
IINA.videoFilters = Application:createMenuItemAction({ "Video", "Video Filters…" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application:createMenuItemAction({ "Video", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.deinterlace = Application:createMenuItemAction({ "Video", "Deinterlace" }, { focusBefore = true })
IINA.delogo = Application:createMenuItemAction({ "Video", "Delogo" }, { focusBefore = true })
IINA.savedVideoFilters = Application:createMenuItemAction({ "Video", "Saved Video Filters" }, { focusBefore = true })
IINA.aspectRatio = Application:createChooseMenuItemAction({ "Video", "Aspect Ratio" }, { focusBefore = true })
IINA.crop = Application:createChooseMenuItemAction({ "Video", "Crop" }, { focusBefore = true })
IINA.flip = Application:createChooseMenuItemAction({ "Video", "Flip" }, { focusBefore = true })
IINA.rotation = Application:createChooseMenuItemAction({ "Video", "Rotation" }, { focusBefore = true })
IINA.videoTrack = Application:createChooseMenuItemAction({ "Video", "Video Track" }, { focusBefore = true })
-- Audio actions
IINA.mute = Application:createMenuItemAction({ "Audio", "Mute" }, { focusBefore = true })
IINA.cycleAudioTracks = Application:createMenuItemAction({ "Audio", "Cycle Audio Tracks" }, { focusBefore = true })
IINA.audioDelay05s = Application:createMenuItemAction({ "Audio", "Audio Delay + 0.5s" }, { focusBefore = true })
IINA.audioDelay05s = Application:createMenuItemAction({ "Audio", "Audio Delay - 0.5s" }, { focusBefore = true })
IINA.resetAudioDelay = Application:createMenuItemAction({ "Audio", "Reset Audio Delay" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application:createMenuItemAction({ "Audio", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.audioFilters = Application:createMenuItemAction({ "Audio", "Audio Filters…" }, { focusBefore = true })
IINA.audioDelay01s = Application:createMenuItemAction({ "Audio", "Audio Delay + 0.1s" }, { focusBefore = true })
IINA.audioDelay01s = Application:createMenuItemAction({ "Audio", "Audio Delay - 0.1s" }, { focusBefore = true })
IINA.audioDelay000s = Application:createMenuItemAction({ "Audio", "Audio Delay: 0.00s" }, { focusBefore = true })
IINA.savedAudioFilters = Application:createMenuItemAction({ "Audio", "Saved Audio Filters" }, { focusBefore = true })
IINA.volumePlus1 = Application:createMenuItemAction({ "Audio", "Volume + 1" }, { focusBefore = true })
IINA.volumePlus5 = Application:createMenuItemAction({ "Audio", "Volume + 5" }, { focusBefore = true })
IINA.volumeMinus1 = Application:createMenuItemAction({ "Audio", "Volume - 1" }, { focusBefore = true })
IINA.volumeMinus5 = Application:createMenuItemAction({ "Audio", "Volume - 5" }, { focusBefore = true })
IINA.volume100 = Application:createMenuItemAction({ "Audio", "Volume: 100" }, { focusBefore = true })
IINA.audioDevice = Application:createChooseMenuItemAction({ "Audio", "Audio Device" }, { focusBefore = true })
IINA.audioTrack = Application:createChooseMenuItemAction({ "Audio", "Audio Track" }, { focusBefore = true })
-- Subtitles actions
IINA.cycleSubtitles = Application:createMenuItemAction({ "Subtitles", "Cycle Subtitles" }, { focusBefore = true })
IINA.resetSubtitleDelay = Application:createMenuItemAction({ "Subtitles", "Reset Subtitle Delay" }, { focusBefore = true })
IINA.findOnlineSubtitles = Application:createMenuItemAction({ "Subtitles", "Find Online Subtitles…" }, { focusBefore = true })
IINA.showQuickSettingsPanel = Application:createMenuItemAction({ "Subtitles", "Show Quick Settings Panel" }, { focusBefore = true })
IINA.subtitleDelayPlus05s = Application:createMenuItemAction({ "Subtitles", "Subtitle Delay + 0.5s" }, { focusBefore = true })
IINA.subtitleDelayMinus05s = Application:createMenuItemAction({ "Subtitles", "Subtitle Delay - 0.5s" }, { focusBefore = true })
IINA.subtitleDelay01s = Application:createMenuItemAction({ "Subtitles", "Subtitle Delay + 0.1s" }, { focusBefore = true })
IINA.subtitleDelay01s = Application:createMenuItemAction({ "Subtitles", "Subtitle Delay - 0.1s" }, { focusBefore = true })
IINA.font = Application:createMenuItemAction({ "Subtitles", "Font…" }, { focusBefore = true })
IINA.loadExternalSubtitle = Application:createMenuItemAction({ "Subtitles", "Load External Subtitle…" }, { focusBefore = true })
IINA.resetSubtitleScale = Application:createMenuItemAction({ "Subtitles", "Reset Subtitle Scale" }, { focusBefore = true })
IINA.saveDownloadedSubtitle = Application:createMenuItemAction({ "Subtitles", "Save Downloaded Subtitle" }, { focusBefore = true })
IINA.scaleDown = Application:createMenuItemAction({ "Subtitles", "Scale Down" }, { focusBefore = true })
IINA.scaleUp = Application:createMenuItemAction({ "Subtitles", "Scale Up" }, { focusBefore = true })
IINA.subtitleDelay000s = Application:createMenuItemAction({ "Subtitles", "Subtitle Delay: 0.00s" }, { focusBefore = true })
IINA.encoding = Application:createChooseMenuItemAction({ "Subtitles", "Encoding" }, { focusBefore = true })
IINA.secondSubtitle = Application:createChooseMenuItemAction({ "Subtitles", "Second Subtitle" }, { focusBefore = true })
IINA.subtitle = Application:createChooseMenuItemAction({ "Subtitles", "Subtitle" }, { focusBefore = true })
-- Window actions
IINA.inspector = Application:createMenuItemAction({ "Window", "Inspector" }, { focusBefore = true })
IINA.minimize = Application:createMenuItemAction({ "Window", "Minimize" }, { focusBefore = true })
IINA.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" }, { focusBefore = true })
IINA.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" }, { focusBefore = true })
IINA.enterFullScreen = Application:createMenuItemAction({ "Window", "Enter Full Screen" }, { focusBefore = true })
IINA.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" }, { focusBefore = true })
IINA.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" }, { focusBefore = true })
IINA.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" }, { focusBefore = true })
IINA.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" }, { focusBefore = true })
IINA.zoom = Application:createMenuItemAction({ "Window", "Zoom" }, { focusBefore = true })
-- Help actions
IINA.gitHub = Application:createMenuItemAction({ "Help", "GitHub" }, { focusBefore = true })
IINA.IINAHelp = Application:createMenuItemAction({ "Help", "IINA Help" }, { focusBefore = true })
IINA.website = Application:createMenuItemAction({ "Help", "Website" }, { focusBefore = true })

IINA:registerShortcuts({
    -- File
    { nil, "o", IINA.open },
    { nil, "w", IINA.close },
    { { "alt" }, "o", IINA.open },
    { { "alt" }, "w", IINA.closeAll },
    { { "shift" }, "h", IINA.playbackHistory },
    { { "shift" }, "o", IINA.openRecent },
    { { "cmd", "shift" }, "o", IINA.openURL },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deleteCurrentFile },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveCurrentPlaylist },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.share },
    -- Playback
    { nil, "space", IINA.playPause },
    { nil, ".", IINA.stopAndClearPlaylists },
    { nil, "[", IINA.speedDownBy05x },
    { nil, "\\", IINA.resetSpeed },
    { nil, "]", IINA.speedUpBy20x },
    { nil, "0", IINA.jumpToBeginning },
    { nil, "c", IINA.chapters },
    { nil, "j", IINA.jumpTo },
    { nil, "l", IINA.ABLoop },
    { nil, "n", IINA.nextMedia },
    { nil, "p", IINA.previousMedia },
    { { "alt" }, "[", IINA.speedDownBy09x },
    { { "alt" }, "]", IINA.speedUpBy11x },
    { { "shift" }, "<", IINA.previousChapter },
    { { "shift" }, ">", IINA.nextChapter },
    { { "shift" }, "c", IINA.showChaptersPanel },
    { { "shift" }, "l", IINA.fileLoop },
    { { "shift" }, "p", IINA.playlist },
    { { "cmd", "shift" }, "p", IINA.showPlaylistPanel },
    { { "cmd", "shift" }, "s", IINA.takeAScreenshot },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.goToScreenshotFolder },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.nextFrame },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.playlistLoop },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.previousFrame },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.speed100x },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepBackward5s },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.stepForward5s },
    -- Video
    { nil, "-", IINA.smallerSize },
    { nil, "0", IINA.halfSize },
    { nil, "1", IINA.normalSize },
    { nil, "2", IINA.doubleSize },
    { nil, "3", IINA.fitToScreen },
    { nil, "=", IINA.biggerSize },
    { { "alt" }, "1", IINA.normalSizeRetina },
    { { "alt" }, "m", IINA.musicMode },
    { { "ctrl" }, "f", IINA.enterFullScreen },
    { { "ctrl" }, "p", IINA.enterPictureInPicture },
    { { "ctrl" }, "t", IINA.floatOnTop },
    { { "ctrl" }, "v", IINA.cycleVideoTracks },
    { { "shift" }, "f", IINA.videoFilters },
    { { "shift" }, "v", IINA.showQuickSettingsPanel },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.deinterlace },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.delogo },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedVideoFilters },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.aspectRatio },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.crop },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.flip },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.rotation },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.videoTrack },
    -- Audio
    { nil, "/", IINA.mute },
    { nil, "a", IINA.audioTrack },
    { { "cmd" }, "c", IINA.audioDevice },
    { { "ctrl" }, "a", IINA.cycleAudioTracks },
    { { "shift" }, "(", IINA.audioDelay05s },
    { { "shift" }, ")", IINA.audioDelay05s },
    { { "shift" }, "_", IINA.resetAudioDelay },
    { { "shift" }, "a", IINA.showQuickSettingsPanel },
    { { "shift" }, "g", IINA.audioFilters },
    { { "shift", "alt" }, "(", IINA.audioDelay01s },
    { { "shift", "alt" }, ")", IINA.audioDelay01s },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.audioDelay000s },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.savedAudioFilters },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus1 },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumePlus5 },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus1 },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volumeMinus5 },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.volume100 },
    -- Subtitles
    { nil, "s", IINA.subtitle },
    { { "ctrl" }, "s", IINA.cycleSubtitles },
    { { "shift" }, "c", IINA.resetSubtitleDelay },
    { { "shift" }, "d", IINA.findOnlineSubtitles },
    { { "shift" }, "s", IINA.showQuickSettingsPanel },
    { { "shift" }, "x", IINA.subtitleDelayPlus05s },
    { { "shift" }, "z", IINA.subtitleDelayMinus05s },
    { { "shift", "alt" }, "x", IINA.subtitleDelay01s },
    { { "shift", "alt" }, "z", IINA.subtitleDelay01s },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.font },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.loadExternalSubtitle },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.resetSubtitleScale },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.saveDownloadedSubtitle },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleDown },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.scaleUp },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.subtitleDelay000s },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.encoding },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.secondSubtitle },
    -- Window
    { nil, "i", IINA.inspector },
    { nil, "m", IINA.minimize },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.arrangeInFront },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.bringAllToFront },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.enterFullScreen },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.minimizeAll },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToLeftSideOfScreen },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.moveWindowToRightSideOfScreen },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoomAll },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.zoom },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.gitHub },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.IINAHelp },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", IINA.website },
})

return IINA
