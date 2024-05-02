----------------------------------------------------------------------------------------------------
-- Arc application config
--
local Ki = spoon.Ki
local Website = Ki.Website
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem
local ToggleMenuItem = Application.ToggleMenuItem
local unmapped = Application.unmapped

-- Determine script path
local parentPathRegex = "^(.+)/.+$"
local spoonPath = hs.spoons.scriptPath()
local root = spoonPath:match(parentPathRegex):match(parentPathRegex)
local arcScriptPath = root.."/scripts/arc.applescript"
local arcTabsScriptPath = root.."/scripts/arc-tabs.applescript"

-- Implement method to support selection of tab titles in select mode
local function getChooserItems()
    local choices = {}
    local script = Application.renderScriptTemplate(arcTabsScriptPath)
    local isOk, spaceTabs, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Application.notifyError("Error fetching tab information", rawTable.NSLocalizedFailureReason)

        return {}
    end

    local windowIndex = 0

    for space, tabTitles in pairs(spaceTabs) do
        windowIndex = windowIndex + 1
        for tabIndex, tabTitle in pairs(tabTitles) do
            local lastOpenParenIndex = tabTitle:match("^.*()%(")
            local title = tabTitle:sub(1, lastOpenParenIndex - 1)
            local url = tabTitle:sub(lastOpenParenIndex - #tabTitle - 1):match("%((.-)%)") or ""

            table.insert(choices, {
                text = title,
                subText = "Space "..space.." Tab #"..tabIndex.." - "..url,
                tabIndex = tabIndex,
                space = space,
                imageURL = Website:getFaviconURL(url),
            })
        end
    end

    return choices
end

-- Helper method to run AppleScript actions available in `osascripts/arc.applescript`
local function runApplescriptAction(errorMessage, viewModel)
    local script = Application.renderScriptTemplate(arcScriptPath, viewModel)
    local isOk, _, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Application.notifyError(errorMessage, rawTable.NSLocalizedFailureReason)
    end
end

-- Action to focus a Arc tab or window
local function focus(app, choice)
    if choice then
        runApplescriptAction("Error focusing Arc tab", {
            action = "focus-tab",
            spaceName = choice.space,
            tabIndex = choice.tabIndex,
        })
    else
        Application.focus(app)
    end
end

-- Action to reload a Arc tab or window
local function reload(_, choice)
    local targetName = "window"
    local target = "active tab of front window"

    if choice then
        local targetFmt = [[tab %i of space "%s" of front window]]
        target = string.format(targetFmt, choice.tabIndex, choice.space)
        targetName = "tab"
    end

    runApplescriptAction("Error reloading Arc "..targetName, {
        action = "reload",
        target = target,
    })
end

-- Action to close a Arc tab or window
local function close(_, choice)
    local targetName = "window"
    local target = "active tab of front window"

    if choice then
        local targetFmt = [[tab %i of space "%s" of front window]]
        target = string.format(targetFmt, choice.tabIndex, choice.space)
        targetName = "tab"
    end

    runApplescriptAction("Error closing Arc "..targetName, {
        action = "close",
        target = target,
    })
end

-- Action to choose and focus an Arc space
local function focusSpace()
    local script = Application.renderScriptTemplate(arcScriptPath, {
        action = "get-spaces",
    })

    local isOk, spaces, rawTable = hs.osascript.applescript(script)

    if not isOk then
        Application.notifyError("Error getting spaces", rawTable.NSLocalizedFailureReason)
        return
    end

    local choices = {}
    for _, space in pairs(spaces) do
        table.insert(choices, {
            id = space,
            text = space,
        })
    end

    local function onChoice(choice)
        local focusScript = Application.renderScriptTemplate(arcScriptPath, {
            action = "focus-space",
            target = choice.id,
        })

        local focusIsOk, _, focusRawTable = hs.osascript.applescript(focusScript)
        if not focusIsOk then
            Application.notifyError("Error getting spaces", focusRawTable.NSLocalizedFailureReason)
        end
    end

    Application:showChooser(choices, onChoice, { placeholderText = "Spaces" })
end


-- Use a helper method to create various browser media actions
local function createMediaAction(command, errorMessage)
    return function (_, choice)
        local viewModel = {
            browser = "Arc",
            command = command,
            target = choice
              and "tab "..choice.tabIndex.." of window "..choice.windowId
              or "active tab of front window",
            ["is-chrome"] = true,
        }
        local script = Application.renderScriptTemplate("browser-media", viewModel)
        local isOk, _, rawTable = hs.osascript.applescript(script)

        if not isOk then
            Application.notifyError(errorMessage, rawTable.NSLocalizedFailureReason)
        end
    end
end
local toggleMedia = createMediaAction("toggle-play", "Error toggling media")

return Application {
    name = "Arc",
    getChooserItems = getChooserItems,
    shortcuts = {
        Arc = {
            { nil, nil, focus, "Activate" },
            { nil, "space", toggleMedia, "Play/Pause Media" },
            { nil, "r", reload, "Reload This Page" },
            { nil, "s", focusSpace, "Focus Arc Space" },
            { nil, ",", SelectMenuItem { "Arc", "Settings…" } },
            { nil, "h", SelectMenuItem { "Arc", "Hide Arc" } },
            { nil, "q", SelectMenuItem { "Arc", "Quit Arc" } },
            { { "alt" }, "h", SelectMenuItem { "Arc", "Hide Other Windows" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "About Arc" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Check for Updates…" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Gift Arc to a Friend" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Import from Another Browser…" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Privacy Policy" } },
            { unmapped, unmapped, ChooseMenuItem { "Arc", "Services" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Set as Default Browser" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Show All" } },
            { unmapped, unmapped, SelectMenuItem { "Arc", "Sign Out" } },
        },
        File = {
            { nil, "l", SelectMenuItem { "File", "Open Command Bar" } },
            { nil, "n", SelectMenuItem { "File", "New Window" } },
            { nil, "p", SelectMenuItem { "File", "Print" } },
            { nil, "t", SelectMenuItem { "File", "New Tab…" } },
            { nil, "w", close, "Close Tab/Window" },
            { { "ctrl" }, "n", SelectMenuItem { "File", "New Note" } },
            { { "shift" }, "2", SelectMenuItem { "File", "Capture…" } },
            { { "shift" }, "n", SelectMenuItem { "File", "New Incognito Window" } },
            { { "shift" }, "s", SelectMenuItem { "File", "Save Page As" } },
            { { "shift" }, "t", SelectMenuItem { "File", "Restore Last Closed Tab" } },
            { { "shift" }, "w", SelectMenuItem { "File", "Close Window" } },
            { { "shift", "ctrl" }, "e", SelectMenuItem { "File", "New Easel" } },
            { { "shift", "ctrl" }, "n", SelectMenuItem { "File", "Open Little Arc" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Capture Full Page" } },
            { unmapped, unmapped, SelectMenuItem { "File", "New Profile" } },
        },
        Edit = {
            { nil, "a", SelectMenuItem { "Edit", "Select All" } },
            { nil, "c", SelectMenuItem { "Edit", "Copy" } },
            { nil, "v", SelectMenuItem { "Edit", "Paste" } },
            { nil, "x", SelectMenuItem { "Edit", "Cut" } },
            { nil, "z", SelectMenuItem { "Edit", "Undo" } },
            { { "shift" }, "c", SelectMenuItem { "Edit", "Copy URL" } },
            { { "shift" }, "v", SelectMenuItem { "Edit", "Paste and Match Style" } },
            { { "shift" }, "z", SelectMenuItem { "Edit", "Redo" } },
            { { "shift", "alt" }, "c", SelectMenuItem { "Edit", "Copy URL as Markdown" } },
            { {  }, "e", SelectMenuItem { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Delete" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Find" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Format" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Paste URL as New Tab" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Speech" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Spelling and Grammar" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Start Dictation…" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Substitutions" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Transformations" } },
        },
        View = {
            { nil, "+", SelectMenuItem { "View", "Zoom In" } },
            { nil, "-", SelectMenuItem { "View", "Zoom Out" } },
            { nil, ".", SelectMenuItem { "View", "Stop Loading" } },
            { nil, "0", SelectMenuItem { "View", "Zoom to Actual Size" } },
            { nil, "r", SelectMenuItem { "View", "Refresh the Page" } },
            { { "alt" }, "r", ToggleMenuItem { "Enter Reader Mode (beta)", "Exit Reader Mode (beta)" } },
            { { "alt" }, "s", SelectMenuItem { "View", "Hide Sidebar" } },
            { { "ctrl" }, "f", ToggleMenuItem { "Enter Full Screen", "Exit Full Screen" } },
            { { "shift" }, "d", SelectMenuItem { "View", "Show Toolbar" } },
            { { "shift" }, "r", SelectMenuItem { "View", "Force Refresh the Page" } },
            { { "shift", "ctrl" }, "-", SelectMenuItem { "View", "Close this Split Pane" } },
            { { "shift", "ctrl" }, "=", SelectMenuItem { "View", "Add Split View" } },
            { unmapped, unmapped, ChooseMenuItem { "View", "Appearance" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Clear Cache and Refresh" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Clear Cookies and Refresh" } },
            { unmapped, unmapped, ChooseMenuItem { "View", "Developer" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Expand Current Split" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Separate Page from Split View" } },
        },
        Spaces = {
            { { "ctrl" }, "1", SelectMenuItem { "Spaces", "Japan Planning" } },
            { { "ctrl" }, "2", SelectMenuItem { "Spaces", "Philippines" } },
            { { "ctrl" }, "3", SelectMenuItem { "Spaces", "Work" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "Change Profile" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "Edit Theme…" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "New Space…" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "Next Space" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "Previous Space" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "Rename Space" } },
            { unmapped, unmapped, SelectMenuItem { "Spaces", "View Spaces…" } },
        },
        Tabs = {
            { nil, "d", SelectMenuItem { "Tabs", "Pin Tab" } },
            { nil, "t", SelectMenuItem { "Tabs", "New Tab…" } },
            { { "shift" }, "k", SelectMenuItem { "Tabs", "Clear Today" } },
            { unmapped, unmapped, SelectMenuItem { "Tabs", "New Folder…" } },
            { unmapped, unmapped, SelectMenuItem { "Tabs", "Next Tab" } },
            { unmapped, unmapped, SelectMenuItem { "Tabs", "Previous Tab" } },
            { unmapped, unmapped, SelectMenuItem { "Tabs", "Reset all tabs in this Space" } },
            { unmapped, unmapped, SelectMenuItem { "Tabs", "Reveal Tab in Sidebar" } },
        },
        Archive = {
            { nil, "[", SelectMenuItem { "Archive", "Go Back" } },
            { nil, "]", SelectMenuItem { "Archive", "Go Forward" } },
            { nil, "y", SelectMenuItem { "Archive", "View History" } },
            { unmapped, unmapped, SelectMenuItem { "Archive", "View Archive…" } },
        },
        Extensions = {
            { unmapped, unmapped, SelectMenuItem { "Extensions", "1Password – Password Manager" } },
            { unmapped, unmapped, SelectMenuItem { "Extensions", "Add Extension…" } },
            { unmapped, unmapped, SelectMenuItem { "Extensions", "Manage Extensions…" } },
            { unmapped, unmapped, SelectMenuItem { "Extensions", "Vimium" } },
            { unmapped, unmapped, SelectMenuItem { "Extensions", "uBlock Origin" } },
        },
        Window = {
            { nil, "m", SelectMenuItem { "Window", "Minimize Window" } },
            { { "alt" }, "m", SelectMenuItem { "Window", "Minimize All" } },
            { { "shift" }, "j", SelectMenuItem { "Window", "View Downloads…" } },
            { { "shift" }, "l", SelectMenuItem { "Window", "Open Library…" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Arrange in Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Bring All to Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Left Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Right Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Remove Window from Set" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Replace Tiled Window" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Stay On Top" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "USJ" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "View Easels & Notes…" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "View Media…" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom" } },
        },
        Help = {
            { unmapped, unmapped, SelectMenuItem { "Help", "Ask Question" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Getting Started" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Report Bug" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Restore Data" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Share Feedback" } },
            { unmapped, unmapped, ChooseMenuItem { "Help", "Troubleshooting" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Visit Help Center" } },
        },
    },
}
