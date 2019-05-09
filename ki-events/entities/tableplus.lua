local TablePlusEntity = {}

local dataPath = "~/Library/Application\\ Support/com.tinyapp.TablePlus/Data"

function TablePlusEntity.init(_, Application)
    local actions = {}

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
    TablePlus.connectionGroups = {}
    TablePlus.connections = {}

    function TablePlus.readApplicationDataPlist(filename)
        local json = hs.execute("plutil -convert json -o - "..dataPath.."/"..filename)
        return hs.json.decode(json)
    end

    function TablePlus.getSelectionItems()
        local choices = {}

        for _, connection in pairs(TablePlus.connections) do
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

    if not hs.fs.pathToAbsolute("~/Library/Application Support/com.tinyapp.TablePlus/Data") then
        local message = "Unable initialize TablePlus connections"
        local subtext = "The app data path doesn't seem to exist ("..dataPath..")"

        TablePlus.notifyError(message, subtext)
    else
        TablePlus.connectionGroupList = TablePlus.readApplicationDataPlist("ConnectionGroups.plist")

        -- Initialize connection groups by group id and connections list
        for _, group in pairs(TablePlus.connectionGroupList) do
            TablePlus.connectionGroups[group.ID] = group.Name
        end

        TablePlus.connections = TablePlus.readApplicationDataPlist("Connections.plist")
    end

    return TablePlus
end

return TablePlusEntity
