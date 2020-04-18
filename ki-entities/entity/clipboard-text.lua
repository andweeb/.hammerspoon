----------------------------------------------------------------------------------------------------
-- Clipboard text entity
--
local Entity = spoon.Ki.Entity
local ClipboardText = Entity:new("Clipboard Text")

-- General text transform functions
local function capitalize(text) return text:gsub('^%l', string.upper) end
local function camelCase(text) return text:gsub('%W+(%w+)', capitalize) end
local function kebabCase(text) return text:gsub('%W+', '-') end
local function snakeCase(text) return text:gsub('%W+', '_') end
local function normalCase(text) return text:gsub('%W+', ' ') end

-- Helper method to create events that transform text that exists in the clipboard
function ClipboardText.transformTextEvent(message, transformFn)
    return function()
        local clipboardText = hs.pasteboard.getContents()

        local convertedText, errorMessage = transformFn(clipboardText)
        if not convertedText then
            ClipboardText.notify("Unable to transform text in clipboard", errorMessage)
            return
        end

        local success = hs.pasteboard.setContents(convertedText)
        if not success then
            ClipboardText.notify("Unable to set contents to clipboard:", convertedText)
            return
        end

        ClipboardText.notify(message..":", convertedText)
    end
end

-- Various clipboard text transformation events
ClipboardText.encodeBase64 = ClipboardText.transformTextEvent("Encoded text in base64", hs.base64.encode)
ClipboardText.decodeBase64 = ClipboardText.transformTextEvent("Decoded text in base64", hs.base64.decode)
ClipboardText.lowercase = ClipboardText.transformTextEvent("Lowercased text", string.lower)
ClipboardText.uppercase = ClipboardText.transformTextEvent("Uppercased text", string.upper)
ClipboardText.normalcase = ClipboardText.transformTextEvent("Converted text to normal case", normalCase)
ClipboardText.camelcase = ClipboardText.transformTextEvent("Converted text to camel case", camelCase)
ClipboardText.kebabcase = ClipboardText.transformTextEvent("Converted text to kebab case", kebabCase)
ClipboardText.snakecase = ClipboardText.transformTextEvent("Converted text to snake case", snakeCase)
ClipboardText.formatJSON = ClipboardText.transformTextEvent("Formatted JSON text", function(text)
    return hs.json.encode(hs.json.decode(text), true)
end)
ClipboardText.capitalizeWords = ClipboardText.transformTextEvent("Capitalized words in text", function(text)
    return (" "..text:lower()):gsub("%W%l", string.upper):sub(2)
end)

-- Use minified sql-formatter package
local sqlFormatterPath = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/sql-formatter.min.js")
local sqlFormatterFile = assert(io.open(sqlFormatterPath, "rb"))
local sqlFormatterScript = sqlFormatterFile:read("*all")
sqlFormatterFile:close()

-- Create sql format text transform event
ClipboardText.formatSQL = ClipboardText.transformTextEvent("Formatted SQL", function(text)
    -- The method call needs to be invoked in javascript due to osascript limitations
    local sqlFormatter = sqlFormatterScript..[[
        sqlFormatter.format(`]]..text:gsub("%`", "\\`")..[[`, { indent: '    ' })
    ]]
    local _, formattedSQL, descriptor = hs.osascript.javascript(sqlFormatter)
    return formattedSQL, type(descriptor) == "table" and descriptor.NSLocalizedDescription or ""
end)

-- Convert Rich Text Format (RTF) to plain text
function ClipboardText.convertRtfToPlainText()
    local text = hs.execute([[
        osascript -e 'the clipboard as «class RTF »' | \
            perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))' | \
            textutil -stdin -stdout -convert txt
    ]])
    hs.pasteboard.setContents(text)
    ClipboardText.notify("Clipboard RTF text converted to plain text:", text)
end

-- Format XML with four-space indentation
function ClipboardText.formatXML()
    hs.execute("pbpaste | XMLLINT_INDENT='    ' xmllint --format - | pbcopy")
    ClipboardText.notify("Formatted XML text in clipboard")
end

-- Open a URL copied in the clipboard
function ClipboardText.openURL()
    local text = hs.pasteboard.getContents()
    local success = hs.urlevent.openURL(text)

    if not success then
        ClipboardText.notify("Unable to open URL in clipboard:", text)
    end
end

-- Helper method for notifying on completion of clipboard text events
function ClipboardText.notify(message, details)
    details = details or ""
    return hs.notify.show("Ki - Clipboard Text Entity", message, details)
end

ClipboardText:registerShortcuts({
    { nil, "c", ClipboardText.capitalizeWords, { "Clipboard Text", "Capitalize Words in Text" } },
    { nil, "d", ClipboardText.decodeBase64, { "Clipboard Text", "Decode Base64" } },
    { nil, "e", ClipboardText.encodeBase64, { "Clipboard Text", "Encode Base64" } },
    { nil, "j", ClipboardText.formatJSON, { "Clipboard Text", "Format JSON" } },
    { nil, "k", ClipboardText.kebabcase, { "Clipboard Text", "Convert Text to Kebabcase" } },
    { nil, "l", ClipboardText.lowercase, { "Clipboard Text", "Convert Text to Lowercase" } },
    { nil, "n", ClipboardText.normalcase, { "Clipboard Text", "Convert Text to Normal" } },
    { nil, "r", ClipboardText.convertRtfToPlainText, { "Clipboard Text", "Convert RTF Text to Plain Text" } },
    { nil, "s", ClipboardText.formatSQL, { "Clipboard Text", "Format SQL" } },
    { nil, "u", ClipboardText.uppercase, { "Clipboard Text", "Convert Text to Uppercase" } },
    { nil, "x", ClipboardText.formatXML, { "Clipboard Text", "Format XML" } },
    { nil, "space", ClipboardText.openURL, { "Clipboard Text", "Open Copied URL" } },
    { { "shift" }, "c", ClipboardText.camelcase, { "Clipboard Text", "Convert Text to Camelcase" } },
    { { "shift" }, "s", ClipboardText.snakecase, { "Clipboard Text", "Convert Text to Snakecase" } },
})

return ClipboardText
