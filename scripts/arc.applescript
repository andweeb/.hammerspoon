-- AppleScript template for activating an Arc tab under a specific space
set action to "{{{action}}}"

tell application "Arc"

    if action is "focus-tab" then

        {{#tabIndex}}
        {{#spaceName}}
        tell front window to select tab {{tabIndex}} of space "{{spaceName}}" 
        {{/spaceName}}
        {{/tabIndex}}

    else if action is "focus-space" then

        {{#target}}
        -- `target` - the name of the space
        focus space "{{target}}" of front window
        {{/target}}

    else if action is "reload" then

        {{#target}}
        tell {{target}} to reload
        {{/target}}

    else if action is "close" then

        {{#target}}
        close {{target}}
        {{/target}}

    else if action is "get-spaces" then

        set spaceNames to {}

        repeat with currentSpace in every space of front window
            copy (title of currentSpace) to the end of the |spaceNames|
        end repeat

        return spaceNames

    end if

end tell
