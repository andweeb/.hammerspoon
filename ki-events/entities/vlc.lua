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

    function actions.openRecent(app)
        local menuItem = { "File", "Open Recent" }
        local menuItemList = Application.getMenuItemList(app, menuItem)
        local recentFileChoices = {}

        for _, item in pairs(menuItemList) do
            if item.AXTitle and #item.AXTitle > 0 then
                table.insert(recentFileChoices, {
                    text = item.AXTitle,
                })
            end
        end

        local function selectMenuItemAndFocus(choice)
            table.insert(menuItem, choice.text)
            app:selectMenuItem(menuItem)
            Application.focus(app)
        end

        Application.showSelectionModal(recentFileChoices, selectMenuItemAndFocus)
    end

    local shortcuts = {
        { nil, "space", actions.playPause, { "Playback", "Toggle Play" } },
        { nil, "o", actions.openFile, { "File", "Open File" } },
        { nil, "s", actions.stop, { "Playback", "Stop" } },
        { { "shift" }, "o", actions.openRecent, { "Playback", "Open Recent" } },
    }

    return Application:new("VLC", shortcuts)
end

return VLCEntity
