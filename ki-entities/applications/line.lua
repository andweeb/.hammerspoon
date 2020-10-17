----------------------------------------------------------------------------------------------------
-- LINE application config
--
local Application = spoon.Ki.Application
local LINE = Application:new("LINE")

-- View actions
LINE.chats = Application:createMenuItemAction({ "View", "Chats" })
LINE.friends = Application:createMenuItemAction({ "View", "Friends" })
LINE.myProfile = Application:createMenuItemAction({ "View", "My profile" })
-- Friends actions
LINE.addFriends = Application:createMenuItemAction({ "Friends", "Add friends" })
LINE.createAGroup = Application:createMenuItemAction({ "Friends", "Create a group" })
-- Windows actions
LINE.maximize = Application:createMenuItemAction({ "Windows", "Maximize" })
LINE.minimize = Application:createMenuItemAction({ "Windows", "Minimize" })
LINE.moveAllToTop = Application:createMenuItemAction({ "Windows", "Move all to top" })
-- Help actions
LINE.help = Application:createMenuItemAction({ "Help", "LINE Help" })

LINE:registerShortcuts({
    -- View
    { nil, "c", LINE.chats, "Chats" },
    { nil, "p", LINE.myProfile, "My profile" },
    { { "shift" }, "f", LINE.friends, "Friends" },
    -- Friends
    { nil, "g", LINE.createAGroup, "Create a group" },
    { { "shift" }, "a", LINE.addFriends, "Add friends" },
    -- Windows
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", LINE.maximize, "Maximize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", LINE.minimize, "Minimize" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", LINE.moveAllToTop, "Move all to top" },
    -- Help
    { { "shift" }, "h", LINE.help, "LINE Help" },
})

return LINE
