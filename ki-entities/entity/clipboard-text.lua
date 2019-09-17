----------------------------------------------------------------------------------------------------
-- Clipboard text entity
--
local Entity = spoon.Ki.Entity

local actions = {}

function actions.notify(message, isError)
    local title = "Ki - Clipboard Text Entity"
    local details = isError and "Unable to manipulate text in clipboard" or hs.pasteboard.getContents()
    return hs.notify.show(title, message, details)
end

function actions.dottedCaseToNormal()
    local clipboardText = hs.pasteboard.getContents()
    local convertedText = clipboardText:gsub("%.", " ")
    hs.pasteboard.setContents(convertedText)
    actions.notify("Clipboard text in normal case")
end

function actions.updateTextCaseEvent(case)
    return function()
        local clipboardText = hs.pasteboard.getContents()
        hs.pasteboard.setContents(clipboardText[case](clipboardText))
        actions.notify("Clipboard text in "..case.."case")
    end
end

function actions.convertBase64Event(translation)
    return function()
        local clipboardText = hs.pasteboard.getContents()
        hs.pasteboard.setContents(hs.base64[translation](clipboardText))
        actions.notify("Clipboard text "..translation.."d in Base64")
    end
end

function actions.convertRtfToPlainText()
    local text = hs.execute([[
        osascript -e 'the clipboard as «class RTF »' | \
            perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))' | \
            textutil -stdin -stdout -convert txt
    ]])
    hs.pasteboard.setContents(text)
    actions.notify("Clipboard RTF text converted to plain text")
end

function actions.formatXML()
    -- Format XML with four-space indentation
    hs.execute("pbpaste | XMLLINT_INDENT='    ' xmllint --format - | pbcopy")
    actions.notify("Formatted XML text in clipboard")
end

function actions.formatJSON()
    local clipboardText = hs.pasteboard.getContents()
    hs.pasteboard.setContents(hs.json.encode(hs.json.decode(clipboardText), true))
    actions.notify("Formatted JSON text in clipboard")
end

function actions.formatSQL()
    hs.execute("pbpaste | format-sql -p console_monochrome | pbcopy")
    actions.notify("Formatted SQL text in clipboard")
end

function actions.openURL()
    local copiedURL = hs.pasteboard.getContents()
    hs.urlevent.openURL(copiedURL)
end

actions.lowercase = actions.updateTextCaseEvent("lower")
actions.uppercase = actions.updateTextCaseEvent("upper")
actions.encodeBase64Text = actions.convertBase64Event("encode")
actions.decodeBase64Text = actions.convertBase64Event("decode")

local shortcuts = {
    { nil, "d", actions.decodeBase64Text, { "Clipboard Text", "Decode Base64" } },
    { nil, "e", actions.encodeBase64Text, { "Clipboard Text", "Encode Base64" } },
    { nil, "j", actions.formatJSON, { "Clipboard Text", "Format JSON" } },
    { nil, "l", actions.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
    { nil, "r", actions.convertRtfToPlainText, { "Clipboard Text", "Convert RTF Text to Plain Text" } },
    { nil, "s", actions.formatSQL, { "Clipboard Text", "Format SQL" } },
    { nil, "u", actions.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
    { nil, "x", actions.formatXML, { "Clipboard Text", "Format XML" } },
    { nil, "space", actions.openURL, { "Clipboard Text", "Open Copied URL" } },
    { { "shift" }, "d", actions.dottedCaseToNormal, { "Clipboard Text", "Convert Dotted Text Case to Normal" } },
}

return Entity:new("Clipboard Text", shortcuts, true)
