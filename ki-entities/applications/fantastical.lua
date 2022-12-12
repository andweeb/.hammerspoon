----------------------------------------------------------------------------------------------------
-- Fantastical application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem
local unmapped = Application.unmapped

-- Add helper method to create URL handler actions
-- https://flexibits.com/fantastical/help/integration-with-other-apps
local function URLHandlerAction(options)
    local name, url = table.unpack(options)
    return Action {
        name = name,
        action = function()
            hs.urlevent.openURL("x-fantastical3://"..url)
        end,
    }
end

return Application {
    name = "Fantastical",
    shortcuts = {
        -- URL handler actions
        { nil, nil, URLHandlerAction { "Show Calendar Window", "show/calendar" } },
        { nil, "c", URLHandlerAction { "Show Mini Calendar Window", "show/mini" } },
        Fantastical = {
            { nil, ",", SelectMenuItem { "Fantastical", "Preferences…" } },
            { nil, "h", SelectMenuItem { "Fantastical", "Hide Fantastical" } },
            { nil, "q", SelectMenuItem { "Fantastical", "Quit Fantastical" } },
            { { "alt" }, "h", SelectMenuItem { "Fantastical", "Hide Others" } },
            { { "alt" }, "q", SelectMenuItem { "Fantastical", "Quit and Keep Windows" } },
            { unmapped, unmapped, SelectMenuItem { "Fantastical", "About Fantastical" } },
            { unmapped, unmapped, SelectMenuItem { "Fantastical", "Quit Fantastical Completely" } },
            { unmapped, unmapped, ChooseMenuItem { "Fantastical", "Services" } },
            { unmapped, unmapped, SelectMenuItem { "Fantastical", "Show All" } },
        },
        File = {
            { nil, "n", SelectMenuItem { "File", "New Item" } },
            { nil, "p", SelectMenuItem { "File", "Print…" } },
            { nil, "w", SelectMenuItem { "File", "Close" } },
            { { "alt" }, "w", SelectMenuItem { "File", "Close All" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Add Interesting Calendars…" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Export…" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Import…" } },
            { unmapped, unmapped, SelectMenuItem { "File", "New Calendar Subscription…" } },
            { unmapped, unmapped, ChooseMenuItem { "File", "New Calendar" } },
        },
        Edit = {
            { nil, "a", SelectMenuItem { "Edit", "Select All" } },
            { nil, "d", SelectMenuItem { "Edit", "Duplicate" } },
            { nil, "f", SelectMenuItem { "Edit", "Find" } },
            { nil, "i", SelectMenuItem { "Edit", "Get Info" } },
            { nil, "k", SelectMenuItem { "Edit", "Toggle New Item Mode" } },
            { nil, "v", SelectMenuItem { "Edit", "Paste" } },
            { nil, "x", SelectMenuItem { "Edit", "Cut" } },
            { nil, "z", SelectMenuItem { "Edit", "Undo" } },
            { { "shift" }, "c", SelectMenuItem { "Edit", "Copy Day as Text" } },
            { { "shift" }, "d", SelectMenuItem { "Edit", "Duplicate as Task" } },
            { { "shift" }, "f", SelectMenuItem { "Edit", "Forward" } },
            { { "shift" }, "i", SelectMenuItem { "Edit", "Show Detected Invitees" } },
            { { "shift" }, "z", SelectMenuItem { "Edit", "Redo" } },
            { { "shift", "alt" }, "c", SelectMenuItem { "Edit", "Copy Week as Text" } },
            { { "shift", "alt" }, "i", SelectMenuItem { "Edit", "Add Detected Invitees" } },
            { { "shift", "alt" }, "v", SelectMenuItem { "Edit", "Paste and Match Style" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Create Template" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Delete" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Respond to Invitation" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Speech" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Spelling and Grammar" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Start Dictation" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Substitutions" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Transformations" } },
        },
        View = {
            { nil, "+", SelectMenuItem { "View", "Make Text Bigger" } },
            { nil, "-", SelectMenuItem { "View", "Make Text Smaller" } },
            { nil, "1", SelectMenuItem { "View", "By Day" } },
            { nil, "2", SelectMenuItem { "View", "By Week" } },
            { nil, "3", SelectMenuItem { "View", "By Month" } },
            { nil, "4", SelectMenuItem { "View", "By Year" } },
            { nil, "e", SelectMenuItem { "View", "Show More" } },
            { nil, "r", SelectMenuItem { "View", "Tasks" } },
            { nil, "t", SelectMenuItem { "View", "Go to Today" } },
            { { "alt" }, "s", SelectMenuItem { "View", "Hide Sidebar" } },
            { { "ctrl" }, "f", SelectMenuItem { "View", "Enter Full Screen" } },
            { { "shift" }, "h", SelectMenuItem { "View", "Hidden Items" } },
            { { "shift" }, "r", SelectMenuItem { "View", "Refresh All" } },
            { { "shift" }, "t", SelectMenuItem { "View", "Go to Date…" } },
            { unmapped, unmapped, ChooseMenuItem { "View", "Calendar Sets" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Combine Identical Events" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Next" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Previous" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Declined Events" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Hidden Items" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Notifications" } },
        },
        Window = {
            { nil, "0", SelectMenuItem { "Window", "Full Calendar Window" } },
            { nil, "9", SelectMenuItem { "Window", "Mini Window" } },
            { nil, "m", SelectMenuItem { "Window", "Minimize" } },
            { { "alt" }, "m", SelectMenuItem { "Window", "Minimize All" } },
            { { "ctrl" }, "a", SelectMenuItem { "Window", "Keep Mini Window in Front" } },
            { { "shift" }, "a", SelectMenuItem { "Window", "Availability" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Arrange in Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Bring All to Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Left Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Right Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move to R240HY" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Tile Window to Left of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Tile Window to Right of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom" } },
        },
        Help = {
            { unmapped, unmapped, SelectMenuItem { "Help", "Contact Flexibits Support" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Fantastical Help" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Terms of Service & Privacy Policy" } },
        },
    },
}
