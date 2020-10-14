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
MicrosoftExcel.new = Application.createMenuItemEvent({ "File", "New" })
MicrosoftExcel.open = Application.createMenuItemEvent({ "File", "Open..." })
MicrosoftExcel.print = Application.createMenuItemEvent({ "File", "Print..." })
MicrosoftExcel.save = Application.createMenuItemEvent({ "File", "Save" })
MicrosoftExcel.close = Application.createMenuItemEvent({ "File", "Close" })
MicrosoftExcel.newFromTemplate = Application.createMenuItemEvent({ "File", "New from Template..." })
MicrosoftExcel.saveAs = Application.createMenuItemEvent({ "File", "Save As..." })
MicrosoftExcel.alwaysOpenReadOnly = Application.createMenuItemEvent({ "File", "Always Open Read-Only" })
MicrosoftExcel.browseVersionHistory = Application.createMenuItemEvent({ "File", "Browse Version History" })
MicrosoftExcel.import = Application.createMenuItemEvent({ "File", "Import" })
MicrosoftExcel.pageSetup = Application.createMenuItemEvent({ "File", "Page Setup..." })
MicrosoftExcel.passwords = Application.createMenuItemEvent({ "File", "Passwords..." })
MicrosoftExcel.properties = Application.createMenuItemEvent({ "File", "Properties..." })
MicrosoftExcel.reduceFileSize = Application.createMenuItemEvent({ "File", "Reduce File Size..." })
MicrosoftExcel.saveAsTemplate = Application.createMenuItemEvent({ "File", "Save as Template..." })
MicrosoftExcel.openRecent = Application.createMenuItemChooserEvent({ "File", "Open Recent" })
MicrosoftExcel.printArea = Application.createMenuItemChooserEvent({ "File", "Print Area" })
MicrosoftExcel.restrictPermissions = Application.createMenuItemChooserEvent({ "File", "Restrict Permissions" })
MicrosoftExcel.share = Application.createMenuItemChooserEvent({ "File", "Share" })
-- Edit actions
MicrosoftExcel.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
MicrosoftExcel.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
MicrosoftExcel.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
MicrosoftExcel.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
MicrosoftExcel.canTRepeat = Application.createMenuItemEvent({ "Edit", "Can't Repeat" })
MicrosoftExcel.canTUndo = Application.createMenuItemEvent({ "Edit", "Can't Undo" })
MicrosoftExcel.pasteSpecial = Application.createMenuItemEvent({ "Edit", "Paste Special..." })
MicrosoftExcel.toggleDrawing = Application.createMenuItemEvent({ "Edit", "Toggle Drawing" })
MicrosoftExcel.delete = Application.createMenuItemEvent({ "Edit", "Delete..." })
MicrosoftExcel.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
MicrosoftExcel.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
MicrosoftExcel.clear = Application.createMenuItemChooserEvent({ "Edit", "Clear" })
MicrosoftExcel.fill = Application.createMenuItemChooserEvent({ "Edit", "Fill" })
MicrosoftExcel.find = Application.createMenuItemChooserEvent({ "Edit", "Find" })
MicrosoftExcel.sheet = Application.createMenuItemChooserEvent({ "Edit", "Sheet" })
-- View actions
MicrosoftExcel.ribbon = Application.createMenuItemEvent({ "View", "Ribbon" })
MicrosoftExcel.enterFullScreen = Application.createMenuItemEvent({ "View", "Enter Full Screen" })
MicrosoftExcel.comments = Application.createMenuItemEvent({ "View", "Comments" })
MicrosoftExcel.customViews = Application.createMenuItemEvent({ "View", "Custom Views..." })
MicrosoftExcel.formulaBar = Application.createMenuItemEvent({ "View", "Formula Bar" })
MicrosoftExcel.formulaBuilder = Application.createMenuItemEvent({ "View", "Formula Builder" })
MicrosoftExcel.headerAndFooter = Application.createMenuItemEvent({ "View", "Header and Footer..." })
MicrosoftExcel.messageBar = Application.createMenuItemEvent({ "View", "Message Bar" })
MicrosoftExcel.normal = Application.createMenuItemEvent({ "View", "Normal" })
MicrosoftExcel.pageLayout = Application.createMenuItemEvent({ "View", "Page Layout" })
MicrosoftExcel.ruler = Application.createMenuItemEvent({ "View", "Ruler" })
MicrosoftExcel.zoom = Application.createMenuItemEvent({ "View", "Zoom..." })
-- Insert actions
MicrosoftExcel.hyperlink = Application.createMenuItemEvent({ "Insert", "Hyperlink..." })
MicrosoftExcel.cells = Application.createMenuItemEvent({ "Insert", "Cells..." })
MicrosoftExcel.columns = Application.createMenuItemEvent({ "Insert", "Columns" })
MicrosoftExcel["function"] = Application.createMenuItemEvent({ "Insert", "Function..." })
MicrosoftExcel.icons = Application.createMenuItemEvent({ "Insert", "Icons..." })
MicrosoftExcel.newComment = Application.createMenuItemEvent({ "Insert", "New Comment" })
MicrosoftExcel.object = Application.createMenuItemEvent({ "Insert", "Object..." })
MicrosoftExcel.pageBreak = Application.createMenuItemEvent({ "Insert", "Page Break" })
MicrosoftExcel.resetAllPageBreaks = Application.createMenuItemEvent({ "Insert", "Reset All Page Breaks" })
MicrosoftExcel.rows = Application.createMenuItemEvent({ "Insert", "Rows" })
MicrosoftExcel.sparklines = Application.createMenuItemEvent({ "Insert", "Sparklines..." })
MicrosoftExcel.symbol = Application.createMenuItemEvent({ "Insert", "Symbol..." })
MicrosoftExcel.table = Application.createMenuItemEvent({ "Insert", "Table" })
MicrosoftExcel.textBox = Application.createMenuItemEvent({ "Insert", "Text Box" })
MicrosoftExcel.wordArt = Application.createMenuItemEvent({ "Insert", "WordArt" })
MicrosoftExcel["3DModels"] = Application.createMenuItemChooserEvent({ "Insert", "3D Models" })
MicrosoftExcel.addIns = Application.createMenuItemChooserEvent({ "Insert", "Add-ins" })
MicrosoftExcel.audio = Application.createMenuItemChooserEvent({ "Insert", "Audio" })
MicrosoftExcel.chart = Application.createMenuItemChooserEvent({ "Insert", "Chart" })
MicrosoftExcel.movie = Application.createMenuItemChooserEvent({ "Insert", "Movie" })
MicrosoftExcel.picture = Application.createMenuItemChooserEvent({ "Insert", "Picture" })
MicrosoftExcel.shape = Application.createMenuItemChooserEvent({ "Insert", "Shape" })
MicrosoftExcel.sheet = Application.createMenuItemChooserEvent({ "Insert", "Sheet" })
MicrosoftExcel.smartArt = Application.createMenuItemChooserEvent({ "Insert", "SmartArt" })
-- Format actions
MicrosoftExcel.cells = Application.createMenuItemEvent({ "Format", "Cells..." })
MicrosoftExcel.conditionalFormatting = Application.createMenuItemEvent({ "Format", "Conditional Formatting..." })
MicrosoftExcel.style = Application.createMenuItemEvent({ "Format", "Style..." })
MicrosoftExcel.column = Application.createMenuItemChooserEvent({ "Format", "Column" })
MicrosoftExcel.row = Application.createMenuItemChooserEvent({ "Format", "Row" })
MicrosoftExcel.sheet = Application.createMenuItemChooserEvent({ "Format", "Sheet" })
-- Tools actions
MicrosoftExcel.smartLookup = Application.createMenuItemEvent({ "Tools", "Smart Lookup..." })
MicrosoftExcel.thesaurus = Application.createMenuItemEvent({ "Tools", "Thesaurus..." })
MicrosoftExcel.translate = Application.createMenuItemEvent({ "Tools", "Translate..." })
MicrosoftExcel.autoCorrectOptions = Application.createMenuItemEvent({ "Tools", "AutoCorrect Options..." })
MicrosoftExcel.checkAccessibility = Application.createMenuItemEvent({ "Tools", "Check Accessibility" })
MicrosoftExcel.customizeKeyboard = Application.createMenuItemEvent({ "Tools", "Customize Keyboard..." })
MicrosoftExcel.errorChecking = Application.createMenuItemEvent({ "Tools", "Error Checking..." })
MicrosoftExcel.excelAddIns = Application.createMenuItemEvent({ "Tools", "Excel Add-ins..." })
MicrosoftExcel.goalSeek = Application.createMenuItemEvent({ "Tools", "Goal Seek..." })
MicrosoftExcel.language = Application.createMenuItemEvent({ "Tools", "Language..." })
MicrosoftExcel.mergeWorkbooks = Application.createMenuItemEvent({ "Tools", "Merge Workbooks..." })
MicrosoftExcel.scenarios = Application.createMenuItemEvent({ "Tools", "Scenarios..." })
MicrosoftExcel.spelling = Application.createMenuItemEvent({ "Tools", "Spelling..." })
MicrosoftExcel.auditing = Application.createMenuItemChooserEvent({ "Tools", "Auditing" })
MicrosoftExcel.macro = Application.createMenuItemChooserEvent({ "Tools", "Macro" })
MicrosoftExcel.protection = Application.createMenuItemChooserEvent({ "Tools", "Protection" })
MicrosoftExcel.trackChanges = Application.createMenuItemChooserEvent({ "Tools", "Track Changes" })
-- Data actions
MicrosoftExcel.sort = Application.createMenuItemEvent({ "Data", "Sort..." })
MicrosoftExcel.advancedFilter = Application.createMenuItemEvent({ "Data", "Advanced Filter..." })
MicrosoftExcel.autoFilter = Application.createMenuItemEvent({ "Data", "AutoFilter" })
MicrosoftExcel.chartAddData = Application.createMenuItemEvent({ "Data", "Chart Add Data..." })
MicrosoftExcel.chartSourceData = Application.createMenuItemEvent({ "Data", "Chart Source Data..." })
MicrosoftExcel.clearFilters = Application.createMenuItemEvent({ "Data", "Clear Filters" })
MicrosoftExcel.consolidate = Application.createMenuItemEvent({ "Data", "Consolidate..." })
MicrosoftExcel.refresh = Application.createMenuItemEvent({ "Data", "Refresh" })
MicrosoftExcel.subtotals = Application.createMenuItemEvent({ "Data", "Subtotals..." })
MicrosoftExcel.summarizeWithPivotTable = Application.createMenuItemEvent({ "Data", "Summarize with PivotTable" })
MicrosoftExcel.table = Application.createMenuItemEvent({ "Data", "Table..." })
MicrosoftExcel.textToColumns = Application.createMenuItemEvent({ "Data", "Text to Columns..." })
MicrosoftExcel.validation = Application.createMenuItemEvent({ "Data", "Validation..." })
MicrosoftExcel.getExternalData = Application.createMenuItemChooserEvent({ "Data", "Get External Data" })
MicrosoftExcel.groupAndOutline = Application.createMenuItemChooserEvent({ "Data", "Group and Outline" })
MicrosoftExcel.tableTools = Application.createMenuItemChooserEvent({ "Data", "Table Tools" })
-- Window actions
MicrosoftExcel.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
MicrosoftExcel.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
MicrosoftExcel.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
MicrosoftExcel.arrange = Application.createMenuItemEvent({ "Window", "Arrange..." })
MicrosoftExcel.book1 = Application.createMenuItemEvent({ "Window", "Book1" })
MicrosoftExcel.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
MicrosoftExcel.freezePanes = Application.createMenuItemEvent({ "Window", "Freeze Panes" })
MicrosoftExcel.hide = Application.createMenuItemEvent({ "Window", "Hide" })
MicrosoftExcel.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
MicrosoftExcel.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
MicrosoftExcel.newWindow = Application.createMenuItemEvent({ "Window", "New Window" })
MicrosoftExcel.split = Application.createMenuItemEvent({ "Window", "Split" })
MicrosoftExcel.unhide = Application.createMenuItemEvent({ "Window", "Unhide..." })
MicrosoftExcel.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })
MicrosoftExcel.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
MicrosoftExcel.checkForUpdates = Application.createMenuItemEvent({ "Help", "Check for Updates" })
MicrosoftExcel.contactSupport = Application.createMenuItemEvent({ "Help", "Contact Support" })
MicrosoftExcel.excelHelp = Application.createMenuItemEvent({ "Help", "Excel Help" })
MicrosoftExcel.feedback = Application.createMenuItemEvent({ "Help", "Feedback" })

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
