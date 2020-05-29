----------------------------------------------------------------------------------------------------
-- Fantastical application config
--
local Application = spoon.Ki.Application
local Fantastical = Application:new("Fantastical")

-- Initialize menu item events
Fantastical.addDetectedInvitees = Application.createMenuItemEvent({ "Edit", "Add Detected Invitees" })
Fantastical.addInterestingCalendars = Application.createMenuItemEvent({ "File", "Add Interesting Calendars…" })
Fantastical.arrangeInFront = Application.createMenuItemEvent({ "Window", "Arrange in Front" })
Fantastical.availability = Application.createMenuItemEvent({ "Window", "Availability" })
Fantastical.bringAllToFront = Application.createMenuItemEvent({ "Window", "Bring All to Front" })
Fantastical.byDay = Application.createMenuItemEvent({ "View", "By Day" })
Fantastical.byMonth = Application.createMenuItemEvent({ "View", "By Month" })
Fantastical.byWeek = Application.createMenuItemEvent({ "View", "By Week" })
Fantastical.byYear = Application.createMenuItemEvent({ "View", "By Year" })
Fantastical.calendarSets = Application.createMenuItemSelectionEvent({ "View", "Calendar Sets" })
Fantastical.close = Application.createMenuItemEvent({ "File", "Close" })
Fantastical.closeAll = Application.createMenuItemEvent({ "File", "Close All" })
Fantastical.combineIdenticalEvents = Application.createMenuItemEvent({ "View", "Combine Identical Events" })
Fantastical.copy = Application.createMenuItemEvent({ "Edit", "Copy" })
Fantastical.copyDayAsText = Application.createMenuItemEvent({ "Edit", "Copy Day as Text" })
Fantastical.copyWeekAsText = Application.createMenuItemEvent({ "Edit", "Copy Week as Text" })
Fantastical.createTemplate = Application.createMenuItemEvent({ "Edit", "Create Template" })
Fantastical.cut = Application.createMenuItemEvent({ "Edit", "Cut" })
Fantastical.delete = Application.createMenuItemEvent({ "Edit", "Delete" })
Fantastical.duplicate = Application.createMenuItemEvent({ "Edit", "Duplicate" })
Fantastical.duplicateAsTask = Application.createMenuItemEvent({ "Edit", "Duplicate as Task" })
Fantastical.emojiSymbols = Application.createMenuItemEvent({ "Edit", "Emoji & Symbols" })
Fantastical.enterFullScreen = Application.createMenuItemEvent({ "View", "Enter Full Screen" })
Fantastical.export = Application.createMenuItemEvent({ "File", "Export…" })
Fantastical.fantasticalHelp = Application.createMenuItemEvent({ "Help", "Fantastical Help" })
Fantastical.find = Application.createMenuItemEvent({ "Edit", "Find" })
Fantastical.forward = Application.createMenuItemEvent({ "Edit", "Forward" })
Fantastical.fullCalendarWindow = Application.createMenuItemEvent({ "Window", "Full Calendar Window" })
Fantastical.getInfo = Application.createMenuItemEvent({ "Edit", "Get Info" })
Fantastical.goToDate = Application.createMenuItemEvent({ "View", "Go to Date…" })
Fantastical.goToToday = Application.createMenuItemEvent({ "View", "Go to Today" })
Fantastical.import = Application.createMenuItemEvent({ "File", "Import…" })
Fantastical.keepMiniWindowInFront = Application.createMenuItemEvent({ "Window", "Keep Mini Window in Front" })
Fantastical.makeTextBigger = Application.createMenuItemEvent({ "View", "Make Text Bigger" })
Fantastical.makeTextSmaller = Application.createMenuItemEvent({ "View", "Make Text Smaller" })
Fantastical.miniWindow = Application.createMenuItemEvent({ "Window", "Mini Window" })
Fantastical.minimize = Application.createMenuItemEvent({ "Window", "Minimize" })
Fantastical.minimizeAll = Application.createMenuItemEvent({ "Window", "Minimize All" })
Fantastical.moveWindowToLeftSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Left Side of Screen" })
Fantastical.moveWindowToRightSideOfScreen = Application.createMenuItemEvent({ "Window", "Move Window to Right Side of Screen" })
Fantastical.newCalendar = Application.createMenuItemSelectionEvent({ "File", "New Calendar" })
Fantastical.newCalendarSubscription = Application.createMenuItemEvent({ "File", "New Calendar Subscription…" })
Fantastical.newItem = Application.createMenuItemEvent({ "File", "New Item" })
Fantastical.next = Application.createMenuItemEvent({ "View", "Next" })
Fantastical.paste = Application.createMenuItemEvent({ "Edit", "Paste" })
Fantastical.pasteAndMatchStyle = Application.createMenuItemEvent({ "Edit", "Paste and Match Style" })
Fantastical.previous = Application.createMenuItemEvent({ "View", "Previous" })
Fantastical.print = Application.createMenuItemEvent({ "File", "Print…" })
Fantastical.redo = Application.createMenuItemEvent({ "Edit", "Redo" })
Fantastical.refreshAll = Application.createMenuItemEvent({ "View", "Refresh All" })
Fantastical.respondToInvitation = Application.createMenuItemSelectionEvent({ "Edit", "Respond to Invitation" })
Fantastical.selectAll = Application.createMenuItemEvent({ "Edit", "Select All" })
Fantastical.showDeclinedEvents = Application.createMenuItemEvent({ "View", "Show Declined Events" })
Fantastical.showDetectedInvitees = Application.createMenuItemEvent({ "Edit", "Show Detected Invitees" })
Fantastical.showHiddenItems = Application.createMenuItemEvent({ "View", "Show Hidden Items" })
Fantastical.showMore = Application.createMenuItemEvent({ "View", "Show More" })
Fantastical.showNotifications = Application.createMenuItemEvent({ "View", "Show Notifications" })
Fantastical.showSidebar = Application.createMenuItemEvent({ "View", "Show Sidebar" })
Fantastical.speech = Application.createMenuItemSelectionEvent({ "Edit", "Speech" })
Fantastical.spellingAndGrammar = Application.createMenuItemSelectionEvent({ "Edit", "Spelling and Grammar" })
Fantastical.startDictation = Application.createMenuItemEvent({ "Edit", "Start Dictation…" })
Fantastical.substitutions = Application.createMenuItemSelectionEvent({ "Edit", "Substitutions" })
Fantastical.tasks = Application.createMenuItemEvent({ "View", "Tasks" })
Fantastical.termsOfServicePrivacyPolicy = Application.createMenuItemEvent({ "Help", "Terms of Service & Privacy Policy" })
Fantastical.toggleNewItemMode = Application.createMenuItemEvent({ "Edit", "Toggle New Item Mode" })
Fantastical.transformations = Application.createMenuItemSelectionEvent({ "Edit", "Transformations" })
Fantastical.undo = Application.createMenuItemEvent({ "Edit", "Undo" })
Fantastical.zoom = Application.createMenuItemEvent({ "Window", "Zoom" })
Fantastical.zoomAll = Application.createMenuItemEvent({ "Window", "Zoom All" })

-- Add helper method to create URL handler actions
-- https://flexibits.com/fantastical/help/integration-with-other-apps
function Fantastical.createURLHandlerActions(url)
    return function() hs.urlevent.openURL("x-fantastical3://"..url) end
end

Fantastical:registerShortcuts({
    -- URL handler actions
    { nil, nil, Fantastical.createURLHandlerActions("show/mini"), { "Fantastical", "Open Mini Window" } },
    { nil, "c", Fantastical.createURLHandlerActions("show/calendar"), { "Fantastical", "Open Calendar" } },
    -- File
    { nil, "n", Fantastical.newItem, { "File", "New Item" } },
    { nil, "p", Fantastical.print, { "File", "Print…" } },
    { nil, "w", Fantastical.close, { "File", "Close" } },
    { { "alt" }, "w", Fantastical.closeAll, { "File", "Close All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.addInterestingCalendars, { "File", "Add Interesting Calendars…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.export, { "File", "Export…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.import, { "File", "Import…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.newCalendarSubscription, { "File", "New Calendar Subscription…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.newCalendar, { "File", "New Calendar" } },
    -- Edit
    { nil, "a", Fantastical.selectAll, { "Edit", "Select All" } },
    { nil, "d", Fantastical.duplicate, { "Edit", "Duplicate" } },
    { nil, "f", Fantastical.find, { "Edit", "Find" } },
    { nil, "i", Fantastical.getInfo, { "Edit", "Get Info" } },
    { nil, "k", Fantastical.toggleNewItemMode, { "Edit", "Toggle New Item Mode" } },
    { nil, "v", Fantastical.paste, { "Edit", "Paste" } },
    { nil, "x", Fantastical.cut, { "Edit", "Cut" } },
    { nil, "z", Fantastical.undo, { "Edit", "Undo" } },
    { { "shift" }, "c", Fantastical.copyDayAsText, { "Edit", "Copy Day as Text" } },
    { { "shift" }, "d", Fantastical.duplicateAsTask, { "Edit", "Duplicate as Task" } },
    { { "shift" }, "f", Fantastical.forward, { "Edit", "Forward" } },
    { { "shift" }, "i", Fantastical.showDetectedInvitees, { "Edit", "Show Detected Invitees" } },
    { { "shift" }, "z", Fantastical.redo, { "Edit", "Redo" } },
    { { "shift", "alt" }, "c", Fantastical.copyWeekAsText, { "Edit", "Copy Week as Text" } },
    { { "shift", "alt" }, "i", Fantastical.addDetectedInvitees, { "Edit", "Add Detected Invitees" } },
    { { "shift", "alt" }, "v", Fantastical.pasteAndMatchStyle, { "Edit", "Paste and Match Style" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.createTemplate, { "Edit", "Create Template" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.delete, { "Edit", "Delete" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.emojiSymbols, { "Edit", "Emoji & Symbols" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.startDictation, { "Edit", "Start Dictation…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.respondToInvitation, { "Edit", "Respond to Invitation" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.speech, { "Edit", "Speech" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.spellingAndGrammar, { "Edit", "Spelling and Grammar" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.substitutions, { "Edit", "Substitutions" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.transformations, { "Edit", "Transformations" } },
    -- View
    { nil, "+", Fantastical.makeTextBigger, { "View", "Make Text Bigger" } },
    { nil, "-", Fantastical.makeTextSmaller, { "View", "Make Text Smaller" } },
    { nil, "1", Fantastical.byDay, { "View", "By Day" } },
    { nil, "2", Fantastical.byWeek, { "View", "By Week" } },
    { nil, "3", Fantastical.byMonth, { "View", "By Month" } },
    { nil, "4", Fantastical.byYear, { "View", "By Year" } },
    { nil, "e", Fantastical.showMore, { "View", "Show More" } },
    { nil, "r", Fantastical.tasks, { "View", "Tasks" } },
    { nil, "t", Fantastical.goToToday, { "View", "Go to Today" } },
    { { "alt" }, "s", Fantastical.showSidebar, { "View", "Show Sidebar" } },
    { { "ctrl" }, "f", Fantastical.enterFullScreen, { "View", "Enter Full Screen" } },
    { { "shift" }, "r", Fantastical.refreshAll, { "View", "Refresh All" } },
    { { "shift" }, "t", Fantastical.goToDate, { "View", "Go to Date…" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.combineIdenticalEvents, { "View", "Combine Identical Events" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.next, { "View", "Next" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.previous, { "View", "Previous" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showDeclinedEvents, { "View", "Show Declined Events" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showHiddenItems, { "View", "Show Hidden Items" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.showNotifications, { "View", "Show Notifications" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.calendarSets, { "View", "Calendar Sets" } },
    -- Window
    { nil, "0", Fantastical.fullCalendarWindow, { "Window", "Full Calendar Window" } },
    { nil, "9", Fantastical.miniWindow, { "Window", "Mini Window" } },
    { nil, "m", Fantastical.minimize, { "Window", "Minimize" } },
    { { "alt" }, "m", Fantastical.minimizeAll, { "Window", "Minimize All" } },
    { { "ctrl" }, "a", Fantastical.keepMiniWindowInFront, { "Window", "Keep Mini Window in Front" } },
    { { "shift" }, "a", Fantastical.availability, { "Window", "Availability" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.arrangeInFront, { "Window", "Arrange in Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.bringAllToFront, { "Window", "Bring All to Front" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.moveWindowToLeftSideOfScreen, { "Window", "Move Window to Left Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.moveWindowToRightSideOfScreen, { "Window", "Move Window to Right Side of Screen" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.zoomAll, { "Window", "Zoom All" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.zoom, { "Window", "Zoom" } },
    -- Help
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.fantasticalHelp, { "Help", "Fantastical Help" } },
    { { "﴾unmapped﴿" }, "﴾unmapped﴿", Fantastical.termsOfServicePrivacyPolicy, { "Help", "Terms of Service & Privacy Policy" } },
})

return Fantastical
