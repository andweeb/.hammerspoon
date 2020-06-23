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
    { nil, "n", MicrosoftExcel.new, { "File", "New" } },
    { nil, "o", MicrosoftExcel.open, { "File", "Open..." } },
    { nil, "p", MicrosoftExcel.print, { "File", "Print..." } },
    { nil, "s", MicrosoftExcel.save, { "File", "Save" } },
    { nil, "w", MicrosoftExcel.close, { "File", "Close" } },
    { { "shift" }, "o", MicrosoftExcel.openRecent, { "File", "Open Recent" } },
    { { "shift" }, "p", MicrosoftExcel.newFromTemplate, { "File", "New from Template..." } },
    { { "shift" }, "s", MicrosoftExcel.saveAs, { "File", "Save As..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.alwaysOpenReadOnly, { "File", "Always Open Read-Only" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.browseVersionHistory, { "File", "Browse Version History" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.import, { "File", "Import" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageSetup, { "File", "Page Setup..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.passwords, { "File", "Passwords..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.properties, { "File", "Properties..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.reduceFileSize, { "File", "Reduce File Size..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.saveAsTemplate, { "File", "Save as Template..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.printArea, { "File", "Print Area" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.restrictPermissions, { "File", "Restrict Permissions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.share, { "File", "Share" } },
    -- Edit
    { nil, "a", MicrosoftExcel.selectAll, { "Edit", "Select All" } },
    { nil, "y", MicrosoftExcel.canTRepeat, { "Edit", "Can't Repeat" } },
    { nil, "z", MicrosoftExcel.canTUndo, { "Edit", "Can't Undo" } },
    { { "ctrl" }, "v", MicrosoftExcel.pasteSpecial, { "Edit", "Paste Special..." } },
    { { "ctrl" }, "z", MicrosoftExcel.toggleDrawing, { "Edit", "Toggle Drawing" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.delete, { "Edit", "Delete..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.clear, { "Edit", "Clear" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.fill, { "Edit", "Fill" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.find, { "Edit", "Find" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, { "Edit", "Sheet" } },
    -- View
    { { "alt" }, "r", MicrosoftExcel.ribbon, { "View", "Ribbon" } },
    { { "ctrl" }, "f", MicrosoftExcel.enterFullScreen, { "View", "Enter Full Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.comments, { "View", "Comments" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.customViews, { "View", "Custom Views..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.formulaBar, { "View", "Formula Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.formulaBuilder, { "View", "Formula Builder" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.headerAndFooter, { "View", "Header and Footer..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.messageBar, { "View", "Message Bar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.normal, { "View", "Normal" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageLayout, { "View", "Page Layout" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.ruler, { "View", "Ruler" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoom, { "View", "Zoom..." } },
    -- Insert
    { nil, "k", MicrosoftExcel.hyperlink, { "Insert", "Hyperlink..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.cells, { "Insert", "Cells..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.columns, { "Insert", "Columns" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel["function"], { "Insert", "Function..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.icons, { "Insert", "Icons..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.newComment, { "Insert", "New Comment" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.object, { "Insert", "Object..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.pageBreak, { "Insert", "Page Break" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.resetAllPageBreaks, { "Insert", "Reset All Page Breaks" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.rows, { "Insert", "Rows" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sparklines, { "Insert", "Sparklines..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.symbol, { "Insert", "Symbol..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.table, { "Insert", "Table" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.textBox, { "Insert", "Text Box" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.wordArt, { "Insert", "WordArt" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel["3DModels"], { "Insert", "3D Models" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.addIns, { "Insert", "Add-ins" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.audio, { "Insert", "Audio" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chart, { "Insert", "Chart" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.movie, { "Insert", "Movie" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.picture, { "Insert", "Picture" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.shape, { "Insert", "Shape" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, { "Insert", "Sheet" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.smartArt, { "Insert", "SmartArt" } },
    -- Format
    { nil, "1", MicrosoftExcel.cells, { "Format", "Cells..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.conditionalFormatting, { "Format", "Conditional Formatting..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.style, { "Format", "Style..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.column, { "Format", "Column" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.row, { "Format", "Row" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.sheet, { "Format", "Sheet" } },
    -- Tools
    { { "alt", "ctrl" }, "l", MicrosoftExcel.smartLookup, { "Tools", "Smart Lookup..." } },
    { { "alt", "ctrl" }, "r", MicrosoftExcel.thesaurus, { "Tools", "Thesaurus..." } },
    { { "alt", "ctrl" }, "t", MicrosoftExcel.translate, { "Tools", "Translate..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.autoCorrectOptions, { "Tools", "AutoCorrect Options..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.checkAccessibility, { "Tools", "Check Accessibility" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.customizeKeyboard, { "Tools", "Customize Keyboard..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.errorChecking, { "Tools", "Error Checking..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.excelAddIns, { "Tools", "Excel Add-ins..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.goalSeek, { "Tools", "Goal Seek..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.language, { "Tools", "Language..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.mergeWorkbooks, { "Tools", "Merge Workbooks..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.scenarios, { "Tools", "Scenarios..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.spelling, { "Tools", "Spelling..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.auditing, { "Tools", "Auditing" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.macro, { "Tools", "Macro" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.protection, { "Tools", "Protection" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.trackChanges, { "Tools", "Track Changes" } },
    -- Data
    { { "shift" }, "r", MicrosoftExcel.sort, { "Data", "Sort..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.advancedFilter, { "Data", "Advanced Filter..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.autoFilter, { "Data", "AutoFilter" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chartAddData, { "Data", "Chart Add Data..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.chartSourceData, { "Data", "Chart Source Data..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.clearFilters, { "Data", "Clear Filters" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.consolidate, { "Data", "Consolidate..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.refresh, { "Data", "Refresh" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.subtotals, { "Data", "Subtotals..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.summarizeWithPivotTable, { "Data", "Summarize with PivotTable" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.table, { "Data", "Table..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.textToColumns, { "Data", "Text to Columns..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.validation, { "Data", "Validation..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.getExternalData, { "Data", "Get External Data" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.groupAndOutline, { "Data", "Group and Outline" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.tableTools, { "Data", "Table Tools" } },
    -- Window
    { nil, "m", MicrosoftExcel.minimize, { "Window", "Minimize" } },
    { { "alt" }, "m", MicrosoftExcel.minimizeAll, { "Window", "Minimize All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.arrange, { "Window", "Arrange..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.book1, { "Window", "Book1" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.freezePanes, { "Window", "Freeze Panes" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.hide, { "Window", "Hide" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.newWindow, { "Window", "New Window" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.split, { "Window", "Split" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.unhide, { "Window", "Unhide..." } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.checkForUpdates, { "Help", "Check for Updates" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.contactSupport, { "Help", "Contact Support" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.excelHelp, { "Help", "Excel Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", MicrosoftExcel.feedback, { "Help", "Feedback" } },
})

return MicrosoftExcel
