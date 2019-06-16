local IINAEntity = {}

function IINAEntity:init(Application)
    self.Application = Application

    local actions = {
        open = Application.createMenuItemEvent("Open...", { focusAfter = true }),
        openURL = Application.createMenuItemEvent("Open URL...", { focusAfter = true }),
        playNext = Application.createMenuItemEvent("Next Media"),
        playPrevious = Application.createMenuItemEvent("Previous Media"),
        playbackHistory = Application.createMenuItemEvent("Playback History", {
            focusAfter = true,
        }),
        togglePlay = Application.createMenuItemEvent({ "Pause", "Resume" }, {
            isToggleable = true,
            focusBefore = true,
        }),
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
            if choice then
                table.insert(menuItem, choice.text)
                app:selectMenuItem(menuItem)
                Application.focus(app)
            end
        end

        Application.showSelectionModal(recentFileChoices, selectMenuItemAndFocus)
    end

    local shortcuts = {
        { nil, "space", actions.togglePlay, { "Playback", "Toggle Play" } },
        { nil, "h", actions.playbackHistory, { "File", "Playback History" } },
        { nil, "p", actions.playPrevious, { "Playback", "Previous Media" } },
        { nil, "n", actions.playNext, { "Playback", "Next Media" } },
        { nil, "o", actions.open, { "File", "Open..." } },
        { nil, "y", actions.playbackHistory, { "File", "Playback History" } },
        { { "shift" }, "o", actions.openRecent, { "File", "Open Recent" } },
        { { "cmd", "shift" }, "o", actions.openURL, { "File", "Open URL..." } },
    }

    return Application:new("IINA", shortcuts)
end

return IINAEntity
