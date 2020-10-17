----------------------------------------------------------------------------------------------------
-- Steam application config
--
local Application = spoon.Ki.Application
local Steam = Application:new("Steam")

-- Account actions
Steam.backupAndRestoreGames = Application:createMenuItemAction({ "Account", "Backup and Restore Games..." })
Steam.changeAccount = Application:createMenuItemAction({ "Account", "Change Account..." })
Steam.goOffline = Application:createMenuItemAction({ "Account", "Go Offline..." })
-- View actions
Steam.bigPictureMode = Application:createMenuItemAction({ "View", "Big Picture Mode" })
Steam.downloads = Application:createMenuItemAction({ "View", "Downloads" })
Steam.friends = Application:createMenuItemAction({ "View", "Friends" })
Steam.hiddenGames = Application:createMenuItemAction({ "View", "Hidden Games" })
Steam.inventory = Application:createMenuItemAction({ "View", "Inventory" })
Steam.library = Application:createMenuItemAction({ "View", "Library" })
Steam.musicDetails = Application:createMenuItemAction({ "View", "Music Details" })
Steam.musicPlayer = Application:createMenuItemAction({ "View", "Music Player" })
Steam.players = Application:createMenuItemAction({ "View", "Players" })
Steam.screenshots = Application:createMenuItemAction({ "View", "Screenshots" })
Steam.servers = Application:createMenuItemAction({ "View", "Servers" })
Steam.updateNews = Application:createMenuItemAction({ "View", "Update news" })
-- Friends actions
Steam.addAFriend = Application:createMenuItemAction({ "Friends", "Add a Friend..." })
Steam.away = Application:createMenuItemAction({ "Friends", "Away" })
Steam.busy = Application:createMenuItemAction({ "Friends", "Busy" })
Steam.changeAvatar = Application:createMenuItemAction({ "Friends", "Change Avatar..." })
Steam.changeProfileName = Application:createMenuItemAction({ "Friends", "Change Profile Name..." })
Steam.editProfileNameAvatar = Application:createMenuItemAction({ "Friends", "Edit Profile Name / Avatar..." })
Steam.invisible = Application:createMenuItemAction({ "Friends", "Invisible" })
Steam.lookingToPlay = Application:createMenuItemAction({ "Friends", "Looking to Play" })
Steam.lookingToTrade = Application:createMenuItemAction({ "Friends", "Looking to Trade" })
Steam.offline = Application:createMenuItemAction({ "Friends", "Offline" })
Steam.online = Application:createMenuItemAction({ "Friends", "Online" })
Steam.showAllInTheFRIENDSSection = Application:createMenuItemAction({ "Friends", "Show All in the FRIENDS Section" })
Steam.showAvatars = Application:createMenuItemAction({ "Friends", "Show Avatars" })
Steam.showOnlineFriendsOnly = Application:createMenuItemAction({ "Friends", "Show Online Friends Only" })
Steam.sortByName = Application:createMenuItemAction({ "Friends", "Sort by Name" })
Steam.viewFriendsList = Application:createMenuItemAction({ "Friends", "View Friends List (.+)" }, { focusBefore = true, isRegex = true })
-- Games actions
Steam.activateAProductOnSteam = Application:createMenuItemAction({ "Games", "Activate a Product on Steam..." })
Steam.addANonSteamGameToMyLibrary = Application:createMenuItemAction({ "Games", "Add a Non-Steam Game to My Library..." })
Steam.manageGiftsAndGuestPasses = Application:createMenuItemAction({ "Games", "Manage Gifts and Guest Passes..." })
Steam.redeemASteamWalletCode = Application:createMenuItemAction({ "Games", "Redeem a Steam Wallet Code..." })
Steam.viewGamesLibrary = Application:createMenuItemAction({ "Games", "View Games Library" })
-- Window actions
Steam.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
Steam.close = Application:createMenuItemAction({ "Window", "Close" })
Steam.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
Steam.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
Steam.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
Steam.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
Steam.smallMode = Application:createMenuItemAction({ "Window", "Small Mode" })
Steam.steam = Application:createMenuItemAction({ "Window", "Steam" })
Steam.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
-- Help actions
Steam.aboutSteam = Application:createMenuItemAction({ "Help", "About Steam" })
Steam.legalInformation = Application:createMenuItemAction({ "Help", "Legal Information" })
Steam.privacyPolicy = Application:createMenuItemAction({ "Help", "Privacy Policy" })
Steam.steamSubscriberAgreement = Application:createMenuItemAction({ "Help", "Steam Subscriber Agreement" })
Steam.steamSupport = Application:createMenuItemAction({ "Help", "Steam Support" })
Steam.systemInformation = Application:createMenuItemAction({ "Help", "System Information" })

Steam:registerShortcuts({
    -- Account
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.backupAndRestoreGames, "Backup and Restore Games..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.changeAccount, "Change Account..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.goOffline, "Go Offline..." },
    -- View
    { nil, "b", Steam.bigPictureMode, "Big Picture Mode" },
    { nil, "d", Steam.downloads, "Downloads" },
    { nil, "f", Steam.friends, "Friends" },
    { nil, "i", Steam.inventory, "Inventory" },
    { nil, "l", Steam.library, "Library" },
    { nil, "m", Steam.musicPlayer, "Music Player" },
    { nil, "p", Steam.players, "Players" },
    { nil, "s", Steam.screenshots, "Screenshots" },
    { { "shift" }, "h", Steam.hiddenGames, "Hidden Games" },
    { { "shift" }, "m", Steam.musicDetails, "Music Details" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.servers, "Servers" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.updateNews, "Update news" },
    -- Friends
    { nil, "g", Steam.viewGamesLibrary, "View Games Library" },
    { { "shift" }, "a", Steam.addAFriend, "Add a Friend..." },
    { { "shift" }, "f", Steam.viewFriendsList, "View Friends List (0 Online)" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.away, "Away" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.busy, "Busy" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.changeAvatar, "Change Avatar..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.changeProfileName, "Change Profile Name..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.editProfileNameAvatar, "Edit Profile Name / Avatar..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.invisible, "Invisible" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.lookingToPlay, "Looking to Play" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.lookingToTrade, "Looking to Trade" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.offline, "Offline" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.online, "Online" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.showAllInTheFRIENDSSection, "Show All in the FRIENDS Section" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.showAvatars, "Show Avatars" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.showOnlineFriendsOnly, "Show Online Friends Only" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.sortByName, "Sort by Name" },
    -- Games
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.activateAProductOnSteam, "Activate a Product on Steam..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.addANonSteamGameToMyLibrary, "Add a Non-Steam Game to My Library..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.manageGiftsAndGuestPasses, "Manage Gifts and Guest Passes..." },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.redeemASteamWalletCode, "Redeem a Steam Wallet Code..." },
    -- Window
    { nil, "m", Steam.minimize, "Minimize" },
    { nil, "w", Steam.close, "Close" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.smallMode, "Small Mode" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.steam, "Steam" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.zoom, "Zoom" },
    -- Help
    { nil, "a", Steam.aboutSteam, "About Steam" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.legalInformation, "Legal Information" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.privacyPolicy, "Privacy Policy" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.steamSubscriberAgreement, "Steam Subscriber Agreement" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.steamSupport, "Steam Support" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Steam.systemInformation, "System Information" },
})

return Steam
