----------------------------------------------------------------------------------------------------
-- Zoom application
--
local Application = spoon.Ki.Application
local Zoom = Application:new("zoom.us")

-- Initialize menu item events
local viewToggles = { "Speaker View", "Gallery View" }
local minimalViewToggles = { "Enter Minimal View", "Exit Minimal View" }
local focusBeforeToggleableEvent = { isToggleable = true, focusBefore = true }
Zoom.keepOnTop = Application.createMenuItemEvent("Keep on Top", { focusBefore = true })
Zoom.toggleVideo = Application.createMenuItemEvent({ "Start Video", "Stop Video" }, focusBeforeToggleableEvent)
Zoom.toggleMinimalView = Application.createMenuItemEvent(minimalViewToggles, focusBeforeToggleableEvent)
Zoom.toggleSpeakerGalleryView = Application.createMenuItemEvent(viewToggles, focusBeforeToggleableEvent)
Zoom.toggleMuteAudio = Application.createMenuItemEvent({ "Mute Audio", "Unmute Audio" }, focusBeforeToggleableEvent)

Zoom:registerShortcuts({
    { nil, "k", Zoom.keepOnTop, { "Meeting", "Keep on Top" } },
    { nil, "m", Zoom.toggleMuteAudio, { "Meeting", "Mute or Unmute Audio" } },
    { nil, "v", Zoom.toggleVideo, { "Meeting", "Start or Stop Video" } },
    { nil, "w", Zoom.toggleSpeakerGalleryView, { "Meeting", "Enter Speaker or Gallery View" } },
    { { "shift" }, "m", Zoom.toggleMinimalView, { "Meeting", "Enter or Exit Minimal View" } },
})

return Zoom
