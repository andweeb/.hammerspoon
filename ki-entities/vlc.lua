local VLCEntity = {}

function VLCEntity:init(Application)
    local function executeApplescriptEvent(script)
        return function()
            return hs.osascript.applescript(script)
        end
    end
    local actions = {
        openFile = Application.createMenuItemEvent("Open File..."),
        playPause = executeApplescriptEvent([[ tell application "VLC" to play ]]),
        stop = executeApplescriptEvent([[ tell application "VLC" to stop ]]),
    }
    local shortcuts = {
        { nil, "space", actions.playPause, { "Playback", "Toggle Play" } },
        { nil, "o", actions.openFile, { "File", "Open File" } },
        { nil, "s", actions.stop, { "Playback", "Stop" } },
    }

    return Application:new("VLC", vlcShortcuts)
end

return VLCEntity
