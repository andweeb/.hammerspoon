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
    { nil, "n", MicrosoftWord.newDocument, { "File", "New Document" } },
    { nil, "o", MicrosoftWord.open, { "File", "Open..." } },
    { nil, "p", MicrosoftWord.print, { "File", "Print..." } },
    { nil, "s", MicrosoftWord.save, { "File", "Save" } },
    { nil, "w", MicrosoftWord.close, { "File", "Close" } },
    { { "shift" }, "o", MicrosoftWord.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "p", MicrosoftWord.newFromTemplate, { "File", "New from Template..." } },
    { { "shift" }, "s", MicrosoftWord.saveAs, { "File", "Save As..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.alwaysOpenReadOnly, { "File", "Always Open Read-Only" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.browseVersionHistory, { "File", "Browse Version History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pageSetup, { "File", "Page Setup..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.properties, { "File", "Properties..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.reduceFileSize, { "File", "Reduce File Size..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.saveAsTemplate, { "File", "Save as Template..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.restrictPermissions, { "File", "Restrict Permissions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.share, { "File", "Share" } },
    -- Edit
    { nil, "a", MicrosoftWord.selectAll, { "Edit", "Select All" } },
    { nil, "c", MicrosoftWord.copy, { "Edit", "Copy" } },
    { nil, "v", MicrosoftWord.paste, { "Edit", "Paste" } },
    { nil, "x", MicrosoftWord.cut, { "Edit", "Cut" } },
    { nil, "y", MicrosoftWord.canTRepeat, { "Edit", "Can't Repeat" } },
    { nil, "z", MicrosoftWord.canTUndo, { "Edit", "Can't Undo" } },
    { { "ctrl" }, "v", MicrosoftWord.pasteSpecial, { "Edit", "Paste Special..." } },
    { { "ctrl" }, "z", MicrosoftWord.toggleDrawing, { "Edit", "Toggle Drawing" } },
    { { "shift", "alt" }, "v", MicrosoftWord.pasteAndMatchFormatting, { "Edit", "Paste and Match Formatting" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.links, { "Edit", "Links..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.selectData, { "Edit", "Select Data..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.clear, { "Edit", "Clear" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.find, { "Edit", "Find" } },
    -- View
    { { "alt" }, "r", MicrosoftWord.ribbon, { "View", "Ribbon" } },
    { { "ctrl" }, "f", MicrosoftWord.enterFullScreen, { "View", "Enter Full Screen" } },
    { { "shift", "ctrl" }, "f", MicrosoftWord.focus, { "View", "Focus" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.draft, { "View", "Draft" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.footnotes, { "View", "Footnotes" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.gridlines, { "View", "Gridlines" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.headerAndFooter, { "View", "Header and Footer" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.markup, { "View", "Markup" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.masterDocument, { "View", "Master Document" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.messageBar, { "View", "Message Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.outline, { "View", "Outline" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.printLayout, { "View", "Print Layout" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.revealFormatting, { "View", "Reveal Formatting" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.ruler, { "View", "Ruler" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.webLayout, { "View", "Web Layout" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoom, { "View", "Zoom" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.sidebar, { "View", "Sidebar" } },
    -- Insert
    { nil, "k", MicrosoftWord.hyperlink, { "Insert", "Hyperlink..." } },
    { { "ctrl" }, "=", MicrosoftWord.equation, { "Insert", "Equation" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.advancedSymbol, { "Insert", "Advanced Symbol..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bookmark, { "Insert", "Bookmark..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.caption, { "Insert", "Caption..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.comment, { "Insert", "Comment" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.crossReference, { "Insert", "Cross-reference..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.dateAndTime, { "Insert", "Date and Time..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.field, { "Insert", "Field..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.file, { "Insert", "File..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.footnote, { "Insert", "Footnote..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.icons, { "Insert", "Icons..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.indexAndTables, { "Insert", "Index and Tables..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.object, { "Insert", "Object..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pageNumbers, { "Insert", "Page Numbers..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.table, { "Insert", "Table..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.watermark, { "Insert", "Watermark..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord["3DModels"], { "Insert", "3D Models" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.addIns, { "Insert", "Add-ins" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.audio, { "Insert", "Audio" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoText, { "Insert", "AutoText" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord["break"], { "Insert", "Break" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.chart, { "Insert", "Chart" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.movie, { "Insert", "Movie" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.pictures, { "Insert", "Pictures" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.shape, { "Insert", "Shape" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.smartArt, { "Insert", "SmartArt" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textBox, { "Insert", "Text Box" } },
    -- Format
    { nil, "d", MicrosoftWord.font, { "Format", "Font..." } },
    { { "alt" }, "m", MicrosoftWord.paragraph, { "Format", "Paragraph..." } },
    { { "shift" }, "1", MicrosoftWord.formatObject, { "Format", "Format Object..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bordersAndShading, { "Format", "Borders and Shading..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bulletsAndNumbering, { "Format", "Bullets and Numbering..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.changeCase, { "Format", "Change Case..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.columns, { "Format", "Columns..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.document, { "Format", "Document..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.dropCap, { "Format", "Drop Cap..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.equationOptions, { "Format", "Equation Options..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.fontSubstitution, { "Format", "Font Substitution..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.style, { "Format", "Style..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.tabs, { "Format", "Tabs..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textDirection, { "Format", "Text Direction..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.textEffects, { "Format", "Text Effects..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.asianLayout, { "Format", "Asian Layout" } },
    -- Tools
    { { "alt", "ctrl" }, "l", MicrosoftWord.smartLookup, { "Tools", "Smart Lookup..." } },
    { { "alt", "ctrl" }, "r", MicrosoftWord.thesaurus, { "Tools", "Thesaurus..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoCorrectOptions, { "Tools", "AutoCorrect Options..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.blockAuthors, { "Tools", "Block Authors" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.checkAccessibility, { "Tools", "Check Accessibility" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.combineDocuments, { "Tools", "Combine Documents..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.customizeKeyboard, { "Tools", "Customize Keyboard..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.envelopes, { "Tools", "Envelopes..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.hyphenation, { "Tools", "Hyphenation..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.labels, { "Tools", "Labels..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.language, { "Tools", "Language..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.protectDocument, { "Tools", "Protect Document..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.slowAndDisabledAddIns, { "Tools", "Slow and Disabled Add-ins..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.templatesAndAddIns, { "Tools", "Templates and Add-ins..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.unblockAllMyBlockedAreas, { "Tools", "Unblock All My Blocked Areas" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.wordCount, { "Tools", "Word Count..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.macro, { "Tools", "Macro" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.spellingAndGrammar, { "Tools", "Spelling and Grammar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.trackChanges, { "Tools", "Track Changes" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.translate, { "Tools", "Translate" } },
    -- Table
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.drawTable, { "Table", "Draw Table" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.formula, { "Table", "Formula..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.mergeCells, { "Table", "Merge Cells" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.repeatHeaderRows, { "Table", "Repeat Header Rows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.sort, { "Table", "Sort..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.splitCells, { "Table", "Split Cells..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.splitTable, { "Table", "Split Table" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.tableProperties, { "Table", "Table Properties..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.viewGridlines, { "Table", "View Gridlines" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.autoFitAndDistribute, { "Table", "AutoFit and Distribute" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.convert, { "Table", "Convert" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.delete, { "Table", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.insert, { "Table", "Insert" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.select, { "Table", "Select" } },
    -- Window
    { nil, "m", MicrosoftWord.minimize, { "Window", "Minimize" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.arrangeAll, { "Window", "Arrange All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.microsoftWord, { "Window", "Microsoft Word" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.newWindow, { "Window", "New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.split, { "Window", "Split" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.checkForUpdates, { "Help", "Check for Updates" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.contactSupport, { "Help", "Contact Support" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.feedback, { "Help", "Feedback" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftWord.wordHelp, { "Help", "Word Help" } },
})

return MicrosoftWord
