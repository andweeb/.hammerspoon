----------------------------------------------------------------------------------------------------
-- IINA application
--
local Application = spoon.Ki.Application

local actions = {
    playNext = Application.createMenuItemEvent("Next Media"),
    playPrevious = Application.createMenuItemEvent("Previous Media"),
    togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
        isToggleable = true,
        focusBefore = true,
    }),
}

local shortcuts = {
    { nil, "space", actions.togglePlay, { "Playback", "Toggle Play" } },
    { nil, "p", actions.playPrevious, { "Playback", "Previous Media" } },
    { nil, "n", actions.playNext, { "Playback", "Next Media" } },
}

return Application:new("IINA", shortcuts)
