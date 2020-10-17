----------------------------------------------------------------------------------------------------
-- Microsoft Word application config
--
local Application = spoon.Ki.Application
local MicrosoftWord = Application:new("Microsoft Word")

-- File actions
MicrosoftWord.newDocument = Application:createMenuItemAction({ "File", "New Document" })
MicrosoftWord.open = Application:createMenuItemAction({ "File", "Open..." })
MicrosoftWord.print = Application:createMenuItemAction({ "File", "Print..." })
MicrosoftWord.save = Application:createMenuItemAction({ "File", "Save" })
MicrosoftWord.close = Application:createMenuItemAction({ "File", "Close" })
MicrosoftWord.newFromTemplate = Application:createMenuItemAction({ "File", "New from Template..." })
MicrosoftWord.saveAs = Application:createMenuItemAction({ "File", "Save As..." })
MicrosoftWord.alwaysOpenReadOnly = Application:createMenuItemAction({ "File", "Always Open Read-Only" })
MicrosoftWord.browseVersionHistory = Application:createMenuItemAction({ "File", "Browse Version History" })
MicrosoftWord.pageSetup = Application:createMenuItemAction({ "File", "Page Setup..." })
MicrosoftWord.properties = Application:createMenuItemAction({ "File", "Properties..." })
MicrosoftWord.reduceFileSize = Application:createMenuItemAction({ "File", "Reduce File Size..." })
MicrosoftWord.saveAsTemplate = Application:createMenuItemAction({ "File", "Save as Template..." })
MicrosoftWord.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
MicrosoftWord.restrictPermissions = Application:createChooseMenuItemAction({ "File", "Restrict Permissions" })
MicrosoftWord.share = Application:createChooseMenuItemAction({ "File", "Share" })
-- Edit actions
MicrosoftWord.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
MicrosoftWord.copy = Application:createMenuItemAction({ "Edit", "Copy" })
MicrosoftWord.paste = Application:createMenuItemAction({ "Edit", "Paste" })
MicrosoftWord.cut = Application:createMenuItemAction({ "Edit", "Cut" })
MicrosoftWord.canTRepeat = Application:createMenuItemAction({ "Edit", "Can't Repeat" })
MicrosoftWord.canTUndo = Application:createMenuItemAction({ "Edit", "Can't Undo" })
MicrosoftWord.pasteSpecial = Application:createMenuItemAction({ "Edit", "Paste Special..." })
MicrosoftWord.toggleDrawing = Application:createMenuItemAction({ "Edit", "Toggle Drawing" })
MicrosoftWord.pasteAndMatchFormatting = Application:createMenuItemAction({ "Edit", "Paste and Match Formatting" })
MicrosoftWord.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
MicrosoftWord.links = Application:createMenuItemAction({ "Edit", "Links..." })
MicrosoftWord.selectData = Application:createMenuItemAction({ "Edit", "Select Data..." })
MicrosoftWord.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
MicrosoftWord.clear = Application:createChooseMenuItemAction({ "Edit", "Clear" })
MicrosoftWord.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
-- View actions
MicrosoftWord.ribbon = Application:createMenuItemAction({ "View", "Ribbon" })
MicrosoftWord.enterFullScreen = Application:createMenuItemAction({ "View", "Enter Full Screen" })
MicrosoftWord.focus = Application:createMenuItemAction({ "View", "Focus" })
MicrosoftWord.draft = Application:createMenuItemAction({ "View", "Draft" })
MicrosoftWord.footnotes = Application:createMenuItemAction({ "View", "Footnotes" })
MicrosoftWord.gridlines = Application:createMenuItemAction({ "View", "Gridlines" })
MicrosoftWord.headerAndFooter = Application:createMenuItemAction({ "View", "Header and Footer" })
MicrosoftWord.markup = Application:createMenuItemAction({ "View", "Markup" })
MicrosoftWord.masterDocument = Application:createMenuItemAction({ "View", "Master Document" })
MicrosoftWord.messageBar = Application:createMenuItemAction({ "View", "Message Bar" })
MicrosoftWord.outline = Application:createMenuItemAction({ "View", "Outline" })
MicrosoftWord.printLayout = Application:createMenuItemAction({ "View", "Print Layout" })
MicrosoftWord.revealFormatting = Application:createMenuItemAction({ "View", "Reveal Formatting" })
MicrosoftWord.ruler = Application:createMenuItemAction({ "View", "Ruler" })
MicrosoftWord.webLayout = Application:createMenuItemAction({ "View", "Web Layout" })
MicrosoftWord.zoom = Application:createMenuItemAction({ "View", "Zoom" })
MicrosoftWord.sidebar = Application:createChooseMenuItemAction({ "View", "Sidebar" })
-- Insert actions
MicrosoftWord.hyperlink = Application:createMenuItemAction({ "Insert", "Hyperlink..." })
MicrosoftWord.equation = Application:createMenuItemAction({ "Insert", "Equation" })
MicrosoftWord.advancedSymbol = Application:createMenuItemAction({ "Insert", "Advanced Symbol..." })
MicrosoftWord.bookmark = Application:createMenuItemAction({ "Insert", "Bookmark..." })
MicrosoftWord.caption = Application:createMenuItemAction({ "Insert", "Caption..." })
MicrosoftWord.comment = Application:createMenuItemAction({ "Insert", "Comment" })
MicrosoftWord.crossReference = Application:createMenuItemAction({ "Insert", "Cross-reference..." })
MicrosoftWord.dateAndTime = Application:createMenuItemAction({ "Insert", "Date and Time..." })
MicrosoftWord.field = Application:createMenuItemAction({ "Insert", "Field..." })
MicrosoftWord.file = Application:createMenuItemAction({ "Insert", "File..." })
MicrosoftWord.footnote = Application:createMenuItemAction({ "Insert", "Footnote..." })
MicrosoftWord.icons = Application:createMenuItemAction({ "Insert", "Icons..." })
MicrosoftWord.indexAndTables = Application:createMenuItemAction({ "Insert", "Index and Tables..." })
MicrosoftWord.object = Application:createMenuItemAction({ "Insert", "Object..." })
MicrosoftWord.pageNumbers = Application:createMenuItemAction({ "Insert", "Page Numbers..." })
MicrosoftWord.table = Application:createMenuItemAction({ "Insert", "Table..." })
MicrosoftWord.watermark = Application:createMenuItemAction({ "Insert", "Watermark..." })
MicrosoftWord["3DModels"] = Application:createChooseMenuItemAction({ "Insert", "3D Models" })
MicrosoftWord.addIns = Application:createChooseMenuItemAction({ "Insert", "Add-ins" })
MicrosoftWord.audio = Application:createChooseMenuItemAction({ "Insert", "Audio" })
MicrosoftWord.autoText = Application:createChooseMenuItemAction({ "Insert", "AutoText" })
MicrosoftWord["break"] = Application:createChooseMenuItemAction({ "Insert", "Break" })
MicrosoftWord.chart = Application:createChooseMenuItemAction({ "Insert", "Chart" })
MicrosoftWord.movie = Application:createChooseMenuItemAction({ "Insert", "Movie" })
MicrosoftWord.pictures = Application:createChooseMenuItemAction({ "Insert", "Pictures" })
MicrosoftWord.shape = Application:createChooseMenuItemAction({ "Insert", "Shape" })
MicrosoftWord.smartArt = Application:createChooseMenuItemAction({ "Insert", "SmartArt" })
MicrosoftWord.textBox = Application:createChooseMenuItemAction({ "Insert", "Text Box" })
-- Format actions
MicrosoftWord.font = Application:createMenuItemAction({ "Format", "Font..." })
MicrosoftWord.paragraph = Application:createMenuItemAction({ "Format", "Paragraph..." })
MicrosoftWord.formatObject = Application:createMenuItemAction({ "Format", "Format Object..." })
MicrosoftWord.bordersAndShading = Application:createMenuItemAction({ "Format", "Borders and Shading..." })
MicrosoftWord.bulletsAndNumbering = Application:createMenuItemAction({ "Format", "Bullets and Numbering..." })
MicrosoftWord.changeCase = Application:createMenuItemAction({ "Format", "Change Case..." })
MicrosoftWord.columns = Application:createMenuItemAction({ "Format", "Columns..." })
MicrosoftWord.document = Application:createMenuItemAction({ "Format", "Document..." })
MicrosoftWord.dropCap = Application:createMenuItemAction({ "Format", "Drop Cap..." })
MicrosoftWord.equationOptions = Application:createMenuItemAction({ "Format", "Equation Options..." })
MicrosoftWord.fontSubstitution = Application:createMenuItemAction({ "Format", "Font Substitution..." })
MicrosoftWord.style = Application:createMenuItemAction({ "Format", "Style..." })
MicrosoftWord.tabs = Application:createMenuItemAction({ "Format", "Tabs..." })
MicrosoftWord.textDirection = Application:createMenuItemAction({ "Format", "Text Direction..." })
MicrosoftWord.textEffects = Application:createMenuItemAction({ "Format", "Text Effects..." })
MicrosoftWord.asianLayout = Application:createChooseMenuItemAction({ "Format", "Asian Layout" })
-- Tools actions
MicrosoftWord.smartLookup = Application:createMenuItemAction({ "Tools", "Smart Lookup..." })
MicrosoftWord.thesaurus = Application:createMenuItemAction({ "Tools", "Thesaurus..." })
MicrosoftWord.autoCorrectOptions = Application:createMenuItemAction({ "Tools", "AutoCorrect Options..." })
MicrosoftWord.blockAuthors = Application:createMenuItemAction({ "Tools", "Block Authors" })
MicrosoftWord.checkAccessibility = Application:createMenuItemAction({ "Tools", "Check Accessibility" })
MicrosoftWord.combineDocuments = Application:createMenuItemAction({ "Tools", "Combine Documents..." })
MicrosoftWord.customizeKeyboard = Application:createMenuItemAction({ "Tools", "Customize Keyboard..." })
MicrosoftWord.envelopes = Application:createMenuItemAction({ "Tools", "Envelopes..." })
MicrosoftWord.hyphenation = Application:createMenuItemAction({ "Tools", "Hyphenation..." })
MicrosoftWord.labels = Application:createMenuItemAction({ "Tools", "Labels..." })
MicrosoftWord.language = Application:createMenuItemAction({ "Tools", "Language..." })
MicrosoftWord.protectDocument = Application:createMenuItemAction({ "Tools", "Protect Document..." })
MicrosoftWord.slowAndDisabledAddIns = Application:createMenuItemAction({ "Tools", "Slow and Disabled Add-ins..." })
MicrosoftWord.templatesAndAddIns = Application:createMenuItemAction({ "Tools", "Templates and Add-ins..." })
MicrosoftWord.unblockAllMyBlockedAreas = Application:createMenuItemAction({ "Tools", "Unblock All My Blocked Areas" })
MicrosoftWord.wordCount = Application:createMenuItemAction({ "Tools", "Word Count..." })
MicrosoftWord.macro = Application:createChooseMenuItemAction({ "Tools", "Macro" })
MicrosoftWord.spellingAndGrammar = Application:createChooseMenuItemAction({ "Tools", "Spelling and Grammar" })
MicrosoftWord.trackChanges = Application:createChooseMenuItemAction({ "Tools", "Track Changes" })
MicrosoftWord.translate = Application:createChooseMenuItemAction({ "Tools", "Translate" })
-- Table actions
MicrosoftWord.drawTable = Application:createMenuItemAction({ "Table", "Draw Table" })
MicrosoftWord.formula = Application:createMenuItemAction({ "Table", "Formula..." })
MicrosoftWord.mergeCells = Application:createMenuItemAction({ "Table", "Merge Cells" })
MicrosoftWord.repeatHeaderRows = Application:createMenuItemAction({ "Table", "Repeat Header Rows" })
MicrosoftWord.sort = Application:createMenuItemAction({ "Table", "Sort..." })
MicrosoftWord.splitCells = Application:createMenuItemAction({ "Table", "Split Cells..." })
MicrosoftWord.splitTable = Application:createMenuItemAction({ "Table", "Split Table" })
MicrosoftWord.tableProperties = Application:createMenuItemAction({ "Table", "Table Properties..." })
MicrosoftWord.viewGridlines = Application:createMenuItemAction({ "Table", "View Gridlines" })
MicrosoftWord.autoFitAndDistribute = Application:createChooseMenuItemAction({ "Table", "AutoFit and Distribute" })
MicrosoftWord.convert = Application:createChooseMenuItemAction({ "Table", "Convert" })
MicrosoftWord.delete = Application:createChooseMenuItemAction({ "Table", "Delete" })
MicrosoftWord.insert = Application:createChooseMenuItemAction({ "Table", "Insert" })
MicrosoftWord.select = Application:createChooseMenuItemAction({ "Table", "Select" })
-- Window actions
MicrosoftWord.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
MicrosoftWord.arrangeAll = Application:createMenuItemAction({ "Window", "Arrange All" })
MicrosoftWord.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
MicrosoftWord.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
MicrosoftWord.microsoftWord = Application:createMenuItemAction({ "Window", "Microsoft Word" })
MicrosoftWord.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
MicrosoftWord.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
MicrosoftWord.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
MicrosoftWord.newWindow = Application:createMenuItemAction({ "Window", "New Window" })
MicrosoftWord.split = Application:createMenuItemAction({ "Window", "Split" })
MicrosoftWord.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
MicrosoftWord.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
MicrosoftWord.checkForUpdates = Application:createMenuItemAction({ "Help", "Check for Updates" })
MicrosoftWord.contactSupport = Application:createMenuItemAction({ "Help", "Contact Support" })
MicrosoftWord.feedback = Application:createMenuItemAction({ "Help", "Feedback" })
MicrosoftWord.wordHelp = Application:createMenuItemAction({ "Help", "Word Help" })

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
