----------------------------------------------------------------------------------------------------
-- Fantastical application config
--
local Application = spoon.Ki.Application
local Fantastical = Application:new("Fantastical")

-- Initialize menu item events
Fantastical.addDetectedInvitees = Application:createMenuItemAction({ "Edit", "Add Detected Invitees" })
Fantastical.addInterestingCalendars = Application:createMenuItemAction({ "File", "Add Interesting Calendars…" })
Fantastical.arrangeInFront = Application:createMenuItemAction({ "Window", "Arrange in Front" })
Fantastical.availability = Application:createMenuItemAction({ "Window", "Availability" })
Fantastical.bringAllToFront = Application:createMenuItemAction({ "Window", "Bring All to Front" })
Fantastical.byDay = Application:createMenuItemAction({ "View", "By Day" })
Fantastical.byMonth = Application:createMenuItemAction({ "View", "By Month" })
Fantastical.byWeek = Application:createMenuItemAction({ "View", "By Week" })
Fantastical.byYear = Application:createMenuItemAction({ "View", "By Year" })
Fantastical.calendarSets = Application:createChooseMenuItemAction({ "View", "Calendar Sets" })
Fantastical.close = Application:createMenuItemAction({ "File", "Close" })
Fantastical.closeAll = Application:createMenuItemAction({ "File", "Close All" })
Fantastical.combineIdenticalEvents = Application:createMenuItemAction({ "View", "Combine Identical Events" })
Fantastical.copy = Application:createMenuItemAction({ "Edit", "Copy" })
Fantastical.copyDayAsText = Application:createMenuItemAction({ "Edit", "Copy Day as Text" })
Fantastical.copyWeekAsText = Application:createMenuItemAction({ "Edit", "Copy Week as Text" })
Fantastical.createTemplate = Application:createMenuItemAction({ "Edit", "Create Template" })
Fantastical.cut = Application:createMenuItemAction({ "Edit", "Cut" })
Fantastical.delete = Application:createMenuItemAction({ "Edit", "Delete" })
Fantastical.duplicate = Application:createMenuItemAction({ "Edit", "Duplicate" })
Fantastical.duplicateAsTask = Application:createMenuItemAction({ "Edit", "Duplicate as Task" })
Fantastical.emojiSymbols = Application:createMenuItemAction({ "Edit", "Emoji & Symbols" })
Fantastical.enterFullScreen = Application:createMenuItemAction({ "View", "Enter Full Screen" })
Fantastical.export = Application:createMenuItemAction({ "File", "Export…" })
Fantastical.fantasticalHelp = Application:createMenuItemAction({ "Help", "Fantastical Help" })
Fantastical.find = Application:createMenuItemAction({ "Edit", "Find" })
Fantastical.forward = Application:createMenuItemAction({ "Edit", "Forward" })
Fantastical.fullCalendarWindow = Application:createMenuItemAction({ "Window", "Full Calendar Window" })
Fantastical.getInfo = Application:createMenuItemAction({ "Edit", "Get Info" })
Fantastical.goToDate = Application:createMenuItemAction({ "View", "Go to Date…" })
Fantastical.goToToday = Application:createMenuItemAction({ "View", "Go to Today" })
Fantastical.import = Application:createMenuItemAction({ "File", "Import…" })
Fantastical.keepMiniWindowInFront = Application:createMenuItemAction({ "Window", "Keep Mini Window in Front" })
Fantastical.makeTextBigger = Application:createMenuItemAction({ "View", "Make Text Bigger" })
Fantastical.makeTextSmaller = Application:createMenuItemAction({ "View", "Make Text Smaller" })
Fantastical.miniWindow = Application:createMenuItemAction({ "Window", "Mini Window" })
Fantastical.minimize = Application:createMenuItemAction({ "Window", "Minimize" })
Fantastical.minimizeAll = Application:createMenuItemAction({ "Window", "Minimize All" })
Fantastical.moveWindowToLeftSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Left Side of Screen" })
Fantastical.moveWindowToRightSideOfScreen = Application:createMenuItemAction({ "Window", "Move Window to Right Side of Screen" })
Fantastical.newCalendar = Application:createChooseMenuItemAction({ "File", "New Calendar" })
Fantastical.newCalendarSubscription = Application:createMenuItemAction({ "File", "New Calendar Subscription…" })
Fantastical.newItem = Application:createMenuItemAction({ "File", "New Item" })
Fantastical.next = Application:createMenuItemAction({ "View", "Next" })
Fantastical.paste = Application:createMenuItemAction({ "Edit", "Paste" })
Fantastical.pasteAndMatchStyle = Application:createMenuItemAction({ "Edit", "Paste and Match Style" })
Fantastical.previous = Application:createMenuItemAction({ "View", "Previous" })
Fantastical.print = Application:createMenuItemAction({ "File", "Print…" })
Fantastical.redo = Application:createMenuItemAction({ "Edit", "Redo" })
Fantastical.refreshAll = Application:createMenuItemAction({ "View", "Refresh All" })
Fantastical.respondToInvitation = Application:createChooseMenuItemAction({ "Edit", "Respond to Invitation" })
Fantastical.selectAll = Application:createMenuItemAction({ "Edit", "Select All" })
Fantastical.showDeclinedEvents = Application:createMenuItemAction({ "View", "Show Declined Events" })
Fantastical.showDetectedInvitees = Application:createMenuItemAction({ "Edit", "Show Detected Invitees" })
Fantastical.showHiddenItems = Application:createMenuItemAction({ "View", "Show Hidden Items" })
Fantastical.showMore = Application:createMenuItemAction({ "View", "Show More" })
Fantastical.showNotifications = Application:createMenuItemAction({ "View", "Show Notifications" })
Fantastical.showSidebar = Application:createMenuItemAction({ "View", "Show Sidebar" })
Fantastical.speech = Application:createChooseMenuItemAction({ "Edit", "Speech" })
Fantastical.spellingAndGrammar = Application:createChooseMenuItemAction({ "Edit", "Spelling and Grammar" })
Fantastical.startDictation = Application:createMenuItemAction({ "Edit", "Start Dictation…" })
Fantastical.substitutions = Application:createChooseMenuItemAction({ "Edit", "Substitutions" })
Fantastical.tasks = Application:createMenuItemAction({ "View", "Tasks" })
Fantastical.termsOfServicePrivacyPolicy = Application:createMenuItemAction({ "Help", "Terms of Service & Privacy Policy" })
Fantastical.toggleNewItemMode = Application:createMenuItemAction({ "Edit", "Toggle New Item Mode" })
Fantastical.transformations = Application:createChooseMenuItemAction({ "Edit", "Transformations" })
Fantastical.undo = Application:createMenuItemAction({ "Edit", "Undo" })
Fantastical.zoom = Application:createMenuItemAction({ "Window", "Zoom" })
Fantastical.zoomAll = Application:createMenuItemAction({ "Window", "Zoom All" })

-- Add helper method to create URL handler actions
-- https://flexibits.com/fantastical/help/integration-with-other-apps
function Fantastical.createURLHandlerActions(url)
    return function() hs.urlevent.openURL("x-fantastical3://"..url) end
end

Fantastical:registerShortcuts({
    -- URL handler actions
    { nil, nil, Fantastical.createURLHandlerActions("show/mini"), "Open Mini Window" },
    { nil, "c", Fantastical.createURLHandlerActions("show/calendar"), "Open Calendar" },
    -- File
    { nil, "n", Fantastical.newItem, "New Item" },
    { nil, "p", Fantastical.print, "Print…" },
    { nil, "w", Fantastical.close, "Close" },
    { { "alt" }, "w", Fantastical.closeAll, "Close All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.addInterestingCalendars, "Add Interesting Calendars…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.export, "Export…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.import, "Import…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.newCalendarSubscription, "New Calendar Subscription…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.newCalendar, "New Calendar" },
    -- Edit
    { nil, "a", Fantastical.selectAll, "Select All" },
    { nil, "d", Fantastical.duplicate, "Duplicate" },
    { nil, "f", Fantastical.find, "Find" },
    { nil, "i", Fantastical.getInfo, "Get Info" },
    { nil, "k", Fantastical.toggleNewItemMode, "Toggle New Item Mode" },
    { nil, "v", Fantastical.paste, "Paste" },
    { nil, "x", Fantastical.cut, "Cut" },
    { nil, "z", Fantastical.undo, "Undo" },
    { { "shift" }, "c", Fantastical.copyDayAsText, "Copy Day as Text" },
    { { "shift" }, "d", Fantastical.duplicateAsTask, "Duplicate as Task" },
    { { "shift" }, "f", Fantastical.forward, "Forward" },
    { { "shift" }, "i", Fantastical.showDetectedInvitees, "Show Detected Invitees" },
    { { "shift" }, "z", Fantastical.redo, "Redo" },
    { { "shift", "alt" }, "c", Fantastical.copyWeekAsText, "Copy Week as Text" },
    { { "shift", "alt" }, "i", Fantastical.addDetectedInvitees, "Add Detected Invitees" },
    { { "shift", "alt" }, "v", Fantastical.pasteAndMatchStyle, "Paste and Match Style" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.createTemplate, "Create Template" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.delete, "Delete" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.emojiSymbols, "Emoji & Symbols" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.startDictation, "Start Dictation…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.respondToInvitation, "Respond to Invitation" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.speech, "Speech" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.spellingAndGrammar, "Spelling and Grammar" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.substitutions, "Substitutions" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.transformations, "Transformations" },
    -- View
    { nil, "+", Fantastical.makeTextBigger, "Make Text Bigger" },
    { nil, "-", Fantastical.makeTextSmaller, "Make Text Smaller" },
    { nil, "1", Fantastical.byDay, "By Day" },
    { nil, "2", Fantastical.byWeek, "By Week" },
    { nil, "3", Fantastical.byMonth, "By Month" },
    { nil, "4", Fantastical.byYear, "By Year" },
    { nil, "e", Fantastical.showMore, "Show More" },
    { nil, "r", Fantastical.tasks, "Tasks" },
    { nil, "t", Fantastical.goToToday, "Go to Today" },
    { { "alt" }, "s", Fantastical.showSidebar, "Show Sidebar" },
    { { "ctrl" }, "f", Fantastical.enterFullScreen, "Enter Full Screen" },
    { { "shift" }, "r", Fantastical.refreshAll, "Refresh All" },
    { { "shift" }, "t", Fantastical.goToDate, "Go to Date…" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.combineIdenticalEvents, "Combine Identical Events" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.next, "Next" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.previous, "Previous" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showDeclinedEvents, "Show Declined Events" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showHiddenItems, "Show Hidden Items" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showNotifications, "Show Notifications" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.calendarSets, "Calendar Sets" },
    -- Window
    { nil, "0", Fantastical.fullCalendarWindow, "Full Calendar Window" },
    { nil, "9", Fantastical.miniWindow, "Mini Window" },
    { nil, "m", Fantastical.minimize, "Minimize" },
    { { "alt" }, "m", Fantastical.minimizeAll, "Minimize All" },
    { { "ctrl" }, "a", Fantastical.keepMiniWindowInFront, "Keep Mini Window in Front" },
    { { "shift" }, "a", Fantastical.availability, "Availability" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.arrangeInFront, "Arrange in Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.bringAllToFront, "Bring All to Front" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.moveWindowToLeftSideOfScreen, "Move Window to Left Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.moveWindowToRightSideOfScreen, "Move Window to Right Side of Screen" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.zoomAll, "Zoom All" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.zoom, "Zoom" },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.fantasticalHelp, "Fantastical Help" },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.termsOfServicePrivacyPolicy, "Terms of Service & Privacy Policy" },
})

return Fantastical
