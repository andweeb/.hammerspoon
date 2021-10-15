----------------------------------------------------------------------------------------------------
-- Clipboard Text entity
--
local Ki = spoon.Ki
local Entity = Ki.Entity
local Action = Ki.Action

-- General text transform functions
local function capitalize(text) return text:gsub('^%l', string.upper) end
local function camelCase(text) return text:gsub('%W+(%w+)', capitalize) end
local function kebabCase(text) return text:gsub('%W+', '-') end
local function snakeCase(text) return text:gsub('%W+', '_') end
local function normalCase(text) return text:gsub('%W+', ' ') end
local function formatJSON(text)
    return hs.json.encode(hs.json.decode(text), true)
end
local function capitalizeWords(text)
    return (" "..text:lower()):gsub("%W%l", string.upper):sub(2)
end
local function notify(message, details)
    details = details or ""
    return hs.notify.show("Clipboard Text", message, details)
end

-- Action that transforms clipboard text
local function TransformTextAction(options)
    local name, transformFn = table.unpack(options)

    return Action {
        name = name,
        action = function()
            local clipboardText = hs.pasteboard.getContents()

            local convertedText, errorMessage = transformFn(clipboardText)
            if not convertedText then
                notify("Unable to transform text in clipboard", errorMessage)
                return
            end

            local success = hs.pasteboard.setContents(convertedText)
            if not success then
                notify("Unable to set contents to clipboard:", convertedText)
                return
            end

            notify(name, convertedText)
        end,
    }
end

-- Format XML with four-space indentation
local function formatXML()
    hs.execute("pbpaste | XMLLINT_INDENT='    ' xmllint --format - | pbcopy")
    notify("Formatted XML text in clipboard")
end

-- Determine sqlformat script path
local parentPathRegex = "^(.+)/.+$"
local spoonPath = hs.spoons.scriptPath()
local root = spoonPath:match(parentPathRegex):match(parentPathRegex)
local scriptPath = root.."/scripts/sqlformat/sqlformat"

-- Create sql format text transform event
local FormatSQL = Action {
    name = "Format SQL",
    action = function()
        local formattedSQL = ""
        local clipboardText = hs.pasteboard.getContents()

        local function callbackFn(exitCode, _, stderr)
            if exitCode ~= 0 then
                notify("Unable to format SQL", stderr)
                return
            end

            local success = hs.pasteboard.setContents(formattedSQL)
            if not success then
                notify("Unable to set contents to clipboard:", formattedSQL)
                return
            end

            notify("Format SQL", formattedSQL)
        end

        local function streamCallbackFn(_, stdout)
            formattedSQL = formattedSQL..stdout
            return true
        end

        hs.task.new(scriptPath, callbackFn, streamCallbackFn, { clipboardText }):start()

    end,
}

-- Convert Rich Text Format (RTF) to plain text
local function convertRtfToPlainText()
    local text = hs.execute([[
        osascript -e 'the clipboard as «class RTF »' | \
            perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))' | \
            textutil -stdin -stdout -convert txt
    ]])
    hs.pasteboard.setContents(text)
    notify("Clipboard RTF text converted to plain text:", text)
end

-- Open a URL copied in the clipboard
local OpenURL = Action {
    name = "Open Copied URL",
    action = function()
        local text = hs.pasteboard.getContents()
        local success = hs.urlevent.openURL(text)

        if not success then
            notify("Unable to open URL in clipboard:", text)
        end
    end
}

return Entity {
    name = "Clipboard Text",
    shortcuts = {
        { nil, "space", OpenURL },
        { nil, "c", TransformTextAction { "Capitalize Words in Text", capitalizeWords } },
        { nil, "d", TransformTextAction { "Decode Base64", hs.base64.decode } },
        { nil, "e", TransformTextAction { "Encode Base64", hs.base64.encode } },
        { nil, "j", TransformTextAction { "Encode Base64", formatJSON } },
        { nil, "k", TransformTextAction { "Convert Text to Kebabcase", kebabCase } },
        { nil, "l", TransformTextAction { "Convert Text to Lowercase", string.lower } },
        { nil, "n", TransformTextAction { "Convert Text to Normal", normalCase } },
        { nil, "r", TransformTextAction { "Convert RTF Text to Plain Text", convertRtfToPlainText } },
        { nil, "s", FormatSQL },
        { nil, "u", TransformTextAction { "Convert Text to Uppercase", string.upper } },
        { nil, "x", TransformTextAction { "Format XML", formatXML } },
        { { "shift" }, "c", TransformTextAction { "Convert Text to Camelcase", camelCase } },
        { { "shift" }, "s", TransformTextAction { "Convert Text to Snakecase", snakeCase } },
    },
}
