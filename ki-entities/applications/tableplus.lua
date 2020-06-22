----------------------------------------------------------------------------------------------------
-- TablePlus application config
--
local Application = spoon.Ki.Application
local TablePlus = Application:new("TablePlus")
TablePlus.dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"

local path = TablePlus.dataPath:gsub("%\\", "")
TablePlus.absoluteDataPath = hs.fs.pathToAbsolute(path)

-- Validate the data path
function TablePlus:validateDataPath()
    local success, value = pcall(function()
        return hs.fs.attributes(self.absoluteDataPath)
    end)

    if not success then
        self.notifyError("TablePlus data path not found", value or "")
    end
end

-- Asynchronously read plist file as json
function TablePlus:readPlist(name, callback)
    local json = nil
    local filename = self.absoluteDataPath.."/"..name..".plist"
    local arguments = { "-convert", "json", "-o", "-", filename }

    local taskDoneCallback = function() if json then callback(json) end end
    local streamingCallback = function(_, stdout)
        local success, data = pcall(function() return hs.json.decode(stdout) end)

        if not success or not data then
            self.notifyError("Unable to initialize TablePlus "..name)
        else
            json = data
        end

        return false
    end

    hs.task
        .new("/usr/bin/plutil", taskDoneCallback, streamingCallback, arguments)
        :start()
end

-- Override selection items method to be able to select a TablePlus connection
function TablePlus.getSelectionItems()
    local choices = {}

    -- Initialize connection groups by group id and connections list
    for _, connection in pairs(TablePlus.connections) do
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
function TablePlus.open(app, choice)
    app:activate()

    if choice then
        local isOk = hs.urlevent.openURL("tableplus://?id="..choice.id)

        if not isOk then
            TablePlus.notifyError("Error opening the connection")
        end
    end
end

-- Validate data path and initialize connections
TablePlus:validateDataPath()
TablePlus:readPlist("Connections", function(connections)
    TablePlus.connections = connections
end)

-- File actions
TablePlus.newWorkspace = Application.createMenuItemEvent({ "File", "New Workspace" })
TablePlus.openFile = Application.createMenuItemEvent({ "File", "Open..." })
TablePlus.newSQLViewer = Application.createMenuItemEvent({ "File", "New SQL Viewer" })
TablePlus.saveAs = Application.createMenuItemEvent({ "File", "Save As..." })
TablePlus.backup = Application.createMenuItemEvent({ "File", "Backup..." })
TablePlus.closeAll = Application.createMenuItemEvent({ "File", "Close All" })
TablePlus.close = Application.createMenuItemEvent({ "File", "Close" })
TablePlus.export = Application.createMenuItemEvent({ "File", "Export..." })
TablePlus.restore = Application.createMenuItemEvent({ "File", "Restore..." })
TablePlus.import = Application.createMenuItemChooserEvent({ "File", "Import" })
TablePlus.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" })
-- Edit actions
TablePlus.decreaseFontSize = Application.createMenuItemEvent({ "Edit", "Decrease Font Size" })
TablePlus.toggleLineComment = Application.createMenuItemEvent({ "Edit", "Toggle Line Comment" })
TablePlus.increaseFontSize = Application.createMenuItemEvent({ "Edit", "Increase Font Size" })
TablePlus.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
TablePlus.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
TablePlus.duplicateRows = Application.createMenuItemEvent({ "Edit", "Duplicate Rows" })
TablePlus.addRow = Application.createMenuItemEvent({ "Edit", "Add Row" })
TablePlus.commit = Application.createMenuItemEvent({ "Edit", "Commit" })
TablePlus.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
TablePlus.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
TablePlus.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
TablePlus.toggleBlockComment = Application.createMenuItemEvent({ "Edit", "Toggle Block Comment" })
TablePlus.selectAllWords = Application.createMenuItemEvent({ "Edit", "Select all Words" })
TablePlus.preview = Application.createMenuItemEvent({ "Edit", "Preview" })
TablePlus.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
TablePlus.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
TablePlus.discard = Application.createMenuItemEvent({ "Edit", "Discard" })
TablePlus.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
TablePlus.selectWord = Application.createMenuItemEvent({ "Edit", "Select Word" })
TablePlus.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
TablePlus.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
TablePlus.speech = Application.createMenuItemChooserEvent({ "Edit", "Speech" })
TablePlus.transformations = Application.createMenuItemChooserEvent({ "Edit", "Transformations" })
-- Connection actions
TablePlus.processList = Application.createMenuItemEvent({ "Connection", "Process List..." })
TablePlus.reloadWorkspace = Application.createMenuItemEvent({ "Connection", "Reload Workspace" })
TablePlus.disconnect = Application.createMenuItemEvent({ "Connection", "Disconnect" })
TablePlus.reloadCurrentTab = Application.createMenuItemEvent({ "Connection", "Reload Current Tab" })
TablePlus.reconnect = Application.createMenuItemEvent({ "Connection", "Reconnect" })
TablePlus.edit = Application.createMenuItemEvent({ "Connection", "Edit..." })
TablePlus.new = Application.createMenuItemEvent({ "Connection", "New..." })
TablePlus.userManagement = Application.createMenuItemEvent({ "Connection", "User Management..." })
TablePlus.viewUsingEncoding = Application.createMenuItemChooserEvent({ "Connection", "View Using Encoding" })
-- Plugins actions
TablePlus.managePlugins = Application.createMenuItemEvent({ "Plugins", "Manage Plugins..." })
TablePlus.runCustomScript = Application.createMenuItemEvent({ "Plugins", "Run Custom Script" })
-- Navigate actions
TablePlus.selectPreviousTab = Application.createMenuItemEvent({ "Navigate", "Select Previous Tab" })
TablePlus.selectNextTab = Application.createMenuItemEvent({ "Navigate", "Select Next Tab" })
TablePlus.switchDatabase = Application.createMenuItemEvent({ "Navigate", "Switch Database..." })
TablePlus.openAnything = Application.createMenuItemEvent({ "Navigate", "Open Anything" })
TablePlus.newTab = Application.createMenuItemEvent({ "Navigate", "New Tab" })
TablePlus.closeTab = Application.createMenuItemEvent({ "Navigate", "Close Tab" })
TablePlus.selectPreviousPane = Application.createMenuItemEvent({ "Navigate", "Select Previous Pane" })
TablePlus.selectNextPane = Application.createMenuItemEvent({ "Navigate", "Select Next Pane" })
TablePlus.showTableData = Application.createMenuItemEvent({ "Navigate", "Show Table Data" })
TablePlus.showTableStructure = Application.createMenuItemEvent({ "Navigate", "Show Table Structure" })
TablePlus.selectPreviousWorkspace = Application.createMenuItemEvent({ "Navigate", "Select Previous Workspace" })
TablePlus.selectNextWorkspace = Application.createMenuItemEvent({ "Navigate", "Select Next Workspace" })
TablePlus.splitHorizontallyPane = Application.createMenuItemEvent({ "Navigate", "Split Horizontally Pane" })
TablePlus.switchConnection = Application.createMenuItemEvent({ "Navigate", "Switch Connection..." })
-- View actions
TablePlus.enterFullScreen = Application.createMenuItemEvent({ "View", "Enter Full Screen" })
TablePlus.toggleConsoleLog = Application.createMenuItemEvent({ "View", "Toggle Console Log" })
-- Window actions
TablePlus.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
TablePlus.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
TablePlus.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
TablePlus.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
TablePlus.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
TablePlus.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
TablePlus.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
TablePlus.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
TablePlus.changelogs = Application.createMenuItemEvent({ "Help", "Changelogs" })
TablePlus.enableSSHDebugLog = Application.createMenuItemEvent({ "Help", "Enable SSH Debug log" })
TablePlus.privateMessage = Application.createMenuItemEvent({ "Help", "Private message..." })
TablePlus.reportBugFeedback = Application.createMenuItemEvent({ "Help", "Report bug & feedback" })

TablePlus:registerShortcuts({
    { nil, nil, TablePlus.open, { "TablePlus", "Open Application or Database Connection" } },
    -- File
    { nil, "i", TablePlus.import, { "File", "Import" } },
    { nil, "n", TablePlus.newWorkspace, { "File", "New Workspace" } },
    { nil, "o", TablePlus.openFile, { "File", "Open..." } },
    { { "shift" }, "o", TablePlus.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "s", TablePlus.saveAs, { "File", "Save As..." } },
    { { "cmd", "shift" }, "o", TablePlus.newSQLViewer, { "File", "New SQL Viewer" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.backup, { "File", "Backup..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.closeAll, { "File", "Close All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.close, { "File", "Close" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.export, { "File", "Export..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.restore, { "File", "Restore..." } },
    -- Edit
    { nil, "-", TablePlus.decreaseFontSize, { "Edit", "Decrease Font Size" } },
    { nil, "/", TablePlus.toggleLineComment, { "Edit", "Toggle Line Comment" } },
    { nil, "=", TablePlus.increaseFontSize, { "Edit", "Increase Font Size" } },
    { nil, "a", TablePlus.selectAll, { "Edit", "Select All" } },
    { nil, "c", TablePlus.copy, { "Edit", "Copy" } },
    { nil, "d", TablePlus.duplicateRows, { "Edit", "Duplicate Rows" } },
    { nil, "i", TablePlus.addRow, { "Edit", "Add Row" } },
    { nil, "s", TablePlus.commit, { "Edit", "Commit" } },
    { nil, "v", TablePlus.paste, { "Edit", "Paste" } },
    { nil, "x", TablePlus.cut, { "Edit", "Cut" } },
    { nil, "z", TablePlus.undo, { "Edit", "Undo" } },
    { { "alt" }, "/", TablePlus.toggleBlockComment, { "Edit", "Toggle Block Comment" } },
    { { "ctrl" }, "g", TablePlus.selectAllWords, { "Edit", "Select all Words" } },
    { { "shift" }, "p", TablePlus.preview, { "Edit", "Preview" } },
    { { "shift" }, "z", TablePlus.redo, { "Edit", "Redo" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.discard, { "Edit", "Discard" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.selectWord, { "Edit", "Select Word" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.speech, { "Edit", "Speech" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.transformations, { "Edit", "Transformations" } },
    -- Connection
    { nil, ".", TablePlus.processList, { "Connection", "Process List..." } },
    { nil, "r", TablePlus.reloadWorkspace, { "Connection", "Reload Workspace" } },
    { { "alt" }, ".", TablePlus.disconnect, { "Connection", "Disconnect" } },
    { { "alt" }, "r", TablePlus.reloadCurrentTab, { "Connection", "Reload Current Tab" } },
    { { "shift" }, "r", TablePlus.reconnect, { "Connection", "Reconnect" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.edit, { "Connection", "Edit..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.new, { "Connection", "New..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.userManagement, { "Connection", "User Management..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.viewUsingEncoding, { "Connection", "View Using Encoding" } },
    -- Plugins
    { nil, "l", TablePlus.managePlugins, { "Plugins", "Manage Plugins..." } },
    { { "ctrl" }, "`", TablePlus.runCustomScript, { "Plugins", "Run Custom Script" } },
    -- Navigate
    { nil, "[", TablePlus.selectPreviousTab, { "Navigate", "Select Previous Tab" } },
    { nil, "]", TablePlus.selectNextTab, { "Navigate", "Select Next Tab" } },
    { nil, "k", TablePlus.switchDatabase, { "Navigate", "Switch Database..." } },
    { nil, "p", TablePlus.openAnything, { "Navigate", "Open Anything" } },
    { nil, "t", TablePlus.newTab, { "Navigate", "New Tab" } },
    { nil, "w", TablePlus.closeTab, { "Navigate", "Close Tab" } },
    { { "alt" }, "[", TablePlus.selectPreviousPane, { "Navigate", "Select Previous Pane" } },
    { { "alt" }, "]", TablePlus.selectNextPane, { "Navigate", "Select Next Pane" } },
    { { "ctrl" }, "[", TablePlus.showTableData, { "Navigate", "Show Table Data" } },
    { { "ctrl" }, "]", TablePlus.showTableStructure, { "Navigate", "Show Table Structure" } },
    { { "shift" }, "[", TablePlus.selectPreviousWorkspace, { "Navigate", "Select Previous Workspace" } },
    { { "shift" }, "]", TablePlus.selectNextWorkspace, { "Navigate", "Select Next Workspace" } },
    { { "shift" }, "d", TablePlus.splitHorizontallyPane, { "Navigate", "Split Horizontally Pane" } },
    { { "shift" }, "k", TablePlus.switchConnection, { "Navigate", "Switch Connection..." } },
    -- View
    { { "ctrl" }, "f", TablePlus.enterFullScreen, { "View", "Enter Full Screen" } },
    { { "shift" }, "c", TablePlus.toggleConsoleLog, { "View", "Toggle Console Log" } },
    -- Window
    { nil, "m", TablePlus.minimize, { "Window", "Minimize" } },
    { { "alt" }, "m", TablePlus.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.changelogs, { "Help", "Changelogs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.enableSSHDebugLog, { "Help", "Enable SSH Debug log" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.privateMessage, { "Help", "Private message..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.reportBugFeedback, { "Help", "Report bug & feedback" } },
})

return TablePlus
