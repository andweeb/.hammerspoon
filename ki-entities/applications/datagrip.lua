----------------------------------------------------------------------------------------------------
-- DataGrip application config
--
local Application = spoon.Ki.Application
local DataGrip = Application:new("DataGrip")

-- File actions
DataGrip.dataSources = Application:createMenuItemAction({ "File", "Data Sources..." })
DataGrip.saveAll = Application:createMenuItemAction({ "File", "Save All" })
DataGrip.reloadAllFromDisk = Application:createMenuItemAction({ "File", "Reload All from Disk" })
DataGrip.saveAs = Application:createMenuItemAction({ "File", "Save As..." })
DataGrip.attachDirectoryToProject = Application:createMenuItemAction({ "File", "Attach Directory to Project" })
DataGrip.closeProject = Application:createMenuItemAction({ "File", "Close Project" })
DataGrip.invalidateCachesRestart = Application:createMenuItemAction({ "File", "Invalidate Caches / Restart..." })
DataGrip.open = Application:createMenuItemAction({ "File", "Open..." })
DataGrip.powerSaveMode = Application:createMenuItemAction({ "File", "Power Save Mode" })
DataGrip.print = Application:createMenuItemAction({ "File", "Print..." })
DataGrip.renameProject = Application:createMenuItemAction({ "File", "Rename Project..." })
DataGrip.export = Application:createChooseMenuItemAction({ "File", "Export" })
DataGrip.fileProperties = Application:createChooseMenuItemAction({ "File", "File Properties" })
DataGrip.localHistory = Application:createChooseMenuItemAction({ "File", "Local History" })
DataGrip.manageIDESettings = Application:createChooseMenuItemAction({ "File", "Manage IDE Settings" })
DataGrip.newProjectsSettings = Application:createChooseMenuItemAction({ "File", "New Projects Settings" })
DataGrip.new = Application:createChooseMenuItemAction({ "File", "New" })
DataGrip.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
-- Edit actions
DataGrip.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
DataGrip.duplicateLineOrSelection = Application:createMenuItemAction({ "Edit", "Duplicate Line or Selection" })
DataGrip.cut = Application:createMenuItemAction({ "Edit", "Cut" })
DataGrip.undo = Application:createMenuItemAction({ "Edit", "Undo" })
DataGrip.toggleCase = Application:createMenuItemAction({ "Edit", "Toggle Case" })
DataGrip.redo = Application:createMenuItemAction({ "Edit", "Redo" })
DataGrip.joinLines = Application:createMenuItemAction({ "Edit", "Join Lines" })
DataGrip.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
DataGrip.encodeXMLHTMLSpecialCharacters = Application:createMenuItemAction({ "Edit", "Encode XML/HTML Special Characters" })
DataGrip.extendSelection = Application:createMenuItemAction({ "Edit", "Extend Selection" })
DataGrip.fillParagraph = Application:createMenuItemAction({ "Edit", "Fill Paragraph" })
DataGrip.indentSelection = Application:createMenuItemAction({ "Edit", "Indent Selection" })
DataGrip.reverseLines = Application:createMenuItemAction({ "Edit", "Reverse Lines" })
DataGrip.shrinkSelection = Application:createMenuItemAction({ "Edit", "Shrink Selection" })
DataGrip.sortLines = Application:createMenuItemAction({ "Edit", "Sort Lines" })
DataGrip.unindentLineOrSelection = Application:createMenuItemAction({ "Edit", "Unindent Line or Selection" })
DataGrip.delete = Application:createMenuItemAction({ "Edit", "Delete" })
DataGrip.convertIndents = Application:createChooseMenuItemAction({ "Edit", "Convert Indents" })
DataGrip.findUsages = Application:createChooseMenuItemAction({ "Edit", "Find Usages" })
DataGrip.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
DataGrip.macros = Application:createChooseMenuItemAction({ "Edit", "Macros" })
-- View actions
DataGrip.recentFiles = Application:createMenuItemAction({ "View", "Recent Files" })
DataGrip.quickSwitchScheme = Application:createMenuItemAction({ "View", "Quick Switch Scheme..." })
DataGrip.recentLocations = Application:createMenuItemAction({ "View", "Recent Locations" })
DataGrip.recentChanges = Application:createMenuItemAction({ "View", "Recent Changes" })
DataGrip.compareWithClipboard = Application:createMenuItemAction({ "View", "Compare with Clipboard" })
DataGrip.quickDefinition = Application:createMenuItemAction({ "View", "Quick Definition" })
DataGrip.quickTypeDefinition = Application:createMenuItemAction({ "View", "Quick Type Definition" })
DataGrip.recentlyChangedFiles = Application:createMenuItemAction({ "View", "Recently Changed Files" })
DataGrip.appearance = Application:createChooseMenuItemAction({ "View", "Appearance" })
DataGrip.bidiTextBaseDirection = Application:createChooseMenuItemAction({ "View", "Bidi Text Base Direction" })
DataGrip.toolWindows = Application:createChooseMenuItemAction({ "View", "Tool Windows" })
-- Navigate actions
DataGrip.back = Application:createMenuItemAction({ "Navigate", "Back" })
DataGrip.forward = Application:createMenuItemAction({ "Navigate", "Forward" })
DataGrip.declarationOrUsages = Application:createMenuItemAction({ "Navigate", "Declaration or Usages" })
DataGrip.tableRoutineClass = Application:createMenuItemAction({ "Navigate", "Table/Routine/Class..." })
DataGrip.superMethod = Application:createMenuItemAction({ "Navigate", "Super Method" })
DataGrip.relatedSymbol = Application:createMenuItemAction({ "Navigate", "Related Symbol..." })
DataGrip.symbol = Application:createMenuItemAction({ "Navigate", "Symbol..." })
DataGrip.file = Application:createMenuItemAction({ "Navigate", "File..." })
DataGrip.fileStructure = Application:createMenuItemAction({ "Navigate", "File Structure" })
DataGrip.implementationS = Application:createMenuItemAction({ "Navigate", "Implementation(s)" })
DataGrip.jumpToNavigationBar = Application:createMenuItemAction({ "Navigate", "Jump to Navigation Bar" })
DataGrip.lastEditLocation = Application:createMenuItemAction({ "Navigate", "Last Edit Location" })
DataGrip.nextEditLocation = Application:createMenuItemAction({ "Navigate", "Next Edit Location" })
DataGrip.nextEmmetEditPoint = Application:createMenuItemAction({ "Navigate", "Next Emmet Edit Point" })
DataGrip.nextHighlightedError = Application:createMenuItemAction({ "Navigate", "Next Highlighted Error" })
DataGrip.previousEmmetEditPoint = Application:createMenuItemAction({ "Navigate", "Previous Emmet Edit Point" })
DataGrip.previousHighlightedError = Application:createMenuItemAction({ "Navigate", "Previous Highlighted Error" })
DataGrip.searchEverywhere = Application:createMenuItemAction({ "Navigate", "Search Everywhere" })
DataGrip.bookmarks = Application:createChooseMenuItemAction({ "Navigate", "Bookmarks" })
DataGrip.navigateInFile = Application:createChooseMenuItemAction({ "Navigate", "Navigate in File" })
-- Code actions
DataGrip.commentWithLineComment = Application:createMenuItemAction({ "Code", "Comment with Line Comment" })
DataGrip.insertLiveTemplate = Application:createMenuItemAction({ "Code", "Insert Live Template..." })
DataGrip.generate = Application:createMenuItemAction({ "Code", "Generate..." })
DataGrip.commentWithBlockComment = Application:createMenuItemAction({ "Code", "Comment with Block Comment" })
DataGrip.surroundWith = Application:createMenuItemAction({ "Code", "Surround With..." })
DataGrip.autoIndentLines = Application:createMenuItemAction({ "Code", "Auto-Indent Lines" })
DataGrip.unwrapRemove = Application:createMenuItemAction({ "Code", "Unwrap/Remove..." })
DataGrip.configureCurrentFileAnalysis = Application:createMenuItemAction({ "Code", "Configure Current File Analysis..." })
DataGrip.runInspectionByName = Application:createMenuItemAction({ "Code", "Run Inspection by Name..." })
DataGrip.reformatFile = Application:createMenuItemAction({ "Code", "Reformat File..." })
DataGrip.codeCleanup = Application:createMenuItemAction({ "Code", "Code Cleanup..." })
DataGrip.dataFlowFromHere = Application:createMenuItemAction({ "Code", "Data Flow from Here..." })
DataGrip.dataFlowToHere = Application:createMenuItemAction({ "Code", "Data Flow to Here..." })
DataGrip.inspectCode = Application:createMenuItemAction({ "Code", "Inspect Code..." })
DataGrip.locateDuplicates = Application:createMenuItemAction({ "Code", "Locate Duplicates..." })
DataGrip.moveElementLeft = Application:createMenuItemAction({ "Code", "Move Element Left" })
DataGrip.moveElementRight = Application:createMenuItemAction({ "Code", "Move Element Right" })
DataGrip.moveLineDown = Application:createMenuItemAction({ "Code", "Move Line Down" })
DataGrip.moveLineUp = Application:createMenuItemAction({ "Code", "Move Line Up" })
DataGrip.moveStatementDown = Application:createMenuItemAction({ "Code", "Move Statement Down" })
DataGrip.moveStatementUp = Application:createMenuItemAction({ "Code", "Move Statement Up" })
DataGrip.silentCodeCleanup = Application:createMenuItemAction({ "Code", "Silent Code Cleanup" })
DataGrip.viewOfflineInspectionResults = Application:createMenuItemAction({ "Code", "View Offline Inspection Results..." })
DataGrip.codeCompletion = Application:createChooseMenuItemAction({ "Code", "Code Completion" })
DataGrip.folding = Application:createChooseMenuItemAction({ "Code", "Folding" })
-- Refactor actions
DataGrip.safeDelete = Application:createMenuItemAction({ "Refactor", "Safe Delete..." })
DataGrip.inline = Application:createMenuItemAction({ "Refactor", "Inline..." })
DataGrip.refactorThis = Application:createMenuItemAction({ "Refactor", "Refactor This..." })
DataGrip.copy = Application:createMenuItemAction({ "Refactor", "Copy..." })
DataGrip.invertBoolean = Application:createMenuItemAction({ "Refactor", "Invert Boolean..." })
DataGrip.move = Application:createMenuItemAction({ "Refactor", "Move..." })
DataGrip.rename = Application:createMenuItemAction({ "Refactor", "Rename..." })
-- Run actions
DataGrip.debug = Application:createMenuItemAction({ "Run", "Debug..." })
DataGrip.run = Application:createMenuItemAction({ "Run", "Run..." })
DataGrip.debug = Application:createMenuItemAction({ "Run", "Debug" })
DataGrip.run = Application:createMenuItemAction({ "Run", "Run" })
DataGrip.editConfigurations = Application:createMenuItemAction({ "Run", "Edit Configurations..." })
DataGrip.importTestsFromFile = Application:createMenuItemAction({ "Run", "Import Tests from File..." })
DataGrip.runWithCoverage = Application:createMenuItemAction({ "Run", "Run with Coverage" })
DataGrip.showCodeCoverageData = Application:createMenuItemAction({ "Run", "Show Code Coverage Data" })
DataGrip.showRunningList = Application:createMenuItemAction({ "Run", "Show Running List" })
DataGrip.stopBackgroundProcesses = Application:createMenuItemAction({ "Run", "Stop Background Processes..." })
DataGrip.stop = Application:createMenuItemAction({ "Run", "Stop" })
DataGrip.viewBreakpoints = Application:createMenuItemAction({ "Run", "View Breakpoints..." })
DataGrip.debuggingActions = Application:createChooseMenuItemAction({ "Run", "Debugging Actions" })
DataGrip.runWithProfiler = Application:createChooseMenuItemAction({ "Run", "Run with Profiler" })
DataGrip.testHistory = Application:createChooseMenuItemAction({ "Run", "Test History" })
DataGrip.toggleBreakpoint = Application:createChooseMenuItemAction({ "Run", "Toggle Breakpoint" })
-- Tools actions
DataGrip.createCommandLineLauncher = Application:createMenuItemAction({ "Tools", "Create Command-line Launcher..." })
DataGrip.IDEScriptingConsole = Application:createMenuItemAction({ "Tools", "IDE Scripting Console" })
DataGrip.saveFileAsTemplate = Application:createMenuItemAction({ "Tools", "Save File as Template..." })
DataGrip.saveAsLiveTemplate = Application:createMenuItemAction({ "Tools", "Save as Live Template..." })
DataGrip.vimEmulator = Application:createMenuItemAction({ "Tools", "Vim Emulator" })
DataGrip.XMLActions = Application:createChooseMenuItemAction({ "Tools", "XML Actions" })
-- Window actions
DataGrip.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
DataGrip.nextProjectWindow = Application:createMenuItemAction({ "Window", "Next Project Window" })
DataGrip.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
DataGrip.previousProjectWindow = Application:createMenuItemAction({ "Window", "Previous Project Window" })
DataGrip.restoreDefaultLayout = Application:createMenuItemAction({ "Window", "Restore Default Layout" })
DataGrip.storeCurrentLayoutAsDefault = Application:createMenuItemAction({ "Window", "Store Current Layout as Default" })
DataGrip.default = Application:createMenuItemAction({ "Window", "default" })
DataGrip.activeToolWindow = Application:createChooseMenuItemAction({ "Window", "Active Tool Window" })
DataGrip.backgroundTasks = Application:createChooseMenuItemAction({ "Window", "Background Tasks" })
DataGrip.editorTabs = Application:createChooseMenuItemAction({ "Window", "Editor Tabs" })
DataGrip.notifications = Application:createChooseMenuItemAction({ "Window", "Notifications" })
-- Help actions
DataGrip.findAction = Application:createMenuItemAction({ "Help", "Find Action..." })
DataGrip.changeMemorySettings = Application:createMenuItemAction({ "Help", "Change Memory Settings" })
DataGrip.collectLogsAndDiagnosticData = Application:createMenuItemAction({ "Help", "Collect Logs and Diagnostic Data" })
DataGrip.contactSupport = Application:createMenuItemAction({ "Help", "Contact Support..." })
DataGrip.demosAndScreencasts = Application:createMenuItemAction({ "Help", "Demos and Screencasts" })
DataGrip.editCustomProperties = Application:createMenuItemAction({ "Help", "Edit Custom Properties..." })
DataGrip.editCustomVMOptions = Application:createMenuItemAction({ "Help", "Edit Custom VM Options..." })
DataGrip.gettingStarted = Application:createMenuItemAction({ "Help", "Getting Started" })
DataGrip.help = Application:createMenuItemAction({ "Help", "Help" })
DataGrip.productivityGuide = Application:createMenuItemAction({ "Help", "Productivity Guide" })
DataGrip.register = Application:createMenuItemAction({ "Help", "Register..." })
DataGrip.showLogInFinder = Application:createMenuItemAction({ "Help", "Show Log in Finder" })
DataGrip.showSQLLogInFinder = Application:createMenuItemAction({ "Help", "Show SQL Log in Finder" })
DataGrip.submitFeedback = Application:createMenuItemAction({ "Help", "Submit Feedback..." })
DataGrip.submitABugReport = Application:createMenuItemAction({ "Help", "Submit a Bug Report..." })
DataGrip.tipOfTheDay = Application:createMenuItemAction({ "Help", "Tip of the Day" })
DataGrip.diagnosticTools = Application:createChooseMenuItemAction({ "Help", "Diagnostic Tools" })

DataGrip:registerShortcuts({
    -- File
    { nil, ";", DataGrip.dataSources, "Data Sources..." },
    { nil, "s", DataGrip.saveAll, "Save All" },
    { { "alt" }, "y", DataGrip.reloadAllFromDisk, "Reload All from Disk" },
    { { "shift" }, "o", DataGrip.openRecent, "Open Recent" },
    { { "shift" }, "s", DataGrip.saveAs, "Save As..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.attachDirectoryToProject, "Attach Directory to Project" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.closeProject, "Close Project" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.invalidateCachesRestart, "Invalidate Caches / Restart..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.open, "Open..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.powerSaveMode, "Power Save Mode" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.print, "Print..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.renameProject, "Rename Project..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.export, "Export" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fileProperties, "File Properties" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.localHistory, "Local History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.manageIDESettings, "Manage IDE Settings" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.newProjectsSettings, "New Projects Settings" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.new, "New" },
    -- Edit
    { nil, "a", DataGrip.selectAll, "Select All" },
    { nil, "x", DataGrip.cut, "Cut" },
    { nil, "z", DataGrip.undo, "Undo" },
    { { "shift" }, "u", DataGrip.toggleCase, "Toggle Case" },
    { { "shift" }, "z", DataGrip.redo, "Redo" },
    { { "shift", "ctrl" }, "j", DataGrip.joinLines, "Join Lines" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.encodeXMLHTMLSpecialCharacters, "Encode XML/HTML Special Characters" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.extendSelection, "Extend Selection" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fillParagraph, "Fill Paragraph" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.indentSelection, "Indent Selection" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.reverseLines, "Reverse Lines" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.shrinkSelection, "Shrink Selection" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.sortLines, "Sort Lines" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.unindentLineOrSelection, "Unindent Line or Selection" },
    { {  }, "", DataGrip.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.convertIndents, "Convert Indents" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.findUsages, "Find Usages" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.macros, "Macros" },
    -- View
    { nil, "e", DataGrip.recentFiles, "Recent Files" },
    { { "ctrl" }, "`", DataGrip.quickSwitchScheme, "Quick Switch Scheme..." },
    { { "shift" }, "e", DataGrip.recentLocations, "Recent Locations" },
    { { "shift", "alt" }, "c", DataGrip.recentChanges, "Recent Changes" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.compareWithClipboard, "Compare with Clipboard" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.quickDefinition, "Quick Definition" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.quickTypeDefinition, "Quick Type Definition" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.recentlyChangedFiles, "Recently Changed Files" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.appearance, "Appearance" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.bidiTextBaseDirection, "Bidi Text Base Direction" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.toolWindows, "Tool Windows" },
    -- Navigate
    { nil, "[", DataGrip.back, "Back" },
    { nil, "]", DataGrip.forward, "Forward" },
    { nil, "b", DataGrip.declarationOrUsages, "Declaration or Usages" },
    { nil, "o", DataGrip.tableRoutineClass, "Table/Routine/Class..." },
    { nil, "u", DataGrip.superMethod, "Super Method" },
    { { "alt" }, "b", DataGrip.relatedSymbol, "Related Symbol..." },
    { { "alt" }, "o", DataGrip.symbol, "Symbol..." },
    { { "cmd", "shift" }, "o", DataGrip.file, "File..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fileStructure, "File Structure" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.implementationS, "Implementation(s)" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.jumpToNavigationBar, "Jump to Navigation Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.lastEditLocation, "Last Edit Location" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextEditLocation, "Next Edit Location" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextEmmetEditPoint, "Next Emmet Edit Point" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextHighlightedError, "Next Highlighted Error" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.previousEmmetEditPoint, "Previous Emmet Edit Point" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.previousHighlightedError, "Previous Highlighted Error" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.searchEverywhere, "Search Everywhere" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.bookmarks, "Bookmarks" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.navigateInFile, "Navigate in File" },
    -- Code
    { nil, "/", DataGrip.commentWithLineComment, "Comment with Line Comment" },
    { nil, "j", DataGrip.insertLiveTemplate, "Insert Live Template..." },
    { nil, "n", DataGrip.generate, "Generate..." },
    { { "alt" }, "/", DataGrip.commentWithBlockComment, "Comment with Block Comment" },
    { { "alt" }, "t", DataGrip.surroundWith, "Surround With..." },
    { { "alt", "ctrl" }, "i", DataGrip.autoIndentLines, "Auto-Indent Lines" },
    { { "shift" }, "", DataGrip.unwrapRemove, "Unwrap/Remove..." },
    { { "shift", "alt" }, "h", DataGrip.configureCurrentFileAnalysis, "Configure Current File Analysis..." },
    { { "shift", "alt" }, "i", DataGrip.runInspectionByName, "Run Inspection by Name..." },
    { { "shift", "alt" }, "l", DataGrip.reformatFile, "Reformat File..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.codeCleanup, "Code Cleanup..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.dataFlowFromHere, "Data Flow from Here..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.dataFlowToHere, "Data Flow to Here..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.inspectCode, "Inspect Code..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.locateDuplicates, "Locate Duplicates..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveElementLeft, "Move Element Left" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveElementRight, "Move Element Right" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveLineDown, "Move Line Down" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveLineUp, "Move Line Up" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveStatementDown, "Move Statement Down" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveStatementUp, "Move Statement Up" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.silentCodeCleanup, "Silent Code Cleanup" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.viewOfflineInspectionResults, "View Offline Inspection Results..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.codeCompletion, "Code Completion" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.folding, "Folding" },
    -- Refactor
    { nil, "", DataGrip.safeDelete, "Safe Delete..." },
    { { "alt" }, "n", DataGrip.inline, "Inline..." },
    { { "ctrl" }, "t", DataGrip.refactorThis, "Refactor This..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.copy, "Copy..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.invertBoolean, "Invert Boolean..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.move, "Move..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.rename, "Rename..." },
    -- Run
    { nil, "d", DataGrip.debug, "Debug" },
    { nil, "r", DataGrip.run, "Run" },
    { { "alt", "ctrl" }, "d", DataGrip.debug, "Debug..." },
    { { "alt", "ctrl" }, "r", DataGrip.run, "Run..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editConfigurations, "Edit Configurations..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.importTestsFromFile, "Import Tests from File..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.runWithCoverage, "Run with Coverage" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showCodeCoverageData, "Show Code Coverage Data" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showRunningList, "Show Running List" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.stopBackgroundProcesses, "Stop Background Processes..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.stop, "Stop" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.viewBreakpoints, "View Breakpoints..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.debuggingActions, "Debugging Actions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.runWithProfiler, "Run with Profiler" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.testHistory, "Test History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.toggleBreakpoint, "Toggle Breakpoint" },
    -- Tools
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.createCommandLineLauncher, "Create Command-line Launcher..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.IDEScriptingConsole, "IDE Scripting Console" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.saveFileAsTemplate, "Save File as Template..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.saveAsLiveTemplate, "Save as Live Template..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.vimEmulator, "Vim Emulator" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.XMLActions, "XML Actions" },
    -- Window
    { nil, "m", DataGrip.minimize, "Minimize" },
    { { "alt" }, "`", DataGrip.nextProjectWindow, "Next Project Window" },
    { { "ctrl" }, "=", DataGrip.zoom, "Zoom" },
    { { "shift", "alt" }, "`", DataGrip.previousProjectWindow, "Previous Project Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.restoreDefaultLayout, "Restore Default Layout" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.storeCurrentLayoutAsDefault, "Store Current Layout as Default" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.default, "default" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.activeToolWindow, "Active Tool Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.backgroundTasks, "Background Tasks" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editorTabs, "Editor Tabs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.notifications, "Notifications" },
    -- Help
    { { "shift" }, "a", DataGrip.findAction, "Find Action..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.changeMemorySettings, "Change Memory Settings" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.collectLogsAndDiagnosticData, "Collect Logs and Diagnostic Data" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.contactSupport, "Contact Support..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.demosAndScreencasts, "Demos and Screencasts" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editCustomProperties, "Edit Custom Properties..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editCustomVMOptions, "Edit Custom VM Options..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.gettingStarted, "Getting Started" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.help, "Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.productivityGuide, "Productivity Guide" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.register, "Register..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showLogInFinder, "Show Log in Finder" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showSQLLogInFinder, "Show SQL Log in Finder" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.submitFeedback, "Submit Feedback..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.submitABugReport, "Submit a Bug Report..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.tipOfTheDay, "Tip of the Day" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.diagnosticTools, "Diagnostic Tools" },
})

return DataGrip
