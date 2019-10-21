----------------------------------------------------------------------------------------------------
-- Java .jar file application
--
local Application = spoon.Ki.Application

local actions = {}

function actions.getQuitMenuItem(app)
    local menuItems = app:getMenuItems()
    local appMenuItems = menuItems[1].AXChildren[1]
    return appMenuItems[#appMenuItems]
end

function actions.getName(app)
    local defaultName = "java"

    -- Get java app name from last "Quit" menu item
    local quitMenuItem = actions.getQuitMenuItem(app)
    local appName = quitMenuItem.AXTitle:match(" (.*)")

    return appName or defaultName
end

function actions.getSelectionItems(_, apps)
    apps = apps or { hs.application.find("java") }

    local choices = {}

    for index, javaApp in pairs(apps) do
        table.insert(choices, {
            index = index,
            text = actions.getName(javaApp),
        })
    end

    return choices
end

function actions.focus(_, choice)
    local apps = { hs.application.find("java") }

    if choice then
        return Application.focus(apps[choice.index])
    elseif #apps > 0 then
        return Application.focus(apps[1])
    end
end

local shortcuts = {
    { nil, nil, actions.focus, { "Java", "Activate/Focus Java App" } },
}

local Java = Application:new("java", shortcuts)

for name, action in pairs(actions) do
    Java[name] = action
end

return Java
