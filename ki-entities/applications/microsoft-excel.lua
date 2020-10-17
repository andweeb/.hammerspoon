----------------------------------------------------------------------------------------------------
-- Microsoft Excel application config
--
local Application = spoon.Ki.Application
local MicrosoftExcel = Application:new("Microsoft Excel")

local scriptPath = "~/.hammerspoon/scripts/microsoft-excel.applescript"
MicrosoftExcel.applescriptLocation = hs.fs.pathToAbsolute(scriptPath)

-- Run rendered Applescript template with given view model
function MicrosoftExcel:runApplescript(viewModel)
    local script = self.renderScriptTemplate(self.applescriptLocation, viewModel)
    local isOk, result, rawTable = hs.osascript.applescript(script)

    if not isOk then
        local actionName = viewModel and "\""..viewModel.action.."\"" or "unknown"
        local errorMessage = "Error executing the "..actionName.." action"
        self.notifyError(errorMessage, rawTable.NSLocalizedFailureReason)
    end

    return result
end

-- Add helper function to dynamically create applescript actions
function MicrosoftExcel:createApplescriptAction(viewModel)
    return function()
        return self:runApplescript(viewModel)
    end
end

-- Attach applescript action methods
MicrosoftExcel.autofitAllColumns = MicrosoftExcel:createApplescriptAction({ action = "autofit-all-columns" })
MicrosoftExcel.activateWorksheet = function(name)
    MicrosoftExcel:runApplescript({
        action = "activate-worksheet",
        targetWorksheet = name,
    })
end
MicrosoftExcel.fetchWorksheets = MicrosoftExcel:createApplescriptAction({ action = "fetch-worksheets" })
MicrosoftExcel.colorSelectedCells = MicrosoftExcel:createApplescriptAction({
    action = "color-selected-cells",
    fillColor = "{255, 255, 153}",
})
MicrosoftExcel.toggleFreezeTopRow = MicrosoftExcel:createApplescriptAction({ action = "toggle-freeze-top-row" })

-- Select a target cell
function MicrosoftExcel.selectCell(app)
    hs.timer.doAfter(0, function()
        hs.focus()

        local title = "Ki - Microsoft Excel"
        local text = "Enter target cell location:"
        local choice, targetCell =
        hs.dialog.textPrompt(title, text, "", "Select", "Cancel")

        if choice == "Select" then
            MicrosoftExcel.colorSelectedCells = MicrosoftExcel:runApplescript({
                action = "select-cell",
                targetCell = targetCell,
            })

            app:activate()
        end
    end)
end

-- Focus the application or selected worksheet
function MicrosoftExcel.focus(app, choice)
    if choice then
        MicrosoftExcel.activateWorksheet(choice.text)
    end

    app:activate()
end

-- Override selections to allow selection of Excel worksheets
function MicrosoftExcel:getChooserItems()
    local choices = {}
    local worksheets = self.fetchWorksheets()

    for _, worksheet in pairs(worksheets) do
        table.insert(choices, { text = worksheet })
    end

    return choices
end

-- File actions
MicrosoftExcel.new = Application:createMenuItemAction({ "File", "New" })
MicrosoftExcel.open = Application:createMenuItemAction({ "File", "Open..." })
MicrosoftExcel.print = Application:createMenuItemAction({ "File", "Print..." })
MicrosoftExcel.save = Application:createMenuItemAction({ "File", "Save" })
MicrosoftExcel.close = Application:createMenuItemAction({ "File", "Close" })
MicrosoftExcel.newFromTemplate = Application:createMenuItemAction({ "File", "New from Template..." })
MicrosoftExcel.saveAs = Application:createMenuItemAction({ "File", "Save As..." })
MicrosoftExcel.alwaysOpenReadOnly = Application:createMenuItemAction({ "File", "Always Open Read-Only" })
MicrosoftExcel.browseVersionHistory = Application:createMenuItemAction({ "File", "Browse Version History" })
MicrosoftExcel.import = Application:createMenuItemAction({ "File", "Import" })
MicrosoftExcel.pageSetup = Application:createMenuItemAction({ "File", "Page Setup..." })
MicrosoftExcel.passwords = Application:createMenuItemAction({ "File", "Passwords..." })
MicrosoftExcel.properties = Application:createMenuItemAction({ "File", "Properties..." })
MicrosoftExcel.reduceFileSize = Application:createMenuItemAction({ "File", "Reduce File Size..." })
MicrosoftExcel.saveAsTemplate = Application:createMenuItemAction({ "File", "Save as Template..." })
MicrosoftExcel.openRecent = Application:createChooseMenuItemAction({ "File", "Open Recent" })
MicrosoftExcel.printArea = Application:createChooseMenuItemAction({ "File", "Print Area" })
MicrosoftExcel.restrictPermissions = Application:createChooseMenuItemAction({ "File", "Restrict Permissions" })
MicrosoftExcel.share = Application:createChooseMenuItemAction({ "File", "Share" })
-- Edit actions
MicrosoftExcel.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
MicrosoftExcel.copy = Application:createMenuItemAction({ "Edit", "Copy" })
MicrosoftExcel.paste = Application:createMenuItemAction({ "Edit", "Paste" })
MicrosoftExcel.cut = Application:createMenuItemAction({ "Edit", "Cut" })
MicrosoftExcel.canTRepeat = Application:createMenuItemAction({ "Edit", "Can't Repeat" })
MicrosoftExcel.canTUndo = Application:createMenuItemAction({ "Edit", "Can't Undo" })
MicrosoftExcel.pasteSpecial = Application:createMenuItemAction({ "Edit", "Paste Special..." })
MicrosoftExcel.toggleDrawing = Application:createMenuItemAction({ "Edit", "Toggle Drawing" })
MicrosoftExcel.delete = Application:createMenuItemAction({ "Edit", "Delete..." })
MicrosoftExcel.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
MicrosoftExcel.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
MicrosoftExcel.clear = Application:createChooseMenuItemAction({ "Edit", "Clear" })
MicrosoftExcel.fill = Application:createChooseMenuItemAction({ "Edit", "Fill" })
MicrosoftExcel.find = Application:createChooseMenuItemAction({ "Edit", "Find" })
MicrosoftExcel.sheet = Application:createChooseMenuItemAction({ "Edit", "Sheet" })
-- View actions
MicrosoftExcel.ribbon = Application:createMenuItemAction({ "View", "Ribbon" })
MicrosoftExcel.enterFullScreen = Application:createMenuItemAction({ "View", "Enter Full Screen" })
MicrosoftExcel.comments = Application:createMenuItemAction({ "View", "Comments" })
MicrosoftExcel.customViews = Application:createMenuItemAction({ "View", "Custom Views..." })
MicrosoftExcel.formulaBar = Application:createMenuItemAction({ "View", "Formula Bar" })
MicrosoftExcel.formulaBuilder = Application:createMenuItemAction({ "View", "Formula Builder" })
MicrosoftExcel.headerAndFooter = Application:createMenuItemAction({ "View", "Header and Footer..." })
MicrosoftExcel.messageBar = Application:createMenuItemAction({ "View", "Message Bar" })
MicrosoftExcel.normal = Application:createMenuItemAction({ "View", "Normal" })
MicrosoftExcel.pageLayout = Application:createMenuItemAction({ "View", "Page Layout" })
MicrosoftExcel.ruler = Application:createMenuItemAction({ "View", "Ruler" })
MicrosoftExcel.zoom = Application:createMenuItemAction({ "View", "Zoom..." })
-- Insert actions
MicrosoftExcel.hyperlink = Application:createMenuItemAction({ "Insert", "Hyperlink..." })
MicrosoftExcel.cells = Application:createMenuItemAction({ "Insert", "Cells..." })
MicrosoftExcel.columns = Application:createMenuItemAction({ "Insert", "Columns" })
MicrosoftExcel["function"] = Application:createMenuItemAction({ "Insert", "Function..." })
MicrosoftExcel.icons = Application:createMenuItemAction({ "Insert", "Icons..." })
MicrosoftExcel.newComment = Application:createMenuItemAction({ "Insert", "New Comment" })
MicrosoftExcel.object = Application:createMenuItemAction({ "Insert", "Object..." })
MicrosoftExcel.pageBreak = Application:createMenuItemAction({ "Insert", "Page Break" })
MicrosoftExcel.resetAllPageBreaks = Application:createMenuItemAction({ "Insert", "Reset All Page Breaks" })
MicrosoftExcel.rows = Application:createMenuItemAction({ "Insert", "Rows" })
MicrosoftExcel.sparklines = Application:createMenuItemAction({ "Insert", "Sparklines..." })
MicrosoftExcel.symbol = Application:createMenuItemAction({ "Insert", "Symbol..." })
MicrosoftExcel.table = Application:createMenuItemAction({ "Insert", "Table" })
MicrosoftExcel.textBox = Application:createMenuItemAction({ "Insert", "Text Box" })
MicrosoftExcel.wordArt = Application:createMenuItemAction({ "Insert", "WordArt" })
MicrosoftExcel["3DModels"] = Application:createChooseMenuItemAction({ "Insert", "3D Models" })
MicrosoftExcel.addIns = Application:createChooseMenuItemAction({ "Insert", "Add-ins" })
MicrosoftExcel.audio = Application:createChooseMenuItemAction({ "Insert", "Audio" })
MicrosoftExcel.chart = Application:createChooseMenuItemAction({ "Insert", "Chart" })
MicrosoftExcel.movie = Application:createChooseMenuItemAction({ "Insert", "Movie" })
MicrosoftExcel.picture = Application:createChooseMenuItemAction({ "Insert", "Picture" })
MicrosoftExcel.shape = Application:createChooseMenuItemAction({ "Insert", "Shape" })
MicrosoftExcel.sheet = Application:createChooseMenuItemAction({ "Insert", "Sheet" })
MicrosoftExcel.smartArt = Application:createChooseMenuItemAction({ "Insert", "SmartArt" })
-- Format actions
MicrosoftExcel.cells = Application:createMenuItemAction({ "Format", "Cells..." })
MicrosoftExcel.conditionalFormatting = Application:createMenuItemAction({ "Format", "Conditional Formatting..." })
MicrosoftExcel.style = Application:createMenuItemAction({ "Format", "Style..." })
MicrosoftExcel.column = Application:createChooseMenuItemAction({ "Format", "Column" })
MicrosoftExcel.row = Application:createChooseMenuItemAction({ "Format", "Row" })
MicrosoftExcel.sheet = Application:createChooseMenuItemAction({ "Format", "Sheet" })
-- Tools actions
MicrosoftExcel.smartLookup = Application:createMenuItemAction({ "Tools", "Smart Lookup..." })
MicrosoftExcel.thesaurus = Application:createMenuItemAction({ "Tools", "Thesaurus..." })
MicrosoftExcel.translate = Application:createMenuItemAction({ "Tools", "Translate..." })
MicrosoftExcel.autoCorrectOptions = Application:createMenuItemAction({ "Tools", "AutoCorrect Options..." })
MicrosoftExcel.checkAccessibility = Application:createMenuItemAction({ "Tools", "Check Accessibility" })
MicrosoftExcel.customizeKeyboard = Application:createMenuItemAction({ "Tools", "Customize Keyboard..." })
MicrosoftExcel.errorChecking = Application:createMenuItemAction({ "Tools", "Error Checking..." })
MicrosoftExcel.excelAddIns = Application:createMenuItemAction({ "Tools", "Excel Add-ins..." })
MicrosoftExcel.goalSeek = Application:createMenuItemAction({ "Tools", "Goal Seek..." })
MicrosoftExcel.language = Application:createMenuItemAction({ "Tools", "Language..." })
MicrosoftExcel.mergeWorkbooks = Application:createMenuItemAction({ "Tools", "Merge Workbooks..." })
MicrosoftExcel.scenarios = Application:createMenuItemAction({ "Tools", "Scenarios..." })
MicrosoftExcel.spelling = Application:createMenuItemAction({ "Tools", "Spelling..." })
MicrosoftExcel.auditing = Application:createChooseMenuItemAction({ "Tools", "Auditing" })
MicrosoftExcel.macro = Application:createChooseMenuItemAction({ "Tools", "Macro" })
MicrosoftExcel.protection = Application:createChooseMenuItemAction({ "Tools", "Protection" })
MicrosoftExcel.trackChanges = Application:createChooseMenuItemAction({ "Tools", "Track Changes" })
-- Data actions
MicrosoftExcel.sort = Application:createMenuItemAction({ "Data", "Sort..." })
MicrosoftExcel.advancedFilter = Application:createMenuItemAction({ "Data", "Advanced Filter..." })
MicrosoftExcel.autoFilter = Application:createMenuItemAction({ "Data", "AutoFilter" })
MicrosoftExcel.chartAddData = Application:createMenuItemAction({ "Data", "Chart Add Data..." })
MicrosoftExcel.chartSourceData = Application:createMenuItemAction({ "Data", "Chart Source Data..." })
MicrosoftExcel.clearFilters = Application:createMenuItemAction({ "Data", "Clear Filters" })
MicrosoftExcel.consolidate = Application:createMenuItemAction({ "Data", "Consolidate..." })
MicrosoftExcel.refresh = Application:createMenuItemAction({ "Data", "Refresh" })
MicrosoftExcel.subtotals = Application:createMenuItemAction({ "Data", "Subtotals..." })
MicrosoftExcel.summarizeWithPivotTable = Application:createMenuItemAction({ "Data", "Summarize with PivotTable" })
MicrosoftExcel.table = Application:createMenuItemAction({ "Data", "Table..." })
MicrosoftExcel.textToColumns = Application:createMenuItemAction({ "Data", "Text to Columns..." })
MicrosoftExcel.validation = Application:createMenuItemAction({ "Data", "Validation..." })
MicrosoftExcel.getExternalData = Application:createChooseMenuItemAction({ "Data", "Get External Data" })
MicrosoftExcel.groupAndOutline = Application:createChooseMenuItemAction({ "Data", "Group and Outline" })
MicrosoftExcel.tableTools = Application:createChooseMenuItemAction({ "Data", "Table Tools" })
-- Window actions
MicrosoftExcel.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
MicrosoftExcel.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
MicrosoftExcel.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
MicrosoftExcel.arrange = Application:createMenuItemAction({ "Window", "Arrange..." })
MicrosoftExcel.book1 = Application:createMenuItemAction({ "Window", "Book1" })
MicrosoftExcel.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
MicrosoftExcel.freezePanes = Application:createMenuItemAction({ "Window", "Freeze Panes" })
MicrosoftExcel.hide = Application:createMenuItemAction({ "Window", "Hide" })
MicrosoftExcel.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
MicrosoftExcel.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
MicrosoftExcel.newWindow = Application:createMenuItemAction({ "Window", "New Window" })
MicrosoftExcel.split = Application:createMenuItemAction({ "Window", "Split" })
MicrosoftExcel.unhide = Application:createMenuItemAction({ "Window", "Unhide..." })
MicrosoftExcel.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })
MicrosoftExcel.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
MicrosoftExcel.checkForUpdates = Application:createMenuItemAction({ "Help", "Check for Updates" })
MicrosoftExcel.contactSupport = Application:createMenuItemAction({ "Help", "Contact Support" })
MicrosoftExcel.excelHelp = Application:createMenuItemAction({ "Help", "Excel Help" })
MicrosoftExcel.feedback = Application:createMenuItemAction({ "Help", "Feedback" })

MicrosoftExcel:registerShortcuts({
    { nil, nil, MicrosoftExcel.focus, "Activate/Focus" },
    { nil, "c", MicrosoftExcel.colorSelectedCells, "Color Selected Cells" },
    { { "cmd" }, "a", MicrosoftExcel.autofitAllColumns, "Autofit All Columns" },
    { { "ctrl" }, "s", MicrosoftExcel.selectCell, "Select Cell" },
    { { "shift" }, "f", MicrosoftExcel.toggleFreezeTopRow, "Toggle Freeze Top Row" },
    { { "shift" }, "o", MicrosoftExcel.openRecent, "Open Recent" },
    -- File
    { nil, "n", MicrosoftExcel.new, "New" },
    { nil, "o", MicrosoftExcel.open, "Open..." },
    { nil, "p", MicrosoftExcel.print, "Print..." },
    { nil, "s", MicrosoftExcel.save, "Save" },
    { nil, "w", MicrosoftExcel.close, "Close" },
    { { "shift" }, "o", MicrosoftExcel.openRecent, "Open Recent" },
    { { "shift" }, "p", MicrosoftExcel.newFromTemplate, "New from Template..." },
    { { "shift" }, "s", MicrosoftExcel.saveAs, "Save As..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.alwaysOpenReadOnly, "Always Open Read-Only" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.browseVersionHistory, "Browse Version History" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.import, "Import" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageSetup, "Page Setup..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.passwords, "Passwords..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.properties, "Properties..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.reduceFileSize, "Reduce File Size..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.saveAsTemplate, "Save as Template..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.printArea, "Print Area" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.restrictPermissions, "Restrict Permissions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.share, "Share" },
    -- Edit
    { nil, "a", MicrosoftExcel.selectAll, "Select All" },
    { nil, "y", MicrosoftExcel.canTRepeat, "Can't Repeat" },
    { nil, "z", MicrosoftExcel.canTUndo, "Can't Undo" },
    { { "ctrl" }, "v", MicrosoftExcel.pasteSpecial, "Paste Special..." },
    { { "ctrl" }, "z", MicrosoftExcel.toggleDrawing, "Toggle Drawing" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.delete, "Delete..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.clear, "Clear" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.fill, "Fill" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.find, "Find" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, "Sheet" },
    -- View
    { { "alt" }, "r", MicrosoftExcel.ribbon, "Ribbon" },
    { { "ctrl" }, "f", MicrosoftExcel.enterFullScreen, "Enter Full Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.comments, "Comments" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.customViews, "Custom Views..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.formulaBar, "Formula Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.formulaBuilder, "Formula Builder" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.headerAndFooter, "Header and Footer..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.messageBar, "Message Bar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.normal, "Normal" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageLayout, "Page Layout" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.ruler, "Ruler" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoom, "Zoom..." },
    -- Insert
    { nil, "k", MicrosoftExcel.hyperlink, "Hyperlink..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.cells, "Cells..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.columns, "Columns" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel["function"], "Function..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.icons, "Icons..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.newComment, "New Comment" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.object, "Object..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageBreak, "Page Break" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.resetAllPageBreaks, "Reset All Page Breaks" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.rows, "Rows" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sparklines, "Sparklines..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.symbol, "Symbol..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.table, "Table" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.textBox, "Text Box" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.wordArt, "WordArt" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel["3DModels"], "3D Models" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.addIns, "Add-ins" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.audio, "Audio" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chart, "Chart" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.movie, "Movie" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.picture, "Picture" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.shape, "Shape" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, "Sheet" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.smartArt, "SmartArt" },
    -- Format
    { nil, "1", MicrosoftExcel.cells, "Cells..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.conditionalFormatting, "Conditional Formatting..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.style, "Style..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.column, "Column" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.row, "Row" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, "Sheet" },
    -- Tools
    { { "alt", "ctrl" }, "l", MicrosoftExcel.smartLookup, "Smart Lookup..." },
    { { "alt", "ctrl" }, "r", MicrosoftExcel.thesaurus, "Thesaurus..." },
    { { "alt", "ctrl" }, "t", MicrosoftExcel.translate, "Translate..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.autoCorrectOptions, "AutoCorrect Options..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.checkAccessibility, "Check Accessibility" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.customizeKeyboard, "Customize Keyboard..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.errorChecking, "Error Checking..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.excelAddIns, "Excel Add-ins..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.goalSeek, "Goal Seek..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.language, "Language..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.mergeWorkbooks, "Merge Workbooks..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.scenarios, "Scenarios..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.spelling, "Spelling..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.auditing, "Auditing" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.macro, "Macro" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.protection, "Protection" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.trackChanges, "Track Changes" },
    -- Data
    { { "shift" }, "r", MicrosoftExcel.sort, "Sort..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.advancedFilter, "Advanced Filter..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.autoFilter, "AutoFilter" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chartAddData, "Chart Add Data..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chartSourceData, "Chart Source Data..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.clearFilters, "Clear Filters" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.consolidate, "Consolidate..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.refresh, "Refresh" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.subtotals, "Subtotals..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.summarizeWithPivotTable, "Summarize with PivotTable" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.table, "Table..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.textToColumns, "Text to Columns..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.validation, "Validation..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.getExternalData, "Get External Data" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.groupAndOutline, "Group and Outline" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.tableTools, "Table Tools" },
    -- Window
    { nil, "m", MicrosoftExcel.minimize, "Minimize" },
    { { "alt" }, "m", MicrosoftExcel.minimizeAll, "Minimize All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.arrange, "Arrange..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.book1, "Book1" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.freezePanes, "Freeze Panes" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.hide, "Hide" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.newWindow, "New Window" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.split, "Split" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.unhide, "Unhide..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.checkForUpdates, "Check for Updates" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.contactSupport, "Contact Support" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.excelHelp, "Excel Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.feedback, "Feedback" },
})

return MicrosoftExcel
