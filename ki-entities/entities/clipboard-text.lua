----------------------------------------------------------------------------------------------------
-- Clipboard text entity
--
local Ki = spoon.Ki
local Entity = Ki.Entity

-- General text transform functions
local function capitalize(text) return text:gsub('^%l', string.upper) end
local function camelCase(text) return text:gsub('%W+(%w+)', capitalize) end
local function kebabCase(text) return text:gsub('%W+', '-') end
local function snakeCase(text) return text:gsub('%W+', '_') end
local function normalCase(text) return text:gsub('%W+', ' ') end

-- Helper method for notifying on completion of clipboard text events
local function notify(message, details)
    details = details or ""
    return hs.notify.show("Ki - Clipboard Text Entity", message, details)
end

-- Helper method to create events that transform text that exists in the clipboard
local function transformText(message, transformFn)
    return function()
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

        notify(message..":", convertedText)
    end
end

-- Various clipboard text transformation events
local encodeBase64 = transformText("Encoded text in base64", hs.base64.encode)
local decodeBase64 = transformText("Decoded text in base64", hs.base64.decode)
local lowercase = transformText("Lowercased text", string.lower)
local uppercase = transformText("Uppercased text", string.upper)
local normalcase = transformText("Converted text to normal case", normalCase)
local camelcase = transformText("Converted text to camel case", camelCase)
local kebabcase = transformText("Converted text to kebab case", kebabCase)
local snakecase = transformText("Converted text to snake case", snakeCase)
local formatJSON = transformText("Formatted JSON text", function(text)
    return hs.json.encode(hs.json.decode(text), true)
end)
local capitalizeWords = transformText("Capitalized words in text", function(text)
    return (" "..text:lower()):gsub("%W%l", string.upper):sub(2)
end)

-- Use minified sql-formatter package
local sqlFormatterPath = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/sql-formatter.min.js")
local sqlFormatterFile = assert(io.open(sqlFormatterPath, "rb"))
local sqlFormatterScript = sqlFormatterFile:read("*all")
sqlFormatterFile:close()

-- Create sql format text transform event
local formatSQL = transformText("Formatted SQL", function(text)
    -- The method call needs to be invoked in javascript due to osascript limitations
    local sqlFormatter = sqlFormatterScript..[[
        sqlFormatter.format(`]]..text:gsub("%`", "\\`")..[[`, { indent: '    ' })
    ]]
    local _, formattedSQL, descriptor = hs.osascript.javascript(sqlFormatter)
    return formattedSQL, type(descriptor) == "table" and descriptor.NSLocalizedDescription or ""
end)

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

-- Format XML with four-space indentation
local function formatXML()
    hs.execute("pbpaste | XMLLINT_INDENT='    ' xmllint --format - | pbcopy")
    notify("Formatted XML text in clipboard")
end

-- Open a URL copied in the clipboard
local function openURL()
    local text = hs.pasteboard.getContents()
    local success = hs.urlevent.openURL(text)

    if not success then
        notify("Unable to open URL in clipboard:", text)
    end
end

return Entity {
    name = "Clipboard Text",
    shortcuts = {
        { nil, "c", capitalizeWords, "Capitalize Words in Text" },
        { nil, "d", decodeBase64, "Decode Base64" },
        { nil, "e", encodeBase64, "Encode Base64" },
        { nil, "j", formatJSON, "Format JSON" },
        { nil, "k", kebabcase, "Convert Text to Kebabcase" },
        { nil, "l", lowercase, "Convert Text to Lowercase" },
        { nil, "n", normalcase, "Convert Text to Normal" },
        { nil, "r", convertRtfToPlainText, "Convert RTF Text to Plain Text" },
        { nil, "s", formatSQL, "Format SQL" },
        { nil, "u", uppercase, "Convert Text to Uppercase" },
        { nil, "x", formatXML, "Format XML" },
        { nil, "space", openURL, "Open Copied URL" },
        { { "shift" }, "c", camelcase, "Convert Text to Camelcase" },
        { { "shift" }, "s", snakecase, "Convert Text to Snakecase" },
    },
}
