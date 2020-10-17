----------------------------------------------------------------------------------------------------
-- Script Editor application config
--
local Application = spoon.Ki.Application
local ScriptEditor = Application:new("Script Editor")

-- File actions
ScriptEditor.new = Application:createMenuItemAction({ "File", "New" })
ScriptEditor.open = Application:createMenuItemAction({ "File", "Open…" })
ScriptEditor.print = Application:createMenuItemAction({ "File", "Print…" })
ScriptEditor.save = Application:createMenuItemAction({ "File", "Save…" })
ScriptEditor.close = Application:createMenuItemAction({ "File", "Close" })
ScriptEditor.closeAll = Application:createMenuItemAction({ "File", "Close All" })
ScriptEditor.openDictionary = Application:createMenuItemAction({ "File", "Open Dictionary…" })
ScriptEditor.pageSetup = Application:createMenuItemAction({ "File", "Page Setup…" })
ScriptEditor.duplicate = Application:createMenuItemAction({ "File", "Duplicate" })
ScriptEditor.saveAs = Application:createMenuItemAction({ "File", "Save As…" })
ScriptEditor.export = Application:createMenuItemAction({ "File", "Export…" })
ScriptEditor.moveTo = Application:createMenuItemAction({ "File", "Move To…" })
ScriptEditor.rename = Application:createMenuItemAction({ "File", "Rename…" })
ScriptEditor.newFromTemplate = Application:createChooseMenuItemAction({ "File", "New from Template" })
ScriptEditor.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
ScriptEditor.revertTo = Application:createChooseMenuItemAction({ "File", "Revert To" })
ScriptEditor.share = Application:createChooseMenuItemAction({ "File", "Share" })
-- Edit actions
ScriptEditor.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
ScriptEditor.copy = Application:createMenuItemAction({ "Edit", "Copy" })
ScriptEditor.paste = Application:createMenuItemAction({ "Edit", "Paste" })
ScriptEditor.cut = Application:createMenuItemAction({ "Edit", "Cut" })
ScriptEditor.undo = Application:createMenuItemAction({ "Edit", "Undo" })
ScriptEditor.pasteReference = Application:createMenuItemAction({ "Edit", "Paste Reference" })
ScriptEditor.redo = Application:createMenuItemAction({ "Edit", "Redo" })
ScriptEditor.pasteAndMatchStyle = Application:createMenuItemAction({ "Edit", "Paste and Match Style" })
ScriptEditor.complete = Application:createMenuItemAction({ "Edit", "Complete" })
ScriptEditor.delete = Application:createMenuItemAction({ "Edit", "Delete" })
ScriptEditor.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
ScriptEditor.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
ScriptEditor.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
ScriptEditor.speech = Application:createChooseMenuItemAction({ "Edit", "Speech" })
ScriptEditor.spellingAndGrammar = Application:createChooseMenuItemAction({ "Edit", "Spelling and Grammar" })
ScriptEditor.substitutions = Application:createChooseMenuItemAction({ "Edit", "Substitutions" })
ScriptEditor.transformations = Application:createChooseMenuItemAction({ "Edit", "Transformations" })
-- View actions
ScriptEditor.showBundleContents = Application:createMenuItemAction({ "View", "Show Bundle Contents" })
ScriptEditor.showDescription = Application:createMenuItemAction({ "View", "Show Description" })
ScriptEditor.showResult = Application:createMenuItemAction({ "View", "Show Result" })
ScriptEditor.showLog = Application:createMenuItemAction({ "View", "Show Log" })
ScriptEditor.showAccessoryView = Application:createMenuItemAction({ "View", "Show Accessory View" })
ScriptEditor.customizeToolbar = Application:createMenuItemAction({ "View", "Customize Toolbar…" })
ScriptEditor.enterFullScreen = Application:createMenuItemAction({ "View", "Enter Full Screen" })
ScriptEditor.hideNavigationBar = Application:createMenuItemAction({ "View", "Hide Navigation Bar" })
ScriptEditor.hideToolbar = Application:createMenuItemAction({ "View", "Hide Toolbar" })
ScriptEditor.showAllTabs = Application:createMenuItemAction({ "View", "Show All Tabs" })
ScriptEditor.showTabBar = Application:createMenuItemAction({ "View", "Show Tab Bar" })
-- Script actions
ScriptEditor.stop = Application:createMenuItemAction({ "Script", "Stop" })
ScriptEditor.compile = Application:createMenuItemAction({ "Script", "Compile" })
ScriptEditor.run = Application:createMenuItemAction({ "Script", "Run" })
ScriptEditor.runApplication = Application:createMenuItemAction({ "Script", "Run Application" })
ScriptEditor.runInForeground = Application:createMenuItemAction({ "Script", "Run in Foreground" })
ScriptEditor.record = Application:createMenuItemAction({ "Script", "Record" })
-- Font actions
ScriptEditor.bigger = Application:createMenuItemAction({ "Font", "Bigger" })
ScriptEditor.smaller = Application:createMenuItemAction({ "Font", "Smaller" })
ScriptEditor.bold = Application:createMenuItemAction({ "Font", "Bold" })
ScriptEditor.italic = Application:createMenuItemAction({ "Font", "Italic" })
ScriptEditor.showFonts = Application:createMenuItemAction({ "Font", "Show Fonts" })
ScriptEditor.underline = Application:createMenuItemAction({ "Font", "Underline" })
ScriptEditor.copyStyle = Application:createMenuItemAction({ "Font", "Copy Style" })
ScriptEditor.pasteStyle = Application:createMenuItemAction({ "Font", "Paste Style" })
ScriptEditor.showColors = Application:createMenuItemAction({ "Font", "Show Colors" })
ScriptEditor.outline = Application:createMenuItemAction({ "Font", "Outline" })
ScriptEditor.styles = Application:createMenuItemAction({ "Font", "Styles…" })
ScriptEditor.baseline = Application:createChooseMenuItemAction({ "Font", "Baseline" })
ScriptEditor.characterShape = Application:createChooseMenuItemAction({ "Font", "Character Shape" })
ScriptEditor.kern = Application:createChooseMenuItemAction({ "Font", "Kern" })
ScriptEditor.ligatures = Application:createChooseMenuItemAction({ "Font", "Ligatures" })
-- Format actions
ScriptEditor.alignLeft = Application:createMenuItemAction({ "Format", "Align Left" })
ScriptEditor.center = Application:createMenuItemAction({ "Format", "Center" })
ScriptEditor.alignRight = Application:createMenuItemAction({ "Format", "Align Right" })
ScriptEditor.copyRuler = Application:createMenuItemAction({ "Format", "Copy Ruler" })
ScriptEditor.pasteRuler = Application:createMenuItemAction({ "Format", "Paste Ruler" })
ScriptEditor.justify = Application:createMenuItemAction({ "Format", "Justify" })
ScriptEditor.showRuler = Application:createMenuItemAction({ "Format", "Show Ruler" })
ScriptEditor.spacing = Application:createMenuItemAction({ "Format", "Spacing…" })
ScriptEditor.writingDirection = Application:createChooseMenuItemAction({ "Format", "Writing Direction" })
-- Window actions
ScriptEditor.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
ScriptEditor.logHistory = Application:createMenuItemAction({ "Window", "Log History" })
ScriptEditor.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
ScriptEditor.library = Application:createMenuItemAction({ "Window", "Library" })
ScriptEditor.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
ScriptEditor.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
ScriptEditor.mergeAllWindows = Application:createMenuItemAction({ "Window", "Merge All Windows" })
ScriptEditor.moveTabToNewWindow = Application:createMenuItemAction({ "Window", "Move Tab to New Window" })
ScriptEditor.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
ScriptEditor.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
ScriptEditor.saveAsDefault = Application:createMenuItemAction({ "Window", "Save as Default" })
ScriptEditor.showNextTab = Application:createMenuItemAction({ "Window", "Show Next Tab" })
ScriptEditor.showPreviousTab = Application:createMenuItemAction({ "Window", "Show Previous Tab" })
ScriptEditor.untitled = Application:createMenuItemAction({ "Window", "Untitled" })
ScriptEditor.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
ScriptEditor.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
ScriptEditor.openExampleScriptsFolder = Application:createMenuItemAction({ "Help", "Open Example Scripts Folder" })
ScriptEditor.scriptEditorHelp = Application:createMenuItemAction({ "Help", "Script Editor Help" })
ScriptEditor.showAppleScriptHelp = Application:createMenuItemAction({ "Help", "Show AppleScript Help" })
ScriptEditor.showAppleScriptLanguageGuide = Application:createMenuItemAction({ "Help", "Show AppleScript Language Guide" })

ScriptEditor:registerShortcuts({
    -- File
    { nil, "n", ScriptEditor.new, "New" },
    { nil, "o", ScriptEditor.open, "Open…" },
    { nil, "p", ScriptEditor.print, "Print…" },
    { nil, "s", ScriptEditor.save, "Save…" },
    { nil, "w", ScriptEditor.close, "Close" },
    { { "alt" }, "w", ScriptEditor.closeAll, "Close All" },
    { { "shift" }, "o", ScriptEditor.openDictionary, "Open Dictionary…" },
    { { "shift" }, "p", ScriptEditor.pageSetup, "Page Setup…" },
    { { "shift" }, "s", ScriptEditor.duplicate, "Duplicate" },
    { { "shift", "alt" }, "s", ScriptEditor.saveAs, "Save As…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.export, "Export…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveTo, "Move To…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.rename, "Rename…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.newFromTemplate, "New from Template" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.openRecent, "Open Recent" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.revertTo, "Revert To" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.share, "Share" },
    -- Edit
    { nil, "a", ScriptEditor.selectAll, "Select All" },
    { nil, "c", ScriptEditor.copy, "Copy" },
    { nil, "v", ScriptEditor.paste, "Paste" },
    { nil, "x", ScriptEditor.cut, "Cut" },
    { nil, "z", ScriptEditor.undo, "Undo" },
    { { "shift" }, "v", ScriptEditor.pasteReference, "Paste Reference" },
    { { "shift" }, "z", ScriptEditor.redo, "Redo" },
    { { "shift", "alt" }, "v", ScriptEditor.pasteAndMatchStyle, "Paste and Match Style" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.complete, "Complete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.speech, "Speech" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.spellingAndGrammar, "Spelling and Grammar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.substitutions, "Substitutions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.transformations, "Transformations" },
    -- View
    { nil, "0", ScriptEditor.showBundleContents, "Show Bundle Contents" },
    { nil, "1", ScriptEditor.showDescription, "Show Description" },
    { nil, "2", ScriptEditor.showResult, "Show Result" },
    { nil, "3", ScriptEditor.showLog, "Show Log" },
    { nil, "9", ScriptEditor.showAccessoryView, "Show Accessory View" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.customizeToolbar, "Customize Toolbar…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.enterFullScreen, "Enter Full Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.hideNavigationBar, "Hide Navigation Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.hideToolbar, "Hide Toolbar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAllTabs, "Show All Tabs" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showTabBar, "Show Tab Bar" },
    -- Script
    { nil, ".", ScriptEditor.stop, "Stop" },
    { nil, "k", ScriptEditor.compile, "Compile" },
    { nil, "r", ScriptEditor.run, "Run" },
    { { "alt" }, "r", ScriptEditor.runApplication, "Run Application" },
    { { "ctrl" }, "r", ScriptEditor.runInForeground, "Run in Foreground" },
    { { "shift" }, "r", ScriptEditor.record, "Record" },
    -- Font
    { nil, "+", ScriptEditor.bigger, "Bigger" },
    { nil, "-", ScriptEditor.smaller, "Smaller" },
    { nil, "b", ScriptEditor.bold, "Bold" },
    { nil, "i", ScriptEditor.italic, "Italic" },
    { nil, "t", ScriptEditor.showFonts, "Show Fonts" },
    { nil, "u", ScriptEditor.underline, "Underline" },
    { { "alt" }, "c", ScriptEditor.copyStyle, "Copy Style" },
    { { "alt" }, "v", ScriptEditor.pasteStyle, "Paste Style" },
    { { "shift" }, "c", ScriptEditor.showColors, "Show Colors" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.outline, "Outline" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.styles, "Styles…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.baseline, "Baseline" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.characterShape, "Character Shape" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.kern, "Kern" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.ligatures, "Ligatures" },
    -- Format
    { nil, "{", ScriptEditor.alignLeft, "Align Left" },
    { nil, "|", ScriptEditor.center, "Center" },
    { nil, "}", ScriptEditor.alignRight, "Align Right" },
    { { "ctrl" }, "c", ScriptEditor.copyRuler, "Copy Ruler" },
    { { "ctrl" }, "v", ScriptEditor.pasteRuler, "Paste Ruler" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.justify, "Justify" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showRuler, "Show Ruler" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.spacing, "Spacing…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.writingDirection, "Writing Direction" },
    -- Window
    { nil, "m", ScriptEditor.minimize, "Minimize" },
    { { "alt" }, "l", ScriptEditor.logHistory, "Log History" },
    { { "alt" }, "m", ScriptEditor.minimizeAll, "Minimize All" },
    { { "shift" }, "l", ScriptEditor.library, "Library" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.mergeAllWindows, "Merge All Windows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveTabToNewWindow, "Move Tab to New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.saveAsDefault, "Save as Default" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showNextTab, "Show Next Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showPreviousTab, "Show Previous Tab" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.untitled, "Untitled" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.openExampleScriptsFolder, "Open Example Scripts Folder" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.scriptEditorHelp, "Script Editor Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAppleScriptHelp, "Show AppleScript Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAppleScriptLanguageGuide, "Show AppleScript Language Guide" },
})

return ScriptEditor
