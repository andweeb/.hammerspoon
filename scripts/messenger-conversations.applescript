-- AppleScript template for Facebook Messenger
-- `operation` - the operation name
-- `scriptPath` - the external script for parsing html
-- `conversationLink` - conversation link string
set targetURL to "https://www.messenger.com"
set operation to "{{operation}}"

if operation is "get-conversations" then

    set windowIndex to -1
    set tabIndex to -1
    set targetHTML to ""
    set scriptPath to "{{{scriptPath}}}"
    set parserPath to scriptPath & "/html-parsers.py"
    set htmlID to do shell script "uuidgen"
    set htmlPath to scriptPath & "/" & htmlID

    tell application "Safari"
        repeat with w in windows
            set windowIndex to (index of w)

            if name of w is not "" then
                repeat with t in tabs of w
                    if URL of t starts with targetURL then
                        set tabIndex to index of t
                        tell t to set targetHTML to do JavaScript "document.documentElement.outerHTML"
                        exit repeat
                    end if
                end repeat
            end if
        end repeat
    end tell

    set tempFile to open for access (htmlPath) with write permission
    write targetHTML to tempFile
    close access tempFile

    set output to (do shell script "python '" & parserPath & "' '" & targetURL & "' '" & htmlPath & "'")

    do shell script "/bin/rm " & quoted form of htmlPath

    return {windowIndex, tabIndex, output}

else if operation is "select-conversation" then

    set windowIndex to "{{{targetWindowIndex}}}" as number
    set tabIndex to "{{{targetTabIndex}}}" as number
    set conversationLink to "{{{conversationLink}}}"

    tell window windowIndex of application "Safari"
        set current tab to tab tabIndex
        tell current tab to do JavaScript "document.querySelector('[data-href=\"" & conversationLink & "\"]').click()"
        activate
    end tell

else if operation is "open-conversation-info-pane" then

    set windowIndex to "{{{targetWindowIndex}}}" as number
    set tabIndex to "{{{targetTabIndex}}}" as number
    set conversationLink to "{{{conversationLink}}}"

    tell window windowIndex of application "Safari"
        set current tab to tab tabIndex
        tell current tab to do JavaScript "document.querySelector('[aria-label=\"Conversation Information\"]').click()"
        activate
    end tell

end
