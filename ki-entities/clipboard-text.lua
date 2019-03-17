local ClipboardTextEntity = {}

function ClipboardTextEntity:init(Entity)
    local ClipboardText = Entity:new("Clipboard Text")

    function ClipboardText.updateTextCaseEvent(case)
        return function()
            local clipboardText = hs.pasteboard.getContents()
            hs.pasteboard.setContents(clipboardText[case](clipboardText))
        end
    end

    function ClipboardText.convertBase64Event(translation)
        return function()
            local clipboardText = hs.pasteboard.getContents()
            hs.pasteboard.setContents(hs.base64[translation](clipboardText))
        end
    end

    local actions = {
        lowercase = ClipboardText.updateTextCaseEvent("lower"),
        uppercase = ClipboardText.updateTextCaseEvent("upper"),
        encodeBase64Text = ClipboardText.convertBase64Event("encode"),
        decodeBase64Text = ClipboardText.convertBase64Event("decode"),
    }
    local shortcuts = {
        { nil, "d", actions.decodeBase64Text, { "Clipboard Text", "Decode Base64" } },
        { nil, "e", actions.encodeBase64Text, { "Clipboard Text", "Encode Base64" } },
        { nil, "l", actions.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
        { nil, "u", actions.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
    }

    ClipboardText:initialize("Clipboard Text", shortcuts, true)

    return ClipboardText
end

return ClipboardTextEntity
