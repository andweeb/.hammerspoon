----------------------------------------------------------------------------------------------------
-- Clipboard text entity
--
local Entity = spoon.Ki.Entity
local ClipboardText = Entity:new("Clipboard Text")

function ClipboardText.notify(message, isError)
    local title = "Ki - Clipboard Text Entity"
    local details = isError and "Unable to manipulate text in clipboard" or hs.pasteboard.getContents()
    return hs.notify.show(title, message, details)
end

function ClipboardText.dottedCaseToNormal()
    local clipboardText = hs.pasteboard.getContents()
    local convertedText = clipboardText:gsub("%.", " ")
    hs.pasteboard.setContents(convertedText)
    ClipboardText.notify("Clipboard text in normal case")
end

function ClipboardText.updateTextCaseEvent(case)
    return function()
        local clipboardText = hs.pasteboard.getContents()
        hs.pasteboard.setContents(clipboardText[case](clipboardText))
        ClipboardText.notify("Clipboard text in "..case.."case")
    end
end

function ClipboardText.convertBase64Event(translation)
    return function()
        local clipboardText = hs.pasteboard.getContents()
        hs.pasteboard.setContents(hs.base64[translation](clipboardText))
        ClipboardText.notify("Clipboard text "..translation.."d in Base64")
    end
end

function ClipboardText.convertRtfToPlainText()
    local text = hs.execute([[
        osascript -e 'the clipboard as «class RTF »' | \
            perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))' | \
            textutil -stdin -stdout -convert txt
    ]])
    hs.pasteboard.setContents(text)
    ClipboardText.notify("Clipboard RTF text converted to plain text")
end

function ClipboardText.formatXML()
    -- Format XML with four-space indentation
    hs.execute("pbpaste | XMLLINT_INDENT='    ' xmllint --format - | pbcopy")
    ClipboardText.notify("Formatted XML text in clipboard")
end

function ClipboardText.formatJSON()
    local clipboardText = hs.pasteboard.getContents()
    hs.pasteboard.setContents(hs.json.encode(hs.json.decode(clipboardText), true))
    ClipboardText.notify("Formatted JSON text in clipboard")
end

function ClipboardText.formatSQL()
    hs.execute("pbpaste | format-sql -p console_monochrome | pbcopy")
    ClipboardText.notify("Formatted SQL text in clipboard")
end

function ClipboardText.openURL()
    local copiedURL = hs.pasteboard.getContents()
    hs.urlevent.openURL(copiedURL)
end

ClipboardText.lowercase = ClipboardText.updateTextCaseEvent("lower")
ClipboardText.uppercase = ClipboardText.updateTextCaseEvent("upper")
ClipboardText.encodeBase64Text = ClipboardText.convertBase64Event("encode")
ClipboardText.decodeBase64Text = ClipboardText.convertBase64Event("decode")

local shortcuts = {
    { nil, "d", ClipboardText.decodeBase64Text, { "Clipboard Text", "Decode Base64" } },
    { nil, "e", ClipboardText.encodeBase64Text, { "Clipboard Text", "Encode Base64" } },
    { nil, "j", ClipboardText.formatJSON, { "Clipboard Text", "Format JSON" } },
    { nil, "l", ClipboardText.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
    { nil, "r", ClipboardText.convertRtfToPlainText, { "Clipboard Text", "Convert RTF Text to Plain Text" } },
    { nil, "s", ClipboardText.formatSQL, { "Clipboard Text", "Format SQL" } },
    { nil, "u", ClipboardText.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
    { nil, "x", ClipboardText.formatXML, { "Clipboard Text", "Format XML" } },
    { nil, "space", ClipboardText.openURL, { "Clipboard Text", "Open Copied URL" } },
    { { "shift" }, "d", ClipboardText.dottedCaseToNormal, { "Clipboard Text", "Convert Dotted Text Case to Normal" } },
}

ClipboardText:initialize("Clipboard Text", shortcuts, true)

return ClipboardText
