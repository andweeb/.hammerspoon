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
    local json = ""
    local filename = self.absoluteDataPath.."/"..name..".plist"
    local arguments = { "-convert", "json", "-o", "-", filename }

    local taskDoneCallback = function()
        local success, data = pcall(function() return hs.json.decode(json) end)

        if not success or not data then
            return self.notifyError("Unable to initialize TablePlus "..name, "")
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
function TablePlus.getChooserItems()
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
TablePlus.newWorkspace = Application:createMenuItemAction({ "File", "New Workspace" })
TablePlus.openFile = Application:createMenuItemAction({ "File", "Open..." })
TablePlus.newSQLViewer = Application:createMenuItemAction({ "File", "New SQL Viewer" })
TablePlus.saveAs = Application:createMenuItemAction({ "File", "Save As..." })
TablePlus.backup = Application:createMenuItemAction({ "File", "Backup..." })
TablePlus.closeAll = Application:createMenuItemAction({ "File", "Close All" })
TablePlus.close = Application:createMenuItemAction({ "File", "Close" })
TablePlus.export = Application:createMenuItemAction({ "File", "Export..." })
TablePlus.restore = Application:createMenuItemAction({ "File", "Restore..." })
TablePlus.import = Application:createChooseMenuItemAction({ "File", "Import" })
TablePlus.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
-- Edit actions
TablePlus.decreaseFontSize = Application:createMenuItemAction({ "Edit", "Decrease Font Size" })
TablePlus.toggleLineComment = Application:createMenuItemAction({ "Edit", "Toggle Line Comment" })
TablePlus.increaseFontSize = Application:createMenuItemAction({ "Edit", "Increase Font Size" })
TablePlus.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
TablePlus.copy = Application:createMenuItemAction({ "Edit", "Copy" })
TablePlus.duplicateRows = Application:createMenuItemAction({ "Edit", "Duplicate Rows" })
TablePlus.addRow = Application:createMenuItemAction({ "Edit", "Add Row" })
TablePlus.commit = Application:createMenuItemAction({ "Edit", "Commit" })
TablePlus.paste = Application:createMenuItemAction({ "Edit", "Paste" })
TablePlus.cut = Application:createMenuItemAction({ "Edit", "Cut" })
TablePlus.undo = Application:createMenuItemAction({ "Edit", "Undo" })
TablePlus.toggleBlockComment = Application:createMenuItemAction({ "Edit", "Toggle Block Comment" })
TablePlus.selectAllWords = Application:createMenuItemAction({ "Edit", "Select all Words" })
TablePlus.preview = Application:createMenuItemAction({ "Edit", "Preview" })
TablePlus.redo = Application:createMenuItemAction({ "Edit", "Redo" })
TablePlus.delete = Application:createMenuItemAction({ "Edit", "Delete" })
TablePlus.discard = Application:createMenuItemAction({ "Edit", "Discard" })
TablePlus.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
TablePlus.selectWord = Application:createMenuItemAction({ "Edit", "Select Word" })
TablePlus.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
TablePlus.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
TablePlus.speech = Application:createChooseMenuItemAction({ "Edit", "Speech" })
TablePlus.transformations = Application:createChooseMenuItemAction({ "Edit", "Transformations" })
-- Connection actions
TablePlus.processList = Application:createMenuItemAction({ "Connection", "Process List..." })
TablePlus.reloadWorkspace = Application:createMenuItemAction({ "Connection", "Reload Workspace" })
TablePlus.disconnect = Application:createMenuItemAction({ "Connection", "Disconnect" })
TablePlus.reloadCurrentTab = Application:createMenuItemAction({ "Connection", "Reload Current Tab" })
TablePlus.reconnect = Application:createMenuItemAction({ "Connection", "Reconnect" })
TablePlus.edit = Application:createMenuItemAction({ "Connection", "Edit..." })
TablePlus.new = Application:createMenuItemAction({ "Connection", "New..." })
TablePlus.userManagement = Application:createMenuItemAction({ "Connection", "User Management..." })
TablePlus.viewUsingEncoding = Application:createChooseMenuItemAction({ "Connection", "View Using Encoding" })
-- Plugins actions
TablePlus.managePlugins = Application:createMenuItemAction({ "Plugins", "Manage Plugins..." })
TablePlus.runCustomScript = Application:createMenuItemAction({ "Plugins", "Run Custom Script" })
-- Navigate actions
TablePlus.selectPreviousTab = Application:createMenuItemAction({ "Navigate", "Select Previous Tab" })
TablePlus.selectNextTab = Application:createMenuItemAction({ "Navigate", "Select Next Tab" })
TablePlus.switchDatabase = Application:createMenuItemAction({ "Navigate", "Switch Database..." })
TablePlus.openAnything = Application:createMenuItemAction({ "Navigate", "Open Anything" })
TablePlus.newTab = Application:createMenuItemAction({ "Navigate", "New Tab" })
TablePlus.closeTab = Application:createMenuItemAction({ "Navigate", "Close Tab" })
TablePlus.selectPreviousPane = Application:createMenuItemAction({ "Navigate", "Select Previous Pane" })
TablePlus.selectNextPane = Application:createMenuItemAction({ "Navigate", "Select Next Pane" })
TablePlus.showTableData = Application:createMenuItemAction({ "Navigate", "Show Table Data" })
TablePlus.showTableStructure = Application:createMenuItemAction({ "Navigate", "Show Table Structure" })
TablePlus.selectPreviousWorkspace = Application:createMenuItemAction({ "Navigate", "Select Previous Workspace" })
TablePlus.selectNextWorkspace = Application:createMenuItemAction({ "Navigate", "Select Next Workspace" })
TablePlus.splitHorizontallyPane = Application:createMenuItemAction({ "Navigate", "Split Horizontally Pane" })
TablePlus.switchConnection = Application:createMenuItemAction({ "Navigate", "Switch Connection..." })
-- View actions
TablePlus.enterFullScreen = Application:createMenuItemAction({ "View", "Enter Full Screen" })
TablePlus.toggleConsoleLog = Application:createMenuItemAction({ "View", "Toggle Console Log" })
-- Window actions
TablePlus.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
TablePlus.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
TablePlus.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
TablePlus.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
TablePlus.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
TablePlus.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
TablePlus.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
TablePlus.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
TablePlus.changelogs = Application:createMenuItemAction({ "Help", "Changelogs" })
TablePlus.enableSSHDebugLog = Application:createMenuItemAction({ "Help", "Enable SSH Debug log" })
TablePlus.privateMessage = Application:createMenuItemAction({ "Help", "Private message..." })
TablePlus.reportBugFeedback = Application:createMenuItemAction({ "Help", "Report bug & feedback" })

TablePlus:registerShortcuts({
    { nil, nil, TablePlus.open, "Open Application or Database Connection" },
    -- File
    { nil, "i", TablePlus.import, "Import" },
    { nil, "n", TablePlus.newWorkspace, "New Workspace" },
    { nil, "o", TablePlus.openFile, "Open..." },
    { { "shift" }, "o", TablePlus.openRecent, "Open Recent" },
    { { "shift" }, "s", TablePlus.saveAs, "Save As..." },
    { { "cmd", "shift" }, "o", TablePlus.newSQLViewer, "New SQL Viewer" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.backup, "Backup..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.closeAll, "Close All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.close, "Close" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.export, "Export..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.restore, "Restore..." },
    -- Edit
    { nil, "-", TablePlus.decreaseFontSize, "Decrease Font Size" },
    { nil, "/", TablePlus.toggleLineComment, "Toggle Line Comment" },
    { nil, "=", TablePlus.increaseFontSize, "Increase Font Size" },
    { nil, "a", TablePlus.selectAll, "Select All" },
    { nil, "c", TablePlus.copy, "Copy" },
    { nil, "d", TablePlus.duplicateRows, "Duplicate Rows" },
    { nil, "i", TablePlus.addRow, "Add Row" },
    { nil, "s", TablePlus.commit, "Commit" },
    { nil, "v", TablePlus.paste, "Paste" },
    { nil, "x", TablePlus.cut, "Cut" },
    { nil, "z", TablePlus.undo, "Undo" },
    { { "alt" }, "/", TablePlus.toggleBlockComment, "Toggle Block Comment" },
    { { "ctrl" }, "g", TablePlus.selectAllWords, "Select all Words" },
    { { "shift" }, "p", TablePlus.preview, "Preview" },
    { { "shift" }, "z", TablePlus.redo, "Redo" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.discard, "Discard" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.selectWord, "Select Word" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.speech, "Speech" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.transformations, "Transformations" },
    -- Connection
    { nil, ".", TablePlus.processList, "Process List..." },
    { nil, "r", TablePlus.reloadWorkspace, "Reload Workspace" },
    { { "alt" }, ".", TablePlus.disconnect, "Disconnect" },
    { { "alt" }, "r", TablePlus.reloadCurrentTab, "Reload Current Tab" },
    { { "shift" }, "r", TablePlus.reconnect, "Reconnect" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.edit, "Edit..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.new, "New..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.userManagement, "User Management..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.viewUsingEncoding, "View Using Encoding" },
    -- Plugins
    { nil, "l", TablePlus.managePlugins, "Manage Plugins..." },
    { { "ctrl" }, "`", TablePlus.runCustomScript, "Run Custom Script" },
    -- Navigate
    { nil, "[", TablePlus.selectPreviousTab, "Select Previous Tab" },
    { nil, "]", TablePlus.selectNextTab, "Select Next Tab" },
    { nil, "k", TablePlus.switchDatabase, "Switch Database..." },
    { nil, "p", TablePlus.openAnything, "Open Anything" },
    { nil, "t", TablePlus.newTab, "New Tab" },
    { nil, "w", TablePlus.closeTab, "Close Tab" },
    { { "alt" }, "[", TablePlus.selectPreviousPane, "Select Previous Pane" },
    { { "alt" }, "]", TablePlus.selectNextPane, "Select Next Pane" },
    { { "ctrl" }, "[", TablePlus.showTableData, "Show Table Data" },
    { { "ctrl" }, "]", TablePlus.showTableStructure, "Show Table Structure" },
    { { "shift" }, "[", TablePlus.selectPreviousWorkspace, "Select Previous Workspace" },
    { { "shift" }, "]", TablePlus.selectNextWorkspace, "Select Next Workspace" },
    { { "shift" }, "d", TablePlus.splitHorizontallyPane, "Split Horizontally Pane" },
    { { "shift" }, "k", TablePlus.switchConnection, "Switch Connection..." },
    -- View
    { { "ctrl" }, "f", TablePlus.enterFullScreen, "Enter Full Screen" },
    { { "shift" }, "c", TablePlus.toggleConsoleLog, "Toggle Console Log" },
    -- Window
    { nil, "m", TablePlus.minimize, "Minimize" },
    { { "alt" }, "m", TablePlus.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.changelogs, "Changelogs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.enableSSHDebugLog, "Enable SSH Debug log" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.privateMessage, "Private message..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", TablePlus.reportBugFeedback, "Report bug & feedback" },
})

return TablePlus
