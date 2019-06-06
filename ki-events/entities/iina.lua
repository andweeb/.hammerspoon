local IINAEntity = {}

function IINAEntity:init(Application)
    local actions = {
        playNext = Application.createMenuItemEvent("Next Media"),
        playPrevious = Application.createMenuItemEvent("Previous Media"),
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
            table.insert(menuItem, choice.text)
            app:selectMenuItem(menuItem)
            Application.focus(app)
        end

        Application.showSelectionModal(recentFileChoices, selectMenuItemAndFocus)
    end

    local shortcuts = {
        { nil, "space", actions.togglePlay, { "Playback", "Toggle Play" } },
        { nil, "p", actions.playPrevious, { "Playback", "Previous Media" } },
        { nil, "n", actions.playNext, { "Playback", "Next Media" } },
        { { "shift" }, "o", actions.openRecent, { "Playback", "Open Recent" } },
    }

    return Application:new("IINA", shortcuts)
end

return IINAEntity
