----------------------------------------------------------------------------------------------------
-- TablePlus application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem
local unmapped = Application.unmapped

local dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"
local path = dataPath:gsub("%\\", "")
local absoluteDataPath = hs.fs.pathToAbsolute(path)

-- Validate the data path
local function validateDataPath()
    local success, value = pcall(function()
        return hs.fs.attributes(absoluteDataPath)
    end)

    if not success then
        Application.notifyError("TablePlus data path not found", value or "")
    end
end

-- Asynchronously read plist file as json
local function readPlist(name, callback)
    local json = ""
    local filename = absoluteDataPath.."/"..name..".plist"
    local arguments = { "-convert", "json", "-o", "-", filename }

    local taskDoneCallback = function()
        local success, data = pcall(function() return hs.json.decode(json) end)

        if not success or not data then
            return Application.notifyError("Unable to initialize TablePlus "..name, "")
        end

        callback(data)
    end
    local streamingCallback = function(_, stdout)
        if stdout then
            json = json..stdout
        end

        return true
    end

    hs.task
        .new("/usr/bin/plutil", taskDoneCallback, streamingCallback, arguments)
        :start()
end

-- Override selection items method to be able to select a TablePlus connection
local connections = {}
local function getChooserItems()
    local choices = {}

    -- Initialize connection groups by group id and connections list
    for _, connection in pairs(connections) do
        local text = connection.ConnectionName.." ["..connection.Enviroment.."]"
        local databaseInfoText = connection.DatabaseHost.." : "..connection.DatabaseName
        local subText = hs.styledtext.new(databaseInfoText, {
            color = { hex = connection.statusColor, alpha = 1 },
            font = { name = "Menlo", size = 10 },
        })

        table.insert(choices, {
            text = text,
            subText = subText,
            id = connection.ID,
        })
    end

    return choices
end

-- Activate TablePlus or open a specific connection id
local Open = Action {
    name = "Open Application or Database Connection",
    action = function(app, choice)
        app:activate()

        if choice then
            local isOk = hs.urlevent.openURL("tableplus://?id="..choice.id)

            if not isOk then
                Application.notifyError("Error opening the connection")
            end
        end
    end,
}

-- Validate data path and initialize connections
validateDataPath()
readPlist("Connections", function(conns) connections = conns end)

return Application {
    name = "TablePlus",
    shortcuts = {
        TablePlus = {
            { nil, nil, Open, "Open Application or Database Connection" },
            { nil, ",", SelectMenuItem { "TablePlus", "Preferences…" } },
            { nil, "h", SelectMenuItem { "TablePlus", "Hide TablePlus" } },
            { nil, "q", SelectMenuItem { "TablePlus", "Quit TablePlus" } },
            { { "alt" }, "h", SelectMenuItem { "TablePlus", "Hide Others" } },
            { { "alt" }, "q", SelectMenuItem { "TablePlus", "Quit and Keep Windows" } },
            { unmapped, unmapped, SelectMenuItem { "TablePlus", "About TablePlus" } },
            { unmapped, unmapped, SelectMenuItem { "TablePlus", "Check for Updates..." } },
            { unmapped, unmapped, SelectMenuItem { "TablePlus", "Register license..." } },
            { unmapped, unmapped, ChooseMenuItem { "TablePlus", "Services" } },
            { unmapped, unmapped, SelectMenuItem { "TablePlus", "Show All" } },
        },
        File = {
            { nil, "i", ChooseMenuItem { "File", "Import" } },
            { nil, "n", SelectMenuItem { "File", "New Workspace" } },
            { nil, "o", SelectMenuItem { "File", "Open..." } },
            { { "shift" }, "o", ChooseMenuItem { "File", "Open Recent" } },
            { { "shift" }, "s", SelectMenuItem { "File", "Save As..." } },
            { { "cmd", "shift" }, "o", SelectMenuItem { "File", "New SQL Viewer" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Backup..." } },
            { unmapped, unmapped, SelectMenuItem { "File", "Close All" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Close" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Export..." } },
            { unmapped, unmapped, SelectMenuItem { "File", "Restore..." } },
        },
        Edit = {
            { nil, "-", SelectMenuItem { "Edit", "Decrease Font Size" } },
            { nil, "/", SelectMenuItem { "Edit", "Toggle Line Comment" } },
            { nil, "=", SelectMenuItem { "Edit", "Increase Font Size" } },
            { nil, "a", SelectMenuItem { "Edit", "Select All" } },
            { nil, "c", SelectMenuItem { "Edit", "Copy" } },
            { nil, "d", SelectMenuItem { "Edit", "Duplicate Rows" } },
            { nil, "i", SelectMenuItem { "Edit", "Add Row" } },
            { nil, "s", SelectMenuItem { "Edit", "Commit" } },
            { nil, "v", SelectMenuItem { "Edit", "Paste" } },
            { nil, "x", SelectMenuItem { "Edit", "Cut" } },
            { nil, "z", SelectMenuItem { "Edit", "Undo" } },
            { { "alt" }, "/", SelectMenuItem { "Edit", "Toggle Block Comment" } },
            { { "ctrl" }, "g", SelectMenuItem { "Edit", "Select all Words" } },
            { { "shift" }, "p", SelectMenuItem { "Edit", "Preview" } },
            { { "shift" }, "z", SelectMenuItem { "Edit", "Redo" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Delete" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Discard" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Find" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Select Word" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Speech" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Start Dictation" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Transformations" } },
        },
        Connection = {
            { nil, ".", SelectMenuItem { "Connection", "Process List..." } },
            { nil, "k", SelectMenuItem { "Connection", "Open a Database..." } },
            { nil, "r", SelectMenuItem { "Connection", "Reload Workspace" } },
            { { "alt" }, ".", SelectMenuItem { "Connection", "Disconnect" } },
            { { "alt" }, "r", SelectMenuItem { "Connection", "Reload Current Tab" } },
            { { "shift" }, "k", SelectMenuItem { "Connection", "Open a Connection..." } },
            { { "shift" }, "r", SelectMenuItem { "Connection", "Reconnect" } },
            { unmapped, unmapped, SelectMenuItem { "Connection", "Edit..." } },
            { unmapped, unmapped, SelectMenuItem { "Connection", "New..." } },
            { unmapped, unmapped, SelectMenuItem { "Connection", "Run All Queries" } },
            { unmapped, unmapped, SelectMenuItem { "Connection", "Run Current Query" } },
            { unmapped, unmapped, SelectMenuItem { "Connection", "User Management..." } },
            { unmapped, unmapped, ChooseMenuItem { "Connection", "View Using Encoding" } },
        },
        Plugins = {
            { nil, "l", SelectMenuItem { "Plugins", "Manage Plugins..." } },
            { { "ctrl" }, "`", SelectMenuItem { "Plugins", "Run Custom Script" } },
        },
        Navigate = {
            { nil, "[", SelectMenuItem { "Navigate", "Select Previous Tab" } },
            { nil, "]", SelectMenuItem { "Navigate", "Select Next Tab" } },
            { nil, "p", SelectMenuItem { "Navigate", "Open Anything" } },
            { nil, "t", SelectMenuItem { "Navigate", "New Tab" } },
            { nil, "w", SelectMenuItem { "Navigate", "Close Tab" } },
            { { "alt" }, "[", SelectMenuItem { "Navigate", "Select Previous Pane" } },
            { { "alt" }, "]", SelectMenuItem { "Navigate", "Select Next Pane" } },
            { { "ctrl" }, "[", SelectMenuItem { "Navigate", "Show Table Data" } },
            { { "ctrl" }, "]", SelectMenuItem { "Navigate", "Show Table Structure" } },
            { { "shift" }, "[", SelectMenuItem { "Navigate", "Select Previous Workspace" } },
            { { "shift" }, "]", SelectMenuItem { "Navigate", "Select Next Workspace" } },
            { { "shift" }, "d", SelectMenuItem { "Navigate", "Split Horizontally Pane" } },
            { unmapped, unmapped, ChooseMenuItem { "Navigate", "Select Tab at Index" } },
        },
        View = {
            { { "ctrl" }, "f", SelectMenuItem { "View", "Enter Full Screen" } },
            { { "shift" }, "\\", SelectMenuItem { "View", "Show All Tabs" } },
            { { "shift" }, "c", SelectMenuItem { "View", "Toggle Console Log" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Tab Bar" } },
        },
        Window = {
            { nil, "m", SelectMenuItem { "Window", "Minimize" } },
            { { "alt" }, "m", SelectMenuItem { "Window", "Minimize All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Arrange in Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Bring All to Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Merge All Windows" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Tab to New Window" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Left Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Right Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Show Next Tab" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Show Previous Tab" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom" } },
        },
        Help = {
            { unmapped, unmapped, SelectMenuItem { "Help", "Changelogs" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Enable SSH Debug log" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Private message..." } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Report bug & feedback" } },
        },
    },
    getChooserItems = getChooserItems,
}
