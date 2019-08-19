----------------------------------------------------------------------------------------------------
-- TablePlus application
--
local Application = spoon.Ki.Application

local actions = {}

local dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"
local function readTablePlusPlist(filename)
    local json = hs.execute("plutil -convert json -o - "..dataPath.."/"..filename)
    return hs.json.decode(json)
end

-- Initialize connection groups by group id and connections list
local connectionGroups = {}
local connectionGroupList = readTablePlusPlist("ConnectionGroups.plist")
for _, group in pairs(connectionGroupList) do
    connectionGroups[group.ID] = group.Name
end
local connections = readTablePlusPlist("Connections.plist")

function actions.open(app, choice)
    app:activate()

    if choice then
        local isOk, _, rawTable = hs.osascript.applescript([[
            open location "tableplus://?id=]]..choice.id..[["
        ]])

        if not isOk then
            Application.notifyError("Error opening the connection", rawTable.NSLocalizedFailureReason)
        end
    end
end

local shortcuts = {
    { nil, nil, actions.open, { "TablePlus", "Open Application or Database Connection" } },
}

local TablePlus = Application:new("TablePlus", shortcuts)

function TablePlus.getSelectionItems()
    local choices = {}

    for _, connection in pairs(connections) do
        local group = connectionGroups[connection.GroupID]
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

return TablePlus
