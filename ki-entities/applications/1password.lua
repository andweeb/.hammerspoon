----------------------------------------------------------------------------------------------------
-- 1Password 7 application config
--
local Ki = spoon.Ki
local Action = Ki.Action
local Application = Ki.Application
local ChooseMenuItem = Application.ChooseMenuItem
local SelectMenuItem = Application.SelectMenuItem
local ToggleMenuItem = Application.ToggleMenuItem
local unmapped = Application.unmapped

-- Add helper method to create URL handler actions
local function URLHandlerAction(options)
    local name, url = table.unpack(options)
    return Action {
        name = name,
        action = function()
            os.execute("open onepassword://"..url)
        end,
    }
end

return Application {
    name = "1Password",
    shortcuts = {
        ["1Password"] = {
            { nil, nil, URLHandlerAction { "Open", "search/ " } },
            { nil, ",", SelectMenuItem { "1Password 7", "Preferences…" } },
            { nil, "h", SelectMenuItem { "1Password 7", "Hide 1Password" } },
            { nil, "q", SelectMenuItem { "1Password 7", "Quit 1Password" } },
            { { "alt" }, "h", SelectMenuItem { "1Password 7", "Hide Others" } },
            { { "alt", "ctrl" }, "l", SelectMenuItem { "1Password 7", "Lock" } },
            { { "alt", "ctrl" }, "q", SelectMenuItem { "1Password 7", "Quit 1Password Completely" } },
            { unmapped, unmapped, SelectMenuItem { "1Password 7", "About 1Password" } },
            { unmapped, unmapped, SelectMenuItem { "1Password 7", "Check for Updates…" } },
            { unmapped, unmapped, SelectMenuItem { "1Password 7", "Empty Trash…" } },
            { unmapped, unmapped, SelectMenuItem { "1Password 7", "Install Browser Extensions…" } },
            { unmapped, unmapped, ChooseMenuItem { "1Password 7", "Services" } },
            { unmapped, unmapped, SelectMenuItem { "1Password 7", "Show All" } },
        },
        File = {
            { nil, "k", SelectMenuItem { "File", "Quick Open…" } },
            { nil, "p", SelectMenuItem { "File", "Print…" } },
            { unmapped, unmapped, ChooseMenuItem { "File", "Export" } },
            { unmapped, unmapped, SelectMenuItem { "File", "Import..." } },
            { unmapped, unmapped, SelectMenuItem { "File", "New Item from Clipboard" } },
            { unmapped, unmapped, ChooseMenuItem { "File", "New Item" } },
            { unmapped, unmapped, SelectMenuItem { "File", "New Smart Folder" } },
            { unmapped, unmapped, SelectMenuItem { "File", "New Vault…" } },
        },
        Edit = {
            { nil, "a", SelectMenuItem { "Edit", "Select All" } },
            { nil, "c", SelectMenuItem { "Edit", "Copy" } },
            { nil, "v", SelectMenuItem { "Edit", "Paste" } },
            { nil, "x", SelectMenuItem { "Edit", "Cut" } },
            { nil, "z", SelectMenuItem { "Edit", "Undo" } },
            { { "ctrl" }, "c", SelectMenuItem { "Edit", "Copy" } },
            { { "shift" }, "c", SelectMenuItem { "Edit", "Copy" } },
            { { "shift" }, "z", SelectMenuItem { "Edit", "Redo" } },
            { { "shift", "ctrl" }, "c", SelectMenuItem { "Edit", "Copy" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Emoji & Symbols" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Find" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Move to Trash" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Move to Trash" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Speech" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Spelling and Grammar" } },
            { unmapped, unmapped, SelectMenuItem { "Edit", "Start Dictation" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Substitutions" } },
            { unmapped, unmapped, ChooseMenuItem { "Edit", "Transformations" } },
        },
        View = {
            { nil, "l", SelectMenuItem { "View", "Hide Vaults" } },
            { nil, "{", SelectMenuItem { "View", "Show Previous Category" } },
            { nil, "}", SelectMenuItem { "View", "Show Next Category" } },
            { { "alt" }, "l", SelectMenuItem { "View", "Collapse Sidebar" } },
            { { "ctrl" }, "f", ToggleMenuItem { "Enter Full Screen", "Exit Full Screen" } },
            { { "ctrl" }, "p", SelectMenuItem { "View", "Conceal Passwords" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Item Counts" } },
            { unmapped, unmapped, SelectMenuItem { "View", "Show Rich Icons" } },
        },
        Account = {
            { unmapped, unmapped, SelectMenuItem { "Account", "Get Emergency Kit…" } },
            { unmapped, unmapped, SelectMenuItem { "Account", "New Vault…" } },
            { unmapped, unmapped, SelectMenuItem { "Account", "Set Up Other Devices" } },
            { unmapped, unmapped, SelectMenuItem { "Account", "Sign in to Another Account…" } },
        },
        Vault = {
            { unmapped, unmapped, SelectMenuItem { "Vault", "Edit Vault…" } },
            { unmapped, unmapped, SelectMenuItem { "Vault", "Exclude From All Vaults" } },
            { unmapped, unmapped, ChooseMenuItem { "Vault", "Switch to Vault" } },
        },
        Item = {
            { nil, "d", SelectMenuItem { "Item", "Duplicate" } },
            { nil, "e", SelectMenuItem { "Item", "Edit" } },
            { nil, "o", SelectMenuItem { "Item", "Open in Separate Window" } },
            { { "shift" }, "e", SelectMenuItem { "Item", "Edit in a Separate Window" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Copy Password" } },
            { unmapped, unmapped, ChooseMenuItem { "Item", "Copy to Vault" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Download Local Copy" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Favorite" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Fill Login in Browser" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Look Up in Vulnerable Passwords" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Move to Trash" } },
            { unmapped, unmapped, ChooseMenuItem { "Item", "Move to Vault" } },
            { unmapped, unmapped, SelectMenuItem { "Item", "Restore from Trash" } },
            { unmapped, unmapped, ChooseMenuItem { "Item", "Share" } },
        },
        Window = {
            { nil, "m", SelectMenuItem { "Window", "Minimize" } },
            { nil, "w", SelectMenuItem { "Window", "Close" } },
            { { "alt" }, "m", SelectMenuItem { "Window", "Minimize All" } },
            { { "alt" }, "w", SelectMenuItem { "Window", "Close All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "1Password" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "1Password" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Arrange in Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Bring All to Front" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Left Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Move Window to Right Side of Screen" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom All" } },
            { unmapped, unmapped, SelectMenuItem { "Window", "Zoom" } },
        },
        Help = {
            { unmapped, unmapped, SelectMenuItem { "Help", "1Password Newsletter" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Facebook" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Get Help" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Release Notes" } },
            { unmapped, unmapped, ChooseMenuItem { "Help", "Tools" } },
            { unmapped, unmapped, ChooseMenuItem { "Help", "Troubleshooting" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "Twitter" } },
            { unmapped, unmapped, SelectMenuItem { "Help", "What’s New" } },
        },
    },
}
