local ClipboardTextEntity = {}

function ClipboardTextEntity:init(Entity)
    local ClipboardText = Entity:new("Clipboard Text")

    function ClipboardText.notify(message, isError)
        local title = "Ki - Clipboard Text Entity"
        local details = isError and "Unable to manipulate text in clipboard" or "Result copied to the clipboard"
        return hs.notify.show(title, message, details)
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

    local actions = {
        lowercase = ClipboardText.updateTextCaseEvent("lower"),
        uppercase = ClipboardText.updateTextCaseEvent("upper"),
        encodeBase64Text = ClipboardText.convertBase64Event("encode"),
        decodeBase64Text = ClipboardText.convertBase64Event("decode"),
        formatXML = ClipboardText.formatXML,
        formatJSON = ClipboardText.formatJSON,
    }
    local shortcuts = {
        { nil, "d", actions.decodeBase64Text, { "Clipboard Text", "Decode Base64" } },
        { nil, "e", actions.encodeBase64Text, { "Clipboard Text", "Encode Base64" } },
        { nil, "j", actions.formatJSON, { "Clipboard Text", "Format JSON" } },
        { nil, "l", actions.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
        { nil, "u", actions.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
        { nil, "x", actions.formatXML, { "Clipboard Text", "Format XML" } },
    }

    ClipboardText:initialize("Clipboard Text", shortcuts, true)

    return ClipboardText
end

return ClipboardTextEntity
