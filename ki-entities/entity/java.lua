----------------------------------------------------------------------------------------------------
-- Java .jar file application
--
local Application = spoon.Ki.Application
local Java = Application:new("Java")

Java.javaAppNames = { "java" }

Java.behaviors = Java.behaviors + {
    entity = function(_, eventHandler)
        eventHandler()
        return true
    end
}

function Java:getApps()
    local apps = {}

    for _, registeredAppName in pairs(self.javaAppNames) do
        local app = hs.application.find(registeredAppName)
        if app then table.insert(apps, app) end
    end

    return apps
end

function Java:registerJavaApps(appNames)
    for _, appName in pairs(appNames) do
        table.insert(self.javaAppNames, appName)
    end
end

function Java.getQuitMenuItem(app)
    local menuItems = app:getMenuItems()
    local appMenuItems = menuItems[1].AXChildren[1]
    return appMenuItems[#appMenuItems]
end

function Java:getName(app)
    local defaultName = "java"

    -- Get java app name from last "Quit" menu item
    local quitMenuItem = self.getQuitMenuItem(app)
    local appName = quitMenuItem.AXTitle:match(" (.*)")

    return appName or defaultName
end

function Java:getSelectionItems(apps)
    apps = apps or self:getApps()

    local choices = {}

    for index, javaApp in pairs(apps) do
        table.insert(choices, {
            index = index,
            text = self:getName(javaApp),
        })
    end

    return choices
end

function Java.focus(_, choice)
    local apps = Java:getApps()

    if choice then
        return Application.focus(apps[choice.index])
    elseif #apps > 0 then
        return Application.focus(apps[1])
    end
end

local shortcuts = {
    { nil, nil, Java.focus, { "Java", "Activate/Focus Java App" } },
    { nil, "a", function() print("bitch") end }
}

Java:initialize("Java", shortcuts)

return Java
