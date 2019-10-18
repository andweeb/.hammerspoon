-- AppleScript template for Microsoft Excel
-- `operation` - the operation name
--
-- For the `color-selected-cells` operation:
-- `fillColor` - the RGB color (i.e., {255, 255, 153} for yellow)
-- For the `activate-worksheet` operation:
-- `targetWorksheet` - the target worksheet name
set operation to "{{operation}}"

if operation is "fetch-worksheets" then

    tell application "Microsoft Excel"
        return name of every sheet of active workbook
    end tell

else if operation is "activate-worksheet" then

    set targetWorksheet to "{{targetWorksheet}}"
    tell application "Microsoft Excel" to activate object worksheet targetWorksheet

else if operation is "select-cell" then

    set targetCell to "{{targetCell}}"
    tell application "Microsoft Excel" to select cell targetCell

else if operation is "color-selected-cells" then

    tell application "Microsoft Excel"
        set fillColor to {255, 255, 255}
        {{#fillColor}}
        set fillColor to {{fillColor}}
        {{/fillColor}}
        set selectedCells to cells of selection

        if (count of selectedCells) is greater than 0 then
            repeat with selectedCell in selectedCells
                set color of interior object of selectedCell to fillColor
            end repeat
        end if
    end tell

else if operation is "toggle-freeze-top-row" then

    tell application "Microsoft Excel"
        select row 2 of active sheet
        set frozenState to freeze panes of active window
        set freeze panes of active window to not frozenState
    end tell

else if operation is "autofit-all-columns" then

    tell application "Microsoft Excel"
        tell active sheet to select used range
    end tell

    tell application "System Events"
        tell process "Excel"
            click menu item "AutoFit Selection" of menu 1 of menu item "Column" of menu 1 of menu bar item "Format" of menu bar 1
        end tell
    end tell

end
