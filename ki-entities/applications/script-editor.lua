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
    { nil, "n", ScriptEditor.new, { "File", "New" } },
    { nil, "o", ScriptEditor.open, { "File", "Open…" } },
    { nil, "p", ScriptEditor.print, { "File", "Print…" } },
    { nil, "s", ScriptEditor.save, { "File", "Save…" } },
    { nil, "w", ScriptEditor.close, { "File", "Close" } },
    { { "alt" }, "w", ScriptEditor.closeAll, { "File", "Close All" } },
    { { "shift" }, "o", ScriptEditor.openDictionary, { "File", "Open Dictionary…" } },
    { { "shift" }, "p", ScriptEditor.pageSetup, { "File", "Page Setup…" } },
    { { "shift" }, "s", ScriptEditor.duplicate, { "File", "Duplicate" } },
    { { "shift", "alt" }, "s", ScriptEditor.saveAs, { "File", "Save As…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.export, { "File", "Export…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveTo, { "File", "Move To…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.rename, { "File", "Rename…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.newFromTemplate, { "File", "New from Template" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.openRecent, { "File", "Open Recent" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.revertTo, { "File", "Revert To" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.share, { "File", "Share" } },
    -- Edit
    { nil, "a", ScriptEditor.selectAll, { "Edit", "Select All" } },
    { nil, "c", ScriptEditor.copy, { "Edit", "Copy" } },
    { nil, "v", ScriptEditor.paste, { "Edit", "Paste" } },
    { nil, "x", ScriptEditor.cut, { "Edit", "Cut" } },
    { nil, "z", ScriptEditor.undo, { "Edit", "Undo" } },
    { { "shift" }, "v", ScriptEditor.pasteReference, { "Edit", "Paste Reference" } },
    { { "shift" }, "z", ScriptEditor.redo, { "Edit", "Redo" } },
    { { "shift", "alt" }, "v", ScriptEditor.pasteAndMatchStyle, { "Edit", "Paste and Match Style" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.complete, { "Edit", "Complete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.speech, { "Edit", "Speech" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.spellingAndGrammar, { "Edit", "Spelling and Grammar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.substitutions, { "Edit", "Substitutions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.transformations, { "Edit", "Transformations" } },
    -- View
    { nil, "0", ScriptEditor.showBundleContents, { "View", "Show Bundle Contents" } },
    { nil, "1", ScriptEditor.showDescription, { "View", "Show Description" } },
    { nil, "2", ScriptEditor.showResult, { "View", "Show Result" } },
    { nil, "3", ScriptEditor.showLog, { "View", "Show Log" } },
    { nil, "9", ScriptEditor.showAccessoryView, { "View", "Show Accessory View" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.customizeToolbar, { "View", "Customize Toolbar…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.enterFullScreen, { "View", "Enter Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.hideNavigationBar, { "View", "Hide Navigation Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.hideToolbar, { "View", "Hide Toolbar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAllTabs, { "View", "Show All Tabs" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showTabBar, { "View", "Show Tab Bar" } },
    -- Script
    { nil, ".", ScriptEditor.stop, { "Script", "Stop" } },
    { nil, "k", ScriptEditor.compile, { "Script", "Compile" } },
    { nil, "r", ScriptEditor.run, { "Script", "Run" } },
    { { "alt" }, "r", ScriptEditor.runApplication, { "Script", "Run Application" } },
    { { "ctrl" }, "r", ScriptEditor.runInForeground, { "Script", "Run in Foreground" } },
    { { "shift" }, "r", ScriptEditor.record, { "Script", "Record" } },
    -- Font
    { nil, "+", ScriptEditor.bigger, { "Font", "Bigger" } },
    { nil, "-", ScriptEditor.smaller, { "Font", "Smaller" } },
    { nil, "b", ScriptEditor.bold, { "Font", "Bold" } },
    { nil, "i", ScriptEditor.italic, { "Font", "Italic" } },
    { nil, "t", ScriptEditor.showFonts, { "Font", "Show Fonts" } },
    { nil, "u", ScriptEditor.underline, { "Font", "Underline" } },
    { { "alt" }, "c", ScriptEditor.copyStyle, { "Font", "Copy Style" } },
    { { "alt" }, "v", ScriptEditor.pasteStyle, { "Font", "Paste Style" } },
    { { "shift" }, "c", ScriptEditor.showColors, { "Font", "Show Colors" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.outline, { "Font", "Outline" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.styles, { "Font", "Styles…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.baseline, { "Font", "Baseline" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.characterShape, { "Font", "Character Shape" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.kern, { "Font", "Kern" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.ligatures, { "Font", "Ligatures" } },
    -- Format
    { nil, "{", ScriptEditor.alignLeft, { "Format", "Align Left" } },
    { nil, "|", ScriptEditor.center, { "Format", "Center" } },
    { nil, "}", ScriptEditor.alignRight, { "Format", "Align Right" } },
    { { "ctrl" }, "c", ScriptEditor.copyRuler, { "Format", "Copy Ruler" } },
    { { "ctrl" }, "v", ScriptEditor.pasteRuler, { "Format", "Paste Ruler" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.justify, { "Format", "Justify" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showRuler, { "Format", "Show Ruler" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.spacing, { "Format", "Spacing…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.writingDirection, { "Format", "Writing Direction" } },
    -- Window
    { nil, "m", ScriptEditor.minimize, { "Window", "Minimize" } },
    { { "alt" }, "l", ScriptEditor.logHistory, { "Window", "Log History" } },
    { { "alt" }, "m", ScriptEditor.minimizeAll, { "Window", "Minimize All" } },
    { { "shift" }, "l", ScriptEditor.library, { "Window", "Library" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.mergeAllWindows, { "Window", "Merge All Windows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveTabToNewWindow, { "Window", "Move Tab to New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.saveAsDefault, { "Window", "Save as Default" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showNextTab, { "Window", "Show Next Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showPreviousTab, { "Window", "Show Previous Tab" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.untitled, { "Window", "Untitled" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.openExampleScriptsFolder, { "Help", "Open Example Scripts Folder" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.scriptEditorHelp, { "Help", "Script Editor Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAppleScriptHelp, { "Help", "Show AppleScript Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", ScriptEditor.showAppleScriptLanguageGuide, { "Help", "Show AppleScript Language Guide" } },
})

return ScriptEditor
