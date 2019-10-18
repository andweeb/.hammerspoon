----------------------------------------------------------------------------------------------------
-- Microsoft Excel application
--
local Application = spoon.Ki.Application
local path = "~/.hammerspoon/scripts/microsoft-excel.applescript"
local applescriptLocation = hs.fs.pathToAbsolute(path)

local actions = {
    openRecent = Application.createMenuItemSelectionEvent({ "File", "Open Recent" }, {
        focusAfter = true,
    }),
}

function actions.fetchWorksheets()
    local script = Application.renderScriptTemplate(applescriptLocation, {
        operation = "fetch-worksheets",
    })

    if not script then
        Application.notifyError("Error fetching worksheets", "Unable to render script template")
    end

    local isOk, worksheets, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Application.notifyError("Error fetching worksheets", rawTable.NSLocalizedFailureReason)
        return
    end

    return worksheets
end

function actions.activateWorksheet(name)
    local script = Application.renderScriptTemplate(applescriptLocation, {
        operation = "activate-worksheet",
        targetWorksheet = name,
    })

    if not script then
        Application.notifyError("Error activating worksheet", "Unable to render script template")
    end

    local isOk, _, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Application.notifyError("Error activating worksheet", rawTable.NSLocalizedFailureReason)
        return
    end
end

function actions.toggleFreezeTopRow()
    local script = Application.renderScriptTemplate(applescriptLocation, {
        operation = "toggle-freeze-top-row",
    })

    if not script then
        Application.notifyError("Error (un)freezing top row", "Unable to render script template")
    end

    local isOk, _, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Application.notifyError("Error (un)freezing top row", rawTable.NSLocalizedFailureReason)
        return
    end
end

function actions.autofitAllColumns()
    local script = Application.renderScriptTemplate(applescriptLocation, {
        operation = "autofit-all-columns",
    })

    if not script then
        Application.notifyError("Error autofitting columns", "Unable to render script template")
    end

    local isOk, _, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Application.notifyError("Error autofitting columns", rawTable.NSLocalizedFailureReason)
        return
    end
end

function actions.colorSelectedCells()
    local script = Application.renderScriptTemplate(applescriptLocation, {
        operation = "color-selected-cells",
        fillColor = "{255, 255, 153}",
    })

    if not script then
        Application.notifyError("Error coloring selected cells", "Unable to render script template")
    end

    local isOk, _, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Application.notifyError("Error coloring selected cells", rawTable.NSLocalizedFailureReason)
        return
    end
end

function actions.selectCell(app)
    hs.timer.doAfter(0, function()
        hs.focus()

        local title = "Ki - Microsoft Excel"
        local text = "Enter target cell location:"
        local choice, targetCell =
            hs.dialog.textPrompt(title, text, "", "Select", "Cancel")

        if choice == "Select" then
            local script = Application.renderScriptTemplate(applescriptLocation, {
                operation = "select-cell",
                targetCell = targetCell,
            })

            if not script then
                Application.notifyError("Error selecting cell", "Unable to render script template")
            end

            local isOk, _, rawTable = hs.osascript.applescript(script)
            if not isOk then
                Application.notifyError("Error selecting cell", rawTable.NSLocalizedFailureReason)
                return
            end

            app:activate()
        end
    end)
end

function actions.focus(app, choice)
    if choice then
        actions.activateWorksheet(choice.text)
    end

    app:activate()
end

local shortcuts = {
    { nil, nil, actions.focus, "Activate/Focus" },
    { nil, "c", actions.colorSelectedCells, "Color Selected Cells" },
    { nil, "s", actions.selectCell, "Select Cell" },
    { { "cmd" }, "a", actions.autofitAllColumns, "Autofit All Columns" },
    { { "shift" }, "f", actions.toggleFreezeTopRow, "Toggle Freeze Top Row" },
    { { "shift" }, "o", actions.openRecent, "Open Recent" },
}

local MicrosoftExcel = Application:new("Microsoft Excel", shortcuts)

for name, action in pairs(actions) do
    MicrosoftExcel[name] = action
end

function MicrosoftExcel.getSelectionItems()
    local choices = {}
    local worksheets = actions.fetchWorksheets()

    for _, worksheet in pairs(worksheets) do
        table.insert(choices, { text = worksheet })
    end

    return choices
end

return MicrosoftExcel
