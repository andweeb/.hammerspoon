----------------------------------------------------------------------------------------------------
-- VLC application config
--
local Application = spoon.Ki.Application
local VLC = Application:new("VLC")

-- File actions
VLC.openDisc = Application.createMenuItemEvent({ "File", "Open Disc..." })
VLC.openNetwork = Application.createMenuItemEvent({ "File", "Open Network..." })
VLC.openFile = Application.createMenuItemEvent({ "File", "Open File..." })
VLC.openCaptureDevice = Application.createMenuItemEvent({ "File", "Open Capture Device..." })
VLC.savePlaylist = Application.createMenuItemEvent({ "File", "Save Playlist..." })
VLC.closeWindow = Application.createMenuItemEvent({ "File", "Close Window" })
VLC.closeAll = Application.createMenuItemEvent({ "File", "Close All" })
VLC.advancedOpenFile = Application.createMenuItemEvent({ "File", "Advanced Open File..." })
VLC.revealInFinder = Application.createMenuItemEvent({ "File", "Reveal in Finder" })
VLC.convertStream = Application.createMenuItemEvent({ "File", "Convert / Stream..." })
VLC.openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" })
-- View actions
VLC.showAllTabs = Application.createMenuItemEvent({ "View", "Show All Tabs" })
VLC.showAudioEffectsButton = Application.createMenuItemEvent({ "View", "Show Audio Effects Button" })
VLC.showPreviousNextButtons = Application.createMenuItemEvent({ "View", "Show Previous & Next Buttons" })
VLC.showShuffleRepeatButtons = Application.createMenuItemEvent({ "View", "Show Shuffle & Repeat Buttons" })
VLC.showSidebar = Application.createMenuItemEvent({ "View", "Show Sidebar" })
VLC.showTabBar = Application.createMenuItemEvent({ "View", "Show Tab Bar" })
VLC.playlistTableColumns = Application.createMenuItemSelectionEvent({ "View", "Playlist Table Columns" })
-- Playback actions
VLC.stop = Application.createMenuItemEvent({ "Playback", "Stop" })
VLC.jumpToTime = Application.createMenuItemEvent({ "Playback", "Jump to Time" })
VLC.repeatAll = Application.createMenuItemEvent({ "Playback", "Repeat All" })
VLC.playPause = Application.createMenuItemEvent({ "Play", "Pause" }, { isToggleable = true })
VLC.random = Application.createMenuItemEvent({ "Playback", "Random" })
VLC.record = Application.createMenuItemEvent({ "Playback", "Record" })
VLC.ABLoop = Application.createMenuItemEvent({ "Playback", "A→B Loop" })
VLC.chapter = Application.createMenuItemEvent({ "Playback", "Chapter" })
VLC.next = Application.createMenuItemEvent({ "Playback", "Next" })
VLC.previous = Application.createMenuItemEvent({ "Playback", "Previous" })
VLC.program = Application.createMenuItemEvent({ "Playback", "Program" })
VLC.quitAfterPlayback = Application.createMenuItemEvent({ "Playback", "Quit after Playback" })
VLC.repeatOne = Application.createMenuItemEvent({ "Playback", "Repeat One" })
VLC.stepBackward = Application.createMenuItemEvent({ "Playback", "Step Backward" })
VLC.stepForward = Application.createMenuItemEvent({ "Playback", "Step Forward" })
VLC.title = Application.createMenuItemEvent({ "Playback", "Title" })
VLC.renderer = Application.createMenuItemSelectionEvent({ "Playback", "Renderer" })
-- Audio actions
VLC.decreaseVolume = Application.createMenuItemEvent({ "Audio", "Decrease Volume" })
VLC.increaseVolume = Application.createMenuItemEvent({ "Audio", "Increase Volume" })
VLC.mute = Application.createMenuItemEvent({ "Audio", "Mute" })
VLC.audioDevice = Application.createMenuItemSelectionEvent({ "Audio", "Audio Device" })
VLC.audioTrack = Application.createMenuItemSelectionEvent({ "Audio", "Audio Track" })
VLC.stereoAudioMode = Application.createMenuItemSelectionEvent({ "Audio", "Stereo audio mode" })
VLC.visualizations = Application.createMenuItemSelectionEvent({ "Audio", "Visualizations" })
-- Video actions
VLC.halfSize = Application.createMenuItemEvent({ "Video", "Half Size" })
VLC.normalSize = Application.createMenuItemEvent({ "Video", "Normal Size" })
VLC.doubleSize = Application.createMenuItemEvent({ "Video", "Double Size" })
VLC.fitToScreen = Application.createMenuItemEvent({ "Video", "Fit to Screen" })
VLC.fullscreen = Application.createMenuItemEvent({ "Video", "Fullscreen" })
VLC.snapshot = Application.createMenuItemEvent({ "Video", "Snapshot" })
VLC.floatOnTop = Application.createMenuItemEvent({ "Video", "Float on Top" })
VLC.aspectRatio = Application.createMenuItemSelectionEvent({ "Video", "Aspect ratio" })
VLC.crop = Application.createMenuItemSelectionEvent({ "Video", "Crop" })
VLC.deinterlaceMode = Application.createMenuItemSelectionEvent({ "Video", "Deinterlace mode" })
VLC.deinterlace = Application.createMenuItemSelectionEvent({ "Video", "Deinterlace" })
VLC.fullscreenVideoDevice = Application.createMenuItemSelectionEvent({ "Video", "Fullscreen Video Device" })
VLC.postProcessing = Application.createMenuItemSelectionEvent({ "Video", "Post processing" })
VLC.videoTrack = Application.createMenuItemSelectionEvent({ "Video", "Video Track" })
-- Subtitles actions
VLC.addSubtitleFile = Application.createMenuItemEvent({ "Subtitles", "Add Subtitle File..." })
VLC.backgroundColor = Application.createMenuItemSelectionEvent({ "Subtitles", "Background Color" })
VLC.outlineThickness = Application.createMenuItemSelectionEvent({ "Subtitles", "Outline Thickness" })
VLC.subtitleTrack = Application.createMenuItemSelectionEvent({ "Subtitles", "Subtitle Track" })
VLC.teletext = Application.createMenuItemSelectionEvent({ "Subtitles", "Teletext" })
VLC.textColor = Application.createMenuItemSelectionEvent({ "Subtitles", "Text Color" })
VLC.textSize = Application.createMenuItemSelectionEvent({ "Subtitles", "Text Size" })
-- Window actions
VLC.bookmarks = Application.createMenuItemEvent({ "Window", "Bookmarks..." })
VLC.videoEffects = Application.createMenuItemEvent({ "Window", "Video Effects..." })
VLC.mediaInformation = Application.createMenuItemEvent({ "Window", "Media Information..." })
VLC.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
VLC.mainWindow = Application.createMenuItemEvent({ "Window", "Main Window..." })
VLC.errorsAndWarnings = Application.createMenuItemEvent({ "Window", "Errors and Warnings..." })
VLC.playlist = Application.createMenuItemEvent({ "Window", "Playlist..." })
VLC.audioEffects = Application.createMenuItemEvent({ "Window", "Audio Effects..." })
VLC.messages = Application.createMenuItemEvent({ "Window", "Messages..." })
VLC.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
VLC.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
VLC.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
VLC.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
VLC.mergeAllWindows = Application.createMenuItemEvent({ "Window", "Merge All Windows" })
VLC.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
VLC.moveTabToNewWindow = Application.createMenuItemEvent({ "Window", "Move Tab to New Window" })
VLC.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
VLC.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
VLC.showNextTab = Application.createMenuItemEvent({ "Window", "Show Next Tab" })
VLC.showPreviousTab = Application.createMenuItemEvent({ "Window", "Show Previous Tab" })
VLC.trackSynchronization = Application.createMenuItemEvent({ "Window", "Track Synchronization" })
-- Help actions
VLC.license = Application.createMenuItemEvent({ "Help", "License" })
VLC.makeADonation = Application.createMenuItemEvent({ "Help", "Make a donation..." })
VLC.onlineDocumentation = Application.createMenuItemEvent({ "Help", "Online Documentation..." })
VLC.onlineForum = Application.createMenuItemEvent({ "Help", "Online Forum..." })
VLC.VLCMediaPlayerHelp = Application.createMenuItemEvent({ "Help", "VLC media player Help..." })
VLC.videoLANWebsite = Application.createMenuItemEvent({ "Help", "VideoLAN Website..." })

VLC:registerShortcuts({
    -- File
    { nil, "d", VLC.openDisc, { "File", "Open Disc..." } },
    { nil, "o", VLC.openFile, { "File", "Open File..." } },
    { nil, "r", VLC.openCaptureDevice, { "File", "Open Capture Device..." } },
    { nil, "w", VLC.closeWindow, { "File", "Close Window" } },
    { { "alt" }, "w", VLC.closeAll, { "File", "Close All" } },
    { { "shift" }, "n", VLC.openNetwork, { "File", "Open Network..." } },
    { { "shift" }, "r", VLC.revealInFinder, { "File", "Reveal in Finder" } },
    { { "shift" }, "s", VLC.convertStream, { "File", "Convert / Stream..." } },
    { { "shift" }, "o", VLC.openRecent, { "File", "Open Recent" } },
    { { "cmd", "shift" }, "o", VLC.advancedOpenFile, { "File", "Advanced Open File..." } },
    { { "cmd", "shift" }, "s", VLC.savePlaylist, { "File", "Save Playlist..." } },
    -- View
    { { "shift" }, "\\", VLC.showAllTabs, { "View", "Show All Tabs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showAudioEffectsButton, { "View", "Show Audio Effects Button" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showPreviousNextButtons, { "View", "Show Previous & Next Buttons" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showShuffleRepeatButtons, { "View", "Show Shuffle & Repeat Buttons" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showSidebar, { "View", "Show Sidebar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showTabBar, { "View", "Show Tab Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.playlistTableColumns, { "View", "Playlist Table Columns" } },
    -- Playback
    { nil, ".", VLC.stop, { "Playback", "Stop" } },
    { nil, "c", VLC.chapter, { "Playback", "Chapter" } },
    { nil, "j", VLC.jumpToTime, { "Playback", "Jump to Time" } },
    { nil, "l", VLC.repeatAll, { "Playback", "Repeat All" } },
    { nil, "n", VLC.next, { "Playback", "Next" } },
    { nil, "p", VLC.previous, { "Playback", "Previous" } },
    { nil, "z", VLC.random, { "Playback", "Random" } },
    { nil, "space", VLC.playPause, { "Playback", "Play" } },
    { { "alt" }, "r", VLC.record, { "Playback", "Record" } },
    { { "shift" }, "l", VLC.ABLoop, { "Playback", "A→B Loop" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.program, { "Playback", "Program" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.quitAfterPlayback, { "Playback", "Quit after Playback" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.repeatOne, { "Playback", "Repeat One" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stepBackward, { "Playback", "Step Backward" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stepForward, { "Playback", "Step Forward" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.title, { "Playback", "Title" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.renderer, { "Playback", "Renderer" } },
    -- Audio
    { nil, "m", VLC.mute, { "Audio", "Mute" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.decreaseVolume, { "Audio", "Decrease Volume" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.increaseVolume, { "Audio", "Increase Volume" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.audioDevice, { "Audio", "Audio Device" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.audioTrack, { "Audio", "Audio Track" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.stereoAudioMode, { "Audio", "Stereo audio mode" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.visualizations, { "Audio", "Visualizations" } },
    -- Video
    { nil, "0", VLC.halfSize, { "Video", "Half Size" } },
    { nil, "1", VLC.normalSize, { "Video", "Normal Size" } },
    { nil, "2", VLC.doubleSize, { "Video", "Double Size" } },
    { nil, "3", VLC.fitToScreen, { "Video", "Fit to Screen" } },
    { nil, "f", VLC.fullscreen, { "Video", "Fullscreen" } },
    { { "alt" }, "s", VLC.snapshot, { "Video", "Snapshot" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.floatOnTop, { "Video", "Float on Top" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.aspectRatio, { "Video", "Aspect ratio" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.crop, { "Video", "Crop" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.deinterlaceMode, { "Video", "Deinterlace mode" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.deinterlace, { "Video", "Deinterlace" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.fullscreenVideoDevice, { "Video", "Fullscreen Video Device" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.postProcessing, { "Video", "Post processing" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.videoTrack, { "Video", "Video Track" } },
    -- Subtitles
    { nil, "s", VLC.subtitleTrack, { "Subtitles", "Subtitle Track" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.addSubtitleFile, { "Subtitles", "Add Subtitle File..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.backgroundColor, { "Subtitles", "Background Color" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.outlineThickness, { "Subtitles", "Outline Thickness" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.teletext, { "Subtitles", "Teletext" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.textColor, { "Subtitles", "Text Color" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.textSize, { "Subtitles", "Text Size" } },
    -- Window
    { nil, "b", VLC.bookmarks, { "Window", "Bookmarks..." } },
    { nil, "e", VLC.videoEffects, { "Window", "Video Effects..." } },
    { nil, "i", VLC.mediaInformation, { "Window", "Media Information..." } },
    { { "alt" }, "c", VLC.mainWindow, { "Window", "Main Window..." } },
    { { "alt" }, "m", VLC.errorsAndWarnings, { "Window", "Errors and Warnings..." } },
    { { "alt" }, "p", VLC.playlist, { "Window", "Playlist..." } },
    { { "shift" }, "e", VLC.audioEffects, { "Window", "Audio Effects..." } },
    { { "shift" }, "m", VLC.messages, { "Window", "Messages..." } },
    { { "shift" }, "z", VLC.zoom, { "Window", "Zoom" } },
    { { "shift", "alt" }, "z", VLC.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.mergeAllWindows, { "Window", "Merge All Windows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.minimize, { "Window", "Minimize" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveTabToNewWindow, { "Window", "Move Tab to New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showNextTab, { "Window", "Show Next Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.showPreviousTab, { "Window", "Show Previous Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.trackSynchronization, { "Window", "Track Synchronization" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.license, { "Help", "License" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.makeADonation, { "Help", "Make a donation..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.onlineDocumentation, { "Help", "Online Documentation..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.onlineForum, { "Help", "Online Forum..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.VLCMediaPlayerHelp, { "Help", "VLC media player Help..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", VLC.videoLANWebsite, { "Help", "VideoLAN Website..." } },
})

return VLC
