----------------------------------------------------------------------------------------------------
-- VLC application config
--
local Application = spoon.Ki.Application
local VLC = Application:new("VLC")

-- File actions
VLC.openDisc = Application:createMenuItemAction({ "File", "Open Disc..." })
VLC.openNetwork = Application:createMenuItemAction({ "File", "Open Network..." })
VLC.openFile = Application:createMenuItemAction({ "File", "Open File..." })
VLC.openCaptureDevice = Application:createMenuItemAction({ "File", "Open Capture Device..." })
VLC.savePlaylist = Application:createMenuItemAction({ "File", "Save Playlist..." })
VLC.closeWindow = Application:createMenuItemAction({ "File", "Close Window" })
VLC.closeAll = Application:createMenuItemAction({ "File", "Close All" })
VLC.advancedOpenFile = Application:createMenuItemAction({ "File", "Advanced Open File..." })
VLC.revealInFinder = Application:createMenuItemAction({ "File", "Reveal in Finder" })
VLC.convertStream = Application:createMenuItemAction({ "File", "Convert / Stream..." })
VLC.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
-- View actions
VLC.showAllTabs = Application:createMenuItemAction({ "View", "Show All Tabs" })
VLC.showAudioEffectsButton = Application:createMenuItemAction({ "View", "Show Audio Effects Button" })
VLC.showPreviousNextButtons = Application:createMenuItemAction({ "View", "Show Previous & Next Buttons" })
VLC.showShuffleRepeatButtons = Application:createMenuItemAction({ "View", "Show Shuffle & Repeat Buttons" })
VLC.showSidebar = Application:createMenuItemAction({ "View", "Show Sidebar" })
VLC.showTabBar = Application:createMenuItemAction({ "View", "Show Tab Bar" })
VLC.playlistTableColumns = Application:createChooseMenuItemAction({ "View", "Playlist Table Columns" })
-- Playback actions
VLC.stop = Application:createMenuItemAction({ "Playback", "Stop" })
VLC.jumpToTime = Application:createMenuItemAction({ "Playback", "Jump to Time" })
VLC.repeatAll = Application:createMenuItemAction({ "Playback", "Repeat All" })
VLC.playPause = Application:createMenuItemAction({ "Play", "Pause" }, { isToggleable = true })
VLC.random = Application:createMenuItemAction({ "Playback", "Random" })
VLC.record = Application:createMenuItemAction({ "Playback", "Record" })
VLC.ABLoop = Application:createMenuItemAction({ "Playback", "A→B Loop" })
VLC.chapter = Application:createMenuItemAction({ "Playback", "Chapter" })
VLC.next = Application:createMenuItemAction({ "Playback", "Next" })
VLC.previous = Application:createMenuItemAction({ "Playback", "Previous" })
VLC.program = Application:createMenuItemAction({ "Playback", "Program" })
VLC.quitAfterPlayback = Application:createMenuItemAction({ "Playback", "Quit after Playback" })
VLC.repeatOne = Application:createMenuItemAction({ "Playback", "Repeat One" })
VLC.stepBackward = Application:createMenuItemAction({ "Playback", "Step Backward" })
VLC.stepForward = Application:createMenuItemAction({ "Playback", "Step Forward" })
VLC.title = Application:createMenuItemAction({ "Playback", "Title" })
VLC.renderer = Application:createChooseMenuItemAction({ "Playback", "Renderer" })
-- Audio actions
VLC.decreaseVolume = Application:createMenuItemAction({ "Audio", "Decrease Volume" })
VLC.increaseVolume = Application:createMenuItemAction({ "Audio", "Increase Volume" })
VLC.mute = Application:createMenuItemAction({ "Audio", "Mute" })
VLC.audioDevice = Application:createChooseMenuItemAction({ "Audio", "Audio Device" })
VLC.audioTrack = Application:createChooseMenuItemAction({ "Audio", "Audio Track" })
VLC.stereoAudioMode = Application:createChooseMenuItemAction({ "Audio", "Stereo audio mode" })
VLC.visualizations = Application:createChooseMenuItemAction({ "Audio", "Visualizations" })
-- Video actions
VLC.halfSize = Application:createMenuItemAction({ "Video", "Half Size" })
VLC.normalSize = Application:createMenuItemAction({ "Video", "Normal Size" })
VLC.doubleSize = Application:createMenuItemAction({ "Video", "Double Size" })
VLC.fitToScreen = Application:createMenuItemAction({ "Video", "Fit to Screen" })
VLC.fullscreen = Application:createMenuItemAction({ "Video", "Fullscreen" })
VLC.snapshot = Application:createMenuItemAction({ "Video", "Snapshot" })
VLC.floatOnTop = Application:createMenuItemAction({ "Video", "Float on Top" })
VLC.aspectRatio = Application:createChooseMenuItemAction({ "Video", "Aspect ratio" })
VLC.crop = Application:createChooseMenuItemAction({ "Video", "Crop" })
VLC.deinterlaceMode = Application:createChooseMenuItemAction({ "Video", "Deinterlace mode" })
VLC.deinterlace = Application:createChooseMenuItemAction({ "Video", "Deinterlace" })
VLC.fullscreenVideoDevice = Application:createChooseMenuItemAction({ "Video", "Fullscreen Video Device" })
VLC.postProcessing = Application:createChooseMenuItemAction({ "Video", "Post processing" })
VLC.videoTrack = Application:createChooseMenuItemAction({ "Video", "Video Track" })
-- Subtitles actions
VLC.addSubtitleFile = Application:createMenuItemAction({ "Subtitles", "Add Subtitle File..." })
VLC.backgroundColor = Application:createChooseMenuItemAction({ "Subtitles", "Background Color" })
VLC.outlineThickness = Application:createChooseMenuItemAction({ "Subtitles", "Outline Thickness" })
VLC.subtitleTrack = Application:createChooseMenuItemAction({ "Subtitles", "Subtitle Track" })
VLC.teletext = Application:createChooseMenuItemAction({ "Subtitles", "Teletext" })
VLC.textColor = Application:createChooseMenuItemAction({ "Subtitles", "Text Color" })
VLC.textSize = Application:createChooseMenuItemAction({ "Subtitles", "Text Size" })
-- Window actions
VLC.bookmarks = Application:createMenuItemAction({ "Window", "Bookmarks..." })
VLC.videoEffects = Application:createMenuItemAction({ "Window", "Video Effects..." })
VLC.mediaInformation = Application:createMenuItemAction({ "Window", "Media Information..." })
VLC.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
VLC.mainWindow = Application:createMenuItemAction({ "Window", "Main Window..." })
VLC.errorsAndWarnings = Application:createMenuItemAction({ "Window", "Errors and Warnings..." })
VLC.playlist = Application:createMenuItemAction({ "Window", "Playlist..." })
VLC.audioEffects = Application:createMenuItemAction({ "Window", "Audio Effects..." })
VLC.messages = Application:createMenuItemAction({ "Window", "Messages..." })
VLC.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
VLC.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
VLC.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
VLC.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
VLC.mergeAllWindows = Application:createMenuItemAction({ "Window", "Merge All Windows" })
VLC.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
VLC.moveTabToNewWindow = Application:createMenuItemAction({ "Window", "Move Tab to New Window" })
VLC.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
VLC.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
VLC.showNextTab = Application:createMenuItemAction({ "Window", "Show Next Tab" })
VLC.showPreviousTab = Application:createMenuItemAction({ "Window", "Show Previous Tab" })
VLC.trackSynchronization = Application:createMenuItemAction({ "Window", "Track Synchronization" })
-- Help actions
VLC.license = Application:createMenuItemAction({ "Help", "License" })
VLC.makeADonation = Application:createMenuItemAction({ "Help", "Make a donation..." })
VLC.onlineDocumentation = Application:createMenuItemAction({ "Help", "Online Documentation..." })
VLC.onlineForum = Application:createMenuItemAction({ "Help", "Online Forum..." })
VLC.VLCMediaPlayerHelp = Application:createMenuItemAction({ "Help", "VLC media player Help..." })
VLC.videoLANWebsite = Application:createMenuItemAction({ "Help", "VideoLAN Website..." })

VLC:registerShortcuts({
    -- File
    { nil, "d", VLC.openDisc, "Open Disc..." },
    { nil, "o", VLC.openFile, "Open File..." },
    { nil, "r", VLC.openCaptureDevice, "Open Capture Device..." },
    { nil, "w", VLC.closeWindow, "Close Window" },
    { { "alt" }, "w", VLC.closeAll, "Close All" },
    { { "shift" }, "n", VLC.openNetwork, "Open Network..." },
    { { "shift" }, "r", VLC.revealInFinder, "Reveal in Finder" },
    { { "shift" }, "s", VLC.convertStream, "Convert / Stream..." },
    { { "shift" }, "o", VLC.openRecent, "Open Recent" },
    { { "cmd", "shift" }, "o", VLC.advancedOpenFile, "Advanced Open File..." },
    { { "cmd", "shift" }, "s", VLC.savePlaylist, "Save Playlist..." },
    -- View
    { { "shift" }, "\\", VLC.showAllTabs, "Show All Tabs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showAudioEffectsButton, "Show Audio Effects Button" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showPreviousNextButtons, "Show Previous & Next Buttons" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showShuffleRepeatButtons, "Show Shuffle & Repeat Buttons" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showSidebar, "Show Sidebar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showTabBar, "Show Tab Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.playlistTableColumns, "Playlist Table Columns" },
    -- Playback
    { nil, ".", VLC.stop, "Stop" },
    { nil, "c", VLC.chapter, "Chapter" },
    { nil, "j", VLC.jumpToTime, "Jump to Time" },
    { nil, "l", VLC.repeatAll, "Repeat All" },
    { nil, "n", VLC.next, "Next" },
    { nil, "p", VLC.previous, "Previous" },
    { nil, "z", VLC.random, "Random" },
    { nil, "space", VLC.playPause, "Play" },
    { { "alt" }, "r", VLC.record, "Record" },
    { { "shift" }, "l", VLC.ABLoop, "A→B Loop" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.program, "Program" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.quitAfterPlayback, "Quit after Playback" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.repeatOne, "Repeat One" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stepBackward, "Step Backward" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stepForward, "Step Forward" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.title, "Title" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.renderer, "Renderer" },
    -- Audio
    { nil, "m", VLC.mute, "Mute" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.decreaseVolume, "Decrease Volume" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.increaseVolume, "Increase Volume" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.audioDevice, "Audio Device" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.audioTrack, "Audio Track" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stereoAudioMode, "Stereo audio mode" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.visualizations, "Visualizations" },
    -- Video
    { nil, "0", VLC.halfSize, "Half Size" },
    { nil, "1", VLC.normalSize, "Normal Size" },
    { nil, "2", VLC.doubleSize, "Double Size" },
    { nil, "3", VLC.fitToScreen, "Fit to Screen" },
    { nil, "f", VLC.fullscreen, "Fullscreen" },
    { { "alt" }, "s", VLC.snapshot, "Snapshot" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.floatOnTop, "Float on Top" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.aspectRatio, "Aspect ratio" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.crop, "Crop" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.deinterlaceMode, "Deinterlace mode" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.deinterlace, "Deinterlace" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.fullscreenVideoDevice, "Fullscreen Video Device" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.postProcessing, "Post processing" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.videoTrack, "Video Track" },
    -- Subtitles
    { nil, "s", VLC.subtitleTrack, "Subtitle Track" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.addSubtitleFile, "Add Subtitle File..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.backgroundColor, "Background Color" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.outlineThickness, "Outline Thickness" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.teletext, "Teletext" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.textColor, "Text Color" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.textSize, "Text Size" },
    -- Window
    { nil, "b", VLC.bookmarks, "Bookmarks..." },
    { nil, "e", VLC.videoEffects, "Video Effects..." },
    { nil, "i", VLC.mediaInformation, "Media Information..." },
    { { "alt" }, "c", VLC.mainWindow, "Main Window..." },
    { { "alt" }, "m", VLC.errorsAndWarnings, "Errors and Warnings..." },
    { { "alt" }, "p", VLC.playlist, "Playlist..." },
    { { "shift" }, "e", VLC.audioEffects, "Audio Effects..." },
    { { "shift" }, "m", VLC.messages, "Messages..." },
    { { "shift" }, "z", VLC.zoom, "Zoom" },
    { { "shift", "alt" }, "z", VLC.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.mergeAllWindows, "Merge All Windows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.minimize, "Minimize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveTabToNewWindow, "Move Tab to New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showNextTab, "Show Next Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showPreviousTab, "Show Previous Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.trackSynchronization, "Track Synchronization" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.license, "License" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.makeADonation, "Make a donation..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.onlineDocumentation, "Online Documentation..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.onlineForum, "Online Forum..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.VLCMediaPlayerHelp, "VLC media player Help..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.videoLANWebsite, "VideoLAN Website..." },
})

return VLC
