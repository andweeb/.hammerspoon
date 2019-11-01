----------------------------------------------------------------------------------------------------
-- TablePlus application
--
local Application = spoon.Ki.Application

local TablePlus = Application:new("TablePlus")
TablePlus.dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"

-- Validate the data path
local dataPath = TablePlus.dataPath:gsub("%\\", "")
local absolutePath = hs.fs.pathToAbsolute(dataPath)
local success, value = pcall(function() return hs.fs.attributes(absolutePath) or {} end)
if not success then
    TablePlus.notifyError("TablePlus data path not found.", value or "")
end

function TablePlus:readPlist(name)
    local json = hs.execute("plutil -convert json -o - "..self.dataPath.."/"..name..".plist")
    return json and hs.json.decode(json) or {}
end

function TablePlus.getSelectionItems()
    local choices = {}

    -- Initialize connection groups by group id and connections list
    local connections = TablePlus:readPlist("Connections")

    for _, connection in pairs(connections) do
        local text = connection.ConnectionName.." ["..connection.Enviroment.."]"
        local databaseInfoText = connection.DatabaseHost.." : "..connection.DatabaseName
        local subText = hs.styledtext.new(databaseInfoText, {
            color = { hex = connection.statusColor, alpha = 1 },
            font = { name = "Menlo", size = 10 },
        })

        table.insert(choices, {
            text = text,
            subText = subText,
            id = connection.ID,
        })
    end

    return choices
end

function TablePlus.open(app, choice)
    app:activate()

    if choice then
        local isOk, _, rawTable = hs.execute([[
            open "tableplus://?id=]]..choice.id..[["
        ]])

        if not isOk then
            Application.notifyError("Error opening the connection", rawTable.NSLocalizedFailureReason)
        end
    end
end

local shortcuts = {
    { nil, nil, TablePlus.open, { "TablePlus", "Open Application or Database Connection" } },
}

-- Initialize TablePlus
TablePlus.connections = TablePlus:readPlist("Connections")
TablePlus.shortcuts = TablePlus.mergeShortcuts(shortcuts, TablePlus.shortcuts)

return TablePlus
