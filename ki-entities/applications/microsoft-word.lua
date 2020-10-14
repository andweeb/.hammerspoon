----------------------------------------------------------------------------------------------------
-- Microsoft Word application config
--
local Application = spoon.Ki.Application
local MicrosoftWord = Application:new("Microsoft Word")

-- File actions
MicrosoftWord.newDocument = Application.createMenuItemEvent({ "File", "New Document" })
MicrosoftWord.open = Application.createMenuItemEvent({ "File", "Open..." })
MicrosoftWord.print = Application.createMenuItemEvent({ "File", "Print..." })
MicrosoftWord.save = Application.createMenuItemEvent({ "File", "Save" })
MicrosoftWord.close = Application.createMenuItemEvent({ "File", "Close" })
MicrosoftWord.newFromTemplate = Application.createMenuItemEvent({ "File", "New from Template..." })
MicrosoftWord.saveAs = Application.createMenuItemEvent({ "File", "Save As..." })
MicrosoftWord.alwaysOpenReadOnly = Application.createMenuItemEvent({ "File", "Always Open Read-Only" })
MicrosoftWord.browseVersionHistory = Application.createMenuItemEvent({ "File", "Browse Version History" })
MicrosoftWord.pageSetup = Application.createMenuItemEvent({ "File", "Page Setup..." })
MicrosoftWord.properties = Application.createMenuItemEvent({ "File", "Properties..." })
MicrosoftWord.reduceFileSize = Application.createMenuItemEvent({ "File", "Reduce File Size..." })
MicrosoftWord.saveAsTemplate = Application.createMenuItemEvent({ "File", "Save as Template..." })
MicrosoftWord.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" })
MicrosoftWord.restrictPermissions = Application.createMenuItemChooserEvent({ "File", "Restrict Permissions" })
MicrosoftWord.share = Application.createMenuItemChooserEvent({ "File", "Share" })
-- Edit actions
MicrosoftWord.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
MicrosoftWord.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
MicrosoftWord.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
MicrosoftWord.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
MicrosoftWord.canTRepeat = Application.createMenuItemEvent({ "Edit", "Can't Repeat" })
MicrosoftWord.canTUndo = Application.createMenuItemEvent({ "Edit", "Can't Undo" })
MicrosoftWord.pasteSpecial = Application.createMenuItemEvent({ "Edit", "Paste Special..." })
MicrosoftWord.toggleDrawing = Application.createMenuItemEvent({ "Edit", "Toggle Drawing" })
MicrosoftWord.pasteAndMatchFormatting = Application.createMenuItemEvent({ "Edit", "Paste and Match Formatting" })
MicrosoftWord.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
MicrosoftWord.links = Application.createMenuItemEvent({ "Edit", "Links..." })
MicrosoftWord.selectData = Application.createMenuItemEvent({ "Edit", "Select Data..." })
MicrosoftWord.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
MicrosoftWord.clear = Application.createMenuItemChooserEvent({ "Edit", "Clear" })
MicrosoftWord.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
-- View actions
MicrosoftWord.ribbon = Application.createMenuItemEvent({ "View", "Ribbon" })
MicrosoftWord.enterFullScreen = Application.createMenuItemEvent({ "View", "Enter Full Screen" })
MicrosoftWord.focus = Application.createMenuItemEvent({ "View", "Focus" })
MicrosoftWord.draft = Application.createMenuItemEvent({ "View", "Draft" })
MicrosoftWord.footnotes = Application.createMenuItemEvent({ "View", "Footnotes" })
MicrosoftWord.gridlines = Application.createMenuItemEvent({ "View", "Gridlines" })
MicrosoftWord.headerAndFooter = Application.createMenuItemEvent({ "View", "Header and Footer" })
MicrosoftWord.markup = Application.createMenuItemEvent({ "View", "Markup" })
MicrosoftWord.masterDocument = Application.createMenuItemEvent({ "View", "Master Document" })
MicrosoftWord.messageBar = Application.createMenuItemEvent({ "View", "Message Bar" })
MicrosoftWord.outline = Application.createMenuItemEvent({ "View", "Outline" })
MicrosoftWord.printLayout = Application.createMenuItemEvent({ "View", "Print Layout" })
MicrosoftWord.revealFormatting = Application.createMenuItemEvent({ "View", "Reveal Formatting" })
MicrosoftWord.ruler = Application.createMenuItemEvent({ "View", "Ruler" })
MicrosoftWord.webLayout = Application.createMenuItemEvent({ "View", "Web Layout" })
MicrosoftWord.zoom = Application.createMenuItemEvent({ "View", "Zoom" })
MicrosoftWord.sidebar = Application.createMenuItemChooserEvent({ "View", "Sidebar" })
-- Insert actions
MicrosoftWord.hyperlink = Application.createMenuItemEvent({ "Insert", "Hyperlink..." })
MicrosoftWord.equation = Application.createMenuItemEvent({ "Insert", "Equation" })
MicrosoftWord.advancedSymbol = Application.createMenuItemEvent({ "Insert", "Advanced Symbol..." })
MicrosoftWord.bookmark = Application.createMenuItemEvent({ "Insert", "Bookmark..." })
MicrosoftWord.caption = Application.createMenuItemEvent({ "Insert", "Caption..." })
MicrosoftWord.comment = Application.createMenuItemEvent({ "Insert", "Comment" })
MicrosoftWord.crossReference = Application.createMenuItemEvent({ "Insert", "Cross-reference..." })
MicrosoftWord.dateAndTime = Application.createMenuItemEvent({ "Insert", "Date and Time..." })
MicrosoftWord.field = Application.createMenuItemEvent({ "Insert", "Field..." })
MicrosoftWord.file = Application.createMenuItemEvent({ "Insert", "File..." })
MicrosoftWord.footnote = Application.createMenuItemEvent({ "Insert", "Footnote..." })
MicrosoftWord.icons = Application.createMenuItemEvent({ "Insert", "Icons..." })
MicrosoftWord.indexAndTables = Application.createMenuItemEvent({ "Insert", "Index and Tables..." })
MicrosoftWord.object = Application.createMenuItemEvent({ "Insert", "Object..." })
MicrosoftWord.pageNumbers = Application.createMenuItemEvent({ "Insert", "Page Numbers..." })
MicrosoftWord.table = Application.createMenuItemEvent({ "Insert", "Table..." })
MicrosoftWord.watermark = Application.createMenuItemEvent({ "Insert", "Watermark..." })
MicrosoftWord["3DModels"] = Application.createMenuItemChooserEvent({ "Insert", "3D Models" })
MicrosoftWord.addIns = Application.createMenuItemChooserEvent({ "Insert", "Add-ins" })
MicrosoftWord.audio = Application.createMenuItemChooserEvent({ "Insert", "Audio" })
MicrosoftWord.autoText = Application.createMenuItemChooserEvent({ "Insert", "AutoText" })
MicrosoftWord["break"] = Application.createMenuItemChooserEvent({ "Insert", "Break" })
MicrosoftWord.chart = Application.createMenuItemChooserEvent({ "Insert", "Chart" })
MicrosoftWord.movie = Application.createMenuItemChooserEvent({ "Insert", "Movie" })
MicrosoftWord.pictures = Application.createMenuItemChooserEvent({ "Insert", "Pictures" })
MicrosoftWord.shape = Application.createMenuItemChooserEvent({ "Insert", "Shape" })
MicrosoftWord.smartArt = Application.createMenuItemChooserEvent({ "Insert", "SmartArt" })
MicrosoftWord.textBox = Application.createMenuItemChooserEvent({ "Insert", "Text Box" })
-- Format actions
MicrosoftWord.font = Application.createMenuItemEvent({ "Format", "Font..." })
MicrosoftWord.paragraph = Application.createMenuItemEvent({ "Format", "Paragraph..." })
MicrosoftWord.formatObject = Application.createMenuItemEvent({ "Format", "Format Object..." })
MicrosoftWord.bordersAndShading = Application.createMenuItemEvent({ "Format", "Borders and Shading..." })
MicrosoftWord.bulletsAndNumbering = Application.createMenuItemEvent({ "Format", "Bullets and Numbering..." })
MicrosoftWord.changeCase = Application.createMenuItemEvent({ "Format", "Change Case..." })
MicrosoftWord.columns = Application.createMenuItemEvent({ "Format", "Columns..." })
MicrosoftWord.document = Application.createMenuItemEvent({ "Format", "Document..." })
MicrosoftWord.dropCap = Application.createMenuItemEvent({ "Format", "Drop Cap..." })
MicrosoftWord.equationOptions = Application.createMenuItemEvent({ "Format", "Equation Options..." })
MicrosoftWord.fontSubstitution = Application.createMenuItemEvent({ "Format", "Font Substitution..." })
MicrosoftWord.style = Application.createMenuItemEvent({ "Format", "Style..." })
MicrosoftWord.tabs = Application.createMenuItemEvent({ "Format", "Tabs..." })
MicrosoftWord.textDirection = Application.createMenuItemEvent({ "Format", "Text Direction..." })
MicrosoftWord.textEffects = Application.createMenuItemEvent({ "Format", "Text Effects..." })
MicrosoftWord.asianLayout = Application.createMenuItemChooserEvent({ "Format", "Asian Layout" })
-- Tools actions
MicrosoftWord.smartLookup = Application.createMenuItemEvent({ "Tools", "Smart Lookup..." })
MicrosoftWord.thesaurus = Application.createMenuItemEvent({ "Tools", "Thesaurus..." })
MicrosoftWord.autoCorrectOptions = Application.createMenuItemEvent({ "Tools", "AutoCorrect Options..." })
MicrosoftWord.blockAuthors = Application.createMenuItemEvent({ "Tools", "Block Authors" })
MicrosoftWord.checkAccessibility = Application.createMenuItemEvent({ "Tools", "Check Accessibility" })
MicrosoftWord.combineDocuments = Application.createMenuItemEvent({ "Tools", "Combine Documents..." })
MicrosoftWord.customizeKeyboard = Application.createMenuItemEvent({ "Tools", "Customize Keyboard..." })
MicrosoftWord.envelopes = Application.createMenuItemEvent({ "Tools", "Envelopes..." })
MicrosoftWord.hyphenation = Application.createMenuItemEvent({ "Tools", "Hyphenation..." })
MicrosoftWord.labels = Application.createMenuItemEvent({ "Tools", "Labels..." })
MicrosoftWord.language = Application.createMenuItemEvent({ "Tools", "Language..." })
MicrosoftWord.protectDocument = Application.createMenuItemEvent({ "Tools", "Protect Document..." })
MicrosoftWord.slowAndDisabledAddIns = Application.createMenuItemEvent({ "Tools", "Slow and Disabled Add-ins..." })
MicrosoftWord.templatesAndAddIns = Application.createMenuItemEvent({ "Tools", "Templates and Add-ins..." })
MicrosoftWord.unblockAllMyBlockedAreas = Application.createMenuItemEvent({ "Tools", "Unblock All My Blocked Areas" })
MicrosoftWord.wordCount = Application.createMenuItemEvent({ "Tools", "Word Count..." })
MicrosoftWord.macro = Application.createMenuItemChooserEvent({ "Tools", "Macro" })
MicrosoftWord.spellingAndGrammar = Application.createMenuItemChooserEvent({ "Tools", "Spelling and Grammar" })
MicrosoftWord.trackChanges = Application.createMenuItemChooserEvent({ "Tools", "Track Changes" })
MicrosoftWord.translate = Application.createMenuItemChooserEvent({ "Tools", "Translate" })
-- Table actions
MicrosoftWord.drawTable = Application.createMenuItemEvent({ "Table", "Draw Table" })
MicrosoftWord.formula = Application.createMenuItemEvent({ "Table", "Formula..." })
MicrosoftWord.mergeCells = Application.createMenuItemEvent({ "Table", "Merge Cells" })
MicrosoftWord.repeatHeaderRows = Application.createMenuItemEvent({ "Table", "Repeat Header Rows" })
MicrosoftWord.sort = Application.createMenuItemEvent({ "Table", "Sort..." })
MicrosoftWord.splitCells = Application.createMenuItemEvent({ "Table", "Split Cells..." })
MicrosoftWord.splitTable = Application.createMenuItemEvent({ "Table", "Split Table" })
MicrosoftWord.tableProperties = Application.createMenuItemEvent({ "Table", "Table Properties..." })
MicrosoftWord.viewGridlines = Application.createMenuItemEvent({ "Table", "View Gridlines" })
MicrosoftWord.autoFitAndDistribute = Application.createMenuItemChooserEvent({ "Table", "AutoFit and Distribute" })
MicrosoftWord.convert = Application.createMenuItemChooserEvent({ "Table", "Convert" })
MicrosoftWord.delete = Application.createMenuItemChooserEvent({ "Table", "Delete" })
MicrosoftWord.insert = Application.createMenuItemChooserEvent({ "Table", "Insert" })
MicrosoftWord.select = Application.createMenuItemChooserEvent({ "Table", "Select" })
-- Window actions
MicrosoftWord.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
MicrosoftWord.arrangeAll = Application.createMenuItemEvent({ "Window", "Arrange All" })
MicrosoftWord.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
MicrosoftWord.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
MicrosoftWord.microsoftWord = Application.createMenuItemEvent({ "Window", "Microsoft Word" })
MicrosoftWord.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
MicrosoftWord.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
MicrosoftWord.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
MicrosoftWord.newWindow = Application.createMenuItemEvent({ "Window", "New Window" })
MicrosoftWord.split = Application.createMenuItemEvent({ "Window", "Split" })
MicrosoftWord.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
MicrosoftWord.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
MicrosoftWord.checkForUpdates = Application.createMenuItemEvent({ "Help", "Check for Updates" })
MicrosoftWord.contactSupport = Application.createMenuItemEvent({ "Help", "Contact Support" })
MicrosoftWord.feedback = Application.createMenuItemEvent({ "Help", "Feedback" })
MicrosoftWord.wordHelp = Application.createMenuItemEvent({ "Help", "Word Help" })

MicrosoftWord:registerShortcuts({
    -- File
    { nil, "n", MicrosoftWord.newDocument, "New Document" },
    { nil, "o", MicrosoftWord.open, "Open..." },
    { nil, "p", MicrosoftWord.print, "Print..." },
    { nil, "s", MicrosoftWord.save, "Save" },
    { nil, "w", MicrosoftWord.close, "Close" },
    { { "shift" }, "o", MicrosoftWord.openRecent, "Open Recent" },
    { { "shift" }, "p", MicrosoftWord.newFromTemplate, "New from Template..." },
    { { "shift" }, "s", MicrosoftWord.saveAs, "Save As..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.alwaysOpenReadOnly, "Always Open Read-Only" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.browseVersionHistory, "Browse Version History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pageSetup, "Page Setup..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.properties, "Properties..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.reduceFileSize, "Reduce File Size..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.saveAsTemplate, "Save as Template..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.restrictPermissions, "Restrict Permissions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.share, "Share" },
    -- Edit
    { nil, "a", MicrosoftWord.selectAll, "Select All" },
    { nil, "c", MicrosoftWord.copy, "Copy" },
    { nil, "v", MicrosoftWord.paste, "Paste" },
    { nil, "x", MicrosoftWord.cut, "Cut" },
    { nil, "y", MicrosoftWord.canTRepeat, "Can't Repeat" },
    { nil, "z", MicrosoftWord.canTUndo, "Can't Undo" },
    { { "ctrl" }, "v", MicrosoftWord.pasteSpecial, "Paste Special..." },
    { { "ctrl" }, "z", MicrosoftWord.toggleDrawing, "Toggle Drawing" },
    { { "shift", "alt" }, "v", MicrosoftWord.pasteAndMatchFormatting, "Paste and Match Formatting" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.links, "Links..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.selectData, "Select Data..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.clear, "Clear" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.find, "Find" },
    -- View
    { { "alt" }, "r", MicrosoftWord.ribbon, "Ribbon" },
    { { "ctrl" }, "f", MicrosoftWord.enterFullScreen, "Enter Full Screen" },
    { { "shift", "ctrl" }, "f", MicrosoftWord.focus, "Focus" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.draft, "Draft" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.footnotes, "Footnotes" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.gridlines, "Gridlines" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.headerAndFooter, "Header and Footer" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.markup, "Markup" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.masterDocument, "Master Document" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.messageBar, "Message Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.outline, "Outline" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.printLayout, "Print Layout" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.revealFormatting, "Reveal Formatting" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.ruler, "Ruler" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.webLayout, "Web Layout" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoom, "Zoom" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.sidebar, "Sidebar" },
    -- Insert
    { nil, "k", MicrosoftWord.hyperlink, "Hyperlink..." },
    { { "ctrl" }, "=", MicrosoftWord.equation, "Equation" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.advancedSymbol, "Advanced Symbol..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bookmark, "Bookmark..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.caption, "Caption..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.comment, "Comment" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.crossReference, "Cross-reference..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.dateAndTime, "Date and Time..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.field, "Field..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.file, "File..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.footnote, "Footnote..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.icons, "Icons..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.indexAndTables, "Index and Tables..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.object, "Object..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pageNumbers, "Page Numbers..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.table, "Table..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.watermark, "Watermark..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord["3DModels"], "3D Models" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.addIns, "Add-ins" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.audio, "Audio" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoText, "AutoText" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord["break"], "Break" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.chart, "Chart" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.movie, "Movie" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pictures, "Pictures" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.shape, "Shape" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.smartArt, "SmartArt" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textBox, "Text Box" },
    -- Format
    { nil, "d", MicrosoftWord.font, "Font..." },
    { { "alt" }, "m", MicrosoftWord.paragraph, "Paragraph..." },
    { { "shift" }, "1", MicrosoftWord.formatObject, "Format Object..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bordersAndShading, "Borders and Shading..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bulletsAndNumbering, "Bullets and Numbering..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.changeCase, "Change Case..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.columns, "Columns..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.document, "Document..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.dropCap, "Drop Cap..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.equationOptions, "Equation Options..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.fontSubstitution, "Font Substitution..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.style, "Style..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.tabs, "Tabs..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textDirection, "Text Direction..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textEffects, "Text Effects..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.asianLayout, "Asian Layout" },
    -- Tools
    { { "alt", "ctrl" }, "l", MicrosoftWord.smartLookup, "Smart Lookup..." },
    { { "alt", "ctrl" }, "r", MicrosoftWord.thesaurus, "Thesaurus..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoCorrectOptions, "AutoCorrect Options..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.blockAuthors, "Block Authors" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.checkAccessibility, "Check Accessibility" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.combineDocuments, "Combine Documents..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.customizeKeyboard, "Customize Keyboard..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.envelopes, "Envelopes..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.hyphenation, "Hyphenation..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.labels, "Labels..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.language, "Language..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.protectDocument, "Protect Document..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.slowAndDisabledAddIns, "Slow and Disabled Add-ins..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.templatesAndAddIns, "Templates and Add-ins..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.unblockAllMyBlockedAreas, "Unblock All My Blocked Areas" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.wordCount, "Word Count..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.macro, "Macro" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.spellingAndGrammar, "Spelling and Grammar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.trackChanges, "Track Changes" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.translate, "Translate" },
    -- Table
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.drawTable, "Draw Table" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.formula, "Formula..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.mergeCells, "Merge Cells" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.repeatHeaderRows, "Repeat Header Rows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.sort, "Sort..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.splitCells, "Split Cells..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.splitTable, "Split Table" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.tableProperties, "Table Properties..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.viewGridlines, "View Gridlines" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoFitAndDistribute, "AutoFit and Distribute" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.convert, "Convert" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.insert, "Insert" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.select, "Select" },
    -- Window
    { nil, "m", MicrosoftWord.minimize, "Minimize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.arrangeAll, "Arrange All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.microsoftWord, "Microsoft Word" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.newWindow, "New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.split, "Split" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.checkForUpdates, "Check for Updates" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.contactSupport, "Contact Support" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.feedback, "Feedback" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.wordHelp, "Word Help" },
})

return MicrosoftWord
