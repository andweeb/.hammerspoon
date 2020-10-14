----------------------------------------------------------------------------------------------------
-- Steam application config
--
local Application = spoon.Ki.Application
local Steam = Application:new("Steam")

-- Account actions
Steam.backupAndRestoreGames = Application.createMenuItemEvent({ "Account", "Backup and Restore Games..." })
Steam.changeAccount = Application.createMenuItemEvent({ "Account", "Change Account..." })
Steam.goOffline = Application.createMenuItemEvent({ "Account", "Go Offline..." })
-- View actions
Steam.bigPictureMode = Application.createMenuItemEvent({ "View", "Big Picture Mode" })
Steam.downloads = Application.createMenuItemEvent({ "View", "Downloads" })
Steam.friends = Application.createMenuItemEvent({ "View", "Friends" })
Steam.hiddenGames = Application.createMenuItemEvent({ "View", "Hidden Games" })
Steam.inventory = Application.createMenuItemEvent({ "View", "Inventory" })
Steam.library = Application.createMenuItemEvent({ "View", "Library" })
Steam.musicDetails = Application.createMenuItemEvent({ "View", "Music Details" })
Steam.musicPlayer = Application.createMenuItemEvent({ "View", "Music Player" })
Steam.players = Application.createMenuItemEvent({ "View", "Players" })
Steam.screenshots = Application.createMenuItemEvent({ "View", "Screenshots" })
Steam.servers = Application.createMenuItemEvent({ "View", "Servers" })
Steam.updateNews = Application.createMenuItemEvent({ "View", "Update news" })
-- Friends actions
Steam.addAFriend = Application.createMenuItemEvent({ "Friends", "Add a Friend..." })
Steam.away = Application.createMenuItemEvent({ "Friends", "Away" })
Steam.busy = Application.createMenuItemEvent({ "Friends", "Busy" })
Steam.changeAvatar = Application.createMenuItemEvent({ "Friends", "Change Avatar..." })
Steam.changeProfileName = Application.createMenuItemEvent({ "Friends", "Change Profile Name..." })
Steam.editProfileNameAvatar = Application.createMenuItemEvent({ "Friends", "Edit Profile Name / Avatar..." })
Steam.invisible = Application.createMenuItemEvent({ "Friends", "Invisible" })
Steam.lookingToPlay = Application.createMenuItemEvent({ "Friends", "Looking to Play" })
Steam.lookingToTrade = Application.createMenuItemEvent({ "Friends", "Looking to Trade" })
Steam.offline = Application.createMenuItemEvent({ "Friends", "Offline" })
Steam.online = Application.createMenuItemEvent({ "Friends", "Online" })
Steam.showAllInTheFRIENDSSection = Application.createMenuItemEvent({ "Friends", "Show All in the FRIENDS Section" })
Steam.showAvatars = Application.createMenuItemEvent({ "Friends", "Show Avatars" })
Steam.showOnlineFriendsOnly = Application.createMenuItemEvent({ "Friends", "Show Online Friends Only" })
Steam.sortByName = Application.createMenuItemEvent({ "Friends", "Sort by Name" })
Steam.viewFriendsList = Application.createMenuItemEvent({ "Friends", "View Friends List (.+)" }, { focusBefore = true, isRegex = true })
-- Games actions
Steam.activateAProductOnSteam = Application.createMenuItemEvent({ "Games", "Activate a Product on Steam..." })
Steam.addANonSteamGameToMyLibrary = Application.createMenuItemEvent({ "Games", "Add a Non-Steam Game to My Library..." })
Steam.manageGiftsAndGuestPasses = Application.createMenuItemEvent({ "Games", "Manage Gifts and Guest Passes..." })
Steam.redeemASteamWalletCode = Application.createMenuItemEvent({ "Games", "Redeem a Steam Wallet Code..." })
Steam.viewGamesLibrary = Application.createMenuItemEvent({ "Games", "View Games Library" })
-- Window actions
Steam.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
Steam.close = Application.createMenuItemEvent({ "Window", "Close" })
Steam.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
Steam.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
Steam.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
Steam.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
Steam.smallMode = Application.createMenuItemEvent({ "Window", "Small Mode" })
Steam.steam = Application.createMenuItemEvent({ "Window", "Steam" })
Steam.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
-- Help actions
Steam.aboutSteam = Application.createMenuItemEvent({ "Help", "About Steam" })
Steam.legalInformation = Application.createMenuItemEvent({ "Help", "Legal Information" })
Steam.privacyPolicy = Application.createMenuItemEvent({ "Help", "Privacy Policy" })
Steam.steamSubscriberAgreement = Application.createMenuItemEvent({ "Help", "Steam Subscriber Agreement" })
Steam.steamSupport = Application.createMenuItemEvent({ "Help", "Steam Support" })
Steam.systemInformation = Application.createMenuItemEvent({ "Help", "System Information" })

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
