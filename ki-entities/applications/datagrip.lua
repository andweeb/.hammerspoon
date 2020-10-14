----------------------------------------------------------------------------------------------------
-- DataGrip application config
--
local Application = spoon.Ki.Application
local DataGrip = Application:new("DataGrip")

-- File actions
DataGrip.dataSources = Application.createMenuItemEvent({ "File", "Data Sources..." })
DataGrip.saveAll = Application.createMenuItemEvent({ "File", "Save All" })
DataGrip.reloadAllFromDisk = Application.createMenuItemEvent({ "File", "Reload All from Disk" })
DataGrip.saveAs = Application.createMenuItemEvent({ "File", "Save As..." })
DataGrip.attachDirectoryToProject = Application.createMenuItemEvent({ "File", "Attach Directory to Project" })
DataGrip.closeProject = Application.createMenuItemEvent({ "File", "Close Project" })
DataGrip.invalidateCachesRestart = Application.createMenuItemEvent({ "File", "Invalidate Caches / Restart..." })
DataGrip.open = Application.createMenuItemEvent({ "File", "Open..." })
DataGrip.powerSaveMode = Application.createMenuItemEvent({ "File", "Power Save Mode" })
DataGrip.print = Application.createMenuItemEvent({ "File", "Print..." })
DataGrip.renameProject = Application.createMenuItemEvent({ "File", "Rename Project..." })
DataGrip.export = Application.createMenuItemChooserEvent({ "File", "Export" })
DataGrip.fileProperties = Application.createMenuItemChooserEvent({ "File", "File Properties" })
DataGrip.localHistory = Application.createMenuItemChooserEvent({ "File", "Local History" })
DataGrip.manageIDESettings = Application.createMenuItemChooserEvent({ "File", "Manage IDE Settings" })
DataGrip.newProjectsSettings = Application.createMenuItemChooserEvent({ "File", "New Projects Settings" })
DataGrip.new = Application.createMenuItemChooserEvent({ "File", "New" })
DataGrip.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" })
-- Edit actions
DataGrip.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
DataGrip.duplicateLineOrSelection = Application.createMenuItemEvent({ "Edit", "Duplicate Line or Selection" })
DataGrip.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
DataGrip.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
DataGrip.toggleCase = Application.createMenuItemEvent({ "Edit", "Toggle Case" })
DataGrip.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
DataGrip.joinLines = Application.createMenuItemEvent({ "Edit", "Join Lines" })
DataGrip.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
DataGrip.encodeXMLHTMLSpecialCharacters = Application.createMenuItemEvent({ "Edit", "Encode XML/HTML Special Characters" })
DataGrip.extendSelection = Application.createMenuItemEvent({ "Edit", "Extend Selection" })
DataGrip.fillParagraph = Application.createMenuItemEvent({ "Edit", "Fill Paragraph" })
DataGrip.indentSelection = Application.createMenuItemEvent({ "Edit", "Indent Selection" })
DataGrip.reverseLines = Application.createMenuItemEvent({ "Edit", "Reverse Lines" })
DataGrip.shrinkSelection = Application.createMenuItemEvent({ "Edit", "Shrink Selection" })
DataGrip.sortLines = Application.createMenuItemEvent({ "Edit", "Sort Lines" })
DataGrip.unindentLineOrSelection = Application.createMenuItemEvent({ "Edit", "Unindent Line or Selection" })
DataGrip.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
DataGrip.convertIndents = Application.createMenuItemChooserEvent({ "Edit", "Convert Indents" })
DataGrip.findUsages = Application.createMenuItemChooserEvent({ "Edit", "Find Usages" })
DataGrip.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
DataGrip.macros = Application.createMenuItemChooserEvent({ "Edit", "Macros" })
-- View actions
DataGrip.recentFiles = Application.createMenuItemEvent({ "View", "Recent Files" })
DataGrip.quickSwitchScheme = Application.createMenuItemEvent({ "View", "Quick Switch Scheme..." })
DataGrip.recentLocations = Application.createMenuItemEvent({ "View", "Recent Locations" })
DataGrip.recentChanges = Application.createMenuItemEvent({ "View", "Recent Changes" })
DataGrip.compareWithClipboard = Application.createMenuItemEvent({ "View", "Compare with Clipboard" })
DataGrip.quickDefinition = Application.createMenuItemEvent({ "View", "Quick Definition" })
DataGrip.quickTypeDefinition = Application.createMenuItemEvent({ "View", "Quick Type Definition" })
DataGrip.recentlyChangedFiles = Application.createMenuItemEvent({ "View", "Recently Changed Files" })
DataGrip.appearance = Application.createMenuItemChooserEvent({ "View", "Appearance" })
DataGrip.bidiTextBaseDirection = Application.createMenuItemChooserEvent({ "View", "Bidi Text Base Direction" })
DataGrip.toolWindows = Application.createMenuItemChooserEvent({ "View", "Tool Windows" })
-- Navigate actions
DataGrip.back = Application.createMenuItemEvent({ "Navigate", "Back" })
DataGrip.forward = Application.createMenuItemEvent({ "Navigate", "Forward" })
DataGrip.declarationOrUsages = Application.createMenuItemEvent({ "Navigate", "Declaration or Usages" })
DataGrip.tableRoutineClass = Application.createMenuItemEvent({ "Navigate", "Table/Routine/Class..." })
DataGrip.superMethod = Application.createMenuItemEvent({ "Navigate", "Super Method" })
DataGrip.relatedSymbol = Application.createMenuItemEvent({ "Navigate", "Related Symbol..." })
DataGrip.symbol = Application.createMenuItemEvent({ "Navigate", "Symbol..." })
DataGrip.file = Application.createMenuItemEvent({ "Navigate", "File..." })
DataGrip.fileStructure = Application.createMenuItemEvent({ "Navigate", "File Structure" })
DataGrip.implementationS = Application.createMenuItemEvent({ "Navigate", "Implementation(s)" })
DataGrip.jumpToNavigationBar = Application.createMenuItemEvent({ "Navigate", "Jump to Navigation Bar" })
DataGrip.lastEditLocation = Application.createMenuItemEvent({ "Navigate", "Last Edit Location" })
DataGrip.nextEditLocation = Application.createMenuItemEvent({ "Navigate", "Next Edit Location" })
DataGrip.nextEmmetEditPoint = Application.createMenuItemEvent({ "Navigate", "Next Emmet Edit Point" })
DataGrip.nextHighlightedError = Application.createMenuItemEvent({ "Navigate", "Next Highlighted Error" })
DataGrip.previousEmmetEditPoint = Application.createMenuItemEvent({ "Navigate", "Previous Emmet Edit Point" })
DataGrip.previousHighlightedError = Application.createMenuItemEvent({ "Navigate", "Previous Highlighted Error" })
DataGrip.searchEverywhere = Application.createMenuItemEvent({ "Navigate", "Search Everywhere" })
DataGrip.bookmarks = Application.createMenuItemChooserEvent({ "Navigate", "Bookmarks" })
DataGrip.navigateInFile = Application.createMenuItemChooserEvent({ "Navigate", "Navigate in File" })
-- Code actions
DataGrip.commentWithLineComment = Application.createMenuItemEvent({ "Code", "Comment with Line Comment" })
DataGrip.insertLiveTemplate = Application.createMenuItemEvent({ "Code", "Insert Live Template..." })
DataGrip.generate = Application.createMenuItemEvent({ "Code", "Generate..." })
DataGrip.commentWithBlockComment = Application.createMenuItemEvent({ "Code", "Comment with Block Comment" })
DataGrip.surroundWith = Application.createMenuItemEvent({ "Code", "Surround With..." })
DataGrip.autoIndentLines = Application.createMenuItemEvent({ "Code", "Auto-Indent Lines" })
DataGrip.unwrapRemove = Application.createMenuItemEvent({ "Code", "Unwrap/Remove..." })
DataGrip.configureCurrentFileAnalysis = Application.createMenuItemEvent({ "Code", "Configure Current File Analysis..." })
DataGrip.runInspectionByName = Application.createMenuItemEvent({ "Code", "Run Inspection by Name..." })
DataGrip.reformatFile = Application.createMenuItemEvent({ "Code", "Reformat File..." })
DataGrip.codeCleanup = Application.createMenuItemEvent({ "Code", "Code Cleanup..." })
DataGrip.dataFlowFromHere = Application.createMenuItemEvent({ "Code", "Data Flow from Here..." })
DataGrip.dataFlowToHere = Application.createMenuItemEvent({ "Code", "Data Flow to Here..." })
DataGrip.inspectCode = Application.createMenuItemEvent({ "Code", "Inspect Code..." })
DataGrip.locateDuplicates = Application.createMenuItemEvent({ "Code", "Locate Duplicates..." })
DataGrip.moveElementLeft = Application.createMenuItemEvent({ "Code", "Move Element Left" })
DataGrip.moveElementRight = Application.createMenuItemEvent({ "Code", "Move Element Right" })
DataGrip.moveLineDown = Application.createMenuItemEvent({ "Code", "Move Line Down" })
DataGrip.moveLineUp = Application.createMenuItemEvent({ "Code", "Move Line Up" })
DataGrip.moveStatementDown = Application.createMenuItemEvent({ "Code", "Move Statement Down" })
DataGrip.moveStatementUp = Application.createMenuItemEvent({ "Code", "Move Statement Up" })
DataGrip.silentCodeCleanup = Application.createMenuItemEvent({ "Code", "Silent Code Cleanup" })
DataGrip.viewOfflineInspectionResults = Application.createMenuItemEvent({ "Code", "View Offline Inspection Results..." })
DataGrip.codeCompletion = Application.createMenuItemChooserEvent({ "Code", "Code Completion" })
DataGrip.folding = Application.createMenuItemChooserEvent({ "Code", "Folding" })
-- Refactor actions
DataGrip.safeDelete = Application.createMenuItemEvent({ "Refactor", "Safe Delete..." })
DataGrip.inline = Application.createMenuItemEvent({ "Refactor", "Inline..." })
DataGrip.refactorThis = Application.createMenuItemEvent({ "Refactor", "Refactor This..." })
DataGrip.copy = Application.createMenuItemEvent({ "Refactor", "Copy..." })
DataGrip.invertBoolean = Application.createMenuItemEvent({ "Refactor", "Invert Boolean..." })
DataGrip.move = Application.createMenuItemEvent({ "Refactor", "Move..." })
DataGrip.rename = Application.createMenuItemEvent({ "Refactor", "Rename..." })
-- Run actions
DataGrip.debug = Application.createMenuItemEvent({ "Run", "Debug..." })
DataGrip.run = Application.createMenuItemEvent({ "Run", "Run..." })
DataGrip.debug = Application.createMenuItemEvent({ "Run", "Debug" })
DataGrip.run = Application.createMenuItemEvent({ "Run", "Run" })
DataGrip.editConfigurations = Application.createMenuItemEvent({ "Run", "Edit Configurations..." })
DataGrip.importTestsFromFile = Application.createMenuItemEvent({ "Run", "Import Tests from File..." })
DataGrip.runWithCoverage = Application.createMenuItemEvent({ "Run", "Run with Coverage" })
DataGrip.showCodeCoverageData = Application.createMenuItemEvent({ "Run", "Show Code Coverage Data" })
DataGrip.showRunningList = Application.createMenuItemEvent({ "Run", "Show Running List" })
DataGrip.stopBackgroundProcesses = Application.createMenuItemEvent({ "Run", "Stop Background Processes..." })
DataGrip.stop = Application.createMenuItemEvent({ "Run", "Stop" })
DataGrip.viewBreakpoints = Application.createMenuItemEvent({ "Run", "View Breakpoints..." })
DataGrip.debuggingActions = Application.createMenuItemChooserEvent({ "Run", "Debugging Actions" })
DataGrip.runWithProfiler = Application.createMenuItemChooserEvent({ "Run", "Run with Profiler" })
DataGrip.testHistory = Application.createMenuItemChooserEvent({ "Run", "Test History" })
DataGrip.toggleBreakpoint = Application.createMenuItemChooserEvent({ "Run", "Toggle Breakpoint" })
-- Tools actions
DataGrip.createCommandLineLauncher = Application.createMenuItemEvent({ "Tools", "Create Command-line Launcher..." })
DataGrip.IDEScriptingConsole = Application.createMenuItemEvent({ "Tools", "IDE Scripting Console" })
DataGrip.saveFileAsTemplate = Application.createMenuItemEvent({ "Tools", "Save File as Template..." })
DataGrip.saveAsLiveTemplate = Application.createMenuItemEvent({ "Tools", "Save as Live Template..." })
DataGrip.vimEmulator = Application.createMenuItemEvent({ "Tools", "Vim Emulator" })
DataGrip.XMLActions = Application.createMenuItemChooserEvent({ "Tools", "XML Actions" })
-- Window actions
DataGrip.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
DataGrip.nextProjectWindow = Application.createMenuItemEvent({ "Window", "Next Project Window" })
DataGrip.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
DataGrip.previousProjectWindow = Application.createMenuItemEvent({ "Window", "Previous Project Window" })
DataGrip.restoreDefaultLayout = Application.createMenuItemEvent({ "Window", "Restore Default Layout" })
DataGrip.storeCurrentLayoutAsDefault = Application.createMenuItemEvent({ "Window", "Store Current Layout as Default" })
DataGrip.default = Application.createMenuItemEvent({ "Window", "default" })
DataGrip.activeToolWindow = Application.createMenuItemChooserEvent({ "Window", "Active Tool Window" })
DataGrip.backgroundTasks = Application.createMenuItemChooserEvent({ "Window", "Background Tasks" })
DataGrip.editorTabs = Application.createMenuItemChooserEvent({ "Window", "Editor Tabs" })
DataGrip.notifications = Application.createMenuItemChooserEvent({ "Window", "Notifications" })
-- Help actions
DataGrip.findAction = Application.createMenuItemEvent({ "Help", "Find Action..." })
DataGrip.changeMemorySettings = Application.createMenuItemEvent({ "Help", "Change Memory Settings" })
DataGrip.collectLogsAndDiagnosticData = Application.createMenuItemEvent({ "Help", "Collect Logs and Diagnostic Data" })
DataGrip.contactSupport = Application.createMenuItemEvent({ "Help", "Contact Support..." })
DataGrip.demosAndScreencasts = Application.createMenuItemEvent({ "Help", "Demos and Screencasts" })
DataGrip.editCustomProperties = Application.createMenuItemEvent({ "Help", "Edit Custom Properties..." })
DataGrip.editCustomVMOptions = Application.createMenuItemEvent({ "Help", "Edit Custom VM Options..." })
DataGrip.gettingStarted = Application.createMenuItemEvent({ "Help", "Getting Started" })
DataGrip.help = Application.createMenuItemEvent({ "Help", "Help" })
DataGrip.productivityGuide = Application.createMenuItemEvent({ "Help", "Productivity Guide" })
DataGrip.register = Application.createMenuItemEvent({ "Help", "Register..." })
DataGrip.showLogInFinder = Application.createMenuItemEvent({ "Help", "Show Log in Finder" })
DataGrip.showSQLLogInFinder = Application.createMenuItemEvent({ "Help", "Show SQL Log in Finder" })
DataGrip.submitFeedback = Application.createMenuItemEvent({ "Help", "Submit Feedback..." })
DataGrip.submitABugReport = Application.createMenuItemEvent({ "Help", "Submit a Bug Report..." })
DataGrip.tipOfTheDay = Application.createMenuItemEvent({ "Help", "Tip of the Day" })
DataGrip.diagnosticTools = Application.createMenuItemChooserEvent({ "Help", "Diagnostic Tools" })

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
