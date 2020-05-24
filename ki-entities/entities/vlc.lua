----------------------------------------------------------------------------------------------------
-- VLC application
--
local Application = spoon.Ki.Application
local VLC = Application:new("VLC")

local function executeApplescriptEvent(script)
    return function()
        return hs.osascript.applescript(script)
    end
end

VLC.openFile = Application.createMenuItemEvent("Open File...")
VLC.playPause = executeApplescriptEvent([[ tell application "VLC" to play ]])
VLC.stop = executeApplescriptEvent([[ tell application "VLC" to stop ]])

VLC:registerShortcuts({
    { nil, "space", VLC.playPause, { "Playback", "Toggle Play" } },
    { nil, "o", VLC.openFile, { "File", "Open File" } },
    { nil, "s", VLC.stop, { "Playback", "Stop" } },
})

return VLC
