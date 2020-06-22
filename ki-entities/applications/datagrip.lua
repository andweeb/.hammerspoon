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
    { nil, ";", DataGrip.dataSources, { "File", "Data Sources..." } },
    { nil, "s", DataGrip.saveAll, { "File", "Save All" } },
    { { "alt" }, "y", DataGrip.reloadAllFromDisk, { "File", "Reload All from Disk" } },
    { { "shift" }, "o", DataGrip.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "s", DataGrip.saveAs, { "File", "Save As..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.attachDirectoryToProject, { "File", "Attach Directory to Project" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.closeProject, { "File", "Close Project" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.invalidateCachesRestart, { "File", "Invalidate Caches / Restart..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.open, { "File", "Open..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.powerSaveMode, { "File", "Power Save Mode" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.print, { "File", "Print..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.renameProject, { "File", "Rename Project..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.export, { "File", "Export" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fileProperties, { "File", "File Properties" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.localHistory, { "File", "Local History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.manageIDESettings, { "File", "Manage IDE Settings" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.newProjectsSettings, { "File", "New Projects Settings" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.new, { "File", "New" } },
    -- Edit
    { nil, "a", DataGrip.selectAll, { "Edit", "Select All" } },
    { nil, "x", DataGrip.cut, { "Edit", "Cut" } },
    { nil, "z", DataGrip.undo, { "Edit", "Undo" } },
    { { "shift" }, "u", DataGrip.toggleCase, { "Edit", "Toggle Case" } },
    { { "shift" }, "z", DataGrip.redo, { "Edit", "Redo" } },
    { { "shift", "ctrl" }, "j", DataGrip.joinLines, { "Edit", "Join Lines" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.encodeXMLHTMLSpecialCharacters, { "Edit", "Encode XML/HTML Special Characters" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.extendSelection, { "Edit", "Extend Selection" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fillParagraph, { "Edit", "Fill Paragraph" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.indentSelection, { "Edit", "Indent Selection" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.reverseLines, { "Edit", "Reverse Lines" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.shrinkSelection, { "Edit", "Shrink Selection" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.sortLines, { "Edit", "Sort Lines" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.unindentLineOrSelection, { "Edit", "Unindent Line or Selection" } },
    { {  }, "", DataGrip.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.convertIndents, { "Edit", "Convert Indents" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.findUsages, { "Edit", "Find Usages" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.macros, { "Edit", "Macros" } },
    -- View
    { nil, "e", DataGrip.recentFiles, { "View", "Recent Files" } },
    { { "ctrl" }, "`", DataGrip.quickSwitchScheme, { "View", "Quick Switch Scheme..." } },
    { { "shift" }, "e", DataGrip.recentLocations, { "View", "Recent Locations" } },
    { { "shift", "alt" }, "c", DataGrip.recentChanges, { "View", "Recent Changes" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.compareWithClipboard, { "View", "Compare with Clipboard" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.quickDefinition, { "View", "Quick Definition" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.quickTypeDefinition, { "View", "Quick Type Definition" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.recentlyChangedFiles, { "View", "Recently Changed Files" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.appearance, { "View", "Appearance" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.bidiTextBaseDirection, { "View", "Bidi Text Base Direction" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.toolWindows, { "View", "Tool Windows" } },
    -- Navigate
    { nil, "[", DataGrip.back, { "Navigate", "Back" } },
    { nil, "]", DataGrip.forward, { "Navigate", "Forward" } },
    { nil, "b", DataGrip.declarationOrUsages, { "Navigate", "Declaration or Usages" } },
    { nil, "o", DataGrip.tableRoutineClass, { "Navigate", "Table/Routine/Class..." } },
    { nil, "u", DataGrip.superMethod, { "Navigate", "Super Method" } },
    { { "alt" }, "b", DataGrip.relatedSymbol, { "Navigate", "Related Symbol..." } },
    { { "alt" }, "o", DataGrip.symbol, { "Navigate", "Symbol..." } },
    { { "cmd", "shift" }, "o", DataGrip.file, { "Navigate", "File..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.fileStructure, { "Navigate", "File Structure" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.implementationS, { "Navigate", "Implementation(s)" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.jumpToNavigationBar, { "Navigate", "Jump to Navigation Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.lastEditLocation, { "Navigate", "Last Edit Location" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextEditLocation, { "Navigate", "Next Edit Location" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextEmmetEditPoint, { "Navigate", "Next Emmet Edit Point" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.nextHighlightedError, { "Navigate", "Next Highlighted Error" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.previousEmmetEditPoint, { "Navigate", "Previous Emmet Edit Point" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.previousHighlightedError, { "Navigate", "Previous Highlighted Error" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.searchEverywhere, { "Navigate", "Search Everywhere" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.bookmarks, { "Navigate", "Bookmarks" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.navigateInFile, { "Navigate", "Navigate in File" } },
    -- Code
    { nil, "/", DataGrip.commentWithLineComment, { "Code", "Comment with Line Comment" } },
    { nil, "j", DataGrip.insertLiveTemplate, { "Code", "Insert Live Template..." } },
    { nil, "n", DataGrip.generate, { "Code", "Generate..." } },
    { { "alt" }, "/", DataGrip.commentWithBlockComment, { "Code", "Comment with Block Comment" } },
    { { "alt" }, "t", DataGrip.surroundWith, { "Code", "Surround With..." } },
    { { "alt", "ctrl" }, "i", DataGrip.autoIndentLines, { "Code", "Auto-Indent Lines" } },
    { { "shift" }, "", DataGrip.unwrapRemove, { "Code", "Unwrap/Remove..." } },
    { { "shift", "alt" }, "h", DataGrip.configureCurrentFileAnalysis, { "Code", "Configure Current File Analysis..." } },
    { { "shift", "alt" }, "i", DataGrip.runInspectionByName, { "Code", "Run Inspection by Name..." } },
    { { "shift", "alt" }, "l", DataGrip.reformatFile, { "Code", "Reformat File..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.codeCleanup, { "Code", "Code Cleanup..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.dataFlowFromHere, { "Code", "Data Flow from Here..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.dataFlowToHere, { "Code", "Data Flow to Here..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.inspectCode, { "Code", "Inspect Code..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.locateDuplicates, { "Code", "Locate Duplicates..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveElementLeft, { "Code", "Move Element Left" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveElementRight, { "Code", "Move Element Right" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveLineDown, { "Code", "Move Line Down" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveLineUp, { "Code", "Move Line Up" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveStatementDown, { "Code", "Move Statement Down" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.moveStatementUp, { "Code", "Move Statement Up" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.silentCodeCleanup, { "Code", "Silent Code Cleanup" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.viewOfflineInspectionResults, { "Code", "View Offline Inspection Results..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.codeCompletion, { "Code", "Code Completion" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.folding, { "Code", "Folding" } },
    -- Refactor
    { nil, "", DataGrip.safeDelete, { "Refactor", "Safe Delete..." } },
    { { "alt" }, "n", DataGrip.inline, { "Refactor", "Inline..." } },
    { { "ctrl" }, "t", DataGrip.refactorThis, { "Refactor", "Refactor This..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.copy, { "Refactor", "Copy..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.invertBoolean, { "Refactor", "Invert Boolean..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.move, { "Refactor", "Move..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.rename, { "Refactor", "Rename..." } },
    -- Run
    { nil, "d", DataGrip.debug, { "Run", "Debug" } },
    { nil, "r", DataGrip.run, { "Run", "Run" } },
    { { "alt", "ctrl" }, "d", DataGrip.debug, { "Run", "Debug..." } },
    { { "alt", "ctrl" }, "r", DataGrip.run, { "Run", "Run..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editConfigurations, { "Run", "Edit Configurations..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.importTestsFromFile, { "Run", "Import Tests from File..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.runWithCoverage, { "Run", "Run with Coverage" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showCodeCoverageData, { "Run", "Show Code Coverage Data" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showRunningList, { "Run", "Show Running List" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.stopBackgroundProcesses, { "Run", "Stop Background Processes..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.stop, { "Run", "Stop" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.viewBreakpoints, { "Run", "View Breakpoints..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.debuggingActions, { "Run", "Debugging Actions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.runWithProfiler, { "Run", "Run with Profiler" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.testHistory, { "Run", "Test History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.toggleBreakpoint, { "Run", "Toggle Breakpoint" } },
    -- Tools
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.createCommandLineLauncher, { "Tools", "Create Command-line Launcher..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.IDEScriptingConsole, { "Tools", "IDE Scripting Console" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.saveFileAsTemplate, { "Tools", "Save File as Template..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.saveAsLiveTemplate, { "Tools", "Save as Live Template..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.vimEmulator, { "Tools", "Vim Emulator" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.XMLActions, { "Tools", "XML Actions" } },
    -- Window
    { nil, "m", DataGrip.minimize, { "Window", "Minimize" } },
    { { "alt" }, "`", DataGrip.nextProjectWindow, { "Window", "Next Project Window" } },
    { { "ctrl" }, "=", DataGrip.zoom, { "Window", "Zoom" } },
    { { "shift", "alt" }, "`", DataGrip.previousProjectWindow, { "Window", "Previous Project Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.restoreDefaultLayout, { "Window", "Restore Default Layout" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.storeCurrentLayoutAsDefault, { "Window", "Store Current Layout as Default" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.default, { "Window", "default" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.activeToolWindow, { "Window", "Active Tool Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.backgroundTasks, { "Window", "Background Tasks" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editorTabs, { "Window", "Editor Tabs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.notifications, { "Window", "Notifications" } },
    -- Help
    { { "shift" }, "a", DataGrip.findAction, { "Help", "Find Action..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.changeMemorySettings, { "Help", "Change Memory Settings" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.collectLogsAndDiagnosticData, { "Help", "Collect Logs and Diagnostic Data" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.contactSupport, { "Help", "Contact Support..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.demosAndScreencasts, { "Help", "Demos and Screencasts" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editCustomProperties, { "Help", "Edit Custom Properties..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.editCustomVMOptions, { "Help", "Edit Custom VM Options..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.gettingStarted, { "Help", "Getting Started" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.help, { "Help", "Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.productivityGuide, { "Help", "Productivity Guide" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.register, { "Help", "Register..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showLogInFinder, { "Help", "Show Log in Finder" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.showSQLLogInFinder, { "Help", "Show SQL Log in Finder" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.submitFeedback, { "Help", "Submit Feedback..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.submitABugReport, { "Help", "Submit a Bug Report..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.tipOfTheDay, { "Help", "Tip of the Day" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", DataGrip.diagnosticTools, { "Help", "Diagnostic Tools" } },
})

return DataGrip
