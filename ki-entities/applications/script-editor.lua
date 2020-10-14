----------------------------------------------------------------------------------------------------
-- Script Editor application config
--
local Application = spoon.Ki.Application
local ScriptEditor = Application:new("Script Editor")

-- File actions
ScriptEditor.new = Application.createMenuItemEvent({ "File", "New" })
ScriptEditor.open = Application.createMenuItemEvent({ "File", "Open…" })
ScriptEditor.print = Application.createMenuItemEvent({ "File", "Print…" })
ScriptEditor.save = Application.createMenuItemEvent({ "File", "Save…" })
ScriptEditor.close = Application.createMenuItemEvent({ "File", "Close" })
ScriptEditor.closeAll = Application.createMenuItemEvent({ "File", "Close All" })
ScriptEditor.openDictionary = Application.createMenuItemEvent({ "File", "Open Dictionary…" })
ScriptEditor.pageSetup = Application.createMenuItemEvent({ "File", "Page Setup…" })
ScriptEditor.duplicate = Application.createMenuItemEvent({ "File", "Duplicate" })
ScriptEditor.saveAs = Application.createMenuItemEvent({ "File", "Save As…" })
ScriptEditor.export = Application.createMenuItemEvent({ "File", "Export…" })
ScriptEditor.moveTo = Application.createMenuItemEvent({ "File", "Move To…" })
ScriptEditor.rename = Application.createMenuItemEvent({ "File", "Rename…" })
ScriptEditor.newFromTemplate = Application.createMenuItemChooserEvent({ "File", "New from Template" })
ScriptEditor.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" })
ScriptEditor.revertTo = Application.createMenuItemChooserEvent({ "File", "Revert To" })
ScriptEditor.share = Application.createMenuItemChooserEvent({ "File", "Share" })
-- Edit actions
ScriptEditor.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
ScriptEditor.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
ScriptEditor.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
ScriptEditor.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
ScriptEditor.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
ScriptEditor.pasteReference = Application.createMenuItemEvent({ "Edit", "Paste Reference" })
ScriptEditor.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
ScriptEditor.pasteAndMatchStyle = Application.createMenuItemEvent({ "Edit", "Paste and Match Style" })
ScriptEditor.complete = Application.createMenuItemEvent({ "Edit", "Complete" })
ScriptEditor.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
ScriptEditor.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
ScriptEditor.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
ScriptEditor.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
ScriptEditor.speech = Application.createMenuItemChooserEvent({ "Edit", "Speech" })
ScriptEditor.spellingAndGrammar = Application.createMenuItemChooserEvent({ "Edit", "Spelling and Grammar" })
ScriptEditor.substitutions = Application.createMenuItemChooserEvent({ "Edit", "Substitutions" })
ScriptEditor.transformations = Application.createMenuItemChooserEvent({ "Edit", "Transformations" })
-- View actions
ScriptEditor.showBundleContents = Application.createMenuItemEvent({ "View", "Show Bundle Contents" })
ScriptEditor.showDescription = Application.createMenuItemEvent({ "View", "Show Description" })
ScriptEditor.showResult = Application.createMenuItemEvent({ "View", "Show Result" })
ScriptEditor.showLog = Application.createMenuItemEvent({ "View", "Show Log" })
ScriptEditor.showAccessoryView = Application.createMenuItemEvent({ "View", "Show Accessory View" })
ScriptEditor.customizeToolbar = Application.createMenuItemEvent({ "View", "Customize Toolbar…" })
ScriptEditor.enterFullScreen = Application.createMenuItemEvent({ "View", "Enter Full Screen" })
ScriptEditor.hideNavigationBar = Application.createMenuItemEvent({ "View", "Hide Navigation Bar" })
ScriptEditor.hideToolbar = Application.createMenuItemEvent({ "View", "Hide Toolbar" })
ScriptEditor.showAllTabs = Application.createMenuItemEvent({ "View", "Show All Tabs" })
ScriptEditor.showTabBar = Application.createMenuItemEvent({ "View", "Show Tab Bar" })
-- Script actions
ScriptEditor.stop = Application.createMenuItemEvent({ "Script", "Stop" })
ScriptEditor.compile = Application.createMenuItemEvent({ "Script", "Compile" })
ScriptEditor.run = Application.createMenuItemEvent({ "Script", "Run" })
ScriptEditor.runApplication = Application.createMenuItemEvent({ "Script", "Run Application" })
ScriptEditor.runInForeground = Application.createMenuItemEvent({ "Script", "Run in Foreground" })
ScriptEditor.record = Application.createMenuItemEvent({ "Script", "Record" })
-- Font actions
ScriptEditor.bigger = Application.createMenuItemEvent({ "Font", "Bigger" })
ScriptEditor.smaller = Application.createMenuItemEvent({ "Font", "Smaller" })
ScriptEditor.bold = Application.createMenuItemEvent({ "Font", "Bold" })
ScriptEditor.italic = Application.createMenuItemEvent({ "Font", "Italic" })
ScriptEditor.showFonts = Application.createMenuItemEvent({ "Font", "Show Fonts" })
ScriptEditor.underline = Application.createMenuItemEvent({ "Font", "Underline" })
ScriptEditor.copyStyle = Application.createMenuItemEvent({ "Font", "Copy Style" })
ScriptEditor.pasteStyle = Application.createMenuItemEvent({ "Font", "Paste Style" })
ScriptEditor.showColors = Application.createMenuItemEvent({ "Font", "Show Colors" })
ScriptEditor.outline = Application.createMenuItemEvent({ "Font", "Outline" })
ScriptEditor.styles = Application.createMenuItemEvent({ "Font", "Styles…" })
ScriptEditor.baseline = Application.createMenuItemChooserEvent({ "Font", "Baseline" })
ScriptEditor.characterShape = Application.createMenuItemChooserEvent({ "Font", "Character Shape" })
ScriptEditor.kern = Application.createMenuItemChooserEvent({ "Font", "Kern" })
ScriptEditor.ligatures = Application.createMenuItemChooserEvent({ "Font", "Ligatures" })
-- Format actions
ScriptEditor.alignLeft = Application.createMenuItemEvent({ "Format", "Align Left" })
ScriptEditor.center = Application.createMenuItemEvent({ "Format", "Center" })
ScriptEditor.alignRight = Application.createMenuItemEvent({ "Format", "Align Right" })
ScriptEditor.copyRuler = Application.createMenuItemEvent({ "Format", "Copy Ruler" })
ScriptEditor.pasteRuler = Application.createMenuItemEvent({ "Format", "Paste Ruler" })
ScriptEditor.justify = Application.createMenuItemEvent({ "Format", "Justify" })
ScriptEditor.showRuler = Application.createMenuItemEvent({ "Format", "Show Ruler" })
ScriptEditor.spacing = Application.createMenuItemEvent({ "Format", "Spacing…" })
ScriptEditor.writingDirection = Application.createMenuItemChooserEvent({ "Format", "Writing Direction" })
-- Window actions
ScriptEditor.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
ScriptEditor.logHistory = Application.createMenuItemEvent({ "Window", "Log History" })
ScriptEditor.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
ScriptEditor.library = Application.createMenuItemEvent({ "Window", "Library" })
ScriptEditor.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
ScriptEditor.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
ScriptEditor.mergeAllWindows = Application.createMenuItemEvent({ "Window", "Merge All Windows" })
ScriptEditor.moveTabToNewWindow = Application.createMenuItemEvent({ "Window", "Move Tab to New Window" })
ScriptEditor.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
ScriptEditor.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
ScriptEditor.saveAsDefault = Application.createMenuItemEvent({ "Window", "Save as Default" })
ScriptEditor.showNextTab = Application.createMenuItemEvent({ "Window", "Show Next Tab" })
ScriptEditor.showPreviousTab = Application.createMenuItemEvent({ "Window", "Show Previous Tab" })
ScriptEditor.untitled = Application.createMenuItemEvent({ "Window", "Untitled" })
ScriptEditor.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
ScriptEditor.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
ScriptEditor.openExampleScriptsFolder = Application.createMenuItemEvent({ "Help", "Open Example Scripts Folder" })
ScriptEditor.scriptEditorHelp = Application.createMenuItemEvent({ "Help", "Script Editor Help" })
ScriptEditor.showAppleScriptHelp = Application.createMenuItemEvent({ "Help", "Show AppleScript Help" })
ScriptEditor.showAppleScriptLanguageGuide = Application.createMenuItemEvent({ "Help", "Show AppleScript Language Guide" })

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
