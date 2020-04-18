----------------------------------------------------------------------------------------------------
-- Emoji Picker entity
--
local Picker = require("ki-entities/entity/picker")

-- Codegen functions used to initialize the hardcoded glyph choices table below:
-- luacheck: push ignore 211
local function createChoices()
    local choices = {}

    local function splitTSV(str)
        local values = {}

        for substr in str:gmatch("([^\t]+)") do
            table.insert(values, substr)
        end

        return values
    end

    -- Named glyph references from HTML spec:
    -- https://html.spec.whatwg.org/#named-character-references
    local tsvFile = io.open("ki-entities/entity/glyphs.tsv", "r")

    -- Initialize glyph choices
    for line in tsvFile:lines() do
        local name, code = table.unpack(splitTSV(line))
        local success, glyph = pcall(function()
            return hs.utf8.codepointToUTF8('U+'..code)
        end)

        if name and success then
            -- Update names to be in normal text
            local subText = (" "..name:lower()):gsub("%W%l", string.upper):sub(2)

            table.insert(choices, {
                item = glyph,
                text = glyph,
                subText = subText.." (U+"..code..")",
            })
        end
    end

    -- Sort choices by character names
    table.sort(choices, function(a, b)
        return a.subText:lower() < b.subText:lower()
    end)

    return choices
end

local function codegen()
    print("local choices = "..hs.inspect(createChoices()))
end
-- luacheck: pop

local choices = { {
    item = "Á",
    subText = "A With Acute, Latin Capital Letter (U+00C1)",
    text = "Á"
  }, {
    item = "á",
    subText = "A With Acute, Latin Small Letter (U+00E1)",
    text = "á"
  }, {
    item = "ă",
    subText = "A With Breve, Latin Small Letter (U+0103)",
    text = "ă"
  }, {
    item = "ǎ",
    subText = "A With Caron, Latin Small Letter (U+01CE)",
    text = "ǎ"
  }, {
    item = "Â",
    subText = "A With Circumflex, Latin Capital Letter (U+00C2)",
    text = "Â"
  }, {
    item = "â",
    subText = "A With Circumflex, Latin Small Letter (U+00E2)",
    text = "â"
  }, {
    item = "Ä",
    subText = "A With Diaeresis, Latin Capital Letter (U+00C4)",
    text = "Ä"
  }, {
    item = "ä",
    subText = "A With Diaeresis, Latin Small Letter (U+00E4)",
    text = "ä"
  }, {
    item = "ȧ",
    subText = "A With Dot Above, Latin Small Letter (U+0227)",
    text = "ȧ"
  }, {
    item = "ạ",
    subText = "A With Dot Below, Latin Small Letter (U+1EA1)",
    text = "ạ"
  }, {
    item = "ȁ",
    subText = "A With Double Grave, Latin Small Letter (U+0201)",
    text = "ȁ"
  }, {
    item = "À",
    subText = "A With Grave, Latin Capital Letter (U+00C0)",
    text = "À"
  }, {
    item = "à",
    subText = "A With Grave, Latin Small Letter (U+00E0)",
    text = "à"
  }, {
    item = "ả",
    subText = "A With Hook Above, Latin Small Letter (U+1EA3)",
    text = "ả"
  }, {
    item = "ȃ",
    subText = "A With Inverted Breve, Latin Small Letter (U+0203)",
    text = "ȃ"
  }, {
    item = "ā",
    subText = "A With Macron, Latin Small Letter (U+0101)",
    text = "ā"
  }, {
    item = "ą",
    subText = "A With Ogonek, Latin Small Letter (U+0105)",
    text = "ą"
  }, {
    item = "ẚ",
    subText = "A With Right Half Ring, Latin Small Letter (U+1E9A)",
    text = "ẚ"
  }, {
    item = "Å",
    subText = "A With Ring Above, Latin Capital Letter (U+00C5)",
    text = "Å"
  }, {
    item = "å",
    subText = "A With Ring Above, Latin Small Letter (U+00E5)",
    text = "å"
  }, {
    item = "ḁ",
    subText = "A With Ring Below, Latin Small Letter (U+1E01)",
    text = "ḁ"
  }, {
    item = "Ⱥ",
    subText = "A With Stroke, Latin Capital Letter (U+023A)",
    text = "Ⱥ"
  }, {
    item = "Ã",
    subText = "A With Tilde, Latin Capital Letter (U+00C3)",
    text = "Ã"
  }, {
    item = "ã",
    subText = "A With Tilde, Latin Small Letter (U+00E3)",
    text = "ã"
  }, {
    item = "ͣ",
    subText = "A, Combining Latin Small Letter (U+0363)",
    text = "ͣ"
  }, {
    item = "ᴀ",
    subText = "A, Latin Letter Small Capital (U+1D00)",
    text = "ᴀ"
  }, {
    item = "ɑ",
    subText = "A, Latin Small Letter Script (U+0251)",
    text = "ɑ"
  }, {
    item = "ɐ",
    subText = "A, Latin Small Letter Turned (U+0250)",
    text = "ɐ"
  }, {
    item = "՟",
    subText = "Abbreviation Mark, Armenian (U+055F)",
    text = "՟"
  }, {
    item = "܏",
    subText = "Abbreviation Mark, Syriac (U+070F)",
    text = "܏"
  }, {
    item = "॰",
    subText = "Abbreviation Sign, Devanagari (U+0970)",
    text = "॰"
  }, {
    item = "㍱",
    subText = "Abbreviations, Squared Latin (U+3371)",
    text = "㍱"
  }, {
    item = "ᢰ",
    subText = "Aboriginal Syllabics Extended, Unified Canadian (U+18B0)",
    text = "ᢰ"
  }, {
    item = "᐀",
    subText = "Aboriginal Syllabics, Unified Canadian (U+1400)",
    text = "᐀"
  }, {
    item = "̕",
    subText = "Above Right, Combining Comma (U+0315)",
    text = "̕"
  }, {
    item = "͘",
    subText = "Above Right, Combining Dot (U+0358)",
    text = "͘"
  }, {
    item = "̒",
    subText = "Above, Cedilla (U+0312)",
    text = "̒"
  }, {
    item = "͌",
    subText = "Above, Combining Almost Equal To (U+034C)",
    text = "͌"
  }, {
    item = "⃔",
    subText = "Above, Combining Anticlockwise Arrow (U+20D4)",
    text = "⃔"
  }, {
    item = "⃰",
    subText = "Above, Combining Asterisk (U+20F0)",
    text = "⃰"
  }, {
    item = "͆",
    subText = "Above, Combining Bridge (U+0346)",
    text = "͆"
  }, {
    item = "⃕",
    subText = "Above, Combining Clockwise Arrow (U+20D5)",
    text = "⃕"
  }, {
    item = "̓",
    subText = "Above, Combining Comma (U+0313)",
    text = "̓"
  }, {
    item = "⃔",
    subText = "Above, Combining Counterclockwise Arrow (U+20D4)",
    text = "⃔"
  }, {
    item = "̇",
    subText = "Above, Combining Dot (U+0307)",
    text = "̇"
  }, {
    item = "̎",
    subText = "Above, Combining Double Vertical Line (U+030E)",
    text = "̎"
  }, {
    item = "⃜",
    subText = "Above, Combining Four Dots (U+20DC)",
    text = "⃜"
  }, {
    item = "͋",
    subText = "Above, Combining Homothetic (U+034B)",
    text = "͋"
  }, {
    item = "̉",
    subText = "Above, Combining Hook (U+0309)",
    text = "̉"
  }, {
    item = "̚",
    subText = "Above, Combining Left Angle (U+031A)",
    text = "̚"
  }, {
    item = "⃖",
    subText = "Above, Combining Left Arrow (U+20D6)",
    text = "⃖"
  }, {
    item = "͑",
    subText = "Above, Combining Left Half Ring (U+0351)",
    text = "͑"
  }, {
    item = "⃐",
    subText = "Above, Combining Left Harpoon (U+20D0)",
    text = "⃐"
  }, {
    item = "⃡",
    subText = "Above, Combining Left Right Arrow (U+20E1)",
    text = "⃡"
  }, {
    item = "͊",
    subText = "Above, Combining Not Tilde (U+034A)",
    text = "͊"
  }, {
    item = "̔",
    subText = "Above, Combining Reversed Comma (U+0314)",
    text = "̔"
  }, {
    item = "⃗",
    subText = "Above, Combining Right Arrow (U+20D7)",
    text = "⃗"
  }, {
    item = "͐",
    subText = "Above, Combining Right Arrowhead (U+0350)",
    text = "͐"
  }, {
    item = "͗",
    subText = "Above, Combining Right Half Ring (U+0357)",
    text = "͗"
  }, {
    item = "⃑",
    subText = "Above, Combining Right Harpoon (U+20D1)",
    text = "⃑"
  }, {
    item = "̊",
    subText = "Above, Combining Ring (U+030A)",
    text = "̊"
  }, {
    item = "⃛",
    subText = "Above, Combining Three Dots (U+20DB)",
    text = "⃛"
  }, {
    item = "̒",
    subText = "Above, Combining Turned Comma (U+0312)",
    text = "̒"
  }, {
    item = "̍",
    subText = "Above, Combining Vertical Line (U+030D)",
    text = "̍"
  }, {
    item = "⃩",
    subText = "Above, Combining Wide Bridge (U+20E9)",
    text = "⃩"
  }, {
    item = "̽",
    subText = "Above, Combining X (U+033D)",
    text = "̽"
  }, {
    item = "͛",
    subText = "Above, Combining Zigzag (U+035B)",
    text = "͛"
  }, {
    item = "˙",
    subText = "Above, Dot (U+02D9)",
    text = "˙"
  }, {
    item = "̈",
    subText = "Above, Double Dot (U+0308)",
    text = "̈"
  }, {
    item = "˚",
    subText = "Above, Ring (U+02DA)",
    text = "˚"
  }, {
    item = "̌",
    subText = "Above, V (U+030C)",
    text = "̌"
  }, {
    item = "⪡",
    subText = "Absolute Continuity (U+2AA1)",
    text = "⪡"
  }, {
    item = "|",
    subText = "Absolute Value (U+007C)",
    text = "|"
  }, {
    item = "〚",
    subText = "Abstract Syntax Bracket, Left (U+301A)",
    text = "〚"
  }, {
    item = "〛",
    subText = "Abstract Syntax Bracket, Right (U+301B)",
    text = "〛"
  }, {
    item = "⏦",
    subText = "Ac Current (U+23E6)",
    text = "⏦"
  }, {
    item = "̗",
    subText = "Accent Below, Combining Acute (U+0317)",
    text = "̗"
  }, {
    item = "̭",
    subText = "Accent Below, Combining Circumflex (U+032D)",
    text = "̭"
  }, {
    item = "̖",
    subText = "Accent Below, Combining Grave (U+0316)",
    text = "̖"
  }, {
    item = "´",
    subText = "Accent, Acute (U+00B4)",
    text = "´"
  }, {
    item = "^",
    subText = "Accent, Circumflex (U+005E)",
    text = "^"
  }, {
    item = "́",
    subText = "Accent, Combining Acute (U+0301)",
    text = "́"
  }, {
    item = "̂",
    subText = "Accent, Combining Circumflex (U+0302)",
    text = "̂"
  }, {
    item = "̋",
    subText = "Accent, Combining Double Acute (U+030B)",
    text = "̋"
  }, {
    item = "̏",
    subText = "Accent, Combining Double Grave (U+030F)",
    text = "̏"
  }, {
    item = "̀",
    subText = "Accent, Combining Grave (U+0300)",
    text = "̀"
  }, {
    item = "˝",
    subText = "Accent, Double Acute (U+02DD)",
    text = "˝"
  }, {
    item = "`",
    subText = "Accent, Grave (U+0060)",
    text = "`"
  }, {
    item = "ˊ",
    subText = "Accent, Modifier Letter Acute (U+02CA)",
    text = "ˊ"
  }, {
    item = "ˆ",
    subText = "Accent, Modifier Letter Circumflex (U+02C6)",
    text = "ˆ"
  }, {
    item = "˟",
    subText = "Accent, Modifier Letter Cross (U+02DF)",
    text = "˟"
  }, {
    item = "ˋ",
    subText = "Accent, Modifier Letter Grave (U+02CB)",
    text = "ˋ"
  }, {
    item = "ˏ",
    subText = "Accent, Modifier Letter Low Acute (U+02CF)",
    text = "ˏ"
  }, {
    item = "ˎ",
    subText = "Accent, Modifier Letter Low Grave (U+02CE)",
    text = "ˎ"
  }, {
    item = "´",
    subText = "Accent, Spacing Acute (U+00B4)",
    text = "´"
  }, {
    item = "^",
    subText = "Accent, Spacing Circumflex (U+005E)",
    text = "^"
  }, {
    item = "`",
    subText = "Accent, Spacing Grave (U+0060)",
    text = "`"
  }, {
    item = "˟",
    subText = "Accent, Swedish Grave (U+02DF)",
    text = "˟"
  }, {
    item = "🦮",
    subText = "Accessibility Symbols (U+1F9AE)",
    text = "🦮"
  }, {
    item = "⛌",
    subText = "Accident (U+26CC)",
    text = "⛌"
  }, {
    item = "℀",
    subText = "Account Of (U+2100)",
    text = "℀"
  }, {
    item = "👤",
    subText = "Account, Guest (U+1F464)",
    text = "👤"
  }, {
    item = "👥",
    subText = "Accounts (U+1F465)",
    text = "👥"
  }, {
    item = "",
    subText = "Acknowledge (U+0006)",
    text = ""
  }, {
    item = "",
    subText = "Acknowledge, Negative (U+0015)",
    text = ""
  }, {
    item = "␆",
    subText = "Acknowledge, Symbol For (U+2406)",
    text = "␆"
  }, {
    item = "␕",
    subText = "Acknowledge, Symbol For Negative (U+2415)",
    text = "␕"
  }, {
    item = "⁝",
    subText = "Acrophonic Symbol Three, Epidaurean (U+205D)",
    text = "⁝"
  }, {
    item = "⃧",
    subText = "Actuarial Bend (U+20E7)",
    text = "⃧"
  }, {
    item = "´",
    subText = "Acute Accent (U+00B4)",
    text = "´"
  }, {
    item = "̗",
    subText = "Acute Accent Below, Combining (U+0317)",
    text = "̗"
  }, {
    item = "́",
    subText = "Acute Accent, Combining (U+0301)",
    text = "́"
  }, {
    item = "̋",
    subText = "Acute Accent, Combining Double (U+030B)",
    text = "̋"
  }, {
    item = "˝",
    subText = "Acute Accent, Double (U+02DD)",
    text = "˝"
  }, {
    item = "ˊ",
    subText = "Acute Accent, Modifier Letter (U+02CA)",
    text = "ˊ"
  }, {
    item = "ˏ",
    subText = "Acute Accent, Modifier Letter Low (U+02CF)",
    text = "ˏ"
  }, {
    item = "´",
    subText = "Acute Accent, Spacing (U+00B4)",
    text = "´"
  }, {
    item = "́",
    subText = "Acute Tone Mark, Combining (U+0341)",
    text = "́"
  }, {
    item = "ੱ",
    subText = "Addak, Gurmukhi (U+0A71)",
    text = "ੱ"
  }, {
    item = "℁",
    subText = "Addressed To The Subject (U+2101)",
    text = "℁"
  }, {
    item = "☬",
    subText = "Adi Shakti (U+262C)",
    text = "☬"
  }, {
    item = "𞤀",
    subText = "Adlam (U+1E900)",
    text = "𞤀"
  }, {
    item = "Æ",
    subText = "Ae, Latin Capital Letter (U+00C6)",
    text = "Æ"
  }, {
    item = "Æ",
    subText = "Ae, Latin Capital Ligature (U+00C6)",
    text = "Æ"
  }, {
    item = "ᴁ",
    subText = "Ae, Latin Letter Small Capital (U+1D01)",
    text = "ᴁ"
  }, {
    item = "æ",
    subText = "Ae, Latin Small Letter (U+00E6)",
    text = "æ"
  }, {
    item = "ᴂ",
    subText = "Ae, Latin Small Letter Turned (U+1D02)",
    text = "ᴂ"
  }, {
    item = "æ",
    subText = "Ae, Latin Small Ligature (U+00E6)",
    text = "æ"
  }, {
    item = "𐄁",
    subText = "Aegean Word Separator Dot (U+10101)",
    text = "𐄁"
  }, {
    item = "𐄀",
    subText = "Aegean Word Separator Line (U+10100)",
    text = "𐄀"
  }, {
    item = "⚕",
    subText = "Aesculapius, Staff Of (U+2695)",
    text = "⚕"
  }, {
    item = "؋",
    subText = "Afghani Sign (U+060B)",
    text = "؋"
  }, {
    item = "ǀ",
    subText = "African Letters For Clicks (U+01C0)",
    text = "ǀ"
  }, {
    item = "𑜀",
    subText = "Ahom (U+11700)",
    text = "𑜀"
  }, {
    item = "ᴥ",
    subText = "Ain, Latin Letter (U+1D25)",
    text = "ᴥ"
  }, {
    item = "ㇰ",
    subText = "Ainu, Katakana Extensions For (U+31F0)",
    text = "ㇰ"
  }, {
    item = "✈",
    subText = "Airplane (U+2708)",
    text = "✈"
  }, {
    item = "⅍",
    subText = "Aktieselskab (U+214D)",
    text = "⅍"
  }, {
    item = "්",
    subText = "Al-Lakuna, Sinhala Sign (U+0DCA)",
    text = "්"
  }, {
    item = "⏰",
    subText = "Alarm Clock (U+23F0)",
    text = "⏰"
  }, {
    item = "𐔰",
    subText = "Albanian, Caucasian (U+10530)",
    text = "𐔰"
  }, {
    item = "🜀",
    subText = "Alchemical Symbols (U+1F700)",
    text = "🜀"
  }, {
    item = "❦",
    subText = "Aldus Leaf (U+2766)",
    text = "❦"
  }, {
    item = "ℵ",
    subText = "Alef Symbol (U+2135)",
    text = "ℵ"
  }, {
    item = "⚗",
    subText = "Alembic (U+2697)",
    text = "⚗"
  }, {
    item = "👾",
    subText = "Alien Monster (U+1F47E)",
    text = "👾"
  }, {
    item = "👽",
    subText = "Alien, Extraterrestrial (U+1F47D)",
    text = "👽"
  }, {
    item = "⌮",
    subText = "All Around-Profile (U+232E)",
    text = "⌮"
  }, {
    item = "≌",
    subText = "All Equal To (U+224C)",
    text = "≌"
  }, {
    item = "∀",
    subText = "All, For (U+2200)",
    text = "∀"
  }, {
    item = "≈",
    subText = "Almost Equal To (U+2248)",
    text = "≈"
  }, {
    item = "͌",
    subText = "Almost Equal To Above, Combining (U+034C)",
    text = "͌"
  }, {
    item = "≉",
    subText = "Almost Equal To, Not (U+2249)",
    text = "≉"
  }, {
    item = "ɑ",
    subText = "Alpha, Latin Small Letter (U+0251)",
    text = "ɑ"
  }, {
    item = "ɒ",
    subText = "Alpha, Latin Small Letter Turned (U+0252)",
    text = "ɒ"
  }, {
    item = "ﬀ",
    subText = "Alphabetic Presentation Forms (U+FB00)",
    text = "ﬀ"
  }, {
    item = "🄀",
    subText = "Alphanumeric Supplement, Enclosed (U+1F100)",
    text = "🄀"
  }, {
    item = "𝐀",
    subText = "Alphanumeric Symbols, Mathematical (U+1D400)",
    text = "𝐀"
  }, {
    item = "①",
    subText = "Alphanumerics, Enclosed (U+2460)",
    text = "①"
  }, {
    item = "∿",
    subText = "Alternating Current (U+223F)",
    text = "∿"
  }, {
    item = "⎇",
    subText = "Alternative Key Symbol (U+2387)",
    text = "⎇"
  }, {
    item = "ǂ",
    subText = "Alveolar Click, Latin Letter (U+01C2)",
    text = "ǂ"
  }, {
    item = "◻",
    subText = "Always (U+25FB)",
    text = "◻"
  }, {
    item = "&",
    subText = "Ampersand (U+0026)",
    text = "&"
  }, {
    item = "🙰",
    subText = "Ampersand And Ligature-Et Ornaments (U+1F670)",
    text = "🙰"
  }, {
    item = "⅋",
    subText = "Ampersand, Turned (U+214B)",
    text = "⅋"
  }, {
    item = "𔐀",
    subText = "Anatolian Hieroglyphs (U+14400)",
    text = "𔐀"
  }, {
    item = "⚓",
    subText = "Anchor (U+2693)",
    text = "⚓"
  }, {
    item = "￹",
    subText = "Anchor, Interlinear Annotation (U+FFF9)",
    text = "￹"
  }, {
    item = "⸎",
    subText = "Ancient Greek Textual Symbols (U+2E0E)",
    text = "⸎"
  }, {
    item = "⋏",
    subText = "And, Curly Logical (U+22CF)",
    text = "⋏"
  }, {
    item = "∧",
    subText = "And, Logical (U+2227)",
    text = "∧"
  }, {
    item = "⋀",
    subText = "And, N-Ary Logical (U+22C0)",
    text = "⋀"
  }, {
    item = "⩑",
    subText = "Ands And Ors, Logical (U+2A51)",
    text = "⩑"
  }, {
    item = "👼",
    subText = "Angel, Baby (U+1F47C)",
    text = "👼"
  }, {
    item = "💢",
    subText = "Anger Symbol (U+1F4A2)",
    text = "💢"
  }, {
    item = "๚",
    subText = "Angkhankhu, Thai Character (U+0E5A)",
    text = "๚"
  }, {
    item = "∠",
    subText = "Angle (U+2220)",
    text = "∠"
  }, {
    item = "̚",
    subText = "Angle Above, Combining Left (U+031A)",
    text = "̚"
  }, {
    item = "∢",
    subText = "Angle Arc (U+2222)",
    text = "∢"
  }, {
    item = "͉",
    subText = "Angle Below, Combining Left (U+0349)",
    text = "͉"
  }, {
    item = "〈",
    subText = "Angle Bracket, Left (U+3008)",
    text = "〈"
  }, {
    item = "《",
    subText = "Angle Bracket, Left Double (U+300A)",
    text = "《"
  }, {
    item = "〈",
    subText = "Angle Bracket, Left-Pointing (U+2329)",
    text = "〈"
  }, {
    item = "⟨",
    subText = "Angle Bracket, Mathematical Left (U+27E8)",
    text = "⟨"
  }, {
    item = "⟪",
    subText = "Angle Bracket, Mathematical Left Double (U+27EA)",
    text = "⟪"
  }, {
    item = "⟩",
    subText = "Angle Bracket, Mathematical Right (U+27E9)",
    text = "⟩"
  }, {
    item = "⟫",
    subText = "Angle Bracket, Mathematical Right Double (U+27EB)",
    text = "⟫"
  }, {
    item = "〉",
    subText = "Angle Bracket, Right (U+3009)",
    text = "〉"
  }, {
    item = "》",
    subText = "Angle Bracket, Right Double (U+300B)",
    text = "》"
  }, {
    item = "〉",
    subText = "Angle Bracket, Right-Pointing (U+232A)",
    text = "〉"
  }, {
    item = "〈",
    subText = "Angle Brackets, Cjk (U+3008)",
    text = "〈"
  }, {
    item = "«",
    subText = "Angle Quotation Mark, Left-Pointing Double (U+00AB)",
    text = "«"
  }, {
    item = "»",
    subText = "Angle Quotation Mark, Right-Pointing Double (U+00BB)",
    text = "»"
  }, {
    item = "‹",
    subText = "Angle Quotation Mark, Single Left-Pointing (U+2039)",
    text = "‹"
  }, {
    item = "›",
    subText = "Angle Quotation Mark, Single Right-Pointing (U+203A)",
    text = "›"
  }, {
    item = "❮",
    subText = "Angle Quotation Marks, Ornamental (U+276E)",
    text = "❮"
  }, {
    item = "⊾",
    subText = "Angle With Arc, Right (U+22BE)",
    text = "⊾"
  }, {
    item = "∡",
    subText = "Angle, Measured (U+2221)",
    text = "∡"
  }, {
    item = "∟",
    subText = "Angle, Right (U+221F)",
    text = "∟"
  }, {
    item = "∢",
    subText = "Angle, Spherical (U+2222)",
    text = "∢"
  }, {
    item = "¬",
    subText = "Angled Dash (U+00AC)",
    text = "¬"
  }, {
    item = "∟",
    subText = "Angles (U+221F)",
    text = "∟"
  }, {
    item = "⦛",
    subText = "Angles And Measured Angles (U+299B)",
    text = "⦛"
  }, {
    item = "Å",
    subText = "Angstrom Sign (U+212B)",
    text = "Å"
  }, {
    item = "🐭",
    subText = "Animal Faces (U+1F42D)",
    text = "🐭"
  }, {
    item = "🐀",
    subText = "Animal Symbols (U+1F400)",
    text = "🐀"
  }, {
    item = "🦀",
    subText = "Animal Symbols (U+1F980)",
    text = "🦀"
  }, {
    item = "☥",
    subText = "Ankh (U+2625)",
    text = "☥"
  }, {
    item = "￹",
    subText = "Annotation Anchor, Interlinear (U+FFF9)",
    text = "￹"
  }, {
    item = "￺",
    subText = "Annotation Separator, Interlinear (U+FFFA)",
    text = "￺"
  }, {
    item = "ۖ",
    subText = "Annotation Signs, Arabic Koranic (U+06D6)",
    text = "ۖ"
  }, {
    item = "ۖ",
    subText = "Annotation Signs, Arabic Qur'Anic (U+06D6)",
    text = "ۖ"
  }, {
    item = "￻",
    subText = "Annotation Terminator, Interlinear (U+FFFB)",
    text = "￻"
  }, {
    item = "￹",
    subText = "Annotation, Interlinear (U+FFF9)",
    text = "￹"
  }, {
    item = "㆐",
    subText = "Annotation, Japanese Kanbun Ideographic (U+3190)",
    text = "㆐"
  }, {
    item = "⃧",
    subText = "Annuity Symbol, Combining (U+20E7)",
    text = "⃧"
  }, {
    item = "·",
    subText = "Ano Teleia, Greek (U+00B7)",
    text = "·"
  }, {
    item = "🐜",
    subText = "Ant (U+1F41C)",
    text = "🐜"
  }, {
    item = "⃔",
    subText = "Anticlockwise Arrow Above, Combining (U+20D4)",
    text = "⃔"
  }, {
    item = "∳",
    subText = "Anticlockwise Contour Integral (U+2233)",
    text = "∳"
  }, {
    item = "⨑",
    subText = "Anticlockwise Integration (U+2A11)",
    text = "⨑"
  }, {
    item = "⃚",
    subText = "Anticlockwise Ring Overlay, Combining (U+20DA)",
    text = "⃚"
  }, {
    item = "Ↄ",
    subText = "Antisigma, Claudian (U+2183)",
    text = "Ↄ"
  }, {
    item = "ँ",
    subText = "Anunasika, Devanagari (U+0901)",
    text = "ँ"
  }, {
    item = "ं",
    subText = "Anusvara, Devanagari Sign (U+0902)",
    text = "ं"
  }, {
    item = "ំ",
    subText = "Anusvara, Khmer (U+17C6)",
    text = "ំ"
  }, {
    item = "ཾ",
    subText = "Anusvara, Tibetan (U+0F7E)",
    text = "ཾ"
  }, {
    item = "⌊",
    subText = "Apl Downstile (U+230A)",
    text = "⌊"
  }, {
    item = "⌶",
    subText = "Apl Functional Symbols (U+2336)",
    text = "⌶"
  }, {
    item = "∘",
    subText = "Apl Jot (U+2218)",
    text = "∘"
  }, {
    item = "¯",
    subText = "Apl Overbar (U+00AF)",
    text = "¯"
  }, {
    item = "'",
    subText = "Apl Quote (U+0027)",
    text = "'"
  }, {
    item = "∣",
    subText = "Apl Stile (U+2223)",
    text = "∣"
  }, {
    item = "∼",
    subText = "Apl Tilde (U+223C)",
    text = "∼"
  }, {
    item = "⌈",
    subText = "Apl Upstile (U+2308)",
    text = "⌈"
  }, {
    item = "'",
    subText = "Apostrophe (U+0027)",
    text = "'"
  }, {
    item = "’",
    subText = "Apostrophe (U+2019)",
    text = "’"
  }, {
    item = "՚",
    subText = "Apostrophe, Armenian (U+055A)",
    text = "՚"
  }, {
    item = "ʼ",
    subText = "Apostrophe, Modifier Letter (U+02BC)",
    text = "ʼ"
  }, {
    item = "ˮ",
    subText = "Apostrophe, Modifier Letter Double (U+02EE)",
    text = "ˮ"
  }, {
    item = "ʼ",
    subText = "Apostrophe, Neutral (U+02BC)",
    text = "ʼ"
  }, {
    item = "'",
    subText = "Apostrophe-Quote (U+0027)",
    text = "'"
  }, {
    item = "Ↄ",
    subText = "Apostrophic C (U+2183)",
    text = "Ↄ"
  }, {
    item = "",
    subText = "Application Program Command (U+009F)",
    text = ""
  }, {
    item = "⁡",
    subText = "Application, Function (U+2061)",
    text = "⁡"
  }, {
    item = "≐",
    subText = "Approaches The Limit (U+2250)",
    text = "≐"
  }, {
    item = "≅",
    subText = "Approximately Equal To (U+2245)",
    text = "≅"
  }, {
    item = "≗",
    subText = "Approximately Equal To (U+2257)",
    text = "≗"
  }, {
    item = "♒",
    subText = "Aquarius (U+2652)",
    text = "♒"
  }, {
    item = "𐪀",
    subText = "Arabian, Old North (U+10A80)",
    text = "𐪀"
  }, {
    item = "𐩠",
    subText = "Arabian, Old South (U+10A60)",
    text = "𐩠"
  }, {
    item = "؀",
    subText = "Arabic (U+0600)",
    text = "؀"
  }, {
    item = "ء",
    subText = "Arabic Alphabet (U+0621)",
    text = "ء"
  }, {
    item = "ٓ",
    subText = "Arabic Combining Marks (U+0653)",
    text = "ٓ"
  }, {
    item = "،",
    subText = "Arabic Comma (U+060C)",
    text = "،"
  }, {
    item = "ﭐ",
    subText = "Arabic Contextual Form Glyphs (U+FB50)",
    text = "ﭐ"
  }, {
    item = "ﺀ",
    subText = "Arabic Contextual Form Glyphs (U+FE80)",
    text = "ﺀ"
  }, {
    item = "؍",
    subText = "Arabic Date Separator (U+060D)",
    text = "؍"
  }, {
    item = "٫",
    subText = "Arabic Decimal Separator (U+066B)",
    text = "٫"
  }, {
    item = "ࢠ",
    subText = "Arabic Extended-A (U+08A0)",
    text = "ࢠ"
  }, {
    item = "ٱ",
    subText = "Arabic Extensions (U+0671)",
    text = "ٱ"
  }, {
    item = "۔",
    subText = "Arabic Full Stop (U+06D4)",
    text = "۔"
  }, {
    item = "ً",
    subText = "Arabic Harakat (U+064B)",
    text = "ً"
  }, {
    item = "ؐ",
    subText = "Arabic Honorifics (U+0610)",
    text = "ؐ"
  }, {
    item = "ـ",
    subText = "Arabic Kashida (U+0640)",
    text = "ـ"
  }, {
    item = "ۖ",
    subText = "Arabic Koranic Annotation Signs (U+06D6)",
    text = "ۖ"
  }, {
    item = "ۀ",
    subText = "Arabic Letter Hamzah On Ha (U+06C0)",
    text = "ۀ"
  }, {
    item = "ۀ",
    subText = "Arabic Letter Heh With Yeh Above (U+06C0)",
    text = "ۀ"
  }, {
    item = "؜",
    subText = "Arabic Letter Mark (U+061C)",
    text = "؜"
  }, {
    item = "ٱ",
    subText = "Arabic Letters, Extended (U+0671)",
    text = "ٱ"
  }, {
    item = "ݐ",
    subText = "Arabic Letters, Extended (U+0750)",
    text = "ݐ"
  }, {
    item = "﷽",
    subText = "Arabic Ligature Bismillah Ar-Rahman Ar-Raheem (U+FDFD)",
    text = "﷽"
  }, {
    item = "ﯪ",
    subText = "Arabic Ligatures (U+FBEA)",
    text = "ﯪ"
  }, {
    item = "𞸀",
    subText = "Arabic Mathematical Alphabetic Symbols (U+1EE00)",
    text = "𞸀"
  }, {
    item = "٬",
    subText = "Arabic Phrase Separator (U+066C)",
    text = "٬"
  }, {
    item = "ﹰ",
    subText = "Arabic Points, Glyphs For Spacing Forms Of (U+FE70)",
    text = "ﹰ"
  }, {
    item = "ﭐ",
    subText = "Arabic Presentation Forms-A (U+FB50)",
    text = "ﭐ"
  }, {
    item = "ﹰ",
    subText = "Arabic Presentation Forms-B (U+FE70)",
    text = "ﹰ"
  }, {
    item = "،",
    subText = "Arabic Punctuation (U+060C)",
    text = "،"
  }, {
    item = "؟",
    subText = "Arabic Question Mark (U+061F)",
    text = "؟"
  }, {
    item = "ۖ",
    subText = "Arabic Qur'Anic Annotation Signs (U+06D6)",
    text = "ۖ"
  }, {
    item = "؛",
    subText = "Arabic Semicolon (U+061B)",
    text = "؛"
  }, {
    item = "﮲",
    subText = "Arabic Spacing Diacritics (U+FBB2)",
    text = "﮲"
  }, {
    item = "؀",
    subText = "Arabic Subtending Marks (U+0600)",
    text = "؀"
  }, {
    item = "ݐ",
    subText = "Arabic Supplement (U+0750)",
    text = "ݐ"
  }, {
    item = "ـ",
    subText = "Arabic Tatweel (U+0640)",
    text = "ـ"
  }, {
    item = "٬",
    subText = "Arabic Thousands Separator (U+066C)",
    text = "٬"
  }, {
    item = "٠",
    subText = "Arabic-Indic Digits (U+0660)",
    text = "٠"
  }, {
    item = "۰",
    subText = "Arabic-Indic Digits, Eastern (U+06F0)",
    text = "۰"
  }, {
    item = "𐡀",
    subText = "Aramaic, Imperial (U+10840)",
    text = "𐡀"
  }, {
    item = "⌒",
    subText = "Arc (U+2312)",
    text = "⌒"
  }, {
    item = "∢",
    subText = "Arc, Angle (U+2222)",
    text = "∢"
  }, {
    item = "⊾",
    subText = "Arc, Right Angle With (U+22BE)",
    text = "⊾"
  }, {
    item = "̫",
    subText = "Arch Below, Combining Inverted Double (U+032B)",
    text = "̫"
  }, {
    item = "◜",
    subText = "Arcs (U+25DC)",
    text = "◜"
  }, {
    item = "가",
    subText = "Area, Asian Scripts (U+AC00)",
    text = "가"
  }, {
    item = "㐀",
    subText = "Area, Cjk Ideographs (U+3400)",
    text = "㐀"
  }, {
    item = "⺀",
    subText = "Area, Cjk Phonetics And Symbols (U+2E80)",
    text = "⺀"
  }, {
    item = "豈",
    subText = "Area, Compatibility And Specials (U+F900)",
    text = "豈"
  }, {
    item = " ",
    subText = "Area, General Scripts (U+0000)",
    text = " "
  }, {
    item = "가",
    subText = "Area, Korean Hangul Syllables (U+AC00)",
    text = "가"
  }, {
    item = "",
    subText = "Area, Private Use (U+E000)",
    text = ""
  }, {
    item = "𠀀",
    subText = "Area, Supplementary Cjk Ideographs (U+20000)",
    text = "𠀀"
  }, {
    item = "𐀀",
    subText = "Area, Supplementary General Scripts (U+10000)",
    text = "𐀀"
  }, {
    item = "�",
    subText = "Area, Surrogates (U+D800)",
    text = "�"
  }, {
    item = " ",
    subText = "Area, Symbols (U+2000)",
    text = " "
  }, {
    item = "󰀀",
    subText = "Area-A, Supplementary Private Use (U+F0000)",
    text = "󰀀"
  }, {
    item = "􀀀",
    subText = "Area-B, Supplementary Private Use (U+100000)",
    text = "􀀀"
  }, {
    item = "₳",
    subText = "Argentinian Former Currency (U+20B3)",
    text = "₳"
  }, {
    item = "♈",
    subText = "Aries (U+2648)",
    text = "♈"
  }, {
    item = "՟",
    subText = "Armenian Abbreviation Mark (U+055F)",
    text = "՟"
  }, {
    item = "԰",
    subText = "Armenian Alphabet (U+0530)",
    text = "԰"
  }, {
    item = "՚",
    subText = "Armenian Apostrophe (U+055A)",
    text = "՚"
  }, {
    item = "՜",
    subText = "Armenian Batsaganchakan Nshan (U+055C)",
    text = "՜"
  }, {
    item = "՝",
    subText = "Armenian Bowt (U+055D)",
    text = "՝"
  }, {
    item = "Ա",
    subText = "Armenian Capital Letters (U+0531)",
    text = "Ա"
  }, {
    item = "՝",
    subText = "Armenian Comma (U+055D)",
    text = "՝"
  }, {
    item = "՛",
    subText = "Armenian Emphasis Mark (U+055B)",
    text = "՛"
  }, {
    item = "՜",
    subText = "Armenian Exclamation Mark (U+055C)",
    text = "՜"
  }, {
    item = "։",
    subText = "Armenian Full Stop (U+0589)",
    text = "։"
  }, {
    item = "՞",
    subText = "Armenian Hartsakan Nshan (U+055E)",
    text = "՞"
  }, {
    item = "֊",
    subText = "Armenian Hyphen (U+058A)",
    text = "֊"
  }, {
    item = "ﬓ",
    subText = "Armenian Ligatures (U+FB13)",
    text = "ﬓ"
  }, {
    item = "՟",
    subText = "Armenian Patiw (U+055F)",
    text = "՟"
  }, {
    item = "՞",
    subText = "Armenian Question Mark (U+055E)",
    text = "՞"
  }, {
    item = "՛",
    subText = "Armenian Shesht (U+055B)",
    text = "՛"
  }, {
    item = "ա",
    subText = "Armenian Small Letters (U+0561)",
    text = "ա"
  }, {
    item = "։",
    subText = "Armenian Vertsaket (U+0589)",
    text = "։"
  }, {
    item = "֊",
    subText = "Armenian Yentamna (U+058A)",
    text = "֊"
  }, {
    item = "⃔",
    subText = "Arrow Above, Combining Anticlockwise (U+20D4)",
    text = "⃔"
  }, {
    item = "⃕",
    subText = "Arrow Above, Combining Clockwise (U+20D5)",
    text = "⃕"
  }, {
    item = "⃔",
    subText = "Arrow Above, Combining Counterclockwise (U+20D4)",
    text = "⃔"
  }, {
    item = "⃖",
    subText = "Arrow Above, Combining Left (U+20D6)",
    text = "⃖"
  }, {
    item = "⃡",
    subText = "Arrow Above, Combining Left Right (U+20E1)",
    text = "⃡"
  }, {
    item = "⃗",
    subText = "Arrow Above, Combining Right (U+20D7)",
    text = "⃗"
  }, {
    item = "͢",
    subText = "Arrow Below, Combining Double Rightwards (U+0362)",
    text = "͢"
  }, {
    item = "⃮",
    subText = "Arrow Below, Combining Left (U+20EE)",
    text = "⃮"
  }, {
    item = "͍",
    subText = "Arrow Below, Combining Left Right (U+034D)",
    text = "͍"
  }, {
    item = "⃯",
    subText = "Arrow Below, Combining Right (U+20EF)",
    text = "⃯"
  }, {
    item = "͎",
    subText = "Arrow Below, Combining Upwards (U+034E)",
    text = "͎"
  }, {
    item = "➔",
    subText = "Arrow Dingbats (U+2794)",
    text = "➔"
  }, {
    item = "◅",
    subText = "Arrow Indicator, Backward (U+25C5)",
    text = "◅"
  }, {
    item = "▻",
    subText = "Arrow Indicator, Forward (U+25BB)",
    text = "▻"
  }, {
    item = "⃪",
    subText = "Arrow Overlay, Combining Leftwards (U+20EA)",
    text = "⃪"
  }, {
    item = "↓",
    subText = "Arrow, Downwards (U+2193)",
    text = "↓"
  }, {
    item = "⌁",
    subText = "Arrow, Electric (U+2301)",
    text = "⌁"
  }, {
    item = "←",
    subText = "Arrow, Leftwards (U+2190)",
    text = "←"
  }, {
    item = "→",
    subText = "Arrow, Rightwards (U+2192)",
    text = "→"
  }, {
    item = "↑",
    subText = "Arrow, Upwards (U+2191)",
    text = "↑"
  }, {
    item = "͐",
    subText = "Arrowhead Above, Combining Right (U+0350)",
    text = "͐"
  }, {
    item = "͔",
    subText = "Arrowhead Below, Combining Left (U+0354)",
    text = "͔"
  }, {
    item = "͕",
    subText = "Arrowhead Below, Combining Right (U+0355)",
    text = "͕"
  }, {
    item = "⌄",
    subText = "Arrowhead, Down (U+2304)",
    text = "⌄"
  }, {
    item = "⌃",
    subText = "Arrowhead, Up (U+2303)",
    text = "⌃"
  }, {
    item = "˂",
    subText = "Arrowheads, Modifier Letter (U+02C2)",
    text = "˂"
  }, {
    item = "←",
    subText = "Arrows (U+2190)",
    text = "←"
  }, {
    item = "➔",
    subText = "Arrows, Dingbat (U+2794)",
    text = "➔"
  }, {
    item = "⇍",
    subText = "Arrows, Double (U+21CD)",
    text = "⇍"
  }, {
    item = "⟵",
    subText = "Arrows, Long (U+27F5)",
    text = "⟵"
  }, {
    item = "⬰",
    subText = "Arrows, Mathematical (U+2B30)",
    text = "⬰"
  }, {
    item = "⬀",
    subText = "Arrows, Miscellaneous (U+2B00)",
    text = "⬀"
  }, {
    item = "🔀",
    subText = "Arrows, User Interface (U+1F500)",
    text = "🔀"
  }, {
    item = "🔙",
    subText = "Arrows, Words With (U+1F519)",
    text = "🔙"
  }, {
    item = "⟰",
    subText = "Arrows-A Supplement (U+27F0)",
    text = "⟰"
  }, {
    item = "⤀",
    subText = "Arrows-B, Supplemental (U+2900)",
    text = "⤀"
  }, {
    item = "🠀",
    subText = "Arrows-C, Supplemental (U+1F800)",
    text = "🠀"
  }, {
    item = "☊",
    subText = "Ascending Node (U+260A)",
    text = "☊"
  }, {
    item = " ",
    subText = "Ascii C0 Control Codes (U+0000)",
    text = " "
  }, {
    item = "0",
    subText = "Ascii Digits (U+0030)",
    text = "0"
  }, {
    item = " ",
    subText = "Ascii Punctuation And Symbols (U+0020)",
    text = " "
  }, {
    item = "！",
    subText = "Ascii Variants, Fullwidth (U+FF01)",
    text = "！"
  }, {
    item = "æ",
    subText = "Ash (U+00E6)",
    text = "æ"
  }, {
    item = "가",
    subText = "Asian Scripts Area (U+AC00)",
    text = "가"
  }, {
    item = "⊦",
    subText = "Assertion (U+22A6)",
    text = "⊦"
  }, {
    item = "*",
    subText = "Asterisk (U+002A)",
    text = "*"
  }, {
    item = "⃰",
    subText = "Asterisk Above, Combining (U+20F0)",
    text = "⃰"
  }, {
    item = "͙",
    subText = "Asterisk Below, Combining (U+0359)",
    text = "͙"
  }, {
    item = "✢",
    subText = "Asterisk Dingbats (U+2722)",
    text = "✢"
  }, {
    item = "∗",
    subText = "Asterisk Operator (U+2217)",
    text = "∗"
  }, {
    item = "⊛",
    subText = "Asterisk Operator, Circled (U+229B)",
    text = "⊛"
  }, {
    item = "⁎",
    subText = "Asterisk, Low (U+204E)",
    text = "⁎"
  }, {
    item = "🞯",
    subText = "Asterisks (U+1F7AF)",
    text = "🞯"
  }, {
    item = "✢",
    subText = "Asterisks (U+2722)",
    text = "✢"
  }, {
    item = "⁑",
    subText = "Asterisks Aligned Vertically, Two (U+2051)",
    text = "⁑"
  }, {
    item = "⁂",
    subText = "Asterism (U+2042)",
    text = "⁂"
  }, {
    item = "⚳",
    subText = "Astrological Signs (U+26B3)",
    text = "⚳"
  }, {
    item = "༕",
    subText = "Astrological Signs, Tibetan (U+0F15)",
    text = "༕"
  }, {
    item = "☽",
    subText = "Astrological Symbols (U+263D)",
    text = "☽"
  }, {
    item = "⣓",
    subText = "Astrological Symbols (U+28D3)",
    text = "⣓"
  }, {
    item = "☀",
    subText = "Astrological Symbols, Weather And (U+2600)",
    text = "☀"
  }, {
    item = "≈",
    subText = "Asymptotic To (U+2248)",
    text = "≈"
  }, {
    item = "≃",
    subText = "Asymptotically Equal To (U+2243)",
    text = "≃"
  }, {
    item = "≄",
    subText = "Asymptotically Equal To, Not (U+2244)",
    text = "≄"
  }, {
    item = "@",
    subText = "At Sign (U+0040)",
    text = "@"
  }, {
    item = "@",
    subText = "At, Commercial (U+0040)",
    text = "@"
  }, {
    item = "⚛",
    subText = "Atom Symbol (U+269B)",
    text = "⚛"
  }, {
    item = "📷",
    subText = "Audio And Video Symbols (U+1F4F7)",
    text = "📷"
  }, {
    item = "₳",
    subText = "Austral Sign (U+20B3)",
    text = "₳"
  }, {
    item = "ऽ",
    subText = "Avagraha, Devanagari Sign (U+093D)",
    text = "ऽ"
  }, {
    item = "𐬀",
    subText = "Avestan (U+10B00)",
    text = "𐬀"
  }, {
    item = "ஃ",
    subText = "Aytham, Tamil (U+0B83)",
    text = "ஃ"
  }, {
    item = "ḃ",
    subText = "B With Dot Above, Latin Small Letter (U+1E03)",
    text = "ḃ"
  }, {
    item = "ḅ",
    subText = "B With Dot Below, Latin Small Letter (U+1E05)",
    text = "ḅ"
  }, {
    item = "Ɓ",
    subText = "B With Hook, Latin Capital Letter (U+0181)",
    text = "Ɓ"
  }, {
    item = "ɓ",
    subText = "B With Hook, Latin Small Letter (U+0253)",
    text = "ɓ"
  }, {
    item = "ḇ",
    subText = "B With Line Below, Latin Small Letter (U+1E07)",
    text = "ḇ"
  }, {
    item = "Ƀ",
    subText = "B With Stroke, Latin Capital Letter (U+0243)",
    text = "Ƀ"
  }, {
    item = "ƀ",
    subText = "B With Stroke, Latin Small Letter (U+0180)",
    text = "ƀ"
  }, {
    item = "ƃ",
    subText = "B With Topbar, Latin Small Letter (U+0183)",
    text = "ƃ"
  }, {
    item = "ʙ",
    subText = "B, Latin Letter Small Capital (U+0299)",
    text = "ʙ"
  }, {
    item = "ᴃ",
    subText = "B, Latin Letter Small Capital Barred (U+1D03)",
    text = "ᴃ"
  }, {
    item = "ℬ",
    subText = "B, Script Capital (U+212C)",
    text = "ℬ"
  }, {
    item = "👶",
    subText = "Baby (U+1F476)",
    text = "👶"
  }, {
    item = "👼",
    subText = "Baby Angel (U+1F47C)",
    text = "👼"
  }, {
    item = "ɤ",
    subText = "Baby Gamma, Latin Small Letter (U+0264)",
    text = "ɤ"
  }, {
    item = "\\",
    subText = "Backslash (U+005C)",
    text = "\\"
  }, {
    item = "⃠",
    subText = "Backslash, Combining Enclosing Circle (U+20E0)",
    text = "⃠"
  }, {
    item = "\b",
    subText = "Backspace (U+0008)",
    text = "\b"
  }, {
    item = "␈",
    subText = "Backspace, Symbol For (U+2408)",
    text = "␈"
  }, {
    item = "◅",
    subText = "Backward Arrow Indicator (U+25C5)",
    text = "◅"
  }, {
    item = "∇",
    subText = "Backward Difference (U+2207)",
    text = "∇"
  }, {
    item = "",
    subText = "Backward, Partial Line (U+008C)",
    text = ""
  }, {
    item = "⊎",
    subText = "Bag Addition (U+228E)",
    text = "⊎"
  }, {
    item = "⟦",
    subText = "Bag Bracket, Left (U+27E6)",
    text = "⟦"
  }, {
    item = "⟧",
    subText = "Bag Bracket, Right (U+27E7)",
    text = "⟧"
  }, {
    item = "♯",
    subText = "Bag Count, Infix (U+266F)",
    text = "♯"
  }, {
    item = "⋿",
    subText = "Bag Membership, Z Notation (U+22FF)",
    text = "⋿"
  }, {
    item = "⩁",
    subText = "Bag Subtraction (U+2A41)",
    text = "⩁"
  }, {
    item = "฿",
    subText = "Baht, Thai Currency Symbol (U+0E3F)",
    text = "฿"
  }, {
    item = "ᬀ",
    subText = "Balinese (U+1B00)",
    text = "ᬀ"
  }, {
    item = "᭐",
    subText = "Balinese Digits (U+1B50)",
    text = "᭐"
  }, {
    item = "᭡",
    subText = "Balinese Musical Symbols (U+1B61)",
    text = "᭡"
  }, {
    item = "☐",
    subText = "Ballot Box (U+2610)",
    text = "☐"
  }, {
    item = "☑",
    subText = "Ballot Box With Check (U+2611)",
    text = "☑"
  }, {
    item = "☒",
    subText = "Ballot Box With X (U+2612)",
    text = "☒"
  }, {
    item = "🗳",
    subText = "Ballot Symbols (U+1F5F3)",
    text = "🗳"
  }, {
    item = "✗",
    subText = "Ballot X (U+2717)",
    text = "✗"
  }, {
    item = "✘",
    subText = "Ballot X, Heavy (U+2718)",
    text = "✘"
  }, {
    item = "ꚠ",
    subText = "Bamum (U+A6A0)",
    text = "ꚠ"
  }, {
    item = "𖠀",
    subText = "Bamum Supplement (U+16800)",
    text = "𖠀"
  }, {
    item = "!",
    subText = "Bang (U+0021)",
    text = "!"
  }, {
    item = "❘",
    subText = "Bar Dingbats, Vertical (U+2758)",
    text = "❘"
  }, {
    item = "⧮",
    subText = "Bar Symbols, Error (U+29EE)",
    text = "⧮"
  }, {
    item = "¦",
    subText = "Bar, Broken (U+00A6)",
    text = "¦"
  }, {
    item = "―",
    subText = "Bar, Horizontal (U+2015)",
    text = "―"
  }, {
    item = "|",
    subText = "Bar, Vertical (U+007C)",
    text = "|"
  }, {
    item = "⫾",
    subText = "Bar, White Vertical (U+2AFE)",
    text = "⫾"
  }, {
    item = "💈",
    subText = "Barber Pole (U+1F488)",
    text = "💈"
  }, {
    item = "ᴃ",
    subText = "Barred B, Latin Letter Small Capital (U+1D03)",
    text = "ᴃ"
  }, {
    item = "Ɵ",
    subText = "Barred O, Latin Capital Letter (U+019F)",
    text = "Ɵ"
  }, {
    item = "ɵ",
    subText = "Barred O, Latin Small Letter (U+0275)",
    text = "ɵ"
  }, {
    item = "⊥",
    subText = "Base (U+22A5)",
    text = "⊥"
  }, {
    item = "⚾",
    subText = "Baseball (U+26BE)",
    text = "⚾"
  }, {
    item = "♩",
    subText = "Basic Musical Symbols (U+2669)",
    text = "♩"
  }, {
    item = "𖫐",
    subText = "Bassa Vah (U+16AD0)",
    text = "𖫐"
  }, {
    item = "🦇",
    subText = "Bat (U+1F987)",
    text = "🦇"
  }, {
    item = "ᯀ",
    subText = "Batak (U+1BC0)",
    text = "ᯀ"
  }, {
    item = "՜",
    subText = "Batsaganchakan Nshan, Armenian (U+055C)",
    text = "՜"
  }, {
    item = "🔋",
    subText = "Battery (U+1F50B)",
    text = "🔋"
  }, {
    item = "⚔",
    subText = "Battleground Symbol (U+2694)",
    text = "⚔"
  }, {
    item = "⛱",
    subText = "Beach, Bathing (U+26F1)",
    text = "⛱"
  }, {
    item = "♫",
    subText = "Beamed Eighth Notes (U+266B)",
    text = "♫"
  }, {
    item = "♫",
    subText = "Beamed Quavers (U+266B)",
    text = "♫"
  }, {
    item = "♬",
    subText = "Beamed Semiquavers (U+266C)",
    text = "♬"
  }, {
    item = "♬",
    subText = "Beamed Sixteenth Notes (U+266C)",
    text = "♬"
  }, {
    item = "🐻",
    subText = "Bear Face (U+1F43B)",
    text = "🐻"
  }, {
    item = "∵",
    subText = "Because (U+2235)",
    text = "∵"
  }, {
    item = "🐄",
    subText = "Beef (On Menus) (U+1F404)",
    text = "🐄"
  }, {
    item = "\a",
    subText = "Bell (U+0007)",
    text = "\a"
  }, {
    item = "🔔",
    subText = "Bell (U+1F514)",
    text = "🔔"
  }, {
    item = "⍾",
    subText = "Bell Symbol (U+237E)",
    text = "⍾"
  }, {
    item = "␇",
    subText = "Bell, Symbol For (U+2407)",
    text = "␇"
  }, {
    item = "̗",
    subText = "Below, Combining Acute Accent (U+0317)",
    text = "̗"
  }, {
    item = "͙",
    subText = "Below, Combining Asterisk (U+0359)",
    text = "͙"
  }, {
    item = "̮",
    subText = "Below, Combining Breve (U+032E)",
    text = "̮"
  }, {
    item = "̪",
    subText = "Below, Combining Bridge (U+032A)",
    text = "̪"
  }, {
    item = "̬",
    subText = "Below, Combining Caron (U+032C)",
    text = "̬"
  }, {
    item = "̭",
    subText = "Below, Combining Circumflex Accent (U+032D)",
    text = "̭"
  }, {
    item = "̦",
    subText = "Below, Combining Comma (U+0326)",
    text = "̦"
  }, {
    item = "̤",
    subText = "Below, Combining Diaeresis (U+0324)",
    text = "̤"
  }, {
    item = "̣",
    subText = "Below, Combining Dot (U+0323)",
    text = "̣"
  }, {
    item = "͜",
    subText = "Below, Combining Double Breve (U+035C)",
    text = "͜"
  }, {
    item = "͟",
    subText = "Below, Combining Double Macron (U+035F)",
    text = "͟"
  }, {
    item = "͢",
    subText = "Below, Combining Double Rightwards Arrow (U+0362)",
    text = "͢"
  }, {
    item = "͚",
    subText = "Below, Combining Double Ring (U+035A)",
    text = "͚"
  }, {
    item = "͈",
    subText = "Below, Combining Double Vertical Line (U+0348)",
    text = "͈"
  }, {
    item = "̞",
    subText = "Below, Combining Down Tack (U+031E)",
    text = "̞"
  }, {
    item = "͇",
    subText = "Below, Combining Equals Sign (U+0347)",
    text = "͇"
  }, {
    item = "̖",
    subText = "Below, Combining Grave Accent (U+0316)",
    text = "̖"
  }, {
    item = "̯",
    subText = "Below, Combining Inverted Breve (U+032F)",
    text = "̯"
  }, {
    item = "̺",
    subText = "Below, Combining Inverted Bridge (U+033A)",
    text = "̺"
  }, {
    item = "̫",
    subText = "Below, Combining Inverted Double Arch (U+032B)",
    text = "̫"
  }, {
    item = "͉",
    subText = "Below, Combining Left Angle (U+0349)",
    text = "͉"
  }, {
    item = "⃮",
    subText = "Below, Combining Left Arrow (U+20EE)",
    text = "⃮"
  }, {
    item = "͔",
    subText = "Below, Combining Left Arrowhead (U+0354)",
    text = "͔"
  }, {
    item = "̜",
    subText = "Below, Combining Left Half Ring (U+031C)",
    text = "̜"
  }, {
    item = "͍",
    subText = "Below, Combining Left Right Arrow (U+034D)",
    text = "͍"
  }, {
    item = "̘",
    subText = "Below, Combining Left Tack (U+0318)",
    text = "̘"
  }, {
    item = "̱",
    subText = "Below, Combining Macron (U+0331)",
    text = "̱"
  }, {
    item = "̠",
    subText = "Below, Combining Minus Sign (U+0320)",
    text = "̠"
  }, {
    item = "̡",
    subText = "Below, Combining Palatalized Hook (U+0321)",
    text = "̡"
  }, {
    item = "̟",
    subText = "Below, Combining Plus Sign (U+031F)",
    text = "̟"
  }, {
    item = "̢",
    subText = "Below, Combining Retroflex Hook (U+0322)",
    text = "̢"
  }, {
    item = "⃯",
    subText = "Below, Combining Right Arrow (U+20EF)",
    text = "⃯"
  }, {
    item = "͕",
    subText = "Below, Combining Right Arrowhead (U+0355)",
    text = "͕"
  }, {
    item = "̹",
    subText = "Below, Combining Right Half Ring (U+0339)",
    text = "̹"
  }, {
    item = "̙",
    subText = "Below, Combining Right Tack (U+0319)",
    text = "̙"
  }, {
    item = "̥",
    subText = "Below, Combining Ring (U+0325)",
    text = "̥"
  }, {
    item = "̼",
    subText = "Below, Combining Seagull (U+033C)",
    text = "̼"
  }, {
    item = "̻",
    subText = "Below, Combining Square (U+033B)",
    text = "̻"
  }, {
    item = "̰",
    subText = "Below, Combining Tilde (U+0330)",
    text = "̰"
  }, {
    item = "̝",
    subText = "Below, Combining Up Tack (U+031D)",
    text = "̝"
  }, {
    item = "͎",
    subText = "Below, Combining Upwards Arrow (U+034E)",
    text = "͎"
  }, {
    item = "̩",
    subText = "Below, Combining Vertical Line (U+0329)",
    text = "̩"
  }, {
    item = "͓",
    subText = "Below, Combining X (U+0353)",
    text = "͓"
  }, {
    item = "ɬ",
    subText = "Belt, Latin Small Letter L With (U+026C)",
    text = "ɬ"
  }, {
    item = "⃧",
    subText = "Bend, Actuarial (U+20E7)",
    text = "⃧"
  }, {
    item = "ঀ",
    subText = "Bengali (U+0980)",
    text = "ঀ"
  }, {
    item = "ক",
    subText = "Bengali Consonants (U+0995)",
    text = "ক"
  }, {
    item = "৲",
    subText = "Bengali Currency Signs (U+09F2)",
    text = "৲"
  }, {
    item = "া",
    subText = "Bengali Dependent Vowel Signs (U+09BE)",
    text = "া"
  }, {
    item = "০",
    subText = "Bengali Digits (U+09E6)",
    text = "০"
  }, {
    item = "্",
    subText = "Bengali Hasant (U+09CD)",
    text = "্"
  }, {
    item = "অ",
    subText = "Bengali Independent Vowels (U+0985)",
    text = "অ"
  }, {
    item = "৺",
    subText = "Bengali Isshar (U+09FA)",
    text = "৺"
  }, {
    item = "৲",
    subText = "Bengali Rupee Mark (U+09F2)",
    text = "৲"
  }, {
    item = "৳",
    subText = "Bengali Rupee Sign (U+09F3)",
    text = "৳"
  }, {
    item = "⌬",
    subText = "Benzene Ring (U+232C)",
    text = "⌬"
  }, {
    item = "ℬ",
    subText = "Bernoulli Function (U+212C)",
    text = "ℬ"
  }, {
    item = "ℶ",
    subText = "Bet Symbol (U+2136)",
    text = "ℶ"
  }, {
    item = "ϐ",
    subText = "Beta Symbol, Greek (U+03D0)",
    text = "ϐ"
  }, {
    item = "ϐ",
    subText = "Beta, Curled (U+03D0)",
    text = "ϐ"
  }, {
    item = "≬",
    subText = "Between (U+226C)",
    text = "≬"
  }, {
    item = "🍵",
    subText = "Beverage Symbols (U+1F375)",
    text = "🍵"
  }, {
    item = "☕",
    subText = "Beverage, Hot (U+2615)",
    text = "☕"
  }, {
    item = "𑰀",
    subText = "Bhaiksuki (U+11C00)",
    text = "𑰀"
  }, {
    item = "‪",
    subText = "Bidirectional Format Characters (U+202A)",
    text = "‪"
  }, {
    item = "兀",
    subText = "Big 5, Duplicate Characters From (U+FA0C)",
    text = "兀"
  }, {
    item = "⧹",
    subText = "Big Reverse Solidus (U+29F9)",
    text = "⧹"
  }, {
    item = "⧸",
    subText = "Big Solidus (U+29F8)",
    text = "⧸"
  }, {
    item = "⤖",
    subText = "Bijection (U+2916)",
    text = "⤖"
  }, {
    item = "ʘ",
    subText = "Bilabial Click, Latin Letter (U+0298)",
    text = "ʘ"
  }, {
    item = "ʬ",
    subText = "Bilabial Percussive, Latin Letter (U+02AC)",
    text = "ʬ"
  }, {
    item = "ं",
    subText = "Bindu, Devanagari (U+0902)",
    text = "ं"
  }, {
    item = "☣",
    subText = "Biohazard Sign (U+2623)",
    text = "☣"
  }, {
    item = "🐦",
    subText = "Bird (U+1F426)",
    text = "🐦"
  }, {
    item = "᠀",
    subText = "Birga, Mongolian (U+1800)",
    text = "᠀"
  }, {
    item = "﷽",
    subText = "Bismillah Ar-Rahman Ar-Raheem, Arabic Ligature (U+FDFD)",
    text = "﷽"
  }, {
    item = "₿",
    subText = "Bitcoin Sign (U+20BF)",
    text = "₿"
  }, {
    item = "●",
    subText = "Black Circle (U+25CF)",
    text = "●"
  }, {
    item = "⚫",
    subText = "Black Circle, Medium (U+26AB)",
    text = "⚫"
  }, {
    item = "⚑",
    subText = "Black Flag (U+2691)",
    text = "⚑"
  }, {
    item = "🖤",
    subText = "Black Heart (U+1F5A4)",
    text = "🖤"
  }, {
    item = "⧗",
    subText = "Black Hourglass (U+29D7)",
    text = "⧗"
  }, {
    item = "☚",
    subText = "Black Left Pointing Index (U+261A)",
    text = "☚"
  }, {
    item = "⁌",
    subText = "Black Leftwards Bullet (U+204C)",
    text = "⁌"
  }, {
    item = "【",
    subText = "Black Lenticular Bracket, Left (U+3010)",
    text = "【"
  }, {
    item = "】",
    subText = "Black Lenticular Bracket, Right (U+3011)",
    text = "】"
  }, {
    item = "⧫",
    subText = "Black Lozenge (U+29EB)",
    text = "⧫"
  }, {
    item = "◾",
    subText = "Black Medium Small Square (U+25FE)",
    text = "◾"
  }, {
    item = "◼",
    subText = "Black Medium Square (U+25FC)",
    text = "◼"
  }, {
    item = "✒",
    subText = "Black Nib (U+2712)",
    text = "✒"
  }, {
    item = "▰",
    subText = "Black Parallelogram (U+25B0)",
    text = "▰"
  }, {
    item = "☛",
    subText = "Black Right Pointing Index (U+261B)",
    text = "☛"
  }, {
    item = "⁍",
    subText = "Black Rightwards Bullet (U+204D)",
    text = "⁍"
  }, {
    item = "✂",
    subText = "Black Scissors (U+2702)",
    text = "✂"
  }, {
    item = "☗",
    subText = "Black Shogi Piece (U+2617)",
    text = "☗"
  }, {
    item = "•",
    subText = "Black Small Circle (U+2022)",
    text = "•"
  }, {
    item = "☻",
    subText = "Black Smiling Face (U+263B)",
    text = "☻"
  }, {
    item = "★",
    subText = "Black Star (U+2605)",
    text = "★"
  }, {
    item = "☀",
    subText = "Black Sun With Rays (U+2600)",
    text = "☀"
  }, {
    item = "☎",
    subText = "Black Telephone (U+260E)",
    text = "☎"
  }, {
    item = "ℭ",
    subText = "Black-Letter Capital C (U+212D)",
    text = "ℭ"
  }, {
    item = "ℌ",
    subText = "Black-Letter Capital H (U+210C)",
    text = "ℌ"
  }, {
    item = "ℑ",
    subText = "Black-Letter Capital I (U+2111)",
    text = "ℑ"
  }, {
    item = "ℜ",
    subText = "Black-Letter Capital R (U+211C)",
    text = "ℜ"
  }, {
    item = "ℨ",
    subText = "Black-Letter Capital Z (U+2128)",
    text = "ℨ"
  }, {
    item = "𝔄",
    subText = "Black-Letter Mathematical Symbols (U+1D504)",
    text = "𝔄"
  }, {
    item = "␢",
    subText = "Blank Symbol (U+2422)",
    text = "␢"
  }, {
    item = "▀",
    subText = "Block Elements (U+2580)",
    text = "▀"
  }, {
    item = "",
    subText = "Block, End Of Transmission (U+0017)",
    text = ""
  }, {
    item = "█",
    subText = "Block, Full (U+2588)",
    text = "█"
  }, {
    item = "␗",
    subText = "Block, Symbol For End Of Transmission (U+2417)",
    text = "␗"
  }, {
    item = "🐡",
    subText = "Blowfish (U+1F421)",
    text = "🐡"
  }, {
    item = "🐗",
    subText = "Boar (U+1F417)",
    text = "🐗"
  }, {
    item = "⛴",
    subText = "Boat Terminal (U+26F4)",
    text = "⛴"
  }, {
    item = "Ⲁ",
    subText = "Bohairic Coptic (U+2C80)",
    text = "Ⲁ"
  }, {
    item = "𝟎",
    subText = "Bold Digits (U+1D7CE)",
    text = "𝟎"
  }, {
    item = "𝟬",
    subText = "Bold Digits, Sans-Serif (U+1D7EC)",
    text = "𝟬"
  }, {
    item = "𝕬",
    subText = "Bold Fraktur Mathematical Symbols (U+1D56C)",
    text = "𝕬"
  }, {
    item = "𝚨",
    subText = "Bold Greek Mathematical Symbols (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝝖",
    subText = "Bold Greek Mathematical Symbols, Sans-Serif (U+1D756)",
    text = "𝝖"
  }, {
    item = "𝜜",
    subText = "Bold Italic Greek Mathematical Symbols (U+1D71C)",
    text = "𝜜"
  }, {
    item = "𝞐",
    subText = "Bold Italic Greek Mathematical Symbols, Sans-Serif (U+1D790)",
    text = "𝞐"
  }, {
    item = "𝑨",
    subText = "Bold Italic Mathematical Symbols (U+1D468)",
    text = "𝑨"
  }, {
    item = "𝘼",
    subText = "Bold Italic Mathematical Symbols, Sans-Serif (U+1D63C)",
    text = "𝘼"
  }, {
    item = "𝐀",
    subText = "Bold Mathematical Symbols (U+1D400)",
    text = "𝐀"
  }, {
    item = "𝗔",
    subText = "Bold Mathematical Symbols, Sans-Serif (U+1D5D4)",
    text = "𝗔"
  }, {
    item = "𝓐",
    subText = "Bold Script Mathematical Symbols (U+1D4D0)",
    text = "𝓐"
  }, {
    item = "﻿",
    subText = "Bom (U+FEFF)",
    text = "﻿"
  }, {
    item = "💣",
    subText = "Bomb (U+1F4A3)",
    text = "💣"
  }, {
    item = "🕮",
    subText = "Book (U+1F56E)",
    text = "🕮"
  }, {
    item = "📕",
    subText = "Books (U+1F4D5)",
    text = "📕"
  }, {
    item = "ㆠ",
    subText = "Bopomofo Extensions, Chinese (U+31A0)",
    text = "ㆠ"
  }, {
    item = "㄀",
    subText = "Bopomofo, Chinese (U+3100)",
    text = "㄀"
  }, {
    item = "⊥",
    subText = "Bottom (U+22A5)",
    text = "⊥"
  }, {
    item = "՝",
    subText = "Bowt, Armenian (U+055D)",
    text = "՝"
  }, {
    item = "⋈",
    subText = "Bowtie (U+22C8)",
    text = "⋈"
  }, {
    item = "⧑",
    subText = "Bowtie Symbols (U+29D1)",
    text = "⧑"
  }, {
    item = "⨝",
    subText = "Bowtie, Large (U+2A1D)",
    text = "⨝"
  }, {
    item = "⧖",
    subText = "Bowtie, Vertical (U+29D6)",
    text = "⧖"
  }, {
    item = "─",
    subText = "Box Drawing (U+2500)",
    text = "─"
  }, {
    item = "☑",
    subText = "Box With Check, Ballot (U+2611)",
    text = "☑"
  }, {
    item = "☒",
    subText = "Box With X, Ballot (U+2612)",
    text = "☒"
  }, {
    item = "☐",
    subText = "Box, Ballot (U+2610)",
    text = "☐"
  }, {
    item = "␣",
    subText = "Box, Open (U+2423)",
    text = "␣"
  }, {
    item = "⍽",
    subText = "Box, Shouldered Open (U+237D)",
    text = "⍽"
  }, {
    item = "⌧",
    subText = "Box, X In A Rectangle (U+2327)",
    text = "⌧"
  }, {
    item = "👦",
    subText = "Boy (U+1F466)",
    text = "👦"
  }, {
    item = "⟨",
    subText = "Bra (U+27E8)",
    text = "⟨"
  }, {
    item = "}",
    subText = "Brace, Closing (U+007D)",
    text = "}"
  }, {
    item = "{",
    subText = "Brace, Opening (U+007B)",
    text = "{"
  }, {
    item = "⎛",
    subText = "Bracket Pieces (U+239B)",
    text = "⎛"
  }, {
    item = "⎰",
    subText = "Bracket Pieces (U+23B0)",
    text = "⎰"
  }, {
    item = "⏜",
    subText = "Bracket Variants For Vertical Text (U+23DC)",
    text = "⏜"
  }, {
    item = "⁅",
    subText = "Bracket With Quill, Left Square (U+2045)",
    text = "⁅"
  }, {
    item = "⁆",
    subText = "Bracket With Quill, Right Square (U+2046)",
    text = "⁆"
  }, {
    item = "}",
    subText = "Bracket, Closing Curly (U+007D)",
    text = "}"
  }, {
    item = "]",
    subText = "Bracket, Closing Square (U+005D)",
    text = "]"
  }, {
    item = "〚",
    subText = "Bracket, Left Abstract Syntax (U+301A)",
    text = "〚"
  }, {
    item = "〈",
    subText = "Bracket, Left Angle (U+3008)",
    text = "〈"
  }, {
    item = "⟦",
    subText = "Bracket, Left Bag (U+27E6)",
    text = "⟦"
  }, {
    item = "【",
    subText = "Bracket, Left Black Lenticular (U+3010)",
    text = "【"
  }, {
    item = "⟪",
    subText = "Bracket, Left Chevron (U+27EA)",
    text = "⟪"
  }, {
    item = "「",
    subText = "Bracket, Left Corner (U+300C)",
    text = "「"
  }, {
    item = "{",
    subText = "Bracket, Left Curly (U+007B)",
    text = "{"
  }, {
    item = "《",
    subText = "Bracket, Left Double Angle (U+300A)",
    text = "《"
  }, {
    item = "⟨",
    subText = "Bracket, Left Sequence (U+27E8)",
    text = "⟨"
  }, {
    item = "[",
    subText = "Bracket, Left Square (U+005B)",
    text = "["
  }, {
    item = "〔",
    subText = "Bracket, Left Tortoise Shell (U+3014)",
    text = "〔"
  }, {
    item = "『",
    subText = "Bracket, Left White Corner (U+300E)",
    text = "『"
  }, {
    item = "⦃",
    subText = "Bracket, Left White Curly (U+2983)",
    text = "⦃"
  }, {
    item = "〖",
    subText = "Bracket, Left White Lenticular (U+3016)",
    text = "〖"
  }, {
    item = "〚",
    subText = "Bracket, Left White Square (U+301A)",
    text = "〚"
  }, {
    item = "〘",
    subText = "Bracket, Left White Tortoise Shell (U+3018)",
    text = "〘"
  }, {
    item = "〈",
    subText = "Bracket, Left-Pointing Angle (U+2329)",
    text = "〈"
  }, {
    item = "⟨",
    subText = "Bracket, Mathematical Left Angle (U+27E8)",
    text = "⟨"
  }, {
    item = "⟪",
    subText = "Bracket, Mathematical Left Double Angle (U+27EA)",
    text = "⟪"
  }, {
    item = "⟩",
    subText = "Bracket, Mathematical Right Angle (U+27E9)",
    text = "⟩"
  }, {
    item = "⟫",
    subText = "Bracket, Mathematical Right Double Angle (U+27EB)",
    text = "⟫"
  }, {
    item = "{",
    subText = "Bracket, Opening Curly (U+007B)",
    text = "{"
  }, {
    item = "[",
    subText = "Bracket, Opening Square (U+005B)",
    text = "["
  }, {
    item = "〛",
    subText = "Bracket, Right Abstract Syntax (U+301B)",
    text = "〛"
  }, {
    item = "〉",
    subText = "Bracket, Right Angle (U+3009)",
    text = "〉"
  }, {
    item = "⟧",
    subText = "Bracket, Right Bag (U+27E7)",
    text = "⟧"
  }, {
    item = "】",
    subText = "Bracket, Right Black Lenticular (U+3011)",
    text = "】"
  }, {
    item = "⟫",
    subText = "Bracket, Right Chevron (U+27EB)",
    text = "⟫"
  }, {
    item = "」",
    subText = "Bracket, Right Corner (U+300D)",
    text = "」"
  }, {
    item = "}",
    subText = "Bracket, Right Curly (U+007D)",
    text = "}"
  }, {
    item = "》",
    subText = "Bracket, Right Double Angle (U+300B)",
    text = "》"
  }, {
    item = "⟩",
    subText = "Bracket, Right Sequence (U+27E9)",
    text = "⟩"
  }, {
    item = "]",
    subText = "Bracket, Right Square (U+005D)",
    text = "]"
  }, {
    item = "〕",
    subText = "Bracket, Right Tortoise Shell (U+3015)",
    text = "〕"
  }, {
    item = "』",
    subText = "Bracket, Right White Corner (U+300F)",
    text = "』"
  }, {
    item = "⦄",
    subText = "Bracket, Right White Curly (U+2984)",
    text = "⦄"
  }, {
    item = "〗",
    subText = "Bracket, Right White Lenticular (U+3017)",
    text = "〗"
  }, {
    item = "〛",
    subText = "Bracket, Right White Square (U+301B)",
    text = "〛"
  }, {
    item = "〙",
    subText = "Bracket, Right White Tortoise Shell (U+3019)",
    text = "〙"
  }, {
    item = "〉",
    subText = "Bracket, Right-Pointing Angle (U+232A)",
    text = "〉"
  }, {
    item = "⦃",
    subText = "Brackets (U+2983)",
    text = "⦃"
  }, {
    item = "〈",
    subText = "Brackets, Cjk Angle (U+3008)",
    text = "〈"
  }, {
    item = "「",
    subText = "Brackets, Cjk Corner (U+300C)",
    text = "「"
  }, {
    item = "⌈",
    subText = "Brackets, Corner (U+2308)",
    text = "⌈"
  }, {
    item = "⎴",
    subText = "Brackets, Horizontal (U+23B4)",
    text = "⎴"
  }, {
    item = "⟦",
    subText = "Brackets, Mathematical (U+27E6)",
    text = "⟦"
  }, {
    item = "❨",
    subText = "Brackets, Ornamental (U+2768)",
    text = "❨"
  }, {
    item = "𑀀",
    subText = "Brahmi (U+11000)",
    text = "𑀀"
  }, {
    item = "⠀",
    subText = "Braille Patterns (U+2800)",
    text = "⠀"
  }, {
    item = "₢",
    subText = "Brazilian Currency (U+20A2)",
    text = "₢"
  }, {
    item = "",
    subText = "Break Here, No (U+0083)",
    text = ""
  }, {
    item = "",
    subText = "Break Permitted Here (U+0082)",
    text = ""
  }, {
    item = "̔",
    subText = "Breathing Mark, Greek Rough (U+0314)",
    text = "̔"
  }, {
    item = "̓",
    subText = "Breathing Mark, Greek Smooth (U+0313)",
    text = "̓"
  }, {
    item = "˘",
    subText = "Breve (U+02D8)",
    text = "˘"
  }, {
    item = "̮",
    subText = "Breve Below, Combining (U+032E)",
    text = "̮"
  }, {
    item = "͜",
    subText = "Breve Below, Combining Double (U+035C)",
    text = "͜"
  }, {
    item = "᷼",
    subText = "Breve Below, Combining Double Inverted (U+1DFC)",
    text = "᷼"
  }, {
    item = "̯",
    subText = "Breve Below, Combining Inverted (U+032F)",
    text = "̯"
  }, {
    item = "̆",
    subText = "Breve, Combining (U+0306)",
    text = "̆"
  }, {
    item = "͝",
    subText = "Breve, Combining Double (U+035D)",
    text = "͝"
  }, {
    item = "͡",
    subText = "Breve, Combining Double Inverted (U+0361)",
    text = "͡"
  }, {
    item = "̑",
    subText = "Breve, Combining Inverted (U+0311)",
    text = "̑"
  }, {
    item = "👰",
    subText = "Bride With Veil (U+1F470)",
    text = "👰"
  }, {
    item = "͆",
    subText = "Bridge Above, Combining (U+0346)",
    text = "͆"
  }, {
    item = "⃩",
    subText = "Bridge Above, Combining Wide (U+20E9)",
    text = "⃩"
  }, {
    item = "̪",
    subText = "Bridge Below, Combining (U+032A)",
    text = "̪"
  }, {
    item = "̺",
    subText = "Bridge Below, Combining Inverted (U+033A)",
    text = "̺"
  }, {
    item = "💨",
    subText = "Briffits (U+1F4A8)",
    text = "💨"
  }, {
    item = "¦",
    subText = "Broken Bar (U+00A6)",
    text = "¦"
  }, {
    item = "¦",
    subText = "Broken Vertical Bar (U+00A6)",
    text = "¦"
  }, {
    item = "🥉",
    subText = "Bronze Medal (U+1F949)",
    text = "🥉"
  }, {
    item = "🗨",
    subText = "Bubble Symbols, Speech And Thought (U+1F5E8)",
    text = "🗨"
  }, {
    item = "🙠",
    subText = "Bud Ornaments, Pointing (U+1F660)",
    text = "🙠"
  }, {
    item = "🐛",
    subText = "Bug (U+1F41B)",
    text = "🐛"
  }, {
    item = "ᨀ",
    subText = "Buginese (U+1A00)",
    text = "ᨀ"
  }, {
    item = "ᝀ",
    subText = "Buhid (U+1740)",
    text = "ᝀ"
  }, {
    item = "🏔",
    subText = "Building And Map Symbols (U+1F3D4)",
    text = "🏔"
  }, {
    item = "🏠",
    subText = "Building And Map Symbols (U+1F3E0)",
    text = "🏠"
  }, {
    item = "•",
    subText = "Bullet (U+2022)",
    text = "•"
  }, {
    item = "∙",
    subText = "Bullet Operator (U+2219)",
    text = "∙"
  }, {
    item = "⁌",
    subText = "Bullet, Black Leftwards (U+204C)",
    text = "⁌"
  }, {
    item = "⁍",
    subText = "Bullet, Black Rightwards (U+204D)",
    text = "⁍"
  }, {
    item = "⁃",
    subText = "Bullet, Hyphen (U+2043)",
    text = "⁃"
  }, {
    item = "☙",
    subText = "Bullet, Reversed Rotated Floral Heart (U+2619)",
    text = "☙"
  }, {
    item = "◉",
    subText = "Bullet, Tainome Japanese (U+25C9)",
    text = "◉"
  }, {
    item = "‣",
    subText = "Bullet, Triangular (U+2023)",
    text = "‣"
  }, {
    item = "◦",
    subText = "Bullet, White (U+25E6)",
    text = "◦"
  }, {
    item = "🞋",
    subText = "Bullseye (U+1F78B)",
    text = "🞋"
  }, {
    item = "◎",
    subText = "Bullseye (U+25CE)",
    text = "◎"
  }, {
    item = "ʘ",
    subText = "Bullseye, Latin Letter (U+0298)",
    text = "ʘ"
  }, {
    item = "⚰",
    subText = "Buried Symbol (U+26B0)",
    text = "⚰"
  }, {
    item = "က",
    subText = "Burmese (U+1000)",
    text = "က"
  }, {
    item = "🦋",
    subText = "Butterfly (U+1F98B)",
    text = "🦋"
  }, {
    item = "≜",
    subText = "By Definition, Equal To (U+225C)",
    text = "≜"
  }, {
    item = "≝",
    subText = "By Definition, Equal To (U+225D)",
    text = "≝"
  }, {
    item = "≞",
    subText = "By, Measured (U+225E)",
    text = "≞"
  }, {
    item = "﻿",
    subText = "Byte Order Mark (U+FEFF)",
    text = "﻿"
  }, {
    item = "𝀀",
    subText = "Byzantine Musical Symbols (U+1D000)",
    text = "𝀀"
  }, {
    item = "ć",
    subText = "C With Acute, Latin Small Letter (U+0107)",
    text = "ć"
  }, {
    item = "č",
    subText = "C With Caron, Latin Small Letter (U+010D)",
    text = "č"
  }, {
    item = "Ç",
    subText = "C With Cedilla, Latin Capital Letter (U+00C7)",
    text = "Ç"
  }, {
    item = "ç",
    subText = "C With Cedilla, Latin Small Letter (U+00E7)",
    text = "ç"
  }, {
    item = "ĉ",
    subText = "C With Circumflex, Latin Small Letter (U+0109)",
    text = "ĉ"
  }, {
    item = "ɕ",
    subText = "C With Curl, Latin Small Letter (U+0255)",
    text = "ɕ"
  }, {
    item = "ċ",
    subText = "C With Dot Above, Latin Small Letter (U+010B)",
    text = "ċ"
  }, {
    item = "ƈ",
    subText = "C With Hook, Latin Small Letter (U+0188)",
    text = "ƈ"
  }, {
    item = "Ȼ",
    subText = "C With Stroke, Latin Capital Letter (U+023B)",
    text = "Ȼ"
  }, {
    item = "ȼ",
    subText = "C With Stroke, Latin Small Letter (U+023C)",
    text = "ȼ"
  }, {
    item = "Ↄ",
    subText = "C, Apostrophic (U+2183)",
    text = "Ↄ"
  }, {
    item = "ℭ",
    subText = "C, Black-Letter Capital (U+212D)",
    text = "ℭ"
  }, {
    item = "ͨ",
    subText = "C, Combining Latin Small Letter (U+0368)",
    text = "ͨ"
  }, {
    item = "ℂ",
    subText = "C, Double-Struck Capital (U+2102)",
    text = "ℂ"
  }, {
    item = "ᴄ",
    subText = "C, Latin Letter Small Capital (U+1D04)",
    text = "ᴄ"
  }, {
    item = "ʗ",
    subText = "C, Latin Letter Stretched (U+0297)",
    text = "ʗ"
  }, {
    item = "ↄ",
    subText = "C, Latin Small Letter Reversed (U+2184)",
    text = "ↄ"
  }, {
    item = " ",
    subText = "C0 Control Codes, Ascii (U+0000)",
    text = " "
  }, {
    item = "",
    subText = "C1 Control Codes (U+0080)",
    text = ""
  }, {
    item = "℆",
    subText = "Cada Una (U+2106)",
    text = "℆"
  }, {
    item = "☤",
    subText = "Caduceus (U+2624)",
    text = "☤"
  }, {
    item = "🤙",
    subText = "Call Me Hand (U+1F919)",
    text = "🤙"
  }, {
    item = "ក",
    subText = "Cambodian (U+1780)",
    text = "ក"
  }, {
    item = "🐫",
    subText = "Camel, Bactrian (U+1F42B)",
    text = "🐫"
  }, {
    item = "🐪",
    subText = "Camel, Dromedary (U+1F42A)",
    text = "🐪"
  }, {
    item = "⛺",
    subText = "Camping Site (U+26FA)",
    text = "⛺"
  }, {
    item = "ᢰ",
    subText = "Canadian Aboriginal Syllabics Extended, Unified (U+18B0)",
    text = "ᢰ"
  }, {
    item = "᐀",
    subText = "Canadian Aboriginal Syllabics, Unified (U+1400)",
    text = "᐀"
  }, {
    item = "᙮",
    subText = "Canadian Syllabics Full Stop (U+166E)",
    text = "᙮"
  }, {
    item = "᙭",
    subText = "Canadian Syllabics Punctuation (U+166D)",
    text = "᙭"
  }, {
    item = "",
    subText = "Cancel (U+0018)",
    text = ""
  }, {
    item = "",
    subText = "Cancel Character (U+0094)",
    text = ""
  }, {
    item = "󠁿",
    subText = "Cancel Tag (U+E007F)",
    text = "󠁿"
  }, {
    item = "␘",
    subText = "Cancel, Symbol For (U+2418)",
    text = "␘"
  }, {
    item = "໌",
    subText = "Cancellation Mark, Lao (U+0ECC)",
    text = "໌"
  }, {
    item = "🗙",
    subText = "Cancellation X (U+1F5D9)",
    text = "🗙"
  }, {
    item = "♋",
    subText = "Cancer (U+264B)",
    text = "♋"
  }, {
    item = "̐",
    subText = "Candrabindu, Combining (U+0310)",
    text = "̐"
  }, {
    item = "ँ",
    subText = "Candrabindu, Devanagari Sign (U+0901)",
    text = "ँ"
  }, {
    item = "֑",
    subText = "Cantillation Marks, Hebrew (U+0591)",
    text = "֑"
  }, {
    item = "࿀",
    subText = "Cantillation Signs, Tibetan (U+0FC0)",
    text = "࿀"
  }, {
    item = "∩",
    subText = "Cap (U+2229)",
    text = "∩"
  }, {
    item = "⊓",
    subText = "Cap, Square (U+2293)",
    text = "⊓"
  }, {
    item = "Ա",
    subText = "Capital Letters, Armenian (U+0531)",
    text = "Ա"
  }, {
    item = "Ѐ",
    subText = "Capital Letters, Cyrillic (U+0400)",
    text = "Ѐ"
  }, {
    item = "Ⴀ",
    subText = "Capital Letters, Georgian (U+10A0)",
    text = "Ⴀ"
  }, {
    item = "Α",
    subText = "Capital Letters, Greek (U+0391)",
    text = "Α"
  }, {
    item = "A",
    subText = "Capital Letters, Latin (U+0041)",
    text = "A"
  }, {
    item = "⸿",
    subText = "Capitulum (U+2E3F)",
    text = "⸿"
  }, {
    item = "♑",
    subText = "Capricorn (U+2651)",
    text = "♑"
  }, {
    item = "⇪",
    subText = "Caps Lock (U+21EA)",
    text = "⇪"
  }, {
    item = "⇬",
    subText = "Caps Lock (U+21EC)",
    text = "⇬"
  }, {
    item = "⮸",
    subText = "Caps Lock (U+2BB8)",
    text = "⮸"
  }, {
    item = "⛐",
    subText = "Car Sliding (U+26D0)",
    text = "⛐"
  }, {
    item = "⛍",
    subText = "Car, Disabled (U+26CD)",
    text = "⛍"
  }, {
    item = "♠",
    subText = "Card Suits, Playing (U+2660)",
    text = "♠"
  }, {
    item = "ℵ",
    subText = "Cardinal, First Transfinite (U+2135)",
    text = "ℵ"
  }, {
    item = "ℸ",
    subText = "Cardinal, Fourth Transfinite (U+2138)",
    text = "ℸ"
  }, {
    item = "ℶ",
    subText = "Cardinal, Second Transfinite (U+2136)",
    text = "ℶ"
  }, {
    item = "ℷ",
    subText = "Cardinal, Third Transfinite (U+2137)",
    text = "ℷ"
  }, {
    item = "🂠",
    subText = "Cards, Playing (U+1F0A0)",
    text = "🂠"
  }, {
    item = "℅",
    subText = "Care Of (U+2105)",
    text = "℅"
  }, {
    item = "ʌ",
    subText = "Caret (U+028C)",
    text = "ʌ"
  }, {
    item = "‸",
    subText = "Caret (U+2038)",
    text = "‸"
  }, {
    item = "⁁",
    subText = "Caret Insertion Point (U+2041)",
    text = "⁁"
  }, {
    item = "𐊠",
    subText = "Carian (U+102A0)",
    text = "𐊠"
  }, {
    item = "ˇ",
    subText = "Caron (U+02C7)",
    text = "ˇ"
  }, {
    item = "̬",
    subText = "Caron Below, Combining (U+032C)",
    text = "̬"
  }, {
    item = "̌",
    subText = "Caron, Combining (U+030C)",
    text = "̌"
  }, {
    item = "\r",
    subText = "Carriage Return (U+000D)",
    text = "\r"
  }, {
    item = "␍",
    subText = "Carriage Return, Symbol For (U+240D)",
    text = "␍"
  }, {
    item = "×",
    subText = "Cartesian Product (U+00D7)",
    text = "×"
  }, {
    item = "⛫",
    subText = "Castle (U+26EB)",
    text = "⛫"
  }, {
    item = "🐈",
    subText = "Cat (U+1F408)",
    text = "🐈"
  }, {
    item = "🐱",
    subText = "Cat Face (U+1F431)",
    text = "🐱"
  }, {
    item = "😸",
    subText = "Cat Faces (U+1F638)",
    text = "😸"
  }, {
    item = "🛆",
    subText = "Caution (U+1F6C6)",
    text = "🛆"
  }, {
    item = "☡",
    subText = "Caution Sign (U+2621)",
    text = "☡"
  }, {
    item = "💿",
    subText = "Cd (U+1F4BF)",
    text = "💿"
  }, {
    item = "₵",
    subText = "Cedi Sign (U+20B5)",
    text = "₵"
  }, {
    item = "¸",
    subText = "Cedilla (U+00B8)",
    text = "¸"
  }, {
    item = "̒",
    subText = "Cedilla Above (U+0312)",
    text = "̒"
  }, {
    item = "̧",
    subText = "Cedilla, Combining (U+0327)",
    text = "̧"
  }, {
    item = "Ç",
    subText = "Cedilla, Latin Capital Letter C With (U+00C7)",
    text = "Ç"
  }, {
    item = "ç",
    subText = "Cedilla, Latin Small Letter C With (U+00E7)",
    text = "ç"
  }, {
    item = "¸",
    subText = "Cedilla, Spacing (U+00B8)",
    text = "¸"
  }, {
    item = "⌈",
    subText = "Ceiling, Left (U+2308)",
    text = "⌈"
  }, {
    item = "⌉",
    subText = "Ceiling, Right (U+2309)",
    text = "⌉"
  }, {
    item = "🎀",
    subText = "Celebration Symbols (U+1F380)",
    text = "🎀"
  }, {
    item = "℃",
    subText = "Celsius, Degree (U+2103)",
    text = "℃"
  }, {
    item = "⛼",
    subText = "Cemetery (U+26FC)",
    text = "⛼"
  }, {
    item = "¢",
    subText = "Cent Sign (U+00A2)",
    text = "¢"
  }, {
    item = "⎅",
    subText = "Center (U+2385)",
    text = "⎅"
  }, {
    item = "℃",
    subText = "Centigrade, Degrees (U+2103)",
    text = "℃"
  }, {
    item = "℄",
    subText = "Centre Line Symbol (U+2104)",
    text = "℄"
  }, {
    item = "﹎",
    subText = "Centreline Low Line (U+FE4E)",
    text = "﹎"
  }, {
    item = "﹊",
    subText = "Centreline Overline (U+FE4A)",
    text = "﹊"
  }, {
    item = "͏",
    subText = "Cgj (U+034F)",
    text = "͏"
  }, {
    item = "⛓",
    subText = "Chains (U+26D3)",
    text = "⛓"
  }, {
    item = "𑄀",
    subText = "Chakma (U+11100)",
    text = "𑄀"
  }, {
    item = "ꨀ",
    subText = "Cham (U+AA00)",
    text = "ꨀ"
  }, {
    item = "്",
    subText = "Chandrakkala, Malayalam (U+0D4D)",
    text = "്"
  }, {
    item = "",
    subText = "Character Introducer, Single (U+009A)",
    text = ""
  }, {
    item = "\t",
    subText = "Character Tabulation (U+0009)",
    text = "\t"
  }, {
    item = "",
    subText = "Character Tabulation Set (U+0088)",
    text = ""
  }, {
    item = "",
    subText = "Character Tabulation With Justification (U+0089)",
    text = ""
  }, {
    item = "⁀",
    subText = "Character Tie (U+2040)",
    text = "⁀"
  }, {
    item = "─",
    subText = "Chart Components, Form And (U+2500)",
    text = "─"
  }, {
    item = "✓",
    subText = "Check Mark (U+2713)",
    text = "✓"
  }, {
    item = "✔",
    subText = "Check Mark, Heavy (U+2714)",
    text = "✔"
  }, {
    item = "⍻",
    subText = "Check Mark, Not (U+237B)",
    text = "⍻"
  }, {
    item = "☑",
    subText = "Check, Ballot Box With (U+2611)",
    text = "☑"
  }, {
    item = "🙾",
    subText = "Checker Board (U+1F67E)",
    text = "🙾"
  }, {
    item = "⛀",
    subText = "Checkers, Symbols For Draughts And (U+26C0)",
    text = "⛀"
  }, {
    item = "🧀",
    subText = "Cheese Wedge (U+1F9C0)",
    text = "🧀"
  }, {
    item = "Ꭰ",
    subText = "Cherokee (U+13A0)",
    text = "Ꭰ"
  }, {
    item = "ꭰ",
    subText = "Cherokee Supplement (U+AB70)",
    text = "ꭰ"
  }, {
    item = "♔",
    subText = "Chess Symbols (U+2654)",
    text = "♔"
  }, {
    item = "🩠",
    subText = "Chess Symbols, Chinese Xiangqi (U+1FA60)",
    text = "🩠"
  }, {
    item = "🨀",
    subText = "Chess Symbols, Heterodox (U+1FA00)",
    text = "🨀"
  }, {
    item = "☖",
    subText = "Chess Symbols, Japanese (U+2616)",
    text = "☖"
  }, {
    item = "⟪",
    subText = "Chevron Bracket, Left (U+27EA)",
    text = "⟪"
  }, {
    item = "⟫",
    subText = "Chevron Bracket, Right (U+27EB)",
    text = "⟫"
  }, {
    item = "«",
    subText = "Chevrons (U+00AB)",
    text = "«"
  }, {
    item = "☧",
    subText = "Chi Rho (U+2627)",
    text = "☧"
  }, {
    item = "🐤",
    subText = "Chick, Baby (U+1F424)",
    text = "🐤"
  }, {
    item = "🐥",
    subText = "Chick, Front-Facing Baby (U+1F425)",
    text = "🐥"
  }, {
    item = "🐣",
    subText = "Chick, Hatching (U+1F423)",
    text = "🐣"
  }, {
    item = "🐔",
    subText = "Chicken (U+1F414)",
    text = "🐔"
  }, {
    item = "ൺ",
    subText = "Chillu Letters, Malayalam (U+0D7A)",
    text = "ൺ"
  }, {
    item = "㄀",
    subText = "Chinese Bopomofo (U+3100)",
    text = "㄀"
  }, {
    item = "ㆠ",
    subText = "Chinese Bopomofo Extensions (U+31A0)",
    text = "ㆠ"
  }, {
    item = "˙",
    subText = "Chinese Fifth Or Neutral Tone, Mandarin (U+02D9)",
    text = "˙"
  }, {
    item = "ˉ",
    subText = "Chinese First Tone, Mandarin (U+02C9)",
    text = "ˉ"
  }, {
    item = "🉠",
    subText = "Chinese Folk Religion Symbols (U+1F260)",
    text = "🉠"
  }, {
    item = "ˋ",
    subText = "Chinese Fourth Tone, Mandarin (U+02CB)",
    text = "ˋ"
  }, {
    item = "ˊ",
    subText = "Chinese Second Tone, Mandarin (U+02CA)",
    text = "ˊ"
  }, {
    item = "ˇ",
    subText = "Chinese Third Tone, Mandarin (U+02C7)",
    text = "ˇ"
  }, {
    item = "🩠",
    subText = "Chinese Xiangqi Chess Symbols (U+1FA60)",
    text = "🩠"
  }, {
    item = "꜀",
    subText = "Chinese, Corner Tone Marks For (U+A700)",
    text = "꜀"
  }, {
    item = "🐿",
    subText = "Chipmunk (U+1F43F)",
    text = "🐿"
  }, {
    item = "⫾",
    subText = "Choice, Dijkstra (U+2AFE)",
    text = "⫾"
  }, {
    item = "⫿",
    subText = "Choice, N-Ary Dijkstra (U+2AFF)",
    text = "⫿"
  }, {
    item = "🎄",
    subText = "Christmas Tree (U+1F384)",
    text = "🎄"
  }, {
    item = "🎅",
    subText = "Christmas, Father (U+1F385)",
    text = "🎅"
  }, {
    item = "☧",
    subText = "Christogram (U+2627)",
    text = "☧"
  }, {
    item = "⛪",
    subText = "Church (U+26EA)",
    text = "⛪"
  }, {
    item = "⃠",
    subText = "Circle Backslash, Combining Enclosing (U+20E0)",
    text = "⃠"
  }, {
    item = "⭕",
    subText = "Circle Signs, Heavy (U+2B55)",
    text = "⭕"
  }, {
    item = "⦵",
    subText = "Circle Symbols (U+29B5)",
    text = "⦵"
  }, {
    item = "●",
    subText = "Circle, Black (U+25CF)",
    text = "●"
  }, {
    item = "•",
    subText = "Circle, Black Small (U+2022)",
    text = "•"
  }, {
    item = "⃝",
    subText = "Circle, Combining Enclosing (U+20DD)",
    text = "⃝"
  }, {
    item = "◌",
    subText = "Circle, Dotted (U+25CC)",
    text = "◌"
  }, {
    item = "⃝",
    subText = "Circle, Jis Composition (U+20DD)",
    text = "⃝"
  }, {
    item = "◯",
    subText = "Circle, Large (U+25EF)",
    text = "◯"
  }, {
    item = "⚫",
    subText = "Circle, Medium Black (U+26AB)",
    text = "⚫"
  }, {
    item = "⚬",
    subText = "Circle, Medium Small White (U+26AC)",
    text = "⚬"
  }, {
    item = "⚪",
    subText = "Circle, Medium White (U+26AA)",
    text = "⚪"
  }, {
    item = "❍",
    subText = "Circle, Shadowed White (U+274D)",
    text = "❍"
  }, {
    item = "○",
    subText = "Circle, White (U+25CB)",
    text = "○"
  }, {
    item = "⊛",
    subText = "Circled Asterisk Operator (U+229B)",
    text = "⊛"
  }, {
    item = "⛒",
    subText = "Circled Crossing Lanes (U+26D2)",
    text = "⛒"
  }, {
    item = "⊝",
    subText = "Circled Dash (U+229D)",
    text = "⊝"
  }, {
    item = "⓪",
    subText = "Circled Digit Zero (U+24EA)",
    text = "⓪"
  }, {
    item = "❶",
    subText = "Circled Digits, Dingbat (U+2776)",
    text = "❶"
  }, {
    item = "⨸",
    subText = "Circled Division Sign (U+2A38)",
    text = "⨸"
  }, {
    item = "⊘",
    subText = "Circled Division Slash (U+2298)",
    text = "⊘"
  }, {
    item = "⊙",
    subText = "Circled Dot Operator (U+2299)",
    text = "⊙"
  }, {
    item = "⨀",
    subText = "Circled Dot Operator, N-Ary (U+2A00)",
    text = "⨀"
  }, {
    item = "⊜",
    subText = "Circled Equals (U+229C)",
    text = "⊜"
  }, {
    item = "㊀",
    subText = "Circled Ideographs (U+3280)",
    text = "㊀"
  }, {
    item = "❶",
    subText = "Circled Inverse Numbers (U+2776)",
    text = "❶"
  }, {
    item = "㋐",
    subText = "Circled Katakana (U+32D0)",
    text = "㋐"
  }, {
    item = "㉠",
    subText = "Circled Korean Hangul Letters (U+3260)",
    text = "㉠"
  }, {
    item = "㉮",
    subText = "Circled Korean Hangul Syllables (U+326E)",
    text = "㉮"
  }, {
    item = "🄫",
    subText = "Circled Latin Letters (U+1F12B)",
    text = "🄫"
  }, {
    item = "Ⓐ",
    subText = "Circled Latin Letters (U+24B6)",
    text = "Ⓐ"
  }, {
    item = "⊖",
    subText = "Circled Minus (U+2296)",
    text = "⊖"
  }, {
    item = "①",
    subText = "Circled Numbers (U+2460)",
    text = "①"
  }, {
    item = "㉑",
    subText = "Circled Numbers (U+3251)",
    text = "㉑"
  }, {
    item = "㊱",
    subText = "Circled Numbers (U+32B1)",
    text = "㊱"
  }, {
    item = "⓵",
    subText = "Circled Numbers, Double (U+24F5)",
    text = "⓵"
  }, {
    item = "⓫",
    subText = "Circled Numbers, White On Black (U+24EB)",
    text = "⓫"
  }, {
    item = "⊕",
    subText = "Circled Plus (U+2295)",
    text = "⊕"
  }, {
    item = "⨁",
    subText = "Circled Plus Operator, N-Ary (U+2A01)",
    text = "⨁"
  }, {
    item = "〶",
    subText = "Circled Postal Mark (U+3036)",
    text = "〶"
  }, {
    item = "⊚",
    subText = "Circled Ring Operator (U+229A)",
    text = "⊚"
  }, {
    item = "⊗",
    subText = "Circled Times (U+2297)",
    text = "⊗"
  }, {
    item = "⨂",
    subText = "Circled Times Operator, N-Ary (U+2A02)",
    text = "⨂"
  }, {
    item = "○",
    subText = "Circles (U+25CB)",
    text = "○"
  }, {
    item = "^",
    subText = "Circumflex Accent (U+005E)",
    text = "^"
  }, {
    item = "̭",
    subText = "Circumflex Accent Below, Combining (U+032D)",
    text = "̭"
  }, {
    item = "̂",
    subText = "Circumflex Accent, Combining (U+0302)",
    text = "̂"
  }, {
    item = "ˆ",
    subText = "Circumflex Accent, Modifier Letter (U+02C6)",
    text = "ˆ"
  }, {
    item = "^",
    subText = "Circumflex Accent, Spacing (U+005E)",
    text = "^"
  }, {
    item = "〈",
    subText = "Cjk Angle Brackets (U+3008)",
    text = "〈"
  }, {
    item = "㌀",
    subText = "Cjk Compatibility (U+3300)",
    text = "㌀"
  }, {
    item = "︰",
    subText = "Cjk Compatibility Forms (U+FE30)",
    text = "︰"
  }, {
    item = "豈",
    subText = "Cjk Compatibility Ideographs (U+F900)",
    text = "豈"
  }, {
    item = "丽",
    subText = "Cjk Compatibility Ideographs Supplement (U+2F800)",
    text = "丽"
  }, {
    item = "「",
    subText = "Cjk Corner Brackets (U+300C)",
    text = "「"
  }, {
    item = "〪",
    subText = "Cjk Diacritics (U+302A)",
    text = "〪"
  }, {
    item = "⿰",
    subText = "Cjk Ideographic Description Characters (U+2FF0)",
    text = "⿰"
  }, {
    item = "㐀",
    subText = "Cjk Ideographs Area (U+3400)",
    text = "㐀"
  }, {
    item = "𠀀",
    subText = "Cjk Ideographs Area, Supplementary (U+20000)",
    text = "𠀀"
  }, {
    item = "㈠",
    subText = "Cjk Ideographs, Parenthesized (U+3220)",
    text = "㈠"
  }, {
    item = "⼀",
    subText = "Cjk Kangxi Radicals (U+2F00)",
    text = "⼀"
  }, {
    item = "㈀",
    subText = "Cjk Letters And Months, Enclosed (U+3200)",
    text = "㈀"
  }, {
    item = "⺀",
    subText = "Cjk Phonetics And Symbols Area (U+2E80)",
    text = "⺀"
  }, {
    item = "｡",
    subText = "Cjk Punctuation, Halfwidth (U+FF61)",
    text = "｡"
  }, {
    item = "「",
    subText = "Cjk Quotation Marks (U+300C)",
    text = "「"
  }, {
    item = "⺀",
    subText = "Cjk Radicals Supplement (U+2E80)",
    text = "⺀"
  }, {
    item = "㇀",
    subText = "Cjk Strokes (U+31C0)",
    text = "㇀"
  }, {
    item = "　",
    subText = "Cjk Symbols And Punctuation (U+3000)",
    text = "　"
  }, {
    item = "一",
    subText = "Cjk Unified Ideographs (U+4E00)",
    text = "一"
  }, {
    item = "㐀",
    subText = "Cjk Unified Ideographs Extension A (U+3400)",
    text = "㐀"
  }, {
    item = "𠀀",
    subText = "Cjk Unified Ideographs Extension B (U+20000)",
    text = "𠀀"
  }, {
    item = "𪜀",
    subText = "Cjk Unified Ideographs Extension C (U+2A700)",
    text = "𪜀"
  }, {
    item = "𫝀",
    subText = "Cjk Unified Ideographs Extension D (U+2B740)",
    text = "𫝀"
  }, {
    item = "𫠠",
    subText = "Cjk Unified Ideographs Extension E (U+2B820)",
    text = "𫠠"
  }, {
    item = "𬺰",
    subText = "Cjk Unified Ideographs Extension F (U+2CEB0)",
    text = "𬺰"
  }, {
    item = "👏",
    subText = "Clapping Hands Sign (U+1F44F)",
    text = "👏"
  }, {
    item = "Ↄ",
    subText = "Claudian Antisigma (U+2183)",
    text = "Ↄ"
  }, {
    item = "Ⅎ",
    subText = "Claudian Digamma Inversum (U+2132)",
    text = "Ⅎ"
  }, {
    item = "⌧",
    subText = "Clear Key (U+2327)",
    text = "⌧"
  }, {
    item = "⎚",
    subText = "Clear Screen Symbol (U+239A)",
    text = "⎚"
  }, {
    item = "☀",
    subText = "Clear Weather (U+2600)",
    text = "☀"
  }, {
    item = "ǂ",
    subText = "Click, Latin Letter Alveolar (U+01C2)",
    text = "ǂ"
  }, {
    item = "ʘ",
    subText = "Click, Latin Letter Bilabial (U+0298)",
    text = "ʘ"
  }, {
    item = "ǀ",
    subText = "Click, Latin Letter Dental (U+01C0)",
    text = "ǀ"
  }, {
    item = "ǁ",
    subText = "Click, Latin Letter Lateral (U+01C1)",
    text = "ǁ"
  }, {
    item = "ǃ",
    subText = "Click, Latin Letter Retroflex (U+01C3)",
    text = "ǃ"
  }, {
    item = "ǀ",
    subText = "Clicks, African Letters For (U+01C0)",
    text = "ǀ"
  }, {
    item = "🕐",
    subText = "Clock Face Symbols (U+1F550)",
    text = "🕐"
  }, {
    item = "⏰",
    subText = "Clock, Alarm (U+23F0)",
    text = "⏰"
  }, {
    item = "⃕",
    subText = "Clockwise Arrow Above, Combining (U+20D5)",
    text = "⃕"
  }, {
    item = "∲",
    subText = "Clockwise Contour Integral (U+2232)",
    text = "∲"
  }, {
    item = "∱",
    subText = "Clockwise Integral (U+2231)",
    text = "∱"
  }, {
    item = "⃙",
    subText = "Clockwise Ring Overlay, Combining (U+20D9)",
    text = "⃙"
  }, {
    item = "℄",
    subText = "Clone (U+2104)",
    text = "℄"
  }, {
    item = "˘",
    subText = "Clones Of Diacritics, Spacing (U+02D8)",
    text = "˘"
  }, {
    item = "⁐",
    subText = "Close Up (U+2050)",
    text = "⁐"
  }, {
    item = "ʚ",
    subText = "Closed Epsilon, Latin Small Letter (U+029A)",
    text = "ʚ"
  }, {
    item = "ɷ",
    subText = "Closed Omega, Latin Small Letter (U+0277)",
    text = "ɷ"
  }, {
    item = "ʚ",
    subText = "Closed Open E, Latin Small Letter (U+029A)",
    text = "ʚ"
  }, {
    item = "ɞ",
    subText = "Closed Reversed Epsilon, Latin Small Letter (U+025E)",
    text = "ɞ"
  }, {
    item = "ɞ",
    subText = "Closed Reversed Open E, Latin Small Letter (U+025E)",
    text = "ɞ"
  }, {
    item = "}",
    subText = "Closing Brace (U+007D)",
    text = "}"
  }, {
    item = "}",
    subText = "Closing Curly Bracket (U+007D)",
    text = "}"
  }, {
    item = "〆",
    subText = "Closing Mark, Ideographic (U+3006)",
    text = "〆"
  }, {
    item = ")",
    subText = "Closing Parenthesis (U+0029)",
    text = ")"
  }, {
    item = "]",
    subText = "Closing Square Bracket (U+005D)",
    text = "]"
  }, {
    item = "👑",
    subText = "Clothing And Accessories (U+1F451)",
    text = "👑"
  }, {
    item = "☁",
    subText = "Cloud (U+2601)",
    text = "☁"
  }, {
    item = "☁",
    subText = "Cloudy Weather (U+2601)",
    text = "☁"
  }, {
    item = "⛅",
    subText = "Cloudy, Partly (U+26C5)",
    text = "⛅"
  }, {
    item = "丽",
    subText = "Cns 11643-1992, Duplicate Characters From (U+2F800)",
    text = "丽"
  }, {
    item = "☕",
    subText = "Coffee, Cup Of (U+2615)",
    text = "☕"
  }, {
    item = "⚰",
    subText = "Coffin (U+26B0)",
    text = "⚰"
  }, {
    item = "💥",
    subText = "Collision Symbol (U+1F4A5)",
    text = "💥"
  }, {
    item = ":",
    subText = "Colon (U+003A)",
    text = ":"
  }, {
    item = "≔",
    subText = "Colon Equals (U+2254)",
    text = "≔"
  }, {
    item = "⧴",
    subText = "Colon Right Arrow (U+29F4)",
    text = "⧴"
  }, {
    item = "₡",
    subText = "Colon Sign (U+20A1)",
    text = "₡"
  }, {
    item = "≕",
    subText = "Colon, Equals (U+2255)",
    text = "≕"
  }, {
    item = "፥",
    subText = "Colon, Ethiopic (U+1365)",
    text = "፥"
  }, {
    item = "፦",
    subText = "Colon, Ethiopic Preface (U+1366)",
    text = "፦"
  }, {
    item = "ˑ",
    subText = "Colon, Modifier Letter Half Triangular (U+02D1)",
    text = "ˑ"
  }, {
    item = "ː",
    subText = "Colon, Modifier Letter Triangular (U+02D0)",
    text = "ː"
  }, {
    item = "᠄",
    subText = "Colon, Mongolian (U+1804)",
    text = "᠄"
  }, {
    item = "⦂",
    subText = "Colon, Z Notation Type (U+2982)",
    text = "⦂"
  }, {
    item = "🟠",
    subText = "Colored Shapes (U+1F7E0)",
    text = "🟠"
  }, {
    item = "́",
    subText = "Combining Acute Accent (U+0301)",
    text = "́"
  }, {
    item = "̗",
    subText = "Combining Acute Accent Below (U+0317)",
    text = "̗"
  }, {
    item = "́",
    subText = "Combining Acute Tone Mark (U+0341)",
    text = "́"
  }, {
    item = "͌",
    subText = "Combining Almost Equal To Above (U+034C)",
    text = "͌"
  }, {
    item = "ᄀ",
    subText = "Combining Alphabet, Korean Hangul Jamo (U+1100)",
    text = "ᄀ"
  }, {
    item = "⃧",
    subText = "Combining Annuity Symbol (U+20E7)",
    text = "⃧"
  }, {
    item = "⃔",
    subText = "Combining Anticlockwise Arrow Above (U+20D4)",
    text = "⃔"
  }, {
    item = "⃚",
    subText = "Combining Anticlockwise Ring Overlay (U+20DA)",
    text = "⃚"
  }, {
    item = "⃰",
    subText = "Combining Asterisk Above (U+20F0)",
    text = "⃰"
  }, {
    item = "͙",
    subText = "Combining Asterisk Below (U+0359)",
    text = "͙"
  }, {
    item = "̆",
    subText = "Combining Breve (U+0306)",
    text = "̆"
  }, {
    item = "̮",
    subText = "Combining Breve Below (U+032E)",
    text = "̮"
  }, {
    item = "͆",
    subText = "Combining Bridge Above (U+0346)",
    text = "͆"
  }, {
    item = "̪",
    subText = "Combining Bridge Below (U+032A)",
    text = "̪"
  }, {
    item = "̐",
    subText = "Combining Candrabindu (U+0310)",
    text = "̐"
  }, {
    item = "̌",
    subText = "Combining Caron (U+030C)",
    text = "̌"
  }, {
    item = "̬",
    subText = "Combining Caron Below (U+032C)",
    text = "̬"
  }, {
    item = "̧",
    subText = "Combining Cedilla (U+0327)",
    text = "̧"
  }, {
    item = "҃",
    subText = "Combining Characters, Cyrillic (U+0483)",
    text = "҃"
  }, {
    item = "̂",
    subText = "Combining Circumflex Accent (U+0302)",
    text = "̂"
  }, {
    item = "̭",
    subText = "Combining Circumflex Accent Below (U+032D)",
    text = "̭"
  }, {
    item = "⃕",
    subText = "Combining Clockwise Arrow Above (U+20D5)",
    text = "⃕"
  }, {
    item = "⃙",
    subText = "Combining Clockwise Ring Overlay (U+20D9)",
    text = "⃙"
  }, {
    item = "̓",
    subText = "Combining Comma Above (U+0313)",
    text = "̓"
  }, {
    item = "̕",
    subText = "Combining Comma Above Right (U+0315)",
    text = "̕"
  }, {
    item = "̦",
    subText = "Combining Comma Below (U+0326)",
    text = "̦"
  }, {
    item = "︦",
    subText = "Combining Conjoining Macron (U+FE26)",
    text = "︦"
  }, {
    item = "⃔",
    subText = "Combining Counterclockwise Arrow Above (U+20D4)",
    text = "⃔"
  }, {
    item = "⃚",
    subText = "Combining Counterclockwise Ring Overlay (U+20DA)",
    text = "⃚"
  }, {
    item = "̀",
    subText = "Combining Diacritical Marks (U+0300)",
    text = "̀"
  }, {
    item = "᪰",
    subText = "Combining Diacritical Marks Extended (U+1AB0)",
    text = "᪰"
  }, {
    item = "⃐",
    subText = "Combining Diacritical Marks For Symbols (U+20D0)",
    text = "⃐"
  }, {
    item = "̈",
    subText = "Combining Diaeresis (U+0308)",
    text = "̈"
  }, {
    item = "̤",
    subText = "Combining Diaeresis Below (U+0324)",
    text = "̤"
  }, {
    item = "̇",
    subText = "Combining Dot Above (U+0307)",
    text = "̇"
  }, {
    item = "͘",
    subText = "Combining Dot Above Right (U+0358)",
    text = "͘"
  }, {
    item = "̣",
    subText = "Combining Dot Below (U+0323)",
    text = "̣"
  }, {
    item = "̋",
    subText = "Combining Double Acute Accent (U+030B)",
    text = "̋"
  }, {
    item = "͝",
    subText = "Combining Double Breve (U+035D)",
    text = "͝"
  }, {
    item = "͜",
    subText = "Combining Double Breve Below (U+035C)",
    text = "͜"
  }, {
    item = "̏",
    subText = "Combining Double Grave Accent (U+030F)",
    text = "̏"
  }, {
    item = "͡",
    subText = "Combining Double Inverted Breve (U+0361)",
    text = "͡"
  }, {
    item = "᷼",
    subText = "Combining Double Inverted Breve Below (U+1DFC)",
    text = "᷼"
  }, {
    item = "̳",
    subText = "Combining Double Low Line (U+0333)",
    text = "̳"
  }, {
    item = "͞",
    subText = "Combining Double Macron (U+035E)",
    text = "͞"
  }, {
    item = "͟",
    subText = "Combining Double Macron Below (U+035F)",
    text = "͟"
  }, {
    item = "̿",
    subText = "Combining Double Overline (U+033F)",
    text = "̿"
  }, {
    item = "͢",
    subText = "Combining Double Rightwards Arrow Below (U+0362)",
    text = "͢"
  }, {
    item = "͚",
    subText = "Combining Double Ring Below (U+035A)",
    text = "͚"
  }, {
    item = "͠",
    subText = "Combining Double Tilde (U+0360)",
    text = "͠"
  }, {
    item = "̎",
    subText = "Combining Double Vertical Line Above (U+030E)",
    text = "̎"
  }, {
    item = "͈",
    subText = "Combining Double Vertical Line Below (U+0348)",
    text = "͈"
  }, {
    item = "⃦",
    subText = "Combining Double Vertical Stroke Overlay (U+20E6)",
    text = "⃦"
  }, {
    item = "̞",
    subText = "Combining Down Tack Below (U+031E)",
    text = "̞"
  }, {
    item = "⃝",
    subText = "Combining Enclosing Circle (U+20DD)",
    text = "⃝"
  }, {
    item = "⃠",
    subText = "Combining Enclosing Circle Backslash (U+20E0)",
    text = "⃠"
  }, {
    item = "⃟",
    subText = "Combining Enclosing Diamond (U+20DF)",
    text = "⃟"
  }, {
    item = "⃣",
    subText = "Combining Enclosing Keycap (U+20E3)",
    text = "⃣"
  }, {
    item = "⃢",
    subText = "Combining Enclosing Screen (U+20E2)",
    text = "⃢"
  }, {
    item = "⃞",
    subText = "Combining Enclosing Square (U+20DE)",
    text = "⃞"
  }, {
    item = "⃤",
    subText = "Combining Enclosing Upward Pointing Triangle (U+20E4)",
    text = "⃤"
  }, {
    item = "͇",
    subText = "Combining Equals Sign Below (U+0347)",
    text = "͇"
  }, {
    item = "͒",
    subText = "Combining Fermata (U+0352)",
    text = "͒"
  }, {
    item = "⃜",
    subText = "Combining Four Dots Above (U+20DC)",
    text = "⃜"
  }, {
    item = "͏",
    subText = "Combining Grapheme Joiner (U+034F)",
    text = "͏"
  }, {
    item = "̀",
    subText = "Combining Grave Accent (U+0300)",
    text = "̀"
  }, {
    item = "̖",
    subText = "Combining Grave Accent Below (U+0316)",
    text = "̖"
  }, {
    item = "̀",
    subText = "Combining Grave Tone Mark (U+0340)",
    text = "̀"
  }, {
    item = "̈́",
    subText = "Combining Greek Dialytika Tonos (U+0344)",
    text = "̈́"
  }, {
    item = "̓",
    subText = "Combining Greek Koronis (U+0343)",
    text = "̓"
  }, {
    item = "͂",
    subText = "Combining Greek Perispomeni (U+0342)",
    text = "͂"
  }, {
    item = "ͅ",
    subText = "Combining Greek Ypogegrammeni (U+0345)",
    text = "ͅ"
  }, {
    item = "̌",
    subText = "Combining Hacek (U+030C)",
    text = "̌"
  }, {
    item = "︠",
    subText = "Combining Half Marks (U+FE20)",
    text = "︠"
  }, {
    item = "︧",
    subText = "Combining Half Marks Below (U+FE27)",
    text = "︧"
  }, {
    item = "͋",
    subText = "Combining Homothetic Above (U+034B)",
    text = "͋"
  }, {
    item = "̉",
    subText = "Combining Hook Above (U+0309)",
    text = "̉"
  }, {
    item = "̛",
    subText = "Combining Horn (U+031B)",
    text = "̛"
  }, {
    item = "̑",
    subText = "Combining Inverted Breve (U+0311)",
    text = "̑"
  }, {
    item = "̯",
    subText = "Combining Inverted Breve Below (U+032F)",
    text = "̯"
  }, {
    item = "̺",
    subText = "Combining Inverted Bridge Below (U+033A)",
    text = "̺"
  }, {
    item = "̫",
    subText = "Combining Inverted Double Arch Below (U+032B)",
    text = "̫"
  }, {
    item = "゙",
    subText = "Combining Japanese Daku-On (U+3099)",
    text = "゙"
  }, {
    item = "゚",
    subText = "Combining Japanese Han-Daku-On (U+309A)",
    text = "゚"
  }, {
    item = "ͣ",
    subText = "Combining Latin Small Letters (U+0363)",
    text = "ͣ"
  }, {
    item = "̚",
    subText = "Combining Left Angle Above (U+031A)",
    text = "̚"
  }, {
    item = "͉",
    subText = "Combining Left Angle Below (U+0349)",
    text = "͉"
  }, {
    item = "⃖",
    subText = "Combining Left Arrow Above (U+20D6)",
    text = "⃖"
  }, {
    item = "⃮",
    subText = "Combining Left Arrow Below (U+20EE)",
    text = "⃮"
  }, {
    item = "͔",
    subText = "Combining Left Arrowhead Below (U+0354)",
    text = "͔"
  }, {
    item = "͑",
    subText = "Combining Left Half Ring Above (U+0351)",
    text = "͑"
  }, {
    item = "̜",
    subText = "Combining Left Half Ring Below (U+031C)",
    text = "̜"
  }, {
    item = "⃐",
    subText = "Combining Left Harpoon Above (U+20D0)",
    text = "⃐"
  }, {
    item = "⃡",
    subText = "Combining Left Right Arrow Above (U+20E1)",
    text = "⃡"
  }, {
    item = "͍",
    subText = "Combining Left Right Arrow Below (U+034D)",
    text = "͍"
  }, {
    item = "̘",
    subText = "Combining Left Tack Below (U+0318)",
    text = "̘"
  }, {
    item = "⃪",
    subText = "Combining Leftwards Arrow Overlay (U+20EA)",
    text = "⃪"
  }, {
    item = "⃭",
    subText = "Combining Leftwards Harpoon With Barb Downwards (U+20ED)",
    text = "⃭"
  }, {
    item = "⃫",
    subText = "Combining Long Double Solidus Overlay (U+20EB)",
    text = "⃫"
  }, {
    item = "̸",
    subText = "Combining Long Solidus Overlay (U+0338)",
    text = "̸"
  }, {
    item = "̶",
    subText = "Combining Long Stroke Overlay (U+0336)",
    text = "̶"
  }, {
    item = "⃒",
    subText = "Combining Long Vertical Line Overlay (U+20D2)",
    text = "⃒"
  }, {
    item = "̲",
    subText = "Combining Low Line (U+0332)",
    text = "̲"
  }, {
    item = "̄",
    subText = "Combining Macron (U+0304)",
    text = "̄"
  }, {
    item = "̱",
    subText = "Combining Macron Below (U+0331)",
    text = "̱"
  }, {
    item = "︤",
    subText = "Combining Macron Left Half (U+FE24)",
    text = "︤"
  }, {
    item = "︥",
    subText = "Combining Macron Right Half (U+FE25)",
    text = "︥"
  }, {
    item = "ٓ",
    subText = "Combining Marks, Arabic (U+0653)",
    text = "ٓ"
  }, {
    item = "፝",
    subText = "Combining Marks, Ethiopic (U+135D)",
    text = "፝"
  }, {
    item = "̠",
    subText = "Combining Minus Sign Below (U+0320)",
    text = "̠"
  }, {
    item = "͊",
    subText = "Combining Not Tilde Above (U+034A)",
    text = "͊"
  }, {
    item = "̨",
    subText = "Combining Ogonek (U+0328)",
    text = "̨"
  }, {
    item = "̅",
    subText = "Combining Overline (U+0305)",
    text = "̅"
  }, {
    item = "̡",
    subText = "Combining Palatalized Hook Below (U+0321)",
    text = "̡"
  }, {
    item = "̟",
    subText = "Combining Plus Sign Below (U+031F)",
    text = "̟"
  }, {
    item = "̢",
    subText = "Combining Retroflex Hook Below (U+0322)",
    text = "̢"
  }, {
    item = "⃥",
    subText = "Combining Reverse Solidus Overlay (U+20E5)",
    text = "⃥"
  }, {
    item = "̔",
    subText = "Combining Reversed Comma Above (U+0314)",
    text = "̔"
  }, {
    item = "⃗",
    subText = "Combining Right Arrow Above (U+20D7)",
    text = "⃗"
  }, {
    item = "⃯",
    subText = "Combining Right Arrow Below (U+20EF)",
    text = "⃯"
  }, {
    item = "͐",
    subText = "Combining Right Arrowhead Above (U+0350)",
    text = "͐"
  }, {
    item = "͕",
    subText = "Combining Right Arrowhead Below (U+0355)",
    text = "͕"
  }, {
    item = "͗",
    subText = "Combining Right Half Ring Above (U+0357)",
    text = "͗"
  }, {
    item = "̹",
    subText = "Combining Right Half Ring Below (U+0339)",
    text = "̹"
  }, {
    item = "⃑",
    subText = "Combining Right Harpoon Above (U+20D1)",
    text = "⃑"
  }, {
    item = "̙",
    subText = "Combining Right Tack Below (U+0319)",
    text = "̙"
  }, {
    item = "⃬",
    subText = "Combining Rightwards Harpoon With Barb Downwards (U+20EC)",
    text = "⃬"
  }, {
    item = "̊",
    subText = "Combining Ring Above (U+030A)",
    text = "̊"
  }, {
    item = "̥",
    subText = "Combining Ring Below (U+0325)",
    text = "̥"
  }, {
    item = "⃘",
    subText = "Combining Ring Overlay (U+20D8)",
    text = "⃘"
  }, {
    item = "̼",
    subText = "Combining Seagull Below (U+033C)",
    text = "̼"
  }, {
    item = "̷",
    subText = "Combining Short Solidus Overlay (U+0337)",
    text = "̷"
  }, {
    item = "̵",
    subText = "Combining Short Stroke Overlay (U+0335)",
    text = "̵"
  }, {
    item = "⃓",
    subText = "Combining Short Vertical Line Overlay (U+20D3)",
    text = "⃓"
  }, {
    item = "̻",
    subText = "Combining Square Below (U+033B)",
    text = "̻"
  }, {
    item = "⃛",
    subText = "Combining Three Dots Above (U+20DB)",
    text = "⃛"
  }, {
    item = "̃",
    subText = "Combining Tilde (U+0303)",
    text = "̃"
  }, {
    item = "̰",
    subText = "Combining Tilde Below (U+0330)",
    text = "̰"
  }, {
    item = "̴",
    subText = "Combining Tilde Overlay (U+0334)",
    text = "̴"
  }, {
    item = "⃨",
    subText = "Combining Triple Underdot (U+20E8)",
    text = "⃨"
  }, {
    item = "̒",
    subText = "Combining Turned Comma Above (U+0312)",
    text = "̒"
  }, {
    item = "̝",
    subText = "Combining Up Tack Below (U+031D)",
    text = "̝"
  }, {
    item = "͎",
    subText = "Combining Upwards Arrow Below (U+034E)",
    text = "͎"
  }, {
    item = "̍",
    subText = "Combining Vertical Line Above (U+030D)",
    text = "̍"
  }, {
    item = "̩",
    subText = "Combining Vertical Line Below (U+0329)",
    text = "̩"
  }, {
    item = "̾",
    subText = "Combining Vertical Tilde (U+033E)",
    text = "̾"
  }, {
    item = "⃩",
    subText = "Combining Wide Bridge Above (U+20E9)",
    text = "⃩"
  }, {
    item = "̽",
    subText = "Combining X Above (U+033D)",
    text = "̽"
  }, {
    item = "͓",
    subText = "Combining X Below (U+0353)",
    text = "͓"
  }, {
    item = "͛",
    subText = "Combining Zigzag Above (U+035B)",
    text = "͛"
  }, {
    item = "🎭",
    subText = "Comedy And Tragedy, Masks Of (U+1F3AD)",
    text = "🎭"
  }, {
    item = "☄",
    subText = "Comet (U+2604)",
    text = "☄"
  }, {
    item = "💠",
    subText = "Comic Style Symbols (U+1F4A0)",
    text = "💠"
  }, {
    item = ",",
    subText = "Comma (U+002C)",
    text = ","
  }, {
    item = "̕",
    subText = "Comma Above Right, Combining (U+0315)",
    text = "̕"
  }, {
    item = "̓",
    subText = "Comma Above, Combining (U+0313)",
    text = "̓"
  }, {
    item = "̔",
    subText = "Comma Above, Combining Reversed (U+0314)",
    text = "̔"
  }, {
    item = "̒",
    subText = "Comma Above, Combining Turned (U+0312)",
    text = "̒"
  }, {
    item = "̦",
    subText = "Comma Below, Combining (U+0326)",
    text = "̦"
  }, {
    item = "”",
    subText = "Comma Quotation Mark, Double (U+201D)",
    text = "”"
  }, {
    item = "‟",
    subText = "Comma Quotation Mark, Double Reversed (U+201F)",
    text = "‟"
  }, {
    item = "“",
    subText = "Comma Quotation Mark, Double Turned (U+201C)",
    text = "“"
  }, {
    item = "„",
    subText = "Comma Quotation Mark, Low Double (U+201E)",
    text = "„"
  }, {
    item = "‚",
    subText = "Comma Quotation Mark, Low Single (U+201A)",
    text = "‚"
  }, {
    item = "’",
    subText = "Comma Quotation Mark, Single (U+2019)",
    text = "’"
  }, {
    item = "‛",
    subText = "Comma Quotation Mark, Single Reversed (U+201B)",
    text = "‛"
  }, {
    item = "‘",
    subText = "Comma Quotation Mark, Single Turned (U+2018)",
    text = "‘"
  }, {
    item = "،",
    subText = "Comma, Arabic (U+060C)",
    text = "،"
  }, {
    item = "՝",
    subText = "Comma, Armenian (U+055D)",
    text = "՝"
  }, {
    item = "፣",
    subText = "Comma, Ethiopic (U+1363)",
    text = "፣"
  }, {
    item = "·",
    subText = "Comma, Georgian (U+00B7)",
    text = "·"
  }, {
    item = "、",
    subText = "Comma, Ideographic (U+3001)",
    text = "、"
  }, {
    item = "⁣",
    subText = "Comma, Invisible (U+2063)",
    text = "⁣"
  }, {
    item = "ʽ",
    subText = "Comma, Modifier Letter Reversed (U+02BD)",
    text = "ʽ"
  }, {
    item = "ʻ",
    subText = "Comma, Modifier Letter Turned (U+02BB)",
    text = "ʻ"
  }, {
    item = "᠂",
    subText = "Comma, Mongolian (U+1802)",
    text = "᠂"
  }, {
    item = "᠈",
    subText = "Comma, Mongolian Manchu (U+1808)",
    text = "᠈"
  }, {
    item = "⹁",
    subText = "Comma, Reversed (U+2E41)",
    text = "⹁"
  }, {
    item = "⌘",
    subText = "Command Key (U+2318)",
    text = "⌘"
  }, {
    item = "",
    subText = "Command, Application Program (U+009F)",
    text = ""
  }, {
    item = "",
    subText = "Command, Operating System (U+009D)",
    text = ""
  }, {
    item = "@",
    subText = "Commercial At (U+0040)",
    text = "@"
  }, {
    item = "⁒",
    subText = "Commercial Minus Sign (U+2052)",
    text = "⁒"
  }, {
    item = "📝",
    subText = "Communication Symbols (U+1F4DD)",
    text = "📝"
  }, {
    item = "🕻",
    subText = "Communication Symbols (U+1F57B)",
    text = "🕻"
  }, {
    item = "💿",
    subText = "Compact Disc (U+1F4BF)",
    text = "💿"
  }, {
    item = "☼",
    subText = "Compass (U+263C)",
    text = "☼"
  }, {
    item = "豈",
    subText = "Compatibility And Specials Area (U+F900)",
    text = "豈"
  }, {
    item = "︰",
    subText = "Compatibility Forms, Cjk (U+FE30)",
    text = "︰"
  }, {
    item = "丽",
    subText = "Compatibility Ideographs Supplement, Cjk (U+2F800)",
    text = "丽"
  }, {
    item = "豈",
    subText = "Compatibility Ideographs, Cjk (U+F900)",
    text = "豈"
  }, {
    item = "並",
    subText = "Compatibility Ideographs, Dprk (U+FA70)",
    text = "並"
  }, {
    item = "侮",
    subText = "Compatibility Ideographs, Jis X 0213 (U+FA30)",
    text = "侮"
  }, {
    item = "㄰",
    subText = "Compatibility Jamo, Korean Hangul (U+3130)",
    text = "㄰"
  }, {
    item = "㌀",
    subText = "Compatibility, Cjk (U+3300)",
    text = "㌀"
  }, {
    item = "∁",
    subText = "Complement (U+2201)",
    text = "∁"
  }, {
    item = "ℂ",
    subText = "Complex Numbers (U+2102)",
    text = "ℂ"
  }, {
    item = "⟟",
    subText = "Component, Radial (U+27DF)",
    text = "⟟"
  }, {
    item = "─",
    subText = "Components, Form And Chart (U+2500)",
    text = "─"
  }, {
    item = "∘",
    subText = "Composite Function (U+2218)",
    text = "∘"
  }, {
    item = "⃝",
    subText = "Composition Circle, Jis (U+20DD)",
    text = "⃝"
  }, {
    item = "⎄",
    subText = "Composition Symbol (U+2384)",
    text = "⎄"
  }, {
    item = "🖥",
    subText = "Computer Component Symbols (U+1F5A5)",
    text = "🖥"
  }, {
    item = "⁀",
    subText = "Concatenation, Sequence (U+2040)",
    text = "⁀"
  }, {
    item = "⌲",
    subText = "Conical Taper (U+2332)",
    text = "⌲"
  }, {
    item = "︦",
    subText = "Conjoining Macron, Combining (U+FE26)",
    text = "︦"
  }, {
    item = "⊹",
    subText = "Conjugate Matrix, Hermitian (U+22B9)",
    text = "⊹"
  }, {
    item = "∧",
    subText = "Conjunction (U+2227)",
    text = "∧"
  }, {
    item = "☌",
    subText = "Conjunction (U+260C)",
    text = "☌"
  }, {
    item = "π",
    subText = "Constant Pi, Mathematical (U+03C0)",
    text = "π"
  }, {
    item = "ℇ",
    subText = "Constant, Euler (U+2107)",
    text = "ℇ"
  }, {
    item = "ℎ",
    subText = "Constant, Planck (U+210E)",
    text = "ℎ"
  }, {
    item = "☧",
    subText = "Constantine'S Cross (U+2627)",
    text = "☧"
  }, {
    item = "⛏",
    subText = "Construction (U+26CF)",
    text = "⛏"
  }, {
    item = "👷",
    subText = "Construction Worker (U+1F477)",
    text = "👷"
  }, {
    item = "∋",
    subText = "Contains As Member (U+220B)",
    text = "∋"
  }, {
    item = "∍",
    subText = "Contains As Member, Small (U+220D)",
    text = "∍"
  }, {
    item = "⊳",
    subText = "Contains As Normal Subgroup (U+22B3)",
    text = "⊳"
  }, {
    item = "ﭐ",
    subText = "Contextual Form Glyphs, Arabic (U+FB50)",
    text = "ﭐ"
  }, {
    item = "ﺀ",
    subText = "Contextual Form Glyphs, Arabic (U+FE80)",
    text = "ﺀ"
  }, {
    item = "⪡",
    subText = "Continuity, Absolute (U+2AA1)",
    text = "⪡"
  }, {
    item = "⎁",
    subText = "Continuous Underline Symbol (U+2381)",
    text = "⎁"
  }, {
    item = "ℶ",
    subText = "Continuum, Second Transfinite Cardinal (U+2136)",
    text = "ℶ"
  }, {
    item = "∮",
    subText = "Contour Integral (U+222E)",
    text = "∮"
  }, {
    item = "∳",
    subText = "Contour Integral, Anticlockwise (U+2233)",
    text = "∳"
  }, {
    item = "∲",
    subText = "Contour Integral, Clockwise (U+2232)",
    text = "∲"
  }, {
    item = "∳",
    subText = "Contour Integral, Counterclockwise (U+2233)",
    text = "∳"
  }, {
    item = "⃩",
    subText = "Contraction Operator (U+20E9)",
    text = "⃩"
  }, {
    item = "⎈",
    subText = "Control (U+2388)",
    text = "⎈"
  }, {
    item = "◰",
    subText = "Control Code Graphics, Quadrant (U+25F0)",
    text = "◰"
  }, {
    item = " ",
    subText = "Control Codes, Ascii C0 (U+0000)",
    text = " "
  }, {
    item = " ",
    subText = "Control Codes, C0 (U+0000)",
    text = " "
  }, {
    item = "",
    subText = "Control Codes, C1 (U+0080)",
    text = ""
  }, {
    item = "␀",
    subText = "Control Codes, Graphic Pictures For (U+2400)",
    text = "␀"
  }, {
    item = "⍽",
    subText = "Control Codes, Graphics For (U+237D)",
    text = "⍽"
  }, {
    item = "",
    subText = "Control Sequence Introducer (U+009B)",
    text = ""
  }, {
    item = "‪",
    subText = "Controls, Bidirectional Format (U+202A)",
    text = "‪"
  }, {
    item = "᠋",
    subText = "Controls, Mongolian Format (U+180B)",
    text = "᠋"
  }, {
    item = "∐",
    subText = "Coproduct Sign (U+2210)",
    text = "∐"
  }, {
    item = "∐",
    subText = "Coproduct, N-Ary (U+2210)",
    text = "∐"
  }, {
    item = "𐋠",
    subText = "Coptic Epact Numbers (U+102E0)",
    text = "𐋠"
  }, {
    item = "Ϣ",
    subText = "Coptic Letters Derived From Demotic (U+03E2)",
    text = "Ϣ"
  }, {
    item = "Ⲁ",
    subText = "Coptic, Bohairic (U+2C80)",
    text = "Ⲁ"
  }, {
    item = "︤",
    subText = "Coptic, Continuous Macrons For (U+FE24)",
    text = "︤"
  }, {
    item = "Ⲳ",
    subText = "Coptic, Extended (U+2CB2)",
    text = "Ⲳ"
  }, {
    item = "🄯",
    subText = "Copyleft Symbol (U+1F12F)",
    text = "🄯"
  }, {
    item = "©",
    subText = "Copyright Sign (U+00A9)",
    text = "©"
  }, {
    item = "℗",
    subText = "Copyright, Sound Recording (U+2117)",
    text = "℗"
  }, {
    item = "⌈",
    subText = "Corner Brackets (U+2308)",
    text = "⌈"
  }, {
    item = "「",
    subText = "Corner Brackets, Cjk (U+300C)",
    text = "「"
  }, {
    item = "꜀",
    subText = "Corner Tone Marks For Chinese (U+A700)",
    text = "꜀"
  }, {
    item = "⌜",
    subText = "Corners, Quine (U+231C)",
    text = "⌜"
  }, {
    item = "≘",
    subText = "Corresponds To (U+2258)",
    text = "≘"
  }, {
    item = "≙",
    subText = "Corresponds To (U+2259)",
    text = "≙"
  }, {
    item = "₡",
    subText = "Costa Rican Currency (U+20A1)",
    text = "₡"
  }, {
    item = "ℵ",
    subText = "Countable, First Transfinite Cardinal (U+2135)",
    text = "ℵ"
  }, {
    item = "⌴",
    subText = "Counterbore (U+2334)",
    text = "⌴"
  }, {
    item = "⃔",
    subText = "Counterclockwise Arrow Above, Combining (U+20D4)",
    text = "⃔"
  }, {
    item = "∳",
    subText = "Counterclockwise Contour Integral (U+2233)",
    text = "∳"
  }, {
    item = "⨑",
    subText = "Counterclockwise Integration (U+2A11)",
    text = "⨑"
  }, {
    item = "⃚",
    subText = "Counterclockwise Ring Overlay, Combining (U+20DA)",
    text = "⃚"
  }, {
    item = "⌵",
    subText = "Countersink (U+2335)",
    text = "⌵"
  }, {
    item = "🐄",
    subText = "Cow (U+1F404)",
    text = "🐄"
  }, {
    item = "🐮",
    subText = "Cow Face (U+1F42E)",
    text = "🐮"
  }, {
    item = "\r",
    subText = "Cr (U+000D)",
    text = "\r"
  }, {
    item = "🦀",
    subText = "Crab (U+1F980)",
    text = "🦀"
  }, {
    item = "௷",
    subText = "Credit Sign, Tamil (U+0BF7)",
    text = "௷"
  }, {
    item = "⚱",
    subText = "Cremated Symbol (U+26B1)",
    text = "⚱"
  }, {
    item = "🌙",
    subText = "Crescent Moon (U+1F319)",
    text = "🌙"
  }, {
    item = "☪",
    subText = "Crescent, Star And (U+262A)",
    text = "☪"
  }, {
    item = "Ǆ",
    subText = "Croatian Digraphs Matching Serbian Cyrillic Letters (U+01C4)",
    text = "Ǆ"
  }, {
    item = "🐊",
    subText = "Crocodile (U+1F40A)",
    text = "🐊"
  }, {
    item = "⌌",
    subText = "Crops (U+230C)",
    text = "⌌"
  }, {
    item = "˟",
    subText = "Cross Accent, Modifier Letter (U+02DF)",
    text = "˟"
  }, {
    item = "✙",
    subText = "Cross Dingbats (U+2719)",
    text = "✙"
  }, {
    item = "❌",
    subText = "Cross Mark (U+274C)",
    text = "❌"
  }, {
    item = "☩",
    subText = "Cross Of Jerusalem (U+2629)",
    text = "☩"
  }, {
    item = "☨",
    subText = "Cross Of Lorraine (U+2628)",
    text = "☨"
  }, {
    item = "🕂",
    subText = "Cross Pommee (U+1F542)",
    text = "🕂"
  }, {
    item = "℞",
    subText = "Cross Ratio (U+211E)",
    text = "℞"
  }, {
    item = "☧",
    subText = "Cross, Constantine'S (U+2627)",
    text = "☧"
  }, {
    item = "⁜",
    subText = "Cross, Dotted (U+205C)",
    text = "⁜"
  }, {
    item = "♱",
    subText = "Cross, East Syriac (U+2671)",
    text = "♱"
  }, {
    item = "🕇",
    subText = "Cross, Heavy Latin (U+1F547)",
    text = "🕇"
  }, {
    item = "✝",
    subText = "Cross, Latin (U+271D)",
    text = "✝"
  }, {
    item = "†",
    subText = "Cross, Long (U+2020)",
    text = "†"
  }, {
    item = "✠",
    subText = "Cross, Maltese (U+2720)",
    text = "✠"
  }, {
    item = "☦",
    subText = "Cross, Orthodox (U+2626)",
    text = "☦"
  }, {
    item = "☓",
    subText = "Cross, St. Andrew'S (U+2613)",
    text = "☓"
  }, {
    item = "♰",
    subText = "Cross, West Syriac (U+2670)",
    text = "♰"
  }, {
    item = "🕆",
    subText = "Cross, White Latin (U+1F546)",
    text = "🕆"
  }, {
    item = "🤞",
    subText = "Crossed Fingers (U+1F91E)",
    text = "🤞"
  }, {
    item = "⚔",
    subText = "Crossed Swords (U+2694)",
    text = "⚔"
  }, {
    item = "✙",
    subText = "Crosses (U+2719)",
    text = "✙"
  }, {
    item = "🞡",
    subText = "Crosses, Greek (U+1F7A1)",
    text = "🞡"
  }, {
    item = "#",
    subText = "Crosshatch (U+0023)",
    text = "#"
  }, {
    item = "𝅘𝅥",
    subText = "Crotchet (U+1D15F)",
    text = "𝅘𝅥"
  }, {
    item = "♩",
    subText = "Crotchet (U+2669)",
    text = "♩"
  }, {
    item = "₢",
    subText = "Cruzeiro Sign (U+20A2)",
    text = "₢"
  }, {
    item = "Ⳬ",
    subText = "Cryptogrammic Letters (U+2CEB)",
    text = "Ⳬ"
  }, {
    item = "∛",
    subText = "Cube Root (U+221B)",
    text = "∛"
  }, {
    item = "³",
    subText = "Cubed (U+00B3)",
    text = "³"
  }, {
    item = "🗻",
    subText = "Cultural Symbols (U+1F5FB)",
    text = "🗻"
  }, {
    item = "𒀀",
    subText = "Cuneiform (U+12000)",
    text = "𒀀"
  }, {
    item = "𒐀",
    subText = "Cuneiform Numbers And Punctuation (U+12400)",
    text = "𒐀"
  }, {
    item = "𒒀",
    subText = "Cuneiform, Early Dynastic (U+12480)",
    text = "𒒀"
  }, {
    item = "∪",
    subText = "Cup (U+222A)",
    text = "∪"
  }, {
    item = "☕",
    subText = "Cup Of Coffee (U+2615)",
    text = "☕"
  }, {
    item = "☕",
    subText = "Cup Of Tea (U+2615)",
    text = "☕"
  }, {
    item = "⛾",
    subText = "Cup On Black Square (U+26FE)",
    text = "⛾"
  }, {
    item = "⊔",
    subText = "Cup, Square (U+2294)",
    text = "⊔"
  }, {
    item = "ϐ",
    subText = "Curled Beta (U+03D0)",
    text = "ϐ"
  }, {
    item = "}",
    subText = "Curly Bracket, Closing (U+007D)",
    text = "}"
  }, {
    item = "{",
    subText = "Curly Bracket, Left (U+007B)",
    text = "{"
  }, {
    item = "⦃",
    subText = "Curly Bracket, Left White (U+2983)",
    text = "⦃"
  }, {
    item = "{",
    subText = "Curly Bracket, Opening (U+007B)",
    text = "{"
  }, {
    item = "}",
    subText = "Curly Bracket, Right (U+007D)",
    text = "}"
  }, {
    item = "⦄",
    subText = "Curly Bracket, Right White (U+2984)",
    text = "⦄"
  }, {
    item = "⋏",
    subText = "Curly Logical And (U+22CF)",
    text = "⋏"
  }, {
    item = "⋎",
    subText = "Curly Logical Or (U+22CE)",
    text = "⋎"
  }, {
    item = "¤",
    subText = "Currency Sign (U+00A4)",
    text = "¤"
  }, {
    item = "৲",
    subText = "Currency Signs, Bengali (U+09F2)",
    text = "৲"
  }, {
    item = "฿",
    subText = "Currency Symbol Baht, Thai (U+0E3F)",
    text = "฿"
  }, {
    item = "៛",
    subText = "Currency Symbol Riel, Khmer (U+17DB)",
    text = "៛"
  }, {
    item = "ƒ",
    subText = "Currency Symbol, Florin (U+0192)",
    text = "ƒ"
  }, {
    item = "₠",
    subText = "Currency Symbols (U+20A0)",
    text = "₠"
  }, {
    item = "₳",
    subText = "Currency, Argentinian Former (U+20B3)",
    text = "₳"
  }, {
    item = "֏",
    subText = "Currency, Armenian (U+058F)",
    text = "֏"
  }, {
    item = "₼",
    subText = "Currency, Azerbaijani (U+20BC)",
    text = "₼"
  }, {
    item = "₢",
    subText = "Currency, Brazilian (U+20A2)",
    text = "₢"
  }, {
    item = "₡",
    subText = "Currency, Costa Rican (U+20A1)",
    text = "₡"
  }, {
    item = "₡",
    subText = "Currency, El Salvadorian (U+20A1)",
    text = "₡"
  }, {
    item = "€",
    subText = "Currency, Euro European (U+20AC)",
    text = "€"
  }, {
    item = "₣",
    subText = "Currency, French (U+20A3)",
    text = "₣"
  }, {
    item = "₾",
    subText = "Currency, Georgian (U+20BE)",
    text = "₾"
  }, {
    item = "₵",
    subText = "Currency, Ghana (U+20B5)",
    text = "₵"
  }, {
    item = "₯",
    subText = "Currency, Greek (U+20AF)",
    text = "₯"
  }, {
    item = "₨",
    subText = "Currency, Indian (U+20A8)",
    text = "₨"
  }, {
    item = "﷼",
    subText = "Currency, Iranian (U+FDFC)",
    text = "﷼"
  }, {
    item = "₪",
    subText = "Currency, Israeli (U+20AA)",
    text = "₪"
  }, {
    item = "₤",
    subText = "Currency, Italian (U+20A4)",
    text = "₤"
  }, {
    item = "₩",
    subText = "Currency, Korean (U+20A9)",
    text = "₩"
  }, {
    item = "₭",
    subText = "Currency, Laotian (U+20AD)",
    text = "₭"
  }, {
    item = "₮",
    subText = "Currency, Mongolian (U+20AE)",
    text = "₮"
  }, {
    item = "₦",
    subText = "Currency, Nigerian (U+20A6)",
    text = "₦"
  }, {
    item = "₲",
    subText = "Currency, Paraguayan (U+20B2)",
    text = "₲"
  }, {
    item = "₱",
    subText = "Currency, Phillipine (U+20B1)",
    text = "₱"
  }, {
    item = "₽",
    subText = "Currency, Russian (U+20BD)",
    text = "₽"
  }, {
    item = "₧",
    subText = "Currency, Spanish (U+20A7)",
    text = "₧"
  }, {
    item = "₤",
    subText = "Currency, Turkish (U+20A4)",
    text = "₤"
  }, {
    item = "₴",
    subText = "Currency, Ukrainian (U+20B4)",
    text = "₴"
  }, {
    item = "₫",
    subText = "Currency, Vietnamese (U+20AB)",
    text = "₫"
  }, {
    item = "⎓",
    subText = "Current Symbol Form Two, Direct (U+2393)",
    text = "⎓"
  }, {
    item = "⏦",
    subText = "Current, Ac (U+23E6)",
    text = "⏦"
  }, {
    item = "∿",
    subText = "Current, Alternating (U+223F)",
    text = "∿"
  }, {
    item = "↡",
    subText = "Cursor Down, Fast (U+21A1)",
    text = "↡"
  }, {
    item = "↞",
    subText = "Cursor Left, Fast (U+219E)",
    text = "↞"
  }, {
    item = "↠",
    subText = "Cursor Right, Fast (U+21A0)",
    text = "↠"
  }, {
    item = "↟",
    subText = "Cursor Up, Fast (U+219F)",
    text = "↟"
  }, {
    item = "∼",
    subText = "Cycle (U+223C)",
    text = "∼"
  }, {
    item = "⌭",
    subText = "Cylindricity (U+232D)",
    text = "⌭"
  }, {
    item = "𐠀",
    subText = "Cypriot Syllabary (U+10800)",
    text = "𐠀"
  }, {
    item = "Ѐ",
    subText = "Cyrillic (U+0400)",
    text = "Ѐ"
  }, {
    item = "Ѐ",
    subText = "Cyrillic Capital Letters (U+0400)",
    text = "Ѐ"
  }, {
    item = "҃",
    subText = "Cyrillic Combining Characters (U+0483)",
    text = "҃"
  }, {
    item = "ⷠ",
    subText = "Cyrillic Extended-A (U+2DE0)",
    text = "ⷠ"
  }, {
    item = "Ꙁ",
    subText = "Cyrillic Extended-B (U+A640)",
    text = "Ꙁ"
  }, {
    item = "ᲀ",
    subText = "Cyrillic Extended-C (U+1C80)",
    text = "ᲀ"
  }, {
    item = "ѐ",
    subText = "Cyrillic Extensions (U+0450)",
    text = "ѐ"
  }, {
    item = "Ҋ",
    subText = "Cyrillic Extensions (U+048A)",
    text = "Ҋ"
  }, {
    item = "Ѡ",
    subText = "Cyrillic Historic Letters (U+0460)",
    text = "Ѡ"
  }, {
    item = "а",
    subText = "Cyrillic Small Letters (U+0430)",
    text = "а"
  }, {
    item = "Ԁ",
    subText = "Cyrillic Supplement (U+0500)",
    text = "Ԁ"
  }, {
    item = "︮",
    subText = "Cyrillic Titlo Left Half, Combining (U+FE2E)",
    text = "︮"
  }, {
    item = "ɖ",
    subText = "D Retroflex Hook, Latin Small Letter (U+0256)",
    text = "ɖ"
  }, {
    item = "ď",
    subText = "D With Caron, Latin Small Letter (U+010F)",
    text = "ď"
  }, {
    item = "ḑ",
    subText = "D With Cedilla, Latin Small Letter (U+1E11)",
    text = "ḑ"
  }, {
    item = "ḓ",
    subText = "D With Circumflex Below, Latin Small Letter (U+1E13)",
    text = "ḓ"
  }, {
    item = "ȡ",
    subText = "D With Curl, Latin Small Letter (U+0221)",
    text = "ȡ"
  }, {
    item = "ḋ",
    subText = "D With Dot Above, Latin Small Letter (U+1E0B)",
    text = "ḋ"
  }, {
    item = "ḍ",
    subText = "D With Dot Below, Latin Small Letter (U+1E0D)",
    text = "ḍ"
  }, {
    item = "Ɗ",
    subText = "D With Hook, Latin Capital Letter (U+018A)",
    text = "Ɗ"
  }, {
    item = "ɗ",
    subText = "D With Hook, Latin Small Letter (U+0257)",
    text = "ɗ"
  }, {
    item = "ḏ",
    subText = "D With Line Below, Latin Small Letter (U+1E0F)",
    text = "ḏ"
  }, {
    item = "đ",
    subText = "D With Stroke, Latin Small Letter (U+0111)",
    text = "đ"
  }, {
    item = "ɖ",
    subText = "D With Tail, Latin Small Letter (U+0256)",
    text = "ɖ"
  }, {
    item = "ƌ",
    subText = "D With Topbar, Latin Small Letter (U+018C)",
    text = "ƌ"
  }, {
    item = "⧠",
    subText = "D'Alembertian (U+29E0)",
    text = "⧠"
  }, {
    item = "ͩ",
    subText = "D, Combining Latin Small Letter (U+0369)",
    text = "ͩ"
  }, {
    item = "ⅅ",
    subText = "D, Double-Struck Italic Capital (U+2145)",
    text = "ⅅ"
  }, {
    item = "ⅆ",
    subText = "D, Double-Struck Italic Small (U+2146)",
    text = "ⅆ"
  }, {
    item = "Ɖ",
    subText = "D, Latin Capital Letter African (U+0189)",
    text = "Ɖ"
  }, {
    item = "ᴅ",
    subText = "D, Latin Letter Small Capital (U+1D05)",
    text = "ᴅ"
  }, {
    item = "†",
    subText = "Dagger (U+2020)",
    text = "†"
  }, {
    item = "‡",
    subText = "Dagger, Double (U+2021)",
    text = "‡"
  }, {
    item = "゙",
    subText = "Daku-On, Combining Japanese (U+3099)",
    text = "゙"
  }, {
    item = "゛",
    subText = "Daku-On, Japanese (U+309B)",
    text = "゛"
  }, {
    item = "ℸ",
    subText = "Dalet Symbol (U+2138)",
    text = "ℸ"
  }, {
    item = "।",
    subText = "Danda, Devanagari (U+0964)",
    text = "।"
  }, {
    item = "॥",
    subText = "Danda, Devanagari Double (U+0965)",
    text = "॥"
  }, {
    item = "¬",
    subText = "Dash, Angled (U+00AC)",
    text = "¬"
  }, {
    item = "⊝",
    subText = "Dash, Circled (U+229D)",
    text = "⊝"
  }, {
    item = "—",
    subText = "Dash, Em (U+2014)",
    text = "—"
  }, {
    item = "–",
    subText = "Dash, En (U+2013)",
    text = "–"
  }, {
    item = "‒",
    subText = "Dash, Figure (U+2012)",
    text = "‒"
  }, {
    item = "⸺",
    subText = "Dash, Omission (U+2E3A)",
    text = "⸺"
  }, {
    item = "―",
    subText = "Dash, Quotation (U+2015)",
    text = "―"
  }, {
    item = "⁓",
    subText = "Dash, Swung (U+2053)",
    text = "⁓"
  }, {
    item = "⸺",
    subText = "Dash, Two-Em (U+2E3A)",
    text = "⸺"
  }, {
    item = "〜",
    subText = "Dash, Wave (U+301C)",
    text = "〜"
  }, {
    item = "〰",
    subText = "Dash, Wavy (U+3030)",
    text = "〰"
  }, {
    item = "﹍",
    subText = "Dashed Low Line (U+FE4D)",
    text = "﹍"
  }, {
    item = "﹉",
    subText = "Dashed Overline (U+FE49)",
    text = "﹉"
  }, {
    item = "‐",
    subText = "Dashes (U+2010)",
    text = "‐"
  }, {
    item = "̔",
    subText = "Dasia, Greek (U+0314)",
    text = "̔"
  }, {
    item = "",
    subText = "Data Link Escape (U+0010)",
    text = ""
  }, {
    item = "␐",
    subText = "Data Link Escape, Symbol For (U+2410)",
    text = "␐"
  }, {
    item = "⟕",
    subText = "Database Theory Operators (U+27D5)",
    text = "⟕"
  }, {
    item = "✡",
    subText = "David, Star Of (U+2721)",
    text = "✡"
  }, {
    item = "௳",
    subText = "Day Sign, Tamil (U+0BF3)",
    text = "௳"
  }, {
    item = "㏠",
    subText = "Days, Ideographic Telegraph Symbols For (U+33E0)",
    text = "㏠"
  }, {
    item = "ȸ",
    subText = "Db Digraph, Latin Small Letter (U+0238)",
    text = "ȸ"
  }, {
    item = "௶",
    subText = "Debit Sign, Tamil (U+0BF6)",
    text = "௶"
  }, {
    item = "⏨",
    subText = "Decimal Exponent Symbol (U+23E8)",
    text = "⏨"
  }, {
    item = ".",
    subText = "Decimal Point (U+002E)",
    text = "."
  }, {
    item = ",",
    subText = "Decimal Separator (U+002C)",
    text = ","
  }, {
    item = "⎖",
    subText = "Decimal Separator Key Symbol (U+2396)",
    text = "⎖"
  }, {
    item = "٫",
    subText = "Decimal Separator, Arabic (U+066B)",
    text = "٫"
  }, {
    item = "⏷",
    subText = "Decrease (U+23F7)",
    text = "⏷"
  }, {
    item = "॥",
    subText = "Deergh Viram, Devanagari (U+0965)",
    text = "॥"
  }, {
    item = "℃",
    subText = "Degree Celsius (U+2103)",
    text = "℃"
  }, {
    item = "℉",
    subText = "Degree Fahrenheit (U+2109)",
    text = "℉"
  }, {
    item = "°",
    subText = "Degree Sign (U+00B0)",
    text = "°"
  }, {
    item = "℃",
    subText = "Degrees Centigrade (U+2103)",
    text = "℃"
  }, {
    item = "∇",
    subText = "Del (U+2207)",
    text = "∇"
  }, {
    item = "",
    subText = "Delete (U+007F)",
    text = ""
  }, {
    item = "␥",
    subText = "Delete Form Two, Symbol For (U+2425)",
    text = "␥"
  }, {
    item = "⌫",
    subText = "Delete To The Left Key (U+232B)",
    text = "⌫"
  }, {
    item = "⌦",
    subText = "Delete To The Right Key (U+2326)",
    text = "⌦"
  }, {
    item = "␡",
    subText = "Delete, Symbol For (U+2421)",
    text = "␡"
  }, {
    item = "≜",
    subText = "Delta Equal To (U+225C)",
    text = "≜"
  }, {
    item = "ƍ",
    subText = "Delta, Latin Small Letter Turned (U+018D)",
    text = "ƍ"
  }, {
    item = "Ϣ",
    subText = "Demotic, Coptic Letters Derived From (U+03E2)",
    text = "Ϣ"
  }, {
    item = "ǀ",
    subText = "Dental Click, Latin Letter (U+01C0)",
    text = "ǀ"
  }, {
    item = "⎾",
    subText = "Dentistry Notation Symbols (U+23BE)",
    text = "⎾"
  }, {
    item = "↧",
    subText = "Depth Symbol (U+21A7)",
    text = "↧"
  }, {
    item = "̇",
    subText = "Derivative (U+0307)",
    text = "̇"
  }, {
    item = "̈",
    subText = "Derivative, Double (U+0308)",
    text = "̈"
  }, {
    item = "⃜",
    subText = "Derivative, Fourth (U+20DC)",
    text = "⃜"
  }, {
    item = "⃛",
    subText = "Derivative, Third (U+20DB)",
    text = "⃛"
  }, {
    item = "☋",
    subText = "Descending Node (U+260B)",
    text = "☋"
  }, {
    item = "𐐀",
    subText = "Deseret (U+10400)",
    text = "𐐀"
  }, {
    item = "ऀ",
    subText = "Devanagari (U+0900)",
    text = "ऀ"
  }, {
    item = "ं",
    subText = "Devanagari Bindu (U+0902)",
    text = "ं"
  }, {
    item = "क",
    subText = "Devanagari Consonants (U+0915)",
    text = "क"
  }, {
    item = "।",
    subText = "Devanagari Danda (U+0964)",
    text = "।"
  }, {
    item = "॥",
    subText = "Devanagari Deergh Viram (U+0965)",
    text = "॥"
  }, {
    item = "ा",
    subText = "Devanagari Dependent Vowel Signs (U+093E)",
    text = "ा"
  }, {
    item = "०",
    subText = "Devanagari Digits (U+0966)",
    text = "०"
  }, {
    item = "॥",
    subText = "Devanagari Double Danda (U+0965)",
    text = "॥"
  }, {
    item = "꣠",
    subText = "Devanagari Extended (U+A8E0)",
    text = "꣠"
  }, {
    item = "॑",
    subText = "Devanagari Extensions (U+0951)",
    text = "॑"
  }, {
    item = "ऄ",
    subText = "Devanagari Independent Vowels (U+0904)",
    text = "ऄ"
  }, {
    item = "ॐ",
    subText = "Devanagari Om (U+0950)",
    text = "ॐ"
  }, {
    item = "।",
    subText = "Devanagari Purna Viram (U+0964)",
    text = "।"
  }, {
    item = "ं",
    subText = "Devanagari Sign Anusvara (U+0902)",
    text = "ं"
  }, {
    item = "ऽ",
    subText = "Devanagari Sign Avagraha (U+093D)",
    text = "ऽ"
  }, {
    item = "ँ",
    subText = "Devanagari Sign Candrabindu (U+0901)",
    text = "ँ"
  }, {
    item = "़",
    subText = "Devanagari Sign Nukta (U+093C)",
    text = "़"
  }, {
    item = "्",
    subText = "Devanagari Sign Virama (U+094D)",
    text = "्"
  }, {
    item = "ः",
    subText = "Devanagari Sign Visarga (U+0903)",
    text = "ः"
  }, {
    item = "",
    subText = "Device Controls (U+0011)",
    text = ""
  }, {
    item = "␑",
    subText = "Device Controls, Symbols For (U+2411)",
    text = "␑"
  }, {
    item = "☸",
    subText = "Dharma, Wheel Of (U+2638)",
    text = "☸"
  }, {
    item = "⃦",
    subText = "Diacritic, Finite Function (U+20E6)",
    text = "⃦"
  }, {
    item = "⃐",
    subText = "Diacritical Marks For Symbols (U+20D0)",
    text = "⃐"
  }, {
    item = "⃐",
    subText = "Diacritical Marks For Symbols, Combining (U+20D0)",
    text = "⃐"
  }, {
    item = "̀",
    subText = "Diacritical Marks, Combining (U+0300)",
    text = "̀"
  }, {
    item = "͂",
    subText = "Diacritics For Greek (U+0342)",
    text = "͂"
  }, {
    item = "͆",
    subText = "Diacritics For Ipa (U+0346)",
    text = "͆"
  }, {
    item = "͐",
    subText = "Diacritics For Uralic Phonetic Alphabet (U+0350)",
    text = "͐"
  }, {
    item = "〪",
    subText = "Diacritics, Cjk (U+302A)",
    text = "〪"
  }, {
    item = "͜",
    subText = "Diacritics, Double (U+035C)",
    text = "͜"
  }, {
    item = "⃝",
    subText = "Diacritics, Enclosing (U+20DD)",
    text = "⃝"
  }, {
    item = "ͣ",
    subText = "Diacritics, Medieval Superscript Letter (U+0363)",
    text = "ͣ"
  }, {
    item = "̀",
    subText = "Diacritics, Ordinary (U+0300)",
    text = "̀"
  }, {
    item = "̴",
    subText = "Diacritics, Overstruck (U+0334)",
    text = "̴"
  }, {
    item = "˘",
    subText = "Diacritics, Spacing Clones Of (U+02D8)",
    text = "˘"
  }, {
    item = "¨",
    subText = "Diaeresis (U+00A8)",
    text = "¨"
  }, {
    item = "̤",
    subText = "Diaeresis Below, Combining (U+0324)",
    text = "̤"
  }, {
    item = "̈",
    subText = "Diaeresis, Combining (U+0308)",
    text = "̈"
  }, {
    item = "¨",
    subText = "Diaeresis, Spacing (U+00A8)",
    text = "¨"
  }, {
    item = "⋱",
    subText = "Diagonal Ellipsis, Down Right (U+22F1)",
    text = "⋱"
  }, {
    item = "⋰",
    subText = "Diagonal Ellipsis, Up Right (U+22F0)",
    text = "⋰"
  }, {
    item = "̈́",
    subText = "Dialytika Tonos, Combining Greek (U+0344)",
    text = "̈́"
  }, {
    item = "̈",
    subText = "Dialytika, Greek (U+0308)",
    text = "̈"
  }, {
    item = "⌀",
    subText = "Diameter Sign (U+2300)",
    text = "⌀"
  }, {
    item = "⋄",
    subText = "Diamond Operator (U+22C4)",
    text = "⋄"
  }, {
    item = "⃟",
    subText = "Diamond, Combining Enclosing (U+20DF)",
    text = "⃟"
  }, {
    item = "🞗",
    subText = "Diamonds (U+1F797)",
    text = "🞗"
  }, {
    item = "◆",
    subText = "Diamonds (U+25C6)",
    text = "◆"
  }, {
    item = "⬥",
    subText = "Diamonds And Lozenges (U+2B25)",
    text = "⬥"
  }, {
    item = "⚀",
    subText = "Dice (U+2680)",
    text = "⚀"
  }, {
    item = "⚐",
    subText = "Dictionary And Map Symbols (U+2690)",
    text = "⚐"
  }, {
    item = "⸚",
    subText = "Dictionary Punctuation (U+2E1A)",
    text = "⸚"
  }, {
    item = "‡",
    subText = "Diesis (U+2021)",
    text = "‡"
  }, {
    item = "∼",
    subText = "Difference Between (U+223C)",
    text = "∼"
  }, {
    item = "≏",
    subText = "Difference Between (U+224F)",
    text = "≏"
  }, {
    item = "⨤",
    subText = "Difference Or Sum, Positive (U+2A24)",
    text = "⨤"
  }, {
    item = "∇",
    subText = "Difference, Backward (U+2207)",
    text = "∇"
  }, {
    item = "∆",
    subText = "Difference, Forward (U+2206)",
    text = "∆"
  }, {
    item = "⨦",
    subText = "Difference, Sum Or Positive (U+2A26)",
    text = "⨦"
  }, {
    item = "∆",
    subText = "Difference, Symmetric (U+2206)",
    text = "∆"
  }, {
    item = "∸",
    subText = "Difference, Symmetric (U+2238)",
    text = "∸"
  }, {
    item = "⊖",
    subText = "Difference, Symmetric (U+2296)",
    text = "⊖"
  }, {
    item = "∂",
    subText = "Differential, Partial (U+2202)",
    text = "∂"
  }, {
    item = "Ⅎ",
    subText = "Digamma Inversum, Claudian (U+2132)",
    text = "Ⅎ"
  }, {
    item = "⓪",
    subText = "Digit Zero, Circled (U+24EA)",
    text = "⓪"
  }, {
    item = "༪",
    subText = "Digits Minus Half, Tibetan (U+0F2A)",
    text = "༪"
  }, {
    item = "𝟎",
    subText = "Digits Symbols, Mathematical (U+1D7CE)",
    text = "𝟎"
  }, {
    item = "٠",
    subText = "Digits, Arabic-Indic (U+0660)",
    text = "٠"
  }, {
    item = "0",
    subText = "Digits, Ascii (U+0030)",
    text = "0"
  }, {
    item = "᭐",
    subText = "Digits, Balinese (U+1B50)",
    text = "᭐"
  }, {
    item = "০",
    subText = "Digits, Bengali (U+09E6)",
    text = "০"
  }, {
    item = "𝟎",
    subText = "Digits, Bold (U+1D7CE)",
    text = "𝟎"
  }, {
    item = "०",
    subText = "Digits, Devanagari (U+0966)",
    text = "०"
  }, {
    item = "❶",
    subText = "Digits, Dingbat Circled (U+2776)",
    text = "❶"
  }, {
    item = "𝟘",
    subText = "Digits, Double-Struck (U+1D7D8)",
    text = "𝟘"
  }, {
    item = "۰",
    subText = "Digits, Eastern Arabic-Indic (U+06F0)",
    text = "۰"
  }, {
    item = "፩",
    subText = "Digits, Ethiopic (U+1369)",
    text = "፩"
  }, {
    item = "૦",
    subText = "Digits, Gujarati (U+0AE6)",
    text = "૦"
  }, {
    item = "੦",
    subText = "Digits, Gurmukhi (U+0A66)",
    text = "੦"
  }, {
    item = "೦",
    subText = "Digits, Kannada (U+0CE6)",
    text = "೦"
  }, {
    item = "𐩀",
    subText = "Digits, Kharoshthi (U+10A40)",
    text = "𐩀"
  }, {
    item = "០",
    subText = "Digits, Khmer (U+17E0)",
    text = "០"
  }, {
    item = "໐",
    subText = "Digits, Lao (U+0ED0)",
    text = "໐"
  }, {
    item = "᥆",
    subText = "Digits, Limbu (U+1946)",
    text = "᥆"
  }, {
    item = "൦",
    subText = "Digits, Malayalam (U+0D66)",
    text = "൦"
  }, {
    item = "᠐",
    subText = "Digits, Mongolian (U+1810)",
    text = "᠐"
  }, {
    item = "𝟶",
    subText = "Digits, Monospace (U+1D7F6)",
    text = "𝟶"
  }, {
    item = "၀",
    subText = "Digits, Myanmar (U+1040)",
    text = "၀"
  }, {
    item = "᧐",
    subText = "Digits, New Tai Lue (U+19D0)",
    text = "᧐"
  }, {
    item = "୦",
    subText = "Digits, Oriya (U+0B66)",
    text = "୦"
  }, {
    item = "𐒠",
    subText = "Digits, Osmanya (U+104A0)",
    text = "𐒠"
  }, {
    item = "𝟢",
    subText = "Digits, Sans-Serif (U+1D7E2)",
    text = "𝟢"
  }, {
    item = "𝟬",
    subText = "Digits, Sans-Serif Bold (U+1D7EC)",
    text = "𝟬"
  }, {
    item = "₀",
    subText = "Digits, Subscript (U+2080)",
    text = "₀"
  }, {
    item = "⁰",
    subText = "Digits, Superscript (U+2070)",
    text = "⁰"
  }, {
    item = "௧",
    subText = "Digits, Tamil (U+0BE7)",
    text = "௧"
  }, {
    item = "౦",
    subText = "Digits, Telugu (U+0C66)",
    text = "౦"
  }, {
    item = "๐",
    subText = "Digits, Thai (U+0E50)",
    text = "๐"
  }, {
    item = "༠",
    subText = "Digits, Tibetan (U+0F20)",
    text = "༠"
  }, {
    item = "⚊",
    subText = "Digram Symbols, Yijing / I Ching Monogram And (U+268A)",
    text = "⚊"
  }, {
    item = "Ǆ",
    subText = "Digraphs Matching Serbian Cyrillic Letters, Croatian (U+01C4)",
    text = "Ǆ"
  }, {
    item = "ʣ",
    subText = "Digraphs, Phonetic (U+02A3)",
    text = "ʣ"
  }, {
    item = "װ",
    subText = "Digraphs, Yiddish (U+05F0)",
    text = "װ"
  }, {
    item = "⫾",
    subText = "Dijkstra Choice (U+2AFE)",
    text = "⫾"
  }, {
    item = "⫿",
    subText = "Dijkstra Choice, N-Ary (U+2AFF)",
    text = "⫿"
  }, {
    item = "⌱",
    subText = "Dimension Origin (U+2331)",
    text = "⌱"
  }, {
    item = "➔",
    subText = "Dingbat Arrows (U+2794)",
    text = "➔"
  }, {
    item = "❶",
    subText = "Dingbat Circled Digits (U+2776)",
    text = "❶"
  }, {
    item = "✀",
    subText = "Dingbats (U+2700)",
    text = "✀"
  }, {
    item = "✀",
    subText = "Dingbats Series 100, Itc Zapf (U+2700)",
    text = "✀"
  }, {
    item = "➔",
    subText = "Dingbats, Arrow (U+2794)",
    text = "➔"
  }, {
    item = "✢",
    subText = "Dingbats, Asterisk (U+2722)",
    text = "✢"
  }, {
    item = "✙",
    subText = "Dingbats, Cross (U+2719)",
    text = "✙"
  }, {
    item = "❍",
    subText = "Dingbats, Drop-Shadowed (U+274D)",
    text = "❍"
  }, {
    item = "☠",
    subText = "Dingbats, Hazard (U+2620)",
    text = "☠"
  }, {
    item = "❣",
    subText = "Dingbats, Heart (U+2763)",
    text = "❣"
  }, {
    item = "☀",
    subText = "Dingbats, Miscellaneous (U+2600)",
    text = "☀"
  }, {
    item = "♩",
    subText = "Dingbats, Music (U+2669)",
    text = "♩"
  }, {
    item = "🙐",
    subText = "Dingbats, Ornamental (U+1F650)",
    text = "🙐"
  }, {
    item = "✎",
    subText = "Dingbats, Pencil (U+270E)",
    text = "✎"
  }, {
    item = "☚",
    subText = "Dingbats, Pointing Index Finger (U+261A)",
    text = "☚"
  }, {
    item = "❛",
    subText = "Dingbats, Quotation Mark (U+275B)",
    text = "❛"
  }, {
    item = "✁",
    subText = "Dingbats, Scissors (U+2701)",
    text = "✁"
  }, {
    item = "❄",
    subText = "Dingbats, Snowflake (U+2744)",
    text = "❄"
  }, {
    item = "✦",
    subText = "Dingbats, Star (U+2726)",
    text = "✦"
  }, {
    item = "❘",
    subText = "Dingbats, Vertical Bar (U+2758)",
    text = "❘"
  }, {
    item = "☠",
    subText = "Dingbats, Warning (U+2620)",
    text = "☠"
  }, {
    item = "☀",
    subText = "Dingbats, Weather (U+2600)",
    text = "☀"
  }, {
    item = "✀",
    subText = "Dingbats, Zapf (U+2700)",
    text = "✀"
  }, {
    item = "🍽",
    subText = "Dining Available Symbol (U+1F37D)",
    text = "🍽"
  }, {
    item = "⎓",
    subText = "Direct Current Symbol Form Two (U+2393)",
    text = "⎓"
  }, {
    item = "⊙",
    subText = "Direct Product (U+2299)",
    text = "⊙"
  }, {
    item = "⊕",
    subText = "Direct Sum (U+2295)",
    text = "⊕"
  }, {
    item = "‪",
    subText = "Directional Format Characters (U+202A)",
    text = "‪"
  }, {
    item = "‬",
    subText = "Directional Formatting, Pop (U+202C)",
    text = "‬"
  }, {
    item = "⁩",
    subText = "Directional Isolate, Pop (U+2069)",
    text = "⁩"
  }, {
    item = "⎂",
    subText = "Discontinuous Underline Symbol (U+2382)",
    text = "⎂"
  }, {
    item = "­",
    subText = "Discretionary Hyphen (U+00AD)",
    text = "­"
  }, {
    item = "∨",
    subText = "Disjunction (U+2228)",
    text = "∨"
  }, {
    item = "〃",
    subText = "Ditto Mark (U+3003)",
    text = "〃"
  }, {
    item = "∣",
    subText = "Divides (U+2223)",
    text = "∣"
  }, {
    item = "៰",
    subText = "Divination, Khmer Numeric Symbols For (U+17F0)",
    text = "៰"
  }, {
    item = "÷",
    subText = "Division Sign (U+00F7)",
    text = "÷"
  }, {
    item = "⨯",
    subText = "Division Sign Operators, Multiplication And (U+2A2F)",
    text = "⨯"
  }, {
    item = "⨸",
    subText = "Division Sign, Circled (U+2A38)",
    text = "⨸"
  }, {
    item = "∕",
    subText = "Division Slash (U+2215)",
    text = "∕"
  }, {
    item = "⊘",
    subText = "Division Slash, Circled (U+2298)",
    text = "⊘"
  }, {
    item = "⋇",
    subText = "Division Times (U+22C7)",
    text = "⋇"
  }, {
    item = "⟌",
    subText = "Division, Long (U+27CC)",
    text = "⟌"
  }, {
    item = "⚮",
    subText = "Divorce Symbol (U+26AE)",
    text = "⚮"
  }, {
    item = "💫",
    subText = "Dizzy Symbol (U+1F4AB)",
    text = "💫"
  }, {
    item = "⛔",
    subText = "Do Not Enter (U+26D4)",
    text = "⛔"
  }, {
    item = "🗎",
    subText = "Document (U+1F5CE)",
    text = "🗎"
  }, {
    item = "🗋",
    subText = "Document, Empty (U+1F5CB)",
    text = "🗋"
  }, {
    item = "∌",
    subText = "Does Not Contain As Member (U+220C)",
    text = "∌"
  }, {
    item = "∤",
    subText = "Does Not Divide (U+2224)",
    text = "∤"
  }, {
    item = "∄",
    subText = "Does Not Exist, There (U+2204)",
    text = "∄"
  }, {
    item = "⊣",
    subText = "Does Not Yield (U+22A3)",
    text = "⊣"
  }, {
    item = "🐕",
    subText = "Dog (U+1F415)",
    text = "🐕"
  }, {
    item = "🐶",
    subText = "Dog Face (U+1F436)",
    text = "🐶"
  }, {
    item = "𑠀",
    subText = "Dogra (U+11800)",
    text = "𑠀"
  }, {
    item = "$",
    subText = "Dollar Sign (U+0024)",
    text = "$"
  }, {
    item = "🐬",
    subText = "Dolphin (U+1F42C)",
    text = "🐬"
  }, {
    item = "◁",
    subText = "Domain Restriction (U+25C1)",
    text = "◁"
  }, {
    item = "🀰",
    subText = "Domino Tiles (U+1F030)",
    text = "🀰"
  }, {
    item = "₫",
    subText = "Dong Sign (U+20AB)",
    text = "₫"
  }, {
    item = ".",
    subText = "Dot (U+002E)",
    text = "."
  }, {
    item = "˙",
    subText = "Dot Above (U+02D9)",
    text = "˙"
  }, {
    item = "͘",
    subText = "Dot Above Right, Combining (U+0358)",
    text = "͘"
  }, {
    item = "̇",
    subText = "Dot Above, Combining (U+0307)",
    text = "̇"
  }, {
    item = "̈",
    subText = "Dot Above, Double (U+0308)",
    text = "̈"
  }, {
    item = "̣",
    subText = "Dot Below, Combining (U+0323)",
    text = "̣"
  }, {
    item = "့",
    subText = "Dot Below, Myanmar Sign (U+1037)",
    text = "့"
  }, {
    item = "․",
    subText = "Dot Leader, One (U+2024)",
    text = "․"
  }, {
    item = "…",
    subText = "Dot Leader, Three (U+2026)",
    text = "…"
  }, {
    item = "‥",
    subText = "Dot Leader, Two (U+2025)",
    text = "‥"
  }, {
    item = "∸",
    subText = "Dot Minus (U+2238)",
    text = "∸"
  }, {
    item = "⋅",
    subText = "Dot Operator (U+22C5)",
    text = "⋅"
  }, {
    item = "⊙",
    subText = "Dot Operator, Circled (U+2299)",
    text = "⊙"
  }, {
    item = "⊡",
    subText = "Dot Operator, Squared (U+22A1)",
    text = "⊡"
  }, {
    item = "∔",
    subText = "Dot Plus (U+2214)",
    text = "∔"
  }, {
    item = "⁙",
    subText = "Dot Punctuation, Five (U+2059)",
    text = "⁙"
  }, {
    item = "⁘",
    subText = "Dot Punctuation, Four (U+2058)",
    text = "⁘"
  }, {
    item = "⁖",
    subText = "Dot Punctuation, Three (U+2056)",
    text = "⁖"
  }, {
    item = "⁚",
    subText = "Dot Punctuation, Two (U+205A)",
    text = "⁚"
  }, {
    item = "·",
    subText = "Dot, Greek Middle (U+00B7)",
    text = "·"
  }, {
    item = "・",
    subText = "Dot, Katakana Middle (U+30FB)",
    text = "・"
  }, {
    item = "İ",
    subText = "Dot, Latin Capital Letter I (U+0130)",
    text = "İ"
  }, {
    item = "ꞏ",
    subText = "Dot, Latin Letter Sinological (U+A78F)",
    text = "ꞏ"
  }, {
    item = "·",
    subText = "Dot, Middle (U+00B7)",
    text = "·"
  }, {
    item = "﹅",
    subText = "Dot, Sesame (U+FE45)",
    text = "﹅"
  }, {
    item = "⍿",
    subText = "Dot, Vertical Line With Middle (U+237F)",
    text = "⍿"
  }, {
    item = "﹆",
    subText = "Dot, White Sesame (U+FE46)",
    text = "﹆"
  }, {
    item = "ı",
    subText = "Dotless I, Latin Small Letter (U+0131)",
    text = "ı"
  }, {
    item = "ɟ",
    subText = "Dotless J With Stroke, Latin Small Letter (U+025F)",
    text = "ɟ"
  }, {
    item = "ȷ",
    subText = "Dotless J, Latin Small Letter (U+0237)",
    text = "ȷ"
  }, {
    item = "𝚤",
    subText = "Dotless Mathematical Symbols (U+1D6A4)",
    text = "𝚤"
  }, {
    item = "⃜",
    subText = "Dots Above, Combining Four (U+20DC)",
    text = "⃜"
  }, {
    item = "⃛",
    subText = "Dots Above, Combining Three (U+20DB)",
    text = "⃛"
  }, {
    item = "᠅",
    subText = "Dots, Mongolian Four (U+1805)",
    text = "᠅"
  }, {
    item = "⁞",
    subText = "Dots, Vertical Four (U+205E)",
    text = "⁞"
  }, {
    item = "◌",
    subText = "Dotted Circle (U+25CC)",
    text = "◌"
  }, {
    item = "⁜",
    subText = "Dotted Cross (U+205C)",
    text = "⁜"
  }, {
    item = "⦙",
    subText = "Dotted Fence (U+2999)",
    text = "⦙"
  }, {
    item = "∴",
    subText = "Dotted Mathematical Operators (U+2234)",
    text = "∴"
  }, {
    item = "˝",
    subText = "Double Acute Accent (U+02DD)",
    text = "˝"
  }, {
    item = "̋",
    subText = "Double Acute Accent, Combining (U+030B)",
    text = "̋"
  }, {
    item = "《",
    subText = "Double Angle Bracket, Left (U+300A)",
    text = "《"
  }, {
    item = "⟪",
    subText = "Double Angle Bracket, Mathematical Left (U+27EA)",
    text = "⟪"
  }, {
    item = "⟫",
    subText = "Double Angle Bracket, Mathematical Right (U+27EB)",
    text = "⟫"
  }, {
    item = "》",
    subText = "Double Angle Bracket, Right (U+300B)",
    text = "》"
  }, {
    item = "«",
    subText = "Double Angle Quotation Mark, Left-Pointing (U+00AB)",
    text = "«"
  }, {
    item = "»",
    subText = "Double Angle Quotation Mark, Right-Pointing (U+00BB)",
    text = "»"
  }, {
    item = "ˮ",
    subText = "Double Apostrophe, Modifier Letter (U+02EE)",
    text = "ˮ"
  }, {
    item = "̫",
    subText = "Double Arch Below, Combining Inverted (U+032B)",
    text = "̫"
  }, {
    item = "⇍",
    subText = "Double Arrows (U+21CD)",
    text = "⇍"
  }, {
    item = "͜",
    subText = "Double Breve Below, Combining (U+035C)",
    text = "͜"
  }, {
    item = "͝",
    subText = "Double Breve, Combining (U+035D)",
    text = "͝"
  }, {
    item = "⓵",
    subText = "Double Circled Numbers (U+24F5)",
    text = "⓵"
  }, {
    item = "”",
    subText = "Double Comma Quotation Mark (U+201D)",
    text = "”"
  }, {
    item = "„",
    subText = "Double Comma Quotation Mark, Low (U+201E)",
    text = "„"
  }, {
    item = "‡",
    subText = "Double Dagger (U+2021)",
    text = "‡"
  }, {
    item = "॥",
    subText = "Double Danda, Devanagari (U+0965)",
    text = "॥"
  }, {
    item = "̈",
    subText = "Double Derivative (U+0308)",
    text = "̈"
  }, {
    item = "͜",
    subText = "Double Diacritics (U+035C)",
    text = "͜"
  }, {
    item = "̈",
    subText = "Double Dot Above (U+0308)",
    text = "̈"
  }, {
    item = "‼",
    subText = "Double Exclamation Mark (U+203C)",
    text = "‼"
  }, {
    item = "̏",
    subText = "Double Grave Accent, Combining (U+030F)",
    text = "̏"
  }, {
    item = "‟",
    subText = "Double High-Reversed-9 Quotation Mark (U+201F)",
    text = "‟"
  }, {
    item = "゠",
    subText = "Double Hyphen, Katakana-Hiragana (U+30A0)",
    text = "゠"
  }, {
    item = "∬",
    subText = "Double Integral (U+222C)",
    text = "∬"
  }, {
    item = "⋒",
    subText = "Double Intersection (U+22D2)",
    text = "⋒"
  }, {
    item = "͡",
    subText = "Double Inverted Breve, Combining (U+0361)",
    text = "͡"
  }, {
    item = "⩓",
    subText = "Double Logical And (U+2A53)",
    text = "⩓"
  }, {
    item = "⩔",
    subText = "Double Logical Or (U+2A54)",
    text = "⩔"
  }, {
    item = "‗",
    subText = "Double Low Line (U+2017)",
    text = "‗"
  }, {
    item = "̳",
    subText = "Double Low Line, Combining (U+0333)",
    text = "̳"
  }, {
    item = "„",
    subText = "Double Low-9 Quotation Mark (U+201E)",
    text = "„"
  }, {
    item = "͟",
    subText = "Double Macron Below, Combining (U+035F)",
    text = "͟"
  }, {
    item = "͞",
    subText = "Double Macron, Combining (U+035E)",
    text = "͞"
  }, {
    item = "⋐",
    subText = "Double Operators (U+22D0)",
    text = "⋐"
  }, {
    item = "̿",
    subText = "Double Overline, Combining (U+033F)",
    text = "̿"
  }, {
    item = "ǁ",
    subText = "Double Pipe (U+01C1)",
    text = "ǁ"
  }, {
    item = "⧺",
    subText = "Double Plus (U+29FA)",
    text = "⧺"
  }, {
    item = "⪻",
    subText = "Double Precedes (U+2ABB)",
    text = "⪻"
  }, {
    item = "″",
    subText = "Double Prime (U+2033)",
    text = "″"
  }, {
    item = "〞",
    subText = "Double Prime Quotation Mark (U+301E)",
    text = "〞"
  }, {
    item = "〟",
    subText = "Double Prime Quotation Mark, Low (U+301F)",
    text = "〟"
  }, {
    item = "〝",
    subText = "Double Prime Quotation Mark, Reversed (U+301D)",
    text = "〝"
  }, {
    item = "ʺ",
    subText = "Double Prime, Modifier Letter (U+02BA)",
    text = "ʺ"
  }, {
    item = "‶",
    subText = "Double Prime, Reversed (U+2036)",
    text = "‶"
  }, {
    item = "⁇",
    subText = "Double Punctuation For Vertical Text (U+2047)",
    text = "⁇"
  }, {
    item = "᜶",
    subText = "Double Punctuation, Philippine (U+1736)",
    text = "᜶"
  }, {
    item = "⁇",
    subText = "Double Question Mark (U+2047)",
    text = "⁇"
  }, {
    item = "“",
    subText = "Double Quotation Mark, Left (U+201C)",
    text = "“"
  }, {
    item = "”",
    subText = "Double Quotation Mark, Right (U+201D)",
    text = "”"
  }, {
    item = "‟",
    subText = "Double Reversed Comma Quotation Mark (U+201F)",
    text = "‟"
  }, {
    item = "͢",
    subText = "Double Rightwards Arrow Below, Combining (U+0362)",
    text = "͢"
  }, {
    item = "͚",
    subText = "Double Ring Below, Combining (U+035A)",
    text = "͚"
  }, {
    item = "⃫",
    subText = "Double Slash Overlay, Long (U+20EB)",
    text = "⃫"
  }, {
    item = "⫽",
    subText = "Double Solidus Operator (U+2AFD)",
    text = "⫽"
  }, {
    item = "⃫",
    subText = "Double Solidus Overlay, Combining Long (U+20EB)",
    text = "⃫"
  }, {
    item = "⋐",
    subText = "Double Subset (U+22D0)",
    text = "⋐"
  }, {
    item = "⪼",
    subText = "Double Succeeds (U+2ABC)",
    text = "⪼"
  }, {
    item = "⋑",
    subText = "Double Superset (U+22D1)",
    text = "⋑"
  }, {
    item = "͠",
    subText = "Double Tilde, Combining (U+0360)",
    text = "͠"
  }, {
    item = "⏩",
    subText = "Double Triangles (U+23E9)",
    text = "⏩"
  }, {
    item = "“",
    subText = "Double Turned Comma Quotation Mark (U+201C)",
    text = "“"
  }, {
    item = "̳",
    subText = "Double Underline (U+0333)",
    text = "̳"
  }, {
    item = "̳",
    subText = "Double Underscore (U+0333)",
    text = "̳"
  }, {
    item = "‗",
    subText = "Double Underscore, Spacing (U+2017)",
    text = "‗"
  }, {
    item = "⋓",
    subText = "Double Union (U+22D3)",
    text = "⋓"
  }, {
    item = "‖",
    subText = "Double Vertical Line (U+2016)",
    text = "‖"
  }, {
    item = "̎",
    subText = "Double Vertical Line Above, Combining (U+030E)",
    text = "̎"
  }, {
    item = "͈",
    subText = "Double Vertical Line Below, Combining (U+0348)",
    text = "͈"
  }, {
    item = "⃦",
    subText = "Double Vertical Stroke Overlay, Combining (U+20E6)",
    text = "⃦"
  }, {
    item = "﹌",
    subText = "Double Wavy Overline (U+FE4C)",
    text = "﹌"
  }, {
    item = "ǂ",
    subText = "Double-Barred Pipe (U+01C2)",
    text = "ǂ"
  }, {
    item = "𝟘",
    subText = "Double-Struck Digits (U+1D7D8)",
    text = "𝟘"
  }, {
    item = "ℼ",
    subText = "Double-Struck Greek Letters (U+213C)",
    text = "ℼ"
  }, {
    item = "ℽ",
    subText = "Double-Struck Greek Letters (U+213D)",
    text = "ℽ"
  }, {
    item = "ⅅ",
    subText = "Double-Struck Italic Mathematical Symbols (U+2145)",
    text = "ⅅ"
  }, {
    item = "𝔸",
    subText = "Double-Struck Mathematical Symbols (U+1D538)",
    text = "𝔸"
  }, {
    item = "🕊",
    subText = "Dove Of Peace (U+1F54A)",
    text = "🕊"
  }, {
    item = "⌄",
    subText = "Down Arrowhead (U+2304)",
    text = "⌄"
  }, {
    item = "☟",
    subText = "Down Pointing Index, White (U+261F)",
    text = "☟"
  }, {
    item = "⋱",
    subText = "Down Right Diagonal Ellipsis (U+22F1)",
    text = "⋱"
  }, {
    item = "⊤",
    subText = "Down Tack (U+22A4)",
    text = "⊤"
  }, {
    item = "̞",
    subText = "Down Tack Below, Combining (U+031E)",
    text = "̞"
  }, {
    item = "⇟",
    subText = "Down, Page (U+21DF)",
    text = "⇟"
  }, {
    item = "⌊",
    subText = "Downstile, Apl (U+230A)",
    text = "⌊"
  }, {
    item = "↓",
    subText = "Downwards Arrow (U+2193)",
    text = "↓"
  }, {
    item = "並",
    subText = "Dprk Compatibility Ideographs (U+FA70)",
    text = "並"
  }, {
    item = "₯",
    subText = "Drachma Sign (U+20AF)",
    text = "₯"
  }, {
    item = "⌭",
    subText = "Drafting Symbols (U+232D)",
    text = "⌭"
  }, {
    item = "🐉",
    subText = "Dragon (U+1F409)",
    text = "🐉"
  }, {
    item = "🐲",
    subText = "Dragon Face (U+1F432)",
    text = "🐲"
  }, {
    item = "ʒ",
    subText = "Dram (U+0292)",
    text = "ʒ"
  }, {
    item = "֏",
    subText = "Dram Sign, Armenian (U+058F)",
    text = "֏"
  }, {
    item = "⛀",
    subText = "Draughts And Checkers, Symbols For (U+26C0)",
    text = "⛀"
  }, {
    item = "⛚",
    subText = "Drive Slow Sign (U+26DA)",
    text = "⛚"
  }, {
    item = "⛾",
    subText = "Drive-In Restaurant (U+26FE)",
    text = "⛾"
  }, {
    item = "♏",
    subText = "Drop (U+264F)",
    text = "♏"
  }, {
    item = "❍",
    subText = "Drop-Shadowed Dingbats (U+274D)",
    text = "❍"
  }, {
    item = "💧",
    subText = "Droplet (U+1F4A7)",
    text = "💧"
  }, {
    item = "🌢",
    subText = "Droplet, Black (U+1F322)",
    text = "🌢"
  }, {
    item = "兀",
    subText = "Duplicate Characters From Big 5 (U+FA0C)",
    text = "兀"
  }, {
    item = "丽",
    subText = "Duplicate Characters From Cns 11643-1992 (U+2F800)",
    text = "丽"
  }, {
    item = "𛰀",
    subText = "Duployan (U+1BC00)",
    text = "𛰀"
  }, {
    item = "📀",
    subText = "Dvd (U+1F4C0)",
    text = "📀"
  }, {
    item = "É",
    subText = "E With Acute, Latin Capital Letter (U+00C9)",
    text = "É"
  }, {
    item = "é",
    subText = "E With Acute, Latin Small Letter (U+00E9)",
    text = "é"
  }, {
    item = "ĕ",
    subText = "E With Breve, Latin Small Letter (U+0115)",
    text = "ĕ"
  }, {
    item = "ě",
    subText = "E With Caron, Latin Small Letter (U+011B)",
    text = "ě"
  }, {
    item = "ȩ",
    subText = "E With Cedilla, Latin Small Letter (U+0229)",
    text = "ȩ"
  }, {
    item = "ḙ",
    subText = "E With Circumflex Below, Latin Small Letter (U+1E19)",
    text = "ḙ"
  }, {
    item = "Ê",
    subText = "E With Circumflex, Latin Capital Letter (U+00CA)",
    text = "Ê"
  }, {
    item = "ê",
    subText = "E With Circumflex, Latin Small Letter (U+00EA)",
    text = "ê"
  }, {
    item = "Ë",
    subText = "E With Diaeresis, Latin Capital Letter (U+00CB)",
    text = "Ë"
  }, {
    item = "ë",
    subText = "E With Diaeresis, Latin Small Letter (U+00EB)",
    text = "ë"
  }, {
    item = "ė",
    subText = "E With Dot Above, Latin Small Letter (U+0117)",
    text = "ė"
  }, {
    item = "ẹ",
    subText = "E With Dot Below, Latin Small Letter (U+1EB9)",
    text = "ẹ"
  }, {
    item = "ȅ",
    subText = "E With Double Grave, Latin Small Letter (U+0205)",
    text = "ȅ"
  }, {
    item = "È",
    subText = "E With Grave, Latin Capital Letter (U+00C8)",
    text = "È"
  }, {
    item = "è",
    subText = "E With Grave, Latin Small Letter (U+00E8)",
    text = "è"
  }, {
    item = "ẻ",
    subText = "E With Hook Above, Latin Small Letter (U+1EBB)",
    text = "ẻ"
  }, {
    item = "ɝ",
    subText = "E With Hook, Latin Small Letter Reversed Open (U+025D)",
    text = "ɝ"
  }, {
    item = "ȇ",
    subText = "E With Inverted Breve, Latin Small Letter (U+0207)",
    text = "ȇ"
  }, {
    item = "ē",
    subText = "E With Macron, Latin Small Letter (U+0113)",
    text = "ē"
  }, {
    item = "ę",
    subText = "E With Ogonek, Latin Small Letter (U+0119)",
    text = "ę"
  }, {
    item = "Ɇ",
    subText = "E With Stroke, Latin Capital Letter (U+0246)",
    text = "Ɇ"
  }, {
    item = "ɇ",
    subText = "E With Stroke, Latin Small Letter (U+0247)",
    text = "ɇ"
  }, {
    item = "ḛ",
    subText = "E With Tilde Below, Latin Small Letter (U+1E1B)",
    text = "ḛ"
  }, {
    item = "ẽ",
    subText = "E With Tilde, Latin Small Letter (U+1EBD)",
    text = "ẽ"
  }, {
    item = "ͤ",
    subText = "E, Combining Latin Small Letter (U+0364)",
    text = "ͤ"
  }, {
    item = "ⅇ",
    subText = "E, Double-Struck Italic Small (U+2147)",
    text = "ⅇ"
  }, {
    item = "Ɛ",
    subText = "E, Latin Capital Letter Open (U+0190)",
    text = "Ɛ"
  }, {
    item = "Ǝ",
    subText = "E, Latin Capital Letter Reversed (U+018E)",
    text = "Ǝ"
  }, {
    item = "Ǝ",
    subText = "E, Latin Capital Letter Turned (U+018E)",
    text = "Ǝ"
  }, {
    item = "ᴇ",
    subText = "E, Latin Letter Small Capital (U+1D07)",
    text = "ᴇ"
  }, {
    item = "ʚ",
    subText = "E, Latin Small Letter Closed Open (U+029A)",
    text = "ʚ"
  }, {
    item = "ɞ",
    subText = "E, Latin Small Letter Closed Reversed Open (U+025E)",
    text = "ɞ"
  }, {
    item = "œ",
    subText = "E, Latin Small Letter O (U+0153)",
    text = "œ"
  }, {
    item = "ɛ",
    subText = "E, Latin Small Letter Open (U+025B)",
    text = "ɛ"
  }, {
    item = "ɘ",
    subText = "E, Latin Small Letter Reversed (U+0258)",
    text = "ɘ"
  }, {
    item = "ɜ",
    subText = "E, Latin Small Letter Reversed Open (U+025C)",
    text = "ɜ"
  }, {
    item = "ǝ",
    subText = "E, Latin Small Letter Turned (U+01DD)",
    text = "ǝ"
  }, {
    item = "ᴈ",
    subText = "E, Latin Small Letter Turned Open (U+1D08)",
    text = "ᴈ"
  }, {
    item = "ℰ",
    subText = "E, Script Capital (U+2130)",
    text = "ℰ"
  }, {
    item = "ℯ",
    subText = "E, Script Small (U+212F)",
    text = "ℯ"
  }, {
    item = "🦅",
    subText = "Eagle (U+1F985)",
    text = "🦅"
  }, {
    item = "👂",
    subText = "Ear (U+1F442)",
    text = "👂"
  }, {
    item = "♁",
    subText = "Earth (U+2641)",
    text = "♁"
  }, {
    item = "⏚",
    subText = "Earth Ground (U+23DA)",
    text = "⏚"
  }, {
    item = "♱",
    subText = "East Syriac Cross (U+2671)",
    text = "♱"
  }, {
    item = "۰",
    subText = "Eastern Arabic-Indic Digits (U+06F0)",
    text = "۰"
  }, {
    item = "⸀",
    subText = "Editorial Symbols, New Testament (U+2E00)",
    text = "⸀"
  }, {
    item = "↑",
    subText = "Egressive Airflow (U+2191)",
    text = "↑"
  }, {
    item = "𓐰",
    subText = "Egyptian Hieroglyph Format Controls (U+13430)",
    text = "𓐰"
  }, {
    item = "𓀀",
    subText = "Egyptian Hieroglyphs (U+13000)",
    text = "𓀀"
  }, {
    item = "♪",
    subText = "Eighth Note (U+266A)",
    text = "♪"
  }, {
    item = "♫",
    subText = "Eighth Notes, Beamed (U+266B)",
    text = "♫"
  }, {
    item = "⅛",
    subText = "Eighths, Fractions (U+215B)",
    text = "⅛"
  }, {
    item = "⏏",
    subText = "Eject Media (U+23CF)",
    text = "⏏"
  }, {
    item = "ੴ",
    subText = "Ek Onkar, Gurmukhi (U+0A74)",
    text = "ੴ"
  }, {
    item = "₡",
    subText = "El Salvadorian Currency (U+20A1)",
    text = "₡"
  }, {
    item = "𐔀",
    subText = "Elbasan (U+10500)",
    text = "𐔀"
  }, {
    item = "⌁",
    subText = "Electric Arrow (U+2301)",
    text = "⌁"
  }, {
    item = "🔌",
    subText = "Electric Plug (U+1F50C)",
    text = "🔌"
  }, {
    item = "⏧",
    subText = "Electrical Intersection (U+23E7)",
    text = "⏧"
  }, {
    item = "↯",
    subText = "Electrolysis (U+21AF)",
    text = "↯"
  }, {
    item = "ℰ",
    subText = "Electromotive Force (U+2130)",
    text = "ℰ"
  }, {
    item = "⎍",
    subText = "Electrotechnical Symbols (U+238D)",
    text = "⎍"
  }, {
    item = "∈",
    subText = "Element Of (U+2208)",
    text = "∈"
  }, {
    item = "∉",
    subText = "Element Of, Not An (U+2209)",
    text = "∉"
  }, {
    item = "∊",
    subText = "Element Of, Small (U+220A)",
    text = "∊"
  }, {
    item = "℩",
    subText = "Element, Unique (U+2129)",
    text = "℩"
  }, {
    item = "🐘",
    subText = "Elephant (U+1F418)",
    text = "🐘"
  }, {
    item = "⬬",
    subText = "Ellipses (U+2B2C)",
    text = "⬬"
  }, {
    item = "⋱",
    subText = "Ellipsis, Down Right Diagonal (U+22F1)",
    text = "⋱"
  }, {
    item = "…",
    subText = "Ellipsis, Horizontal (U+2026)",
    text = "…"
  }, {
    item = "ຯ",
    subText = "Ellipsis, Lao (U+0EAF)",
    text = "ຯ"
  }, {
    item = "⋯",
    subText = "Ellipsis, Midline Horizontal (U+22EF)",
    text = "⋯"
  }, {
    item = "᠁",
    subText = "Ellipsis, Mongolian (U+1801)",
    text = "᠁"
  }, {
    item = "⋰",
    subText = "Ellipsis, Up Right Diagonal (U+22F0)",
    text = "⋰"
  }, {
    item = "⋮",
    subText = "Ellipsis, Vertical (U+22EE)",
    text = "⋮"
  }, {
    item = "℘",
    subText = "Elliptic Function, Weierstrass (U+2118)",
    text = "℘"
  }, {
    item = "𐿠",
    subText = "Elymaic (U+10FE0)",
    text = "𐿠"
  }, {
    item = "—",
    subText = "Em Dash (U+2014)",
    text = "—"
  }, {
    item = " ",
    subText = "Em Quad (U+2001)",
    text = " "
  }, {
    item = " ",
    subText = "Em Space (U+2003)",
    text = " "
  }, {
    item = "‪",
    subText = "Embedding, Left-To-Right (U+202A)",
    text = "‪"
  }, {
    item = "‫",
    subText = "Embedding, Right-To-Left (U+202B)",
    text = "‫"
  }, {
    item = "ℰ",
    subText = "Emf (U+2130)",
    text = "ℰ"
  }, {
    item = "🦰",
    subText = "Emoji Components (U+1F9B0)",
    text = "🦰"
  }, {
    item = "🏻",
    subText = "Emoji Modifiers (U+1F3FB)",
    text = "🏻"
  }, {
    item = "🤐",
    subText = "Emoticon Faces (U+1F910)",
    text = "🤐"
  }, {
    item = "😀",
    subText = "Emoticons (U+1F600)",
    text = "😀"
  }, {
    item = "՛",
    subText = "Emphasis Mark, Armenian (U+055B)",
    text = "՛"
  }, {
    item = "﹅",
    subText = "Emphasis Marks, Sidelining (U+FE45)",
    text = "﹅"
  }, {
    item = "⎃",
    subText = "Emphasis Symbol (U+2383)",
    text = "⎃"
  }, {
    item = "∅",
    subText = "Empty Set (U+2205)",
    text = "∅"
  }, {
    item = "⦰",
    subText = "Empty Sets (U+29B0)",
    text = "⦰"
  }, {
    item = "–",
    subText = "En Dash (U+2013)",
    text = "–"
  }, {
    item = " ",
    subText = "En Quad (U+2000)",
    text = " "
  }, {
    item = " ",
    subText = "En Space (U+2002)",
    text = " "
  }, {
    item = "🄀",
    subText = "Enclosed Alphanumeric Supplement (U+1F100)",
    text = "🄀"
  }, {
    item = "①",
    subText = "Enclosed Alphanumerics (U+2460)",
    text = "①"
  }, {
    item = "㈀",
    subText = "Enclosed Cjk Letters And Months (U+3200)",
    text = "㈀"
  }, {
    item = "🈀",
    subText = "Enclosed Ideographic Supplement (U+1F200)",
    text = "🈀"
  }, {
    item = "🄐",
    subText = "Enclosed Latin Capital Letters (U+1F110)",
    text = "🄐"
  }, {
    item = "⊕",
    subText = "Enclosed Mathematical Operators (U+2295)",
    text = "⊕"
  }, {
    item = "⃠",
    subText = "Enclosing Circle Backslash, Combining (U+20E0)",
    text = "⃠"
  }, {
    item = "⃝",
    subText = "Enclosing Circle, Combining (U+20DD)",
    text = "⃝"
  }, {
    item = "⃝",
    subText = "Enclosing Diacritics (U+20DD)",
    text = "⃝"
  }, {
    item = "⃟",
    subText = "Enclosing Diamond, Combining (U+20DF)",
    text = "⃟"
  }, {
    item = "⃣",
    subText = "Enclosing Keycap, Combining (U+20E3)",
    text = "⃣"
  }, {
    item = "⃢",
    subText = "Enclosing Screen, Combining (U+20E2)",
    text = "⃢"
  }, {
    item = "⃞",
    subText = "Enclosing Square, Combining (U+20DE)",
    text = "⃞"
  }, {
    item = "⃤",
    subText = "Enclosing Upward Pointing Triangle, Combining (U+20E4)",
    text = "⃤"
  }, {
    item = "⇲",
    subText = "End (U+21F2)",
    text = "⇲"
  }, {
    item = "",
    subText = "End Of Guarded Area (U+0097)",
    text = ""
  }, {
    item = "\n",
    subText = "End Of Line (U+000A)",
    text = "\n"
  }, {
    item = "",
    subText = "End Of Medium (U+0019)",
    text = ""
  }, {
    item = "⍿",
    subText = "End Of Medium, Symbol For (U+237F)",
    text = "⍿"
  }, {
    item = "␙",
    subText = "End Of Medium, Symbol For (U+2419)",
    text = "␙"
  }, {
    item = "∎",
    subText = "End Of Proof (U+220E)",
    text = "∎"
  }, {
    item = "",
    subText = "End Of Selected Area (U+0087)",
    text = ""
  }, {
    item = "",
    subText = "End Of Text (U+0003)",
    text = ""
  }, {
    item = "␃",
    subText = "End Of Text, Symbol For (U+2403)",
    text = "␃"
  }, {
    item = "",
    subText = "End Of Transmission (U+0004)",
    text = ""
  }, {
    item = "",
    subText = "End Of Transmission Block (U+0017)",
    text = ""
  }, {
    item = "␗",
    subText = "End Of Transmission Block, Symbol For (U+2417)",
    text = "␗"
  }, {
    item = "⌁",
    subText = "End Of Transmission Symbol (U+2301)",
    text = "⌁"
  }, {
    item = "␄",
    subText = "End Of Transmission, Symbol For (U+2404)",
    text = "␄"
  }, {
    item = "ŋ",
    subText = "Eng, Latin Small Letter (U+014B)",
    text = "ŋ"
  }, {
    item = "௺",
    subText = "Enn, Tamil (U+0BFA)",
    text = "௺"
  }, {
    item = "‿",
    subText = "Enotikon, Greek (U+203F)",
    text = "‿"
  }, {
    item = "",
    subText = "Enquiry (U+0005)",
    text = ""
  }, {
    item = "␅",
    subText = "Enquiry, Symbol For (U+2405)",
    text = "␅"
  }, {
    item = "⌤",
    subText = "Enter Key (U+2324)",
    text = "⌤"
  }, {
    item = "⎆",
    subText = "Enter Symbol (U+2386)",
    text = "⎆"
  }, {
    item = "🎠",
    subText = "Entertainment Symbols (U+1F3A0)",
    text = "🎠"
  }, {
    item = "✉",
    subText = "Envelope (U+2709)",
    text = "✉"
  }, {
    item = "🖂",
    subText = "Envelope, Back Of (U+1F582)",
    text = "🖂"
  }, {
    item = "🖃",
    subText = "Envelope, Stamped (U+1F583)",
    text = "🖃"
  }, {
    item = "\n",
    subText = "Eol (U+000A)",
    text = "\n"
  }, {
    item = "⁝",
    subText = "Epidaurean Acrophonic Symbol Three (U+205D)",
    text = "⁝"
  }, {
    item = "ϵ",
    subText = "Epsilon Symbol, Greek Lunate (U+03F5)",
    text = "ϵ"
  }, {
    item = "϶",
    subText = "Epsilon Symbol, Greek Reversed Lunate (U+03F6)",
    text = "϶"
  }, {
    item = "Ɛ",
    subText = "Epsilon, Latin Capital Letter (U+0190)",
    text = "Ɛ"
  }, {
    item = "ɛ",
    subText = "Epsilon, Latin Small Letter (U+025B)",
    text = "ɛ"
  }, {
    item = "ʚ",
    subText = "Epsilon, Latin Small Letter Closed (U+029A)",
    text = "ʚ"
  }, {
    item = "ɞ",
    subText = "Epsilon, Latin Small Letter Closed Reversed (U+025E)",
    text = "ɞ"
  }, {
    item = "϶",
    subText = "Epsilon, Reversed Straight (U+03F6)",
    text = "϶"
  }, {
    item = "∍",
    subText = "Epsilon, Reversed Straight (U+220D)",
    text = "∍"
  }, {
    item = "ϵ",
    subText = "Epsilon, Straight (U+03F5)",
    text = "ϵ"
  }, {
    item = "͌",
    subText = "Equal To Above, Combining Almost (U+034C)",
    text = "͌"
  }, {
    item = "≜",
    subText = "Equal To By Definition (U+225C)",
    text = "≜"
  }, {
    item = "≝",
    subText = "Equal To By Definition (U+225D)",
    text = "≝"
  }, {
    item = "≌",
    subText = "Equal To, All (U+224C)",
    text = "≌"
  }, {
    item = "≈",
    subText = "Equal To, Almost (U+2248)",
    text = "≈"
  }, {
    item = "≅",
    subText = "Equal To, Approximately (U+2245)",
    text = "≅"
  }, {
    item = "≗",
    subText = "Equal To, Approximately (U+2257)",
    text = "≗"
  }, {
    item = "≃",
    subText = "Equal To, Asymptotically (U+2243)",
    text = "≃"
  }, {
    item = "≜",
    subText = "Equal To, Delta (U+225C)",
    text = "≜"
  }, {
    item = "≑",
    subText = "Equal To, Geometrically (U+2251)",
    text = "≑"
  }, {
    item = "≥",
    subText = "Equal To, Greater-Than Or (U+2265)",
    text = "≥"
  }, {
    item = "≤",
    subText = "Equal To, Less-Than Or (U+2264)",
    text = "≤"
  }, {
    item = "≠",
    subText = "Equal To, Not (U+2260)",
    text = "≠"
  }, {
    item = "≟",
    subText = "Equal To, Questioned (U+225F)",
    text = "≟"
  }, {
    item = "≗",
    subText = "Equal To, Ring (U+2257)",
    text = "≗"
  }, {
    item = "≖",
    subText = "Equal To, Ring In (U+2256)",
    text = "≖"
  }, {
    item = "≃",
    subText = "Equality And Inequality Signs (U+2243)",
    text = "≃"
  }, {
    item = "⋕",
    subText = "Equality And Inequality Signs (U+22D5)",
    text = "⋕"
  }, {
    item = "≕",
    subText = "Equals Colon (U+2255)",
    text = "≕"
  }, {
    item = "=",
    subText = "Equals Sign (U+003D)",
    text = "="
  }, {
    item = "͇",
    subText = "Equals Sign Below, Combining (U+0347)",
    text = "͇"
  }, {
    item = "⊜",
    subText = "Equals, Circled (U+229C)",
    text = "⊜"
  }, {
    item = "≔",
    subText = "Equals, Colon (U+2254)",
    text = "≔"
  }, {
    item = "≒",
    subText = "Equals, Nearly (U+2252)",
    text = "≒"
  }, {
    item = "⋍",
    subText = "Equals, Reversed Tilde (U+22CD)",
    text = "⋍"
  }, {
    item = "≛",
    subText = "Equals, Star (U+225B)",
    text = "≛"
  }, {
    item = "≜",
    subText = "Equiangular (U+225C)",
    text = "≜"
  }, {
    item = "≚",
    subText = "Equiangular To (U+225A)",
    text = "≚"
  }, {
    item = "≍",
    subText = "Equivalent To (U+224D)",
    text = "≍"
  }, {
    item = "≎",
    subText = "Equivalent To, Geometrically (U+224E)",
    text = "≎"
  }, {
    item = "≣",
    subText = "Equivalent To, Strictly (U+2263)",
    text = "≣"
  }, {
    item = "⧦",
    subText = "Equivalent, Tautological (U+29E6)",
    text = "⧦"
  }, {
    item = "㋿",
    subText = "Era Name, Japanese (U+32FF)",
    text = "㋿"
  }, {
    item = "㍻",
    subText = "Era Names, Japanese (U+337B)",
    text = "㍻"
  }, {
    item = "⌫",
    subText = "Erase To The Left (U+232B)",
    text = "⌫"
  }, {
    item = "⌦",
    subText = "Erase To The Right (U+2326)",
    text = "⌦"
  }, {
    item = "ℯ",
    subText = "Error (U+212F)",
    text = "ℯ"
  }, {
    item = "⧮",
    subText = "Error Bar Symbols (U+29EE)",
    text = "⧮"
  }, {
    item = "",
    subText = "Escape (U+001B)",
    text = ""
  }, {
    item = "⎋",
    subText = "Escape (U+238B)",
    text = "⎋"
  }, {
    item = "⮹",
    subText = "Escape (U+2BB9)",
    text = "⮹"
  }, {
    item = "",
    subText = "Escape, Data Link (U+0010)",
    text = ""
  }, {
    item = "␛",
    subText = "Escape, Symbol For (U+241B)",
    text = "␛"
  }, {
    item = "␐",
    subText = "Escape, Symbol For Data Link (U+2410)",
    text = "␐"
  }, {
    item = "$",
    subText = "Escudo (U+0024)",
    text = "$"
  }, {
    item = "ƪ",
    subText = "Esh Loop, Latin Letter Reversed (U+01AA)",
    text = "ƪ"
  }, {
    item = "Ʃ",
    subText = "Esh, Latin Capital Letter (U+01A9)",
    text = "Ʃ"
  }, {
    item = "ʃ",
    subText = "Esh, Latin Small Letter (U+0283)",
    text = "ʃ"
  }, {
    item = "ʅ",
    subText = "Esh, Latin Small Letter Squat Reversed (U+0285)",
    text = "ʅ"
  }, {
    item = "℮",
    subText = "Estimated Symbol (U+212E)",
    text = "℮"
  }, {
    item = "≙",
    subText = "Estimates (U+2259)",
    text = "≙"
  }, {
    item = "ß",
    subText = "Eszett (U+00DF)",
    text = "ß"
  }, {
    item = "⁊",
    subText = "Et, Tironian Sign (U+204A)",
    text = "⁊"
  }, {
    item = "Ð",
    subText = "Eth, Latin Capital Letter (U+00D0)",
    text = "Ð"
  }, {
    item = "ᴆ",
    subText = "Eth, Latin Letter Small Capital (U+1D06)",
    text = "ᴆ"
  }, {
    item = "ð",
    subText = "Eth, Latin Small Letter (U+00F0)",
    text = "ð"
  }, {
    item = "œ",
    subText = "Ethel (U+0153)",
    text = "œ"
  }, {
    item = "፥",
    subText = "Ethiopic Colon (U+1365)",
    text = "፥"
  }, {
    item = "፝",
    subText = "Ethiopic Combining Marks (U+135D)",
    text = "፝"
  }, {
    item = "፣",
    subText = "Ethiopic Comma (U+1363)",
    text = "፣"
  }, {
    item = "፩",
    subText = "Ethiopic Digits (U+1369)",
    text = "፩"
  }, {
    item = "ⶀ",
    subText = "Ethiopic Extended (U+2D80)",
    text = "ⶀ"
  }, {
    item = "꬀",
    subText = "Ethiopic Extended-A (U+AB00)",
    text = "꬀"
  }, {
    item = "።",
    subText = "Ethiopic Full Stop (U+1362)",
    text = "።"
  }, {
    item = "፩",
    subText = "Ethiopic Numbers (U+1369)",
    text = "፩"
  }, {
    item = "፨",
    subText = "Ethiopic Paragraph Separator (U+1368)",
    text = "፨"
  }, {
    item = "፦",
    subText = "Ethiopic Preface Colon (U+1366)",
    text = "፦"
  }, {
    item = "፡",
    subText = "Ethiopic Punctuation (U+1361)",
    text = "፡"
  }, {
    item = "፧",
    subText = "Ethiopic Question Mark (U+1367)",
    text = "፧"
  }, {
    item = "፤",
    subText = "Ethiopic Semicolon (U+1364)",
    text = "፤"
  }, {
    item = "ᎀ",
    subText = "Ethiopic Supplement (U+1380)",
    text = "ᎀ"
  }, {
    item = "ሀ",
    subText = "Ethiopic Syllables (U+1200)",
    text = "ሀ"
  }, {
    item = "፡",
    subText = "Ethiopic Wordspace (U+1361)",
    text = "፡"
  }, {
    item = "ℇ",
    subText = "Euler Constant (U+2107)",
    text = "ℇ"
  }, {
    item = "€",
    subText = "Euro European Currency (U+20AC)",
    text = "€"
  }, {
    item = "€",
    subText = "Euro Sign (U+20AC)",
    text = "€"
  }, {
    item = "Ā",
    subText = "European Latin (U+0100)",
    text = "Ā"
  }, {
    item = "§",
    subText = "European Paragraph Sign (U+00A7)",
    text = "§"
  }, {
    item = "¶",
    subText = "European Section Sign (U+00B6)",
    text = "¶"
  }, {
    item = "∹",
    subText = "Excess (U+2239)",
    text = "∹"
  }, {
    item = "!",
    subText = "Exclamation Mark (U+0021)",
    text = "!"
  }, {
    item = "❢",
    subText = "Exclamation Mark Ornament, Heavy (U+2762)",
    text = "❢"
  }, {
    item = "❕",
    subText = "Exclamation Mark Ornament, White (U+2755)",
    text = "❕"
  }, {
    item = "՜",
    subText = "Exclamation Mark, Armenian (U+055C)",
    text = "՜"
  }, {
    item = "‼",
    subText = "Exclamation Mark, Double (U+203C)",
    text = "‼"
  }, {
    item = "¡",
    subText = "Exclamation Mark, Inverted (U+00A1)",
    text = "¡"
  }, {
    item = "ǃ",
    subText = "Exclamation Mark, Latin Letter (U+01C3)",
    text = "ǃ"
  }, {
    item = "᥄",
    subText = "Exclamation Mark, Limbu (U+1944)",
    text = "᥄"
  }, {
    item = "⁈",
    subText = "Exclamation Mark, Question (U+2048)",
    text = "⁈"
  }, {
    item = "⁉",
    subText = "Exclamation Question Mark (U+2049)",
    text = "⁉"
  }, {
    item = "∄",
    subText = "Exist, There Does Not (U+2204)",
    text = "∄"
  }, {
    item = "∃",
    subText = "Existential Quantifier (U+2203)",
    text = "∃"
  }, {
    item = "∃",
    subText = "Exists, There (U+2203)",
    text = "∃"
  }, {
    item = "ℯ",
    subText = "Exponent, Natural (U+212F)",
    text = "ℯ"
  }, {
    item = "ㇰ",
    subText = "Extensions For Ainu, Katakana (U+31F0)",
    text = "ㇰ"
  }, {
    item = "👽",
    subText = "Extraterrestrial Alien (U+1F47D)",
    text = "👽"
  }, {
    item = "👁",
    subText = "Eye (U+1F441)",
    text = "👁"
  }, {
    item = "👀",
    subText = "Eyes (U+1F440)",
    text = "👀"
  }, {
    item = "ƹ",
    subText = "Ezh Reversed, Latin Small Letter (U+01B9)",
    text = "ƹ"
  }, {
    item = "ǯ",
    subText = "Ezh With Caron, Latin Small Letter (U+01EF)",
    text = "ǯ"
  }, {
    item = "Ʒ",
    subText = "Ezh, Latin Capital Letter (U+01B7)",
    text = "Ʒ"
  }, {
    item = "ᴣ",
    subText = "Ezh, Latin Letter Small Capital (U+1D23)",
    text = "ᴣ"
  }, {
    item = "ʒ",
    subText = "Ezh, Latin Small Letter (U+0292)",
    text = "ʒ"
  }, {
    item = "ḟ",
    subText = "F With Dot Above, Latin Small Letter (U+1E1F)",
    text = "ḟ"
  }, {
    item = "ƒ",
    subText = "F With Hook, Latin Small Letter (U+0192)",
    text = "ƒ"
  }, {
    item = "ƒ",
    subText = "F, Latin Small Letter Script (U+0192)",
    text = "ƒ"
  }, {
    item = "ℱ",
    subText = "F, Script Capital (U+2131)",
    text = "ℱ"
  }, {
    item = "Ⅎ",
    subText = "F, Turned Capital (U+2132)",
    text = "Ⅎ"
  }, {
    item = "ⅎ",
    subText = "F, Turned Small (U+214E)",
    text = "ⅎ"
  }, {
    item = "🤦",
    subText = "Face Palm (U+1F926)",
    text = "🤦"
  }, {
    item = "☻",
    subText = "Face, Black Smiling (U+263B)",
    text = "☻"
  }, {
    item = "〠",
    subText = "Face, Postal Mark (U+3020)",
    text = "〠"
  }, {
    item = "☹",
    subText = "Face, White Frowning (U+2639)",
    text = "☹"
  }, {
    item = "☺",
    subText = "Face, White Smiling (U+263A)",
    text = "☺"
  }, {
    item = "😀",
    subText = "Faces (U+1F600)",
    text = "😀"
  }, {
    item = "🤠",
    subText = "Faces (U+1F920)",
    text = "🤠"
  }, {
    item = "👀",
    subText = "Facial Parts Symbols (U+1F440)",
    text = "👀"
  }, {
    item = "℻",
    subText = "Facsimile Sign (U+213B)",
    text = "℻"
  }, {
    item = "!",
    subText = "Factorial (U+0021)",
    text = "!"
  }, {
    item = "⛭",
    subText = "Factory (U+26ED)",
    text = "⛭"
  }, {
    item = "℉",
    subText = "Fahrenheit, Degree (U+2109)",
    text = "℉"
  }, {
    item = "👸",
    subText = "Fairy Tale Symbols (U+1F478)",
    text = "👸"
  }, {
    item = "👪",
    subText = "Family (U+1F46A)",
    text = "👪"
  }, {
    item = "↡",
    subText = "Fast Cursor Down (U+21A1)",
    text = "↡"
  }, {
    item = "↞",
    subText = "Fast Cursor Left (U+219E)",
    text = "↞"
  }, {
    item = "↠",
    subText = "Fast Cursor Right (U+21A0)",
    text = "↠"
  }, {
    item = "↟",
    subText = "Fast Cursor Up (U+219F)",
    text = "↟"
  }, {
    item = "⏩",
    subText = "Fast Forward (U+23E9)",
    text = "⏩"
  }, {
    item = "⏪",
    subText = "Fast Rewind (U+23EA)",
    text = "⏪"
  }, {
    item = "🎅",
    subText = "Father Christmas (U+1F385)",
    text = "🎅"
  }, {
    item = "′",
    subText = "Feet (U+2032)",
    text = "′"
  }, {
    item = "♀",
    subText = "Female Sign (U+2640)",
    text = "♀"
  }, {
    item = "ª",
    subText = "Feminine Ordinal Indicator (U+00AA)",
    text = "ª"
  }, {
    item = "⦙",
    subText = "Fence, Dotted (U+2999)",
    text = "⦙"
  }, {
    item = "⦙",
    subText = "Fences (U+2999)",
    text = "⦙"
  }, {
    item = "⧘",
    subText = "Fences, Wiggly (U+29D8)",
    text = "⧘"
  }, {
    item = "͒",
    subText = "Fermata, Combining (U+0352)",
    text = "͒"
  }, {
    item = "⛴",
    subText = "Ferry (U+26F4)",
    text = "⛴"
  }, {
    item = "\f",
    subText = "Ff (U+000C)",
    text = "\f"
  }, {
    item = "⅕",
    subText = "Fifths, Fractions (U+2155)",
    text = "⅕"
  }, {
    item = "‒",
    subText = "Figure Dash (U+2012)",
    text = "‒"
  }, {
    item = " ",
    subText = "Figure Space (U+2007)",
    text = " "
  }, {
    item = "📁",
    subText = "File Folder (U+1F4C1)",
    text = "📁"
  }, {
    item = "📂",
    subText = "File Folder, Open (U+1F4C2)",
    text = "📂"
  }, {
    item = "",
    subText = "File Separator (U+001C)",
    text = ""
  }, {
    item = "␜",
    subText = "File Separator, Symbol For (U+241C)",
    text = "␜"
  }, {
    item = "〿",
    subText = "Fill Space, Ideographic Half (U+303F)",
    text = "〿"
  }, {
    item = "ㅤ",
    subText = "Filler, Hangul (U+3164)",
    text = "ㅤ"
  }, {
    item = "🎞",
    subText = "Film Frames (U+1F39E)",
    text = "🎞"
  }, {
    item = "☚",
    subText = "Finger Dingbats, Pointing Index (U+261A)",
    text = "☚"
  }, {
    item = "🤞",
    subText = "Fingers Crossed (U+1F91E)",
    text = "🤞"
  }, {
    item = "⇻",
    subText = "Finite Function (U+21FB)",
    text = "⇻"
  }, {
    item = "⃦",
    subText = "Finite Function Diacritic (U+20E6)",
    text = "⃦"
  }, {
    item = "⤕",
    subText = "Finite Injection (U+2915)",
    text = "⤕"
  }, {
    item = "⇼",
    subText = "Finite Relation (U+21FC)",
    text = "⇼"
  }, {
    item = "⤁",
    subText = "Finite Surjection (U+2901)",
    text = "⤁"
  }, {
    item = "⤘",
    subText = "Finite Surjective Injection (U+2918)",
    text = "⤘"
  }, {
    item = "🔥",
    subText = "Fire (U+1F525)",
    text = "🔥"
  }, {
    item = "🛱",
    subText = "Fire Engine, Oncoming (U+1F6F1)",
    text = "🛱"
  }, {
    item = "☽",
    subText = "First Quarter Moon (U+263D)",
    text = "☽"
  }, {
    item = "⁨",
    subText = "First Strong Isolate (U+2068)",
    text = "⁨"
  }, {
    item = "🐟",
    subText = "Fish (U+1F41F)",
    text = "🐟"
  }, {
    item = "⥼",
    subText = "Fish Tails (U+297C)",
    text = "⥼"
  }, {
    item = "🐠",
    subText = "Fish, Tropical (U+1F420)",
    text = "🐠"
  }, {
    item = "◉",
    subText = "Fisheye (U+25C9)",
    text = "◉"
  }, {
    item = "☞",
    subText = "Fist (U+261E)",
    text = "☞"
  }, {
    item = "✊",
    subText = "Fist, Raised (U+270A)",
    text = "✊"
  }, {
    item = "👊",
    subText = "Fisted Hand Sign (U+1F44A)",
    text = "👊"
  }, {
    item = "⁙",
    subText = "Five Dot Punctuation (U+2059)",
    text = "⁙"
  }, {
    item = "⛳",
    subText = "Flag In Hole (U+26F3)",
    text = "⛳"
  }, {
    item = "⚑",
    subText = "Flag, Black (U+2691)",
    text = "⚑"
  }, {
    item = "🏴",
    subText = "Flag, Waving Black (U+1F3F4)",
    text = "🏴"
  }, {
    item = "🏳",
    subText = "Flag, Waving White (U+1F3F3)",
    text = "🏳"
  }, {
    item = "⚐",
    subText = "Flag, White (U+2690)",
    text = "⚐"
  }, {
    item = "♭",
    subText = "Flat Sign, Music (U+266D)",
    text = "♭"
  }, {
    item = "⏥",
    subText = "Flatness (U+23E5)",
    text = "⏥"
  }, {
    item = "⚜",
    subText = "Fleur-De-Lis (U+269C)",
    text = "⚜"
  }, {
    item = "⌊",
    subText = "Floor, Left (U+230A)",
    text = "⌊"
  }, {
    item = "⌋",
    subText = "Floor, Right (U+230B)",
    text = "⌋"
  }, {
    item = "💾",
    subText = "Floppy Disk (U+1F4BE)",
    text = "💾"
  }, {
    item = "☙",
    subText = "Floral Heart Bullet, Reversed Rotated (U+2619)",
    text = "☙"
  }, {
    item = "ƒ",
    subText = "Florin Currency Symbol (U+0192)",
    text = "ƒ"
  }, {
    item = "🛸",
    subText = "Flying Saucer (U+1F6F8)",
    text = "🛸"
  }, {
    item = "ƒ",
    subText = "Folder (U+0192)",
    text = "ƒ"
  }, {
    item = "๏",
    subText = "Fongman, Thai Character (U+0E4F)",
    text = "๏"
  }, {
    item = "🍽",
    subText = "Food Available Symbol (U+1F37D)",
    text = "🍽"
  }, {
    item = "🍔",
    subText = "Food Symbols (U+1F354)",
    text = "🍔"
  }, {
    item = "🥐",
    subText = "Food Symbols (U+1F950)",
    text = "🥐"
  }, {
    item = "👣",
    subText = "Footprints (U+1F463)",
    text = "👣"
  }, {
    item = "∀",
    subText = "For All (U+2200)",
    text = "∀"
  }, {
    item = "⊩",
    subText = "Forces (U+22A9)",
    text = "⊩"
  }, {
    item = "ᚕ",
    subText = "Forfeda Supplement, Ogham (U+1695)",
    text = "ᚕ"
  }, {
    item = "🍽",
    subText = "Fork And Knife With Plate (U+1F37D)",
    text = "🍽"
  }, {
    item = "⫙",
    subText = "Forks (U+2AD9)",
    text = "⫙"
  }, {
    item = "─",
    subText = "Form And Chart Components (U+2500)",
    text = "─"
  }, {
    item = "\f",
    subText = "Form Feed (U+000C)",
    text = "\f"
  }, {
    item = "↡",
    subText = "Form Feed (U+21A1)",
    text = "↡"
  }, {
    item = "␌",
    subText = "Form Feed, Symbol For (U+240C)",
    text = "␌"
  }, {
    item = "‌",
    subText = "Format Characters (U+200C)",
    text = "‌"
  }, {
    item = "‪",
    subText = "Format Characters, Directional (U+202A)",
    text = "‪"
  }, {
    item = "𓐰",
    subText = "Format Controls, Egyptian Hieroglyph (U+13430)",
    text = "𓐰"
  }, {
    item = "᠋",
    subText = "Format Controls, Mongolian (U+180B)",
    text = "᠋"
  }, {
    item = "‬",
    subText = "Formatting, Pop Directional (U+202C)",
    text = "‬"
  }, {
    item = "▻",
    subText = "Forward Arrow Indicator (U+25BB)",
    text = "▻"
  }, {
    item = "∆",
    subText = "Forward Difference (U+2206)",
    text = "∆"
  }, {
    item = "⏵",
    subText = "Forward Play (U+23F5)",
    text = "⏵"
  }, {
    item = "⏩",
    subText = "Forward, Fast (U+23E9)",
    text = "⏩"
  }, {
    item = "⛲",
    subText = "Fountain (U+26F2)",
    text = "⛲"
  }, {
    item = "⛶",
    subText = "Four Corners, Square (U+26F6)",
    text = "⛶"
  }, {
    item = "⁛",
    subText = "Four Dot Mark (U+205B)",
    text = "⁛"
  }, {
    item = "⁘",
    subText = "Four Dot Punctuation (U+2058)",
    text = "⁘"
  }, {
    item = "⃜",
    subText = "Four Dots Above, Combining (U+20DC)",
    text = "⃜"
  }, {
    item = "᠅",
    subText = "Four Dots, Mongolian (U+1805)",
    text = "᠅"
  }, {
    item = "⁞",
    subText = "Four Dots, Vertical (U+205E)",
    text = "⁞"
  }, {
    item = " ",
    subText = "Four-Per-Em Space (U+2005)",
    text = " "
  }, {
    item = "ℱ",
    subText = "Fourier Transform (U+2131)",
    text = "ℱ"
  }, {
    item = "⃜",
    subText = "Fourth Derivative (U+20DC)",
    text = "⃜"
  }, {
    item = "∜",
    subText = "Fourth Root (U+221C)",
    text = "∜"
  }, {
    item = "ˋ",
    subText = "Fourth Tone, Mandarin Chinese (U+02CB)",
    text = "ˋ"
  }, {
    item = "¼",
    subText = "Fourths, Fractions (U+00BC)",
    text = "¼"
  }, {
    item = "⅟",
    subText = "Fraction Numerator One (U+215F)",
    text = "⅟"
  }, {
    item = "½",
    subText = "Fraction One Half, Vulgar (U+00BD)",
    text = "½"
  }, {
    item = "⅑",
    subText = "Fraction One Ninth, Vulgar (U+2151)",
    text = "⅑"
  }, {
    item = "¼",
    subText = "Fraction One Quarter, Vulgar (U+00BC)",
    text = "¼"
  }, {
    item = "⅐",
    subText = "Fraction One Seventh, Vulgar (U+2150)",
    text = "⅐"
  }, {
    item = "⅒",
    subText = "Fraction One Tenth, Vulgar (U+2152)",
    text = "⅒"
  }, {
    item = "⁄",
    subText = "Fraction Slash (U+2044)",
    text = "⁄"
  }, {
    item = "¾",
    subText = "Fraction Three Quarters, Vulgar (U+00BE)",
    text = "¾"
  }, {
    item = "⅛",
    subText = "Fractions Eighths (U+215B)",
    text = "⅛"
  }, {
    item = "⅕",
    subText = "Fractions Fifths (U+2155)",
    text = "⅕"
  }, {
    item = "¼",
    subText = "Fractions Fourths (U+00BC)",
    text = "¼"
  }, {
    item = "¼",
    subText = "Fractions Quarters (U+00BC)",
    text = "¼"
  }, {
    item = "⅙",
    subText = "Fractions Sixths (U+2159)",
    text = "⅙"
  }, {
    item = "⅓",
    subText = "Fractions Thirds (U+2153)",
    text = "⅓"
  }, {
    item = "⅓",
    subText = "Fractions, Vulgar (U+2153)",
    text = "⅓"
  }, {
    item = "𝔄",
    subText = "Fraktur Mathematical Symbols (U+1D504)",
    text = "𝔄"
  }, {
    item = "𝕬",
    subText = "Fraktur Mathematical Symbols, Bold (U+1D56C)",
    text = "𝕬"
  }, {
    item = "⧖",
    subText = "Framus, White (U+29D6)",
    text = "⧖"
  }, {
    item = "₣",
    subText = "Franc Sign, French (U+20A3)",
    text = "₣"
  }, {
    item = "ʕ",
    subText = "Fricative, Latin Letter Pharyngeal Voiced (U+0295)",
    text = "ʕ"
  }, {
    item = "🐸",
    subText = "Frog Face (U+1F438)",
    text = "🐸"
  }, {
    item = "⌢",
    subText = "Frown (U+2322)",
    text = "⌢"
  }, {
    item = "☹",
    subText = "Frowning Face, White (U+2639)",
    text = "☹"
  }, {
    item = "🍅",
    subText = "Fruit And Vegetable Symbols (U+1F345)",
    text = "🍅"
  }, {
    item = "⛽",
    subText = "Fuel Pump (U+26FD)",
    text = "⛽"
  }, {
    item = "█",
    subText = "Full Block (U+2588)",
    text = "█"
  }, {
    item = ".",
    subText = "Full Stop (U+002E)",
    text = "."
  }, {
    item = "۔",
    subText = "Full Stop, Arabic (U+06D4)",
    text = "۔"
  }, {
    item = "։",
    subText = "Full Stop, Armenian (U+0589)",
    text = "։"
  }, {
    item = "᙮",
    subText = "Full Stop, Canadian Syllabics (U+166E)",
    text = "᙮"
  }, {
    item = "።",
    subText = "Full Stop, Ethiopic (U+1362)",
    text = "።"
  }, {
    item = "։",
    subText = "Full Stop, Georgian (U+0589)",
    text = "։"
  }, {
    item = "。",
    subText = "Full Stop, Ideographic (U+3002)",
    text = "。"
  }, {
    item = "᠃",
    subText = "Full Stop, Mongolian (U+1803)",
    text = "᠃"
  }, {
    item = "᠉",
    subText = "Full Stop, Mongolian Manchu (U+1809)",
    text = "᠉"
  }, {
    item = "！",
    subText = "Fullwidth Ascii Variants (U+FF01)",
    text = "！"
  }, {
    item = "＀",
    subText = "Fullwidth Forms, Halfwidth And (U+FF00)",
    text = "＀"
  }, {
    item = "￠",
    subText = "Fullwidth Symbol Variants (U+FFE0)",
    text = "￠"
  }, {
    item = "⁡",
    subText = "Function Application (U+2061)",
    text = "⁡"
  }, {
    item = "ƒ",
    subText = "Function Symbol (U+0192)",
    text = "ƒ"
  }, {
    item = "ℬ",
    subText = "Function, Bernoulli (U+212C)",
    text = "ℬ"
  }, {
    item = "∘",
    subText = "Function, Composite (U+2218)",
    text = "∘"
  }, {
    item = "⇻",
    subText = "Function, Finite (U+21FB)",
    text = "⇻"
  }, {
    item = "Γ",
    subText = "Function, Gamma (U+0393)",
    text = "Γ"
  }, {
    item = "⇸",
    subText = "Function, Partial (U+21F8)",
    text = "⇸"
  }, {
    item = "→",
    subText = "Function, Total (U+2192)",
    text = "→"
  }, {
    item = "℘",
    subText = "Function, Weierstrass Elliptic (U+2118)",
    text = "℘"
  }, {
    item = "⌶",
    subText = "Functional Symbols, Apl (U+2336)",
    text = "⌶"
  }, {
    item = "⚱",
    subText = "Funeral Urn (U+26B1)",
    text = "⚱"
  }, {
    item = "⏛",
    subText = "Fuse (U+23DB)",
    text = "⏛"
  }, {
    item = "᠋",
    subText = "Fvs1 (U+180B)",
    text = "᠋"
  }, {
    item = "ǵ",
    subText = "G With Acute, Latin Small Letter (U+01F5)",
    text = "ǵ"
  }, {
    item = "ğ",
    subText = "G With Breve, Latin Small Letter (U+011F)",
    text = "ğ"
  }, {
    item = "ǧ",
    subText = "G With Caron, Latin Small Letter (U+01E7)",
    text = "ǧ"
  }, {
    item = "ģ",
    subText = "G With Cedilla, Latin Small Letter (U+0123)",
    text = "ģ"
  }, {
    item = "ĝ",
    subText = "G With Circumflex, Latin Small Letter (U+011D)",
    text = "ĝ"
  }, {
    item = "ġ",
    subText = "G With Dot Above, Latin Small Letter (U+0121)",
    text = "ġ"
  }, {
    item = "Ɠ",
    subText = "G With Hook, Latin Capital Letter (U+0193)",
    text = "Ɠ"
  }, {
    item = "ʛ",
    subText = "G With Hook, Latin Letter Small Capital (U+029B)",
    text = "ʛ"
  }, {
    item = "ɠ",
    subText = "G With Hook, Latin Small Letter (U+0260)",
    text = "ɠ"
  }, {
    item = "ḡ",
    subText = "G With Macron, Latin Small Letter (U+1E21)",
    text = "ḡ"
  }, {
    item = "ǥ",
    subText = "G With Stroke, Latin Small Letter (U+01E5)",
    text = "ǥ"
  }, {
    item = "ɢ",
    subText = "G, Latin Letter Small Capital (U+0262)",
    text = "ɢ"
  }, {
    item = "ɡ",
    subText = "G, Latin Small Letter Script (U+0261)",
    text = "ɡ"
  }, {
    item = "ℊ",
    subText = "G, Script Small (U+210A)",
    text = "ℊ"
  }, {
    item = "⅁",
    subText = "G, Turned Sans-Serif Capital (U+2141)",
    text = "⅁"
  }, {
    item = "⅁",
    subText = "Game (U+2141)",
    text = "⅁"
  }, {
    item = "🎮",
    subText = "Game Symbols (U+1F3AE)",
    text = "🎮"
  }, {
    item = "Γ",
    subText = "Gamma Function (U+0393)",
    text = "Γ"
  }, {
    item = "ℾ",
    subText = "Gamma, Double-Struck Capital (U+213E)",
    text = "ℾ"
  }, {
    item = "ℽ",
    subText = "Gamma, Double-Struck Small (U+213D)",
    text = "ℽ"
  }, {
    item = "Ɣ",
    subText = "Gamma, Latin Capital Letter (U+0194)",
    text = "Ɣ"
  }, {
    item = "ɣ",
    subText = "Gamma, Latin Small Letter (U+0263)",
    text = "ɣ"
  }, {
    item = "ɤ",
    subText = "Gamma, Latin Small Letter Baby (U+0264)",
    text = "ɤ"
  }, {
    item = "ˠ",
    subText = "Gamma, Modifier Letter Small (U+02E0)",
    text = "ˠ"
  }, {
    item = "⛽",
    subText = "Gas Station (U+26FD)",
    text = "⛽"
  }, {
    item = "⚙",
    subText = "Gear (U+2699)",
    text = "⚙"
  }, {
    item = "♊",
    subText = "Gemini (U+264A)",
    text = "♊"
  }, {
    item = "⚢",
    subText = "Gender Symbols (U+26A2)",
    text = "⚢"
  }, {
    item = "⚭",
    subText = "Genealogical Symbols (U+26AD)",
    text = "⚭"
  }, {
    item = " ",
    subText = "General Punctuation (U+2000)",
    text = " "
  }, {
    item = " ",
    subText = "General Scripts Area (U+0000)",
    text = " "
  }, {
    item = "𐀀",
    subText = "General Scripts Area, Supplementary (U+10000)",
    text = "𐀀"
  }, {
    item = "⋂",
    subText = "Generalized Intersection (U+22C2)",
    text = "⋂"
  }, {
    item = "⋃",
    subText = "Generalized Union (U+22C3)",
    text = "⋃"
  }, {
    item = "∺",
    subText = "Geometric Proportion (U+223A)",
    text = "∺"
  }, {
    item = "🔲",
    subText = "Geometric Shapes (U+1F532)",
    text = "🔲"
  }, {
    item = "■",
    subText = "Geometric Shapes (U+25A0)",
    text = "■"
  }, {
    item = "🞀",
    subText = "Geometric Shapes Extended (U+1F780)",
    text = "🞀"
  }, {
    item = "≑",
    subText = "Geometrically Equal To (U+2251)",
    text = "≑"
  }, {
    item = "≎",
    subText = "Geometrically Equivalent To (U+224E)",
    text = "≎"
  }, {
    item = "Ⴀ",
    subText = "Georgian (U+10A0)",
    text = "Ⴀ"
  }, {
    item = "ა",
    subText = "Georgian Alphabet (U+10D0)",
    text = "ა"
  }, {
    item = "Ⴀ",
    subText = "Georgian Capital Letters (U+10A0)",
    text = "Ⴀ"
  }, {
    item = "·",
    subText = "Georgian Comma (U+00B7)",
    text = "·"
  }, {
    item = "₾",
    subText = "Georgian Currency (U+20BE)",
    text = "₾"
  }, {
    item = "Ა",
    subText = "Georgian Extended (U+1C90)",
    text = "Ა"
  }, {
    item = "ჱ",
    subText = "Georgian Extensions (U+10F1)",
    text = "ჱ"
  }, {
    item = "։",
    subText = "Georgian Full Stop (U+0589)",
    text = "։"
  }, {
    item = "Ⴀ",
    subText = "Georgian Khutsuri (U+10A0)",
    text = "Ⴀ"
  }, {
    item = "ა",
    subText = "Georgian Mkhedruli (U+10D0)",
    text = "ა"
  }, {
    item = "჻",
    subText = "Georgian Paragraph Separator (U+10FB)",
    text = "჻"
  }, {
    item = "ა",
    subText = "Georgian Small Letters (U+10D0)",
    text = "ა"
  }, {
    item = "ⴀ",
    subText = "Georgian Supplement (U+2D00)",
    text = "ⴀ"
  }, {
    item = "ℳ",
    subText = "German Mark Pre-Wwii (U+2133)",
    text = "ℳ"
  }, {
    item = "₰",
    subText = "German Penny Sign (U+20B0)",
    text = "₰"
  }, {
    item = "🙅",
    subText = "Gesture Symbols (U+1F645)",
    text = "🙅"
  }, {
    item = "〓",
    subText = "Geta Mark (U+3013)",
    text = "〓"
  }, {
    item = "₵",
    subText = "Ghana Currency (U+20B5)",
    text = "₵"
  }, {
    item = "👻",
    subText = "Ghost (U+1F47B)",
    text = "👻"
  }, {
    item = "ℷ",
    subText = "Gimel Symbol (U+2137)",
    text = "ℷ"
  }, {
    item = "👧",
    subText = "Girl (U+1F467)",
    text = "👧"
  }, {
    item = "Ⰰ",
    subText = "Glagolitic (U+2C00)",
    text = "Ⰰ"
  }, {
    item = "𞀀",
    subText = "Glagolitic Supplement (U+1E000)",
    text = "𞀀"
  }, {
    item = "⧦",
    subText = "Gleich Stark (U+29E6)",
    text = "⧦"
  }, {
    item = "🌍",
    subText = "Globe Symbols (U+1F30D)",
    text = "🌍"
  }, {
    item = "🌐",
    subText = "Globe With Meridians (U+1F310)",
    text = "🌐"
  }, {
    item = "ʼ",
    subText = "Glottal Stop (U+02BC)",
    text = "ʼ"
  }, {
    item = "Ɂ",
    subText = "Glottal Stop, Latin Capital Letter (U+0241)",
    text = "Ɂ"
  }, {
    item = "ʔ",
    subText = "Glottal Stop, Latin Letter (U+0294)",
    text = "ʔ"
  }, {
    item = "ʖ",
    subText = "Glottal Stop, Latin Letter Inverted (U+0296)",
    text = "ʖ"
  }, {
    item = "ʕ",
    subText = "Glottal Stop, Latin Letter Reversed (U+0295)",
    text = "ʕ"
  }, {
    item = "ɂ",
    subText = "Glottal Stop, Latin Small Letter (U+0242)",
    text = "ɂ"
  }, {
    item = "ˀ",
    subText = "Glottal Stop, Modifier Letter (U+02C0)",
    text = "ˀ"
  }, {
    item = "ˁ",
    subText = "Glottal Stop, Modifier Letter Reversed (U+02C1)",
    text = "ˁ"
  }, {
    item = "ˤ",
    subText = "Glottal Stop, Modifier Letter Small Reversed (U+02E4)",
    text = "ˤ"
  }, {
    item = "⸘",
    subText = "Gnaborretni (U+2E18)",
    text = "⸘"
  }, {
    item = "⚆",
    subText = "Go Markers (U+2686)",
    text = "⚆"
  }, {
    item = "🐐",
    subText = "Goat (U+1F410)",
    text = "🐐"
  }, {
    item = "👺",
    subText = "Goblin, Japanese (U+1F47A)",
    text = "👺"
  }, {
    item = "🥇",
    subText = "Gold Medal (U+1F947)",
    text = "🥇"
  }, {
    item = "ᛮ",
    subText = "Golden Numbers, Runic (U+16EE)",
    text = "ᛮ"
  }, {
    item = "⛳",
    subText = "Golf Course (U+26F3)",
    text = "⛳"
  }, {
    item = "𐌰",
    subText = "Gothic (U+10330)",
    text = "𐌰"
  }, {
    item = "𑌀",
    subText = "Grantha (U+11300)",
    text = "𑌀"
  }, {
    item = "͏",
    subText = "Grapheme Joiner, Combining (U+034F)",
    text = "͏"
  }, {
    item = "⎷",
    subText = "Graphic Characters, Terminal (U+23B7)",
    text = "⎷"
  }, {
    item = "▖",
    subText = "Graphic Characters, Terminal (U+2596)",
    text = "▖"
  }, {
    item = "␀",
    subText = "Graphic Pictures For Control Codes (U+2400)",
    text = "␀"
  }, {
    item = "⍽",
    subText = "Graphics For Control Codes (U+237D)",
    text = "⍽"
  }, {
    item = "◰",
    subText = "Graphics, Quadrant Control Code (U+25F0)",
    text = "◰"
  }, {
    item = "`",
    subText = "Grave Accent (U+0060)",
    text = "`"
  }, {
    item = "̖",
    subText = "Grave Accent Below, Combining (U+0316)",
    text = "̖"
  }, {
    item = "̀",
    subText = "Grave Accent, Combining (U+0300)",
    text = "̀"
  }, {
    item = "̏",
    subText = "Grave Accent, Combining Double (U+030F)",
    text = "̏"
  }, {
    item = "ˋ",
    subText = "Grave Accent, Modifier Letter (U+02CB)",
    text = "ˋ"
  }, {
    item = "ˎ",
    subText = "Grave Accent, Modifier Letter Low (U+02CE)",
    text = "ˎ"
  }, {
    item = "`",
    subText = "Grave Accent, Spacing (U+0060)",
    text = "`"
  }, {
    item = "˟",
    subText = "Grave Accent, Swedish (U+02DF)",
    text = "˟"
  }, {
    item = "̀",
    subText = "Grave Tone Mark, Combining (U+0340)",
    text = "̀"
  }, {
    item = "⛼",
    subText = "Graveyard (U+26FC)",
    text = "⛼"
  }, {
    item = "≥",
    subText = "Greater-Than Or Equal To (U+2265)",
    text = "≥"
  }, {
    item = ">",
    subText = "Greater-Than Sign (U+003E)",
    text = ">"
  }, {
    item = "≫",
    subText = "Greater-Than, Much (U+226B)",
    text = "≫"
  }, {
    item = "⋙",
    subText = "Greater-Than, Very Much (U+22D9)",
    text = "⋙"
  }, {
    item = "Ͱ",
    subText = "Greek (U+0370)",
    text = "Ͱ"
  }, {
    item = "Α",
    subText = "Greek Alphabet (U+0391)",
    text = "Α"
  }, {
    item = "·",
    subText = "Greek Ano Teleia (U+00B7)",
    text = "·"
  }, {
    item = "Ϙ",
    subText = "Greek Archaic Letters (U+03D8)",
    text = "Ϙ"
  }, {
    item = "ϐ",
    subText = "Greek Beta Symbol (U+03D0)",
    text = "ϐ"
  }, {
    item = "Α",
    subText = "Greek Capital Letters (U+0391)",
    text = "Α"
  }, {
    item = "🞡",
    subText = "Greek Crosses (U+1F7A1)",
    text = "🞡"
  }, {
    item = "₯",
    subText = "Greek Currency (U+20AF)",
    text = "₯"
  }, {
    item = "̔",
    subText = "Greek Dasia (U+0314)",
    text = "̔"
  }, {
    item = "̈",
    subText = "Greek Dialytika (U+0308)",
    text = "̈"
  }, {
    item = "̈́",
    subText = "Greek Dialytika Tonos, Combining (U+0344)",
    text = "̈́"
  }, {
    item = "‿",
    subText = "Greek Enotikon (U+203F)",
    text = "‿"
  }, {
    item = "ἀ",
    subText = "Greek Extended (U+1F00)",
    text = "ἀ"
  }, {
    item = "ͅ",
    subText = "Greek Iota Subscript (U+0345)",
    text = "ͅ"
  }, {
    item = "̓",
    subText = "Greek Koronis, Combining (U+0343)",
    text = "̓"
  }, {
    item = "ℼ",
    subText = "Greek Letters, Double-Struck (U+213C)",
    text = "ℼ"
  }, {
    item = "ϵ",
    subText = "Greek Lunate Epsilon Symbol (U+03F5)",
    text = "ϵ"
  }, {
    item = "ϲ",
    subText = "Greek Lunate Sigma Symbol (U+03F2)",
    text = "ϲ"
  }, {
    item = "𝚨",
    subText = "Greek Mathematical Symbols (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝚨",
    subText = "Greek Mathematical Symbols, Bold (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝜜",
    subText = "Greek Mathematical Symbols, Bold Italic (U+1D71C)",
    text = "𝜜"
  }, {
    item = "𝛢",
    subText = "Greek Mathematical Symbols, Italic (U+1D6E2)",
    text = "𝛢"
  }, {
    item = "𝝖",
    subText = "Greek Mathematical Symbols, Sans-Serif Bold (U+1D756)",
    text = "𝝖"
  }, {
    item = "𝞐",
    subText = "Greek Mathematical Symbols, Sans-Serif Bold Italic (U+1D790)",
    text = "𝞐"
  }, {
    item = "·",
    subText = "Greek Middle Dot (U+00B7)",
    text = "·"
  }, {
    item = "𝈀",
    subText = "Greek Musical Notation, Ancient (U+1D200)",
    text = "𝈀"
  }, {
    item = "ͅ",
    subText = "Greek Non-Spacing Iota Below (U+0345)",
    text = "ͅ"
  }, {
    item = "𐅀",
    subText = "Greek Numbers, Ancient (U+10140)",
    text = "𐅀"
  }, {
    item = "𝔖",
    subText = "Greek Old Testament (U+1D516)",
    text = "𝔖"
  }, {
    item = "́",
    subText = "Greek Oxia (U+0301)",
    text = "́"
  }, {
    item = "⁙",
    subText = "Greek Pentonkion (U+2059)",
    text = "⁙"
  }, {
    item = "͂",
    subText = "Greek Perispomeni, Combining (U+0342)",
    text = "͂"
  }, {
    item = "ϕ",
    subText = "Greek Phi Symbol (U+03D5)",
    text = "ϕ"
  }, {
    item = "ϖ",
    subText = "Greek Pi Symbol (U+03D6)",
    text = "ϖ"
  }, {
    item = "̓",
    subText = "Greek Psili (U+0313)",
    text = "̓"
  }, {
    item = "ʹ",
    subText = "Greek Punctuation And Signs (U+0374)",
    text = "ʹ"
  }, {
    item = ";",
    subText = "Greek Question Mark (U+003B)",
    text = ";"
  }, {
    item = ";",
    subText = "Greek Question Mark (U+037E)",
    text = ";"
  }, {
    item = "϶",
    subText = "Greek Reversed Lunate Epsilon Symbol (U+03F6)",
    text = "϶"
  }, {
    item = "̔",
    subText = "Greek Rough Breathing Mark (U+0314)",
    text = "̔"
  }, {
    item = "℩",
    subText = "Greek Small Letter Iota, Turned (U+2129)",
    text = "℩"
  }, {
    item = "ϲ",
    subText = "Greek Small Letter Lunate Sigma (U+03F2)",
    text = "ϲ"
  }, {
    item = "π",
    subText = "Greek Small Letter Pi (U+03C0)",
    text = "π"
  }, {
    item = "α",
    subText = "Greek Small Letters (U+03B1)",
    text = "α"
  }, {
    item = "̓",
    subText = "Greek Smooth Breathing Mark (U+0313)",
    text = "̓"
  }, {
    item = "⸎",
    subText = "Greek Textual Symbols, Ancient (U+2E0E)",
    text = "⸎"
  }, {
    item = "ϑ",
    subText = "Greek Theta Symbol (U+03D1)",
    text = "ϑ"
  }, {
    item = "́",
    subText = "Greek Tonos (U+0301)",
    text = "́"
  }, {
    item = "̀",
    subText = "Greek Varia (U+0300)",
    text = "̀"
  }, {
    item = "ϐ",
    subText = "Greek Variant Letterforms (U+03D0)",
    text = "ϐ"
  }, {
    item = "̆",
    subText = "Greek Vrachy (U+0306)",
    text = "̆"
  }, {
    item = "ͅ",
    subText = "Greek Ypogegrammeni, Combining (U+0345)",
    text = "ͅ"
  }, {
    item = "͂",
    subText = "Greek, Diacritics For (U+0342)",
    text = "͂"
  }, {
    item = "ἀ",
    subText = "Greek, Precomposed Polytonic (U+1F00)",
    text = "ἀ"
  }, {
    item = "𝇐",
    subText = "Gregorian Musical Symbols (U+1D1D0)",
    text = "𝇐"
  }, {
    item = "⏚",
    subText = "Ground, Earth (U+23DA)",
    text = "⏚"
  }, {
    item = "⇰",
    subText = "Group Lock (U+21F0)",
    text = "⇰"
  }, {
    item = "⇨",
    subText = "Group Select (Iso 9995-7) (U+21E8)",
    text = "⇨"
  }, {
    item = "",
    subText = "Group Separator (U+001D)",
    text = ""
  }, {
    item = "␝",
    subText = "Group Separator, Symbol For (U+241D)",
    text = "␝"
  }, {
    item = "₲",
    subText = "Guarani Sign (U+20B2)",
    text = "₲"
  }, {
    item = "",
    subText = "Guarded Area, End Of (U+0097)",
    text = ""
  }, {
    item = "",
    subText = "Guarded Area, Start Of (U+0096)",
    text = ""
  }, {
    item = "«",
    subText = "Guillemet, Left Pointing (U+00AB)",
    text = "«"
  }, {
    item = "‹",
    subText = "Guillemet, Left Pointing Single (U+2039)",
    text = "‹"
  }, {
    item = "»",
    subText = "Guillemet, Right Pointing (U+00BB)",
    text = "»"
  }, {
    item = "›",
    subText = "Guillemet, Right Pointing Single (U+203A)",
    text = "›"
  }, {
    item = "઀",
    subText = "Gujarati (U+0A80)",
    text = "઀"
  }, {
    item = "ક",
    subText = "Gujarati Consonants (U+0A95)",
    text = "ક"
  }, {
    item = "ા",
    subText = "Gujarati Dependent Vowel Signs (U+0ABE)",
    text = "ા"
  }, {
    item = "૦",
    subText = "Gujarati Digits (U+0AE6)",
    text = "૦"
  }, {
    item = "અ",
    subText = "Gujarati Independent Vowels (U+0A85)",
    text = "અ"
  }, {
    item = "૱",
    subText = "Gujarati Rupee Sign (U+0AF1)",
    text = "૱"
  }, {
    item = "𑵠",
    subText = "Gunjala Gondi (U+11D60)",
    text = "𑵠"
  }, {
    item = "਀",
    subText = "Gurmukhi (U+0A00)",
    text = "਀"
  }, {
    item = "ੱ",
    subText = "Gurmukhi Addak (U+0A71)",
    text = "ੱ"
  }, {
    item = "ਕ",
    subText = "Gurmukhi Consonants (U+0A15)",
    text = "ਕ"
  }, {
    item = "ਾ",
    subText = "Gurmukhi Dependent Vowel Signs (U+0A3E)",
    text = "ਾ"
  }, {
    item = "੦",
    subText = "Gurmukhi Digits (U+0A66)",
    text = "੦"
  }, {
    item = "ੴ",
    subText = "Gurmukhi Ek Onkar (U+0A74)",
    text = "ੴ"
  }, {
    item = "ਅ",
    subText = "Gurmukhi Independent Vowels (U+0A05)",
    text = "ਅ"
  }, {
    item = "☬",
    subText = "Gurmukhi Khanda (U+262C)",
    text = "☬"
  }, {
    item = "ੰ",
    subText = "Gurmukhi Tippi (U+0A70)",
    text = "ੰ"
  }, {
    item = "ḫ",
    subText = "H With Breve Below, Latin Small Letter (U+1E2B)",
    text = "ḫ"
  }, {
    item = "ȟ",
    subText = "H With Caron, Latin Small Letter (U+021F)",
    text = "ȟ"
  }, {
    item = "ḩ",
    subText = "H With Cedilla, Latin Small Letter (U+1E29)",
    text = "ḩ"
  }, {
    item = "ĥ",
    subText = "H With Circumflex, Latin Small Letter (U+0125)",
    text = "ĥ"
  }, {
    item = "ḧ",
    subText = "H With Diaeresis, Latin Small Letter (U+1E27)",
    text = "ḧ"
  }, {
    item = "ḣ",
    subText = "H With Dot Above, Latin Small Letter (U+1E23)",
    text = "ḣ"
  }, {
    item = "ḥ",
    subText = "H With Dot Below, Latin Small Letter (U+1E25)",
    text = "ḥ"
  }, {
    item = "ʮ",
    subText = "H With Fishhook, Latin Small Letter Turned (U+02AE)",
    text = "ʮ"
  }, {
    item = "ɦ",
    subText = "H With Hook, Latin Small Letter (U+0266)",
    text = "ɦ"
  }, {
    item = "ẖ",
    subText = "H With Line Below, Latin Small Letter (U+1E96)",
    text = "ẖ"
  }, {
    item = "ħ",
    subText = "H With Stroke, Latin Small Letter (U+0127)",
    text = "ħ"
  }, {
    item = "ℌ",
    subText = "H, Black-Letter Capital (U+210C)",
    text = "ℌ"
  }, {
    item = "ͪ",
    subText = "H, Combining Latin Small Letter (U+036A)",
    text = "ͪ"
  }, {
    item = "ℍ",
    subText = "H, Double-Struck Capital (U+210D)",
    text = "ℍ"
  }, {
    item = "ʜ",
    subText = "H, Latin Letter Small Capital (U+029C)",
    text = "ʜ"
  }, {
    item = "ɥ",
    subText = "H, Latin Small Letter Turned (U+0265)",
    text = "ɥ"
  }, {
    item = "ₕ",
    subText = "H, Latin Subscript Small Letter (U+2095)",
    text = "ₕ"
  }, {
    item = "ʰ",
    subText = "H, Modifier Letter Small (U+02B0)",
    text = "ʰ"
  }, {
    item = "ℋ",
    subText = "H, Script Capital (U+210B)",
    text = "ℋ"
  }, {
    item = "̌",
    subText = "Hacek, Combining (U+030C)",
    text = "̌"
  }, {
    item = "ˇ",
    subText = "Hacek, Modifier Letter (U+02C7)",
    text = "ˇ"
  }, {
    item = " ",
    subText = "Hair Space (U+200A)",
    text = " "
  }, {
    item = "्",
    subText = "Halant (U+094D)",
    text = "्"
  }, {
    item = "྄",
    subText = "Halanta, Tibetan Mark (U+0F84)",
    text = "྄"
  }, {
    item = "〿",
    subText = "Half Fill Space, Ideographic (U+303F)",
    text = "〿"
  }, {
    item = "⌡",
    subText = "Half Integral, Bottom (U+2321)",
    text = "⌡"
  }, {
    item = "⌠",
    subText = "Half Integral, Top (U+2320)",
    text = "⌠"
  }, {
    item = "︠",
    subText = "Half Marks, Combining (U+FE20)",
    text = "︠"
  }, {
    item = "͑",
    subText = "Half Ring Above, Combining Left (U+0351)",
    text = "͑"
  }, {
    item = "͗",
    subText = "Half Ring Above, Combining Right (U+0357)",
    text = "͗"
  }, {
    item = "̜",
    subText = "Half Ring Below, Combining Left (U+031C)",
    text = "̜"
  }, {
    item = "̹",
    subText = "Half Ring Below, Combining Right (U+0339)",
    text = "̹"
  }, {
    item = "ՙ",
    subText = "Half Ring, Armenian Modifier Letter Left (U+0559)",
    text = "ՙ"
  }, {
    item = "՚",
    subText = "Half Ring, Armenian Modifier Letter Right (U+055A)",
    text = "՚"
  }, {
    item = "˓",
    subText = "Half Ring, Modifier Letter Centred Left (U+02D3)",
    text = "˓"
  }, {
    item = "ʿ",
    subText = "Half Ring, Modifier Letter Left (U+02BF)",
    text = "ʿ"
  }, {
    item = "ˑ",
    subText = "Half Triangular Colon, Modifier Letter (U+02D1)",
    text = "ˑ"
  }, {
    item = "½",
    subText = "Half, Vulgar Fraction One (U+00BD)",
    text = "½"
  }, {
    item = "＀",
    subText = "Halfwidth And Fullwidth Forms (U+FF00)",
    text = "＀"
  }, {
    item = "｡",
    subText = "Halfwidth Cjk Punctuation (U+FF61)",
    text = "｡"
  }, {
    item = "｡",
    subText = "Halfwidth Japanese Katakana Variants (U+FF61)",
    text = "｡"
  }, {
    item = "ﾠ",
    subText = "Halfwidth Korean Hangul Variants (U+FFA0)",
    text = "ﾠ"
  }, {
    item = "￨",
    subText = "Halfwidth Symbol Variants (U+FFE8)",
    text = "￨"
  }, {
    item = "▽",
    subText = "Hamilton Operator (U+25BD)",
    text = "▽"
  }, {
    item = "⚒",
    subText = "Hammer And Pick (U+2692)",
    text = "⚒"
  }, {
    item = "☭",
    subText = "Hammer And Sickle (U+262D)",
    text = "☭"
  }, {
    item = "🐹",
    subText = "Hamster Face (U+1F439)",
    text = "🐹"
  }, {
    item = "ۀ",
    subText = "Hamzah On Ha, Arabic Letter (U+06C0)",
    text = "ۀ"
  }, {
    item = "一",
    subText = "Han Ideographs (U+4E00)",
    text = "一"
  }, {
    item = "゚",
    subText = "Han-Daku-On, Combining Japanese (U+309A)",
    text = "゚"
  }, {
    item = "゜",
    subText = "Han-Daku-On, Japanese (U+309C)",
    text = "゜"
  }, {
    item = "👆",
    subText = "Hand Symbols (U+1F446)",
    text = "👆"
  }, {
    item = "🖎",
    subText = "Hand Symbols (U+1F58E)",
    text = "🖎"
  }, {
    item = "🤘",
    subText = "Hand Symbols (U+1F918)",
    text = "🤘"
  }, {
    item = "☚",
    subText = "Hand Symbols, Pointing (U+261A)",
    text = "☚"
  }, {
    item = "👆",
    subText = "Hand, Index Finger Pointing (U+1F446)",
    text = "👆"
  }, {
    item = "✋",
    subText = "Hand, Raised (U+270B)",
    text = "✋"
  }, {
    item = "🤚",
    subText = "Hand, Raised Back Of (U+1F91A)",
    text = "🤚"
  }, {
    item = "✌",
    subText = "Hand, Victory (U+270C)",
    text = "✌"
  }, {
    item = "✍",
    subText = "Hand, Writing (U+270D)",
    text = "✍"
  }, {
    item = "🤝",
    subText = "Handshake (U+1F91D)",
    text = "🤝"
  }, {
    item = "ㅥ",
    subText = "Hangul Archaic Letters, Korean (U+3165)",
    text = "ㅥ"
  }, {
    item = "ᅟ",
    subText = "Hangul Choseong Filler (U+115F)",
    text = "ᅟ"
  }, {
    item = "㄰",
    subText = "Hangul Compatibility Jamo, Korean (U+3130)",
    text = "㄰"
  }, {
    item = "ㅤ",
    subText = "Hangul Filler (U+3164)",
    text = "ㅤ"
  }, {
    item = "ᄀ",
    subText = "Hangul Jamo Combining Alphabet, Korean (U+1100)",
    text = "ᄀ"
  }, {
    item = "ꥠ",
    subText = "Hangul Jamo Extended-A, Korean (U+A960)",
    text = "ꥠ"
  }, {
    item = "ힰ",
    subText = "Hangul Jamo Extended-B, Korean (U+D7B0)",
    text = "ힰ"
  }, {
    item = "ᅠ",
    subText = "Hangul Jungseong Filler (U+1160)",
    text = "ᅠ"
  }, {
    item = "㉠",
    subText = "Hangul Letters, Circled Korean (U+3260)",
    text = "㉠"
  }, {
    item = "㈀",
    subText = "Hangul Letters, Parenthesized Korean (U+3200)",
    text = "㈀"
  }, {
    item = "가",
    subText = "Hangul Syllables Area, Korean (U+AC00)",
    text = "가"
  }, {
    item = "㉮",
    subText = "Hangul Syllables, Circled Korean (U+326E)",
    text = "㉮"
  }, {
    item = "㈎",
    subText = "Hangul Syllables, Parenthesized Korean (U+320E)",
    text = "㈎"
  }, {
    item = "ﾠ",
    subText = "Hangul Variants, Halfwidth Korean (U+FFA0)",
    text = "ﾠ"
  }, {
    item = "〡",
    subText = "Hangzhou Numerals (U+3021)",
    text = "〡"
  }, {
    item = "𐴀",
    subText = "Hanifi Rohingya (U+10D00)",
    text = "𐴀"
  }, {
    item = "ᜠ",
    subText = "Hanunoo (U+1720)",
    text = "ᜠ"
  }, {
    item = "ً",
    subText = "Harakat, Arabic (U+064B)",
    text = "ً"
  }, {
    item = "⚓",
    subText = "Harbor Symbol (U+2693)",
    text = "⚓"
  }, {
    item = "👷",
    subText = "Hardhat (U+1F477)",
    text = "👷"
  }, {
    item = "⃐",
    subText = "Harpoon Above, Combining Left (U+20D0)",
    text = "⃐"
  }, {
    item = "⃑",
    subText = "Harpoon Above, Combining Right (U+20D1)",
    text = "⃑"
  }, {
    item = "⃭",
    subText = "Harpoon With Barb Downwards, Combining Leftwards (U+20ED)",
    text = "⃭"
  }, {
    item = "⃬",
    subText = "Harpoon With Barb Downwards, Combining Rightwards (U+20EC)",
    text = "⃬"
  }, {
    item = "↼",
    subText = "Harpoons (U+21BC)",
    text = "↼"
  }, {
    item = "⥊",
    subText = "Harpoons, Miscellaneous (U+294A)",
    text = "⥊"
  }, {
    item = "՞",
    subText = "Hartsakan Nshan, Armenian (U+055E)",
    text = "՞"
  }, {
    item = "্",
    subText = "Hasant, Bengali (U+09CD)",
    text = "্"
  }, {
    item = "꠆",
    subText = "Hasanta, Syloti Nagri Sign (U+A806)",
    text = "꠆"
  }, {
    item = "#",
    subText = "Hash (U+0023)",
    text = "#"
  }, {
    item = "̂",
    subText = "Hat (U+0302)",
    text = "̂"
  }, {
    item = "∩",
    subText = "Hat (U+2229)",
    text = "∩"
  }, {
    item = "𐣠",
    subText = "Hatran (U+108E0)",
    text = "𐣠"
  }, {
    item = "☺",
    subText = "Have A Nice Day! (U+263A)",
    text = "☺"
  }, {
    item = "☠",
    subText = "Hazard Dingbats (U+2620)",
    text = "☠"
  }, {
    item = "༁",
    subText = "Head Marks, Tibetan (U+0F01)",
    text = "༁"
  }, {
    item = "",
    subText = "Heading, Start Of (U+0001)",
    text = ""
  }, {
    item = "␁",
    subText = "Heading, Symbol For Start Of (U+2401)",
    text = "␁"
  }, {
    item = "🎧",
    subText = "Headphone (U+1F3A7)",
    text = "🎧"
  }, {
    item = "⛼",
    subText = "Headstone Graveyard Symbol (U+26FC)",
    text = "⛼"
  }, {
    item = "☙",
    subText = "Heart Bullet, Reversed Rotated Floral (U+2619)",
    text = "☙"
  }, {
    item = "❣",
    subText = "Heart Dingbats (U+2763)",
    text = "❣"
  }, {
    item = "❣",
    subText = "Heart Ornaments (U+2763)",
    text = "❣"
  }, {
    item = "💓",
    subText = "Heart Symbols (U+1F493)",
    text = "💓"
  }, {
    item = "🖤",
    subText = "Heart, Black (U+1F5A4)",
    text = "🖤"
  }, {
    item = "🤍",
    subText = "Heart, White (U+1F90D)",
    text = "🤍"
  }, {
    item = "✘",
    subText = "Heavy Ballot X (U+2718)",
    text = "✘"
  }, {
    item = "✔",
    subText = "Heavy Check Mark (U+2714)",
    text = "✔"
  }, {
    item = "❢",
    subText = "Heavy Exclamation Mark Ornament (U+2762)",
    text = "❢"
  }, {
    item = "✖",
    subText = "Heavy Multiplication X (U+2716)",
    text = "✖"
  }, {
    item = "❈",
    subText = "Heavy Sparkle (U+2748)",
    text = "❈"
  }, {
    item = "֐",
    subText = "Hebrew (U+0590)",
    text = "֐"
  }, {
    item = "א",
    subText = "Hebrew Alphabet (U+05D0)",
    text = "א"
  }, {
    item = "֑",
    subText = "Hebrew Cantillation Marks (U+0591)",
    text = "֑"
  }, {
    item = "ℵ",
    subText = "Hebrew Letterlike Mathematical Symbols (U+2135)",
    text = "ℵ"
  }, {
    item = "ְ",
    subText = "Hebrew Points And Punctuation (U+05B0)",
    text = "ְ"
  }, {
    item = "יִ",
    subText = "Hebrew Presentation Forms (U+FB1D)",
    text = "יִ"
  }, {
    item = "❧",
    subText = "Hedera (U+2767)",
    text = "❧"
  }, {
    item = "ۀ",
    subText = "Heh With Yeh Above, Arabic Letter (U+06C0)",
    text = "ۀ"
  }, {
    item = "⎈",
    subText = "Helm Symbol (U+2388)",
    text = "⎈"
  }, {
    item = "⛑",
    subText = "Helmet With White Cross (U+26D1)",
    text = "⛑"
  }, {
    item = "𛀂",
    subText = "Hentaigana (U+1B002)",
    text = "𛀂"
  }, {
    item = "𛄀",
    subText = "Hentaigana (U+1B100)",
    text = "𛄀"
  }, {
    item = "⚚",
    subText = "Hermes, Staff Of (U+269A)",
    text = "⚚"
  }, {
    item = "⊹",
    subText = "Hermitian Conjugate Matrix (U+22B9)",
    text = "⊹"
  }, {
    item = "䷀",
    subText = "Hexagram Symbols, Yijing / I Ching (U+4DC0)",
    text = "䷀"
  }, {
    item = "𔐀",
    subText = "Hieroglyphs, Anatolian (U+14400)",
    text = "𔐀"
  }, {
    item = "𓀀",
    subText = "Hieroglyphs, Egyptian (U+13000)",
    text = "𓀀"
  }, {
    item = "�",
    subText = "High Surrogates (U+D800)",
    text = "�"
  }, {
    item = "⚡",
    subText = "High Voltage Sign (U+26A1)",
    text = "⚡"
  }, {
    item = "‟",
    subText = "High-Reversed-9 Quotation Mark, Double (U+201F)",
    text = "‟"
  }, {
    item = "‛",
    subText = "High-Reversed-9 Quotation Mark, Single (U+201B)",
    text = "‛"
  }, {
    item = "≻",
    subText = "Higher Rank Than (U+227B)",
    text = "≻"
  }, {
    item = "ℌ",
    subText = "Hilbert Space (U+210C)",
    text = "ℌ"
  }, {
    item = "぀",
    subText = "Hiragana (U+3040)",
    text = "぀"
  }, {
    item = "ゝ",
    subText = "Hiragana Iteration Mark (U+309D)",
    text = "ゝ"
  }, {
    item = "ゕ",
    subText = "Hiragana Letter Small Ka (U+3095)",
    text = "ゕ"
  }, {
    item = "ゖ",
    subText = "Hiragana Letter Small Ke (U+3096)",
    text = "ゖ"
  }, {
    item = "ゕ",
    subText = "Hiragana Supplement (U+3095)",
    text = "ゕ"
  }, {
    item = "ゞ",
    subText = "Hiragana Voiced Iteration Mark (U+309E)",
    text = "ゞ"
  }, {
    item = "▮",
    subText = "Histogram Marker (U+25AE)",
    text = "▮"
  }, {
    item = "⛬",
    subText = "Historic Site (U+26EC)",
    text = "⛬"
  }, {
    item = "𞄀",
    subText = "Hmong, Nyiakeng Puachue (U+1E100)",
    text = "𞄀"
  }, {
    item = "𖬀",
    subText = "Hmong, Pahawh (U+16B00)",
    text = "𖬀"
  }, {
    item = "⍥",
    subText = "Holler (U+2365)",
    text = "⍥"
  }, {
    item = "↸",
    subText = "Home (U+21B8)",
    text = "↸"
  }, {
    item = "⇱",
    subText = "Home (U+21F1)",
    text = "⇱"
  }, {
    item = "∻",
    subText = "Homothetic (U+223B)",
    text = "∻"
  }, {
    item = "͋",
    subText = "Homothetic Above, Combining (U+034B)",
    text = "͋"
  }, {
    item = "🐝",
    subText = "Honeybee (U+1F41D)",
    text = "🐝"
  }, {
    item = "ؐ",
    subText = "Honorifics, Arabic (U+0610)",
    text = "ؐ"
  }, {
    item = "̉",
    subText = "Hook Above, Combining (U+0309)",
    text = "̉"
  }, {
    item = "̡",
    subText = "Hook Below, Combining Palatalized (U+0321)",
    text = "̡"
  }, {
    item = "̢",
    subText = "Hook Below, Combining Retroflex (U+0322)",
    text = "̢"
  }, {
    item = "˞",
    subText = "Hook, Modifier Letter Rhotic (U+02DE)",
    text = "˞"
  }, {
    item = "̨",
    subText = "Hook, Nasal (U+0328)",
    text = "̨"
  }, {
    item = "⍤",
    subText = "Hoot (U+2364)",
    text = "⍤"
  }, {
    item = "―",
    subText = "Horizontal Bar (U+2015)",
    text = "―"
  }, {
    item = "⎴",
    subText = "Horizontal Brackets (U+23B4)",
    text = "⎴"
  }, {
    item = "…",
    subText = "Horizontal Ellipsis (U+2026)",
    text = "…"
  }, {
    item = "⋯",
    subText = "Horizontal Ellipsis, Midline (U+22EF)",
    text = "⋯"
  }, {
    item = "⎺",
    subText = "Horizontal Scan Lines (U+23BA)",
    text = "⎺"
  }, {
    item = "\t",
    subText = "Horizontal Tabulation (U+0009)",
    text = "\t"
  }, {
    item = "␉",
    subText = "Horizontal Tabulation, Symbol For (U+2409)",
    text = "␉"
  }, {
    item = "̛",
    subText = "Horn, Combining (U+031B)",
    text = "̛"
  }, {
    item = "🐎",
    subText = "Horse (U+1F40E)",
    text = "🐎"
  }, {
    item = "🐴",
    subText = "Horse Face (U+1F434)",
    text = "🐴"
  }, {
    item = "⛨",
    subText = "Hospital (U+26E8)",
    text = "⛨"
  }, {
    item = "☕",
    subText = "Hot Beverage (U+2615)",
    text = "☕"
  }, {
    item = "🌭",
    subText = "Hot Dog (U+1F32D)",
    text = "🌭"
  }, {
    item = "♨",
    subText = "Hot Springs (U+2668)",
    text = "♨"
  }, {
    item = "⌛",
    subText = "Hourglass (U+231B)",
    text = "⌛"
  }, {
    item = "⏳",
    subText = "Hourglass With Flowing Sand (U+23F3)",
    text = "⏳"
  }, {
    item = "⧗",
    subText = "Hourglass, Black (U+29D7)",
    text = "⧗"
  }, {
    item = "㍘",
    subText = "Hours, Ideographic Telegraph Symbols For (U+3358)",
    text = "㍘"
  }, {
    item = "⌂",
    subText = "House (U+2302)",
    text = "⌂"
  }, {
    item = "₴",
    subText = "Hryvnia Sign (U+20B4)",
    text = "₴"
  }, {
    item = "\t",
    subText = "Ht (U+0009)",
    text = "\t"
  }, {
    item = "𐲀",
    subText = "Hungarian, Old (U+10C80)",
    text = "𐲀"
  }, {
    item = "ƕ",
    subText = "Hv, Latin Small Letter (U+0195)",
    text = "ƕ"
  }, {
    item = "Ƕ",
    subText = "Hwair, Latin Capital Letter (U+01F6)",
    text = "Ƕ"
  }, {
    item = "‐",
    subText = "Hyphen (U+2010)",
    text = "‐"
  }, {
    item = "⁃",
    subText = "Hyphen Bullet (U+2043)",
    text = "⁃"
  }, {
    item = "-",
    subText = "Hyphen Or Minus Sign (U+002D)",
    text = "-"
  }, {
    item = "֊",
    subText = "Hyphen, Armenian (U+058A)",
    text = "֊"
  }, {
    item = "­",
    subText = "Hyphen, Discretionary (U+00AD)",
    text = "­"
  }, {
    item = "⹀",
    subText = "Hyphen, Double (U+2E40)",
    text = "⹀"
  }, {
    item = "゠",
    subText = "Hyphen, Katakana-Hiragana Double (U+30A0)",
    text = "゠"
  }, {
    item = "᠆",
    subText = "Hyphen, Mongolian Todo Soft (U+1806)",
    text = "᠆"
  }, {
    item = "‑",
    subText = "Hyphen, Non-Breaking (U+2011)",
    text = "‑"
  }, {
    item = "͜",
    subText = "Hyphen, Papyrological (U+035C)",
    text = "͜"
  }, {
    item = "­",
    subText = "Hyphen, Soft (U+00AD)",
    text = "­"
  }, {
    item = "-",
    subText = "Hyphen-Minus (U+002D)",
    text = "-"
  }, {
    item = "‧",
    subText = "Hyphenation Point (U+2027)",
    text = "‧"
  }, {
    item = "-",
    subText = "Hyphus (U+002D)",
    text = "-"
  }, {
    item = "⎎",
    subText = "Hysteresis Symbol (U+238E)",
    text = "⎎"
  }, {
    item = "Ɨ",
    subText = "I Bar, Latin Capital Letter (U+0197)",
    text = "Ɨ"
  }, {
    item = "䷀",
    subText = "I Ching / Yijing Hexagram Symbols (U+4DC0)",
    text = "䷀"
  }, {
    item = "⚊",
    subText = "I Ching / Yijing Monogram And Digram Symbols (U+268A)",
    text = "⚊"
  }, {
    item = "☰",
    subText = "I Ching / Yijing Trigram Symbols (U+2630)",
    text = "☰"
  }, {
    item = "İ",
    subText = "I Dot, Latin Capital Letter (U+0130)",
    text = "İ"
  }, {
    item = "🤟",
    subText = "I Love You Hand Sign (U+1F91F)",
    text = "🤟"
  }, {
    item = "Í",
    subText = "I With Acute, Latin Capital Letter (U+00CD)",
    text = "Í"
  }, {
    item = "í",
    subText = "I With Acute, Latin Small Letter (U+00ED)",
    text = "í"
  }, {
    item = "ĭ",
    subText = "I With Breve, Latin Small Letter (U+012D)",
    text = "ĭ"
  }, {
    item = "ǐ",
    subText = "I With Caron, Latin Small Letter (U+01D0)",
    text = "ǐ"
  }, {
    item = "Î",
    subText = "I With Circumflex, Latin Capital Letter (U+00CE)",
    text = "Î"
  }, {
    item = "î",
    subText = "I With Circumflex, Latin Small Letter (U+00EE)",
    text = "î"
  }, {
    item = "Ï",
    subText = "I With Diaeresis, Latin Capital Letter (U+00CF)",
    text = "Ï"
  }, {
    item = "ï",
    subText = "I With Diaeresis, Latin Small Letter (U+00EF)",
    text = "ï"
  }, {
    item = "İ",
    subText = "I With Dot Above, Latin Capital Letter (U+0130)",
    text = "İ"
  }, {
    item = "ị",
    subText = "I With Dot Below, Latin Small Letter (U+1ECB)",
    text = "ị"
  }, {
    item = "ȉ",
    subText = "I With Double Grave, Latin Small Letter (U+0209)",
    text = "ȉ"
  }, {
    item = "Ì",
    subText = "I With Grave, Latin Capital Letter (U+00CC)",
    text = "Ì"
  }, {
    item = "ì",
    subText = "I With Grave, Latin Small Letter (U+00EC)",
    text = "ì"
  }, {
    item = "ỉ",
    subText = "I With Hook Above, Latin Small Letter (U+1EC9)",
    text = "ỉ"
  }, {
    item = "ȋ",
    subText = "I With Inverted Breve, Latin Small Letter (U+020B)",
    text = "ȋ"
  }, {
    item = "ī",
    subText = "I With Macron, Latin Small Letter (U+012B)",
    text = "ī"
  }, {
    item = "į",
    subText = "I With Ogonek, Latin Small Letter (U+012F)",
    text = "į"
  }, {
    item = "Ɨ",
    subText = "I With Stroke, Latin Capital Letter (U+0197)",
    text = "Ɨ"
  }, {
    item = "ɨ",
    subText = "I With Stroke, Latin Small Letter (U+0268)",
    text = "ɨ"
  }, {
    item = "ḭ",
    subText = "I With Tilde Below, Latin Small Letter (U+1E2D)",
    text = "ḭ"
  }, {
    item = "ĩ",
    subText = "I With Tilde, Latin Small Letter (U+0129)",
    text = "ĩ"
  }, {
    item = "ℑ",
    subText = "I, Black-Letter Capital (U+2111)",
    text = "ℑ"
  }, {
    item = "ͥ",
    subText = "I, Combining Latin Small Letter (U+0365)",
    text = "ͥ"
  }, {
    item = "ⅈ",
    subText = "I, Double-Struck Italic Small (U+2148)",
    text = "ⅈ"
  }, {
    item = "ɪ",
    subText = "I, Latin Letter Small Capital (U+026A)",
    text = "ɪ"
  }, {
    item = "ı",
    subText = "I, Latin Small Letter Dotless (U+0131)",
    text = "ı"
  }, {
    item = "ᴉ",
    subText = "I, Latin Small Letter Turned (U+1D09)",
    text = "ᴉ"
  }, {
    item = "ᵢ",
    subText = "I, Latin Subscript Small Letter (U+1D62)",
    text = "ᵢ"
  }, {
    item = "ℐ",
    subText = "I, Script Capital (U+2110)",
    text = "ℐ"
  }, {
    item = "ⁱ",
    subText = "I, Superscript Latin Small Letter (U+2071)",
    text = "ⁱ"
  }, {
    item = "⛸",
    subText = "Ice Skate (U+26F8)",
    text = "⛸"
  }, {
    item = "⛐",
    subText = "Icy Road (U+26D0)",
    text = "⛐"
  }, {
    item = "💡",
    subText = "Idea (U+1F4A1)",
    text = "💡"
  }, {
    item = "≡",
    subText = "Identical To (U+2261)",
    text = "≡"
  }, {
    item = "≢",
    subText = "Identical To, Not (U+2262)",
    text = "≢"
  }, {
    item = "𐂀",
    subText = "Ideograms, Linear B (U+10080)",
    text = "𐂀"
  }, {
    item = "㆐",
    subText = "Ideographic Annotation, Japanese Kanbun (U+3190)",
    text = "㆐"
  }, {
    item = "〆",
    subText = "Ideographic Closing Mark (U+3006)",
    text = "〆"
  }, {
    item = "、",
    subText = "Ideographic Comma (U+3001)",
    text = "、"
  }, {
    item = "⿰",
    subText = "Ideographic Description Characters, Cjk (U+2FF0)",
    text = "⿰"
  }, {
    item = "。",
    subText = "Ideographic Full Stop (U+3002)",
    text = "。"
  }, {
    item = "〿",
    subText = "Ideographic Half Fill Space (U+303F)",
    text = "〿"
  }, {
    item = "々",
    subText = "Ideographic Iteration Mark (U+3005)",
    text = "々"
  }, {
    item = "〻",
    subText = "Ideographic Iteration Mark, Vertical (U+303B)",
    text = "〻"
  }, {
    item = "〇",
    subText = "Ideographic Number Zero (U+3007)",
    text = "〇"
  }, {
    item = "　",
    subText = "Ideographic Space (U+3000)",
    text = "　"
  }, {
    item = "🈀",
    subText = "Ideographic Supplement, Enclosed (U+1F200)",
    text = "🈀"
  }, {
    item = "𖿠",
    subText = "Ideographic Symbols And Punctuation (U+16FE0)",
    text = "𖿠"
  }, {
    item = "㏠",
    subText = "Ideographic Telegraph Symbols For Days (U+33E0)",
    text = "㏠"
  }, {
    item = "㍘",
    subText = "Ideographic Telegraph Symbols For Hours (U+3358)",
    text = "㍘"
  }, {
    item = "㋀",
    subText = "Ideographic Telegraph Symbols For Months (U+32C0)",
    text = "㋀"
  }, {
    item = "〪",
    subText = "Ideographic Tone Marks (U+302A)",
    text = "〪"
  }, {
    item = "〾",
    subText = "Ideographic Variation Indicator (U+303E)",
    text = "〾"
  }, {
    item = "㐀",
    subText = "Ideographs Area, Cjk (U+3400)",
    text = "㐀"
  }, {
    item = "𠀀",
    subText = "Ideographs Area, Supplementary Cjk (U+20000)",
    text = "𠀀"
  }, {
    item = "㐀",
    subText = "Ideographs Extension A, Cjk Unified (U+3400)",
    text = "㐀"
  }, {
    item = "𠀀",
    subText = "Ideographs Extension B, Cjk Unified (U+20000)",
    text = "𠀀"
  }, {
    item = "𪜀",
    subText = "Ideographs Extension C, Cjk Unified (U+2A700)",
    text = "𪜀"
  }, {
    item = "𫝀",
    subText = "Ideographs Extension D, Cjk Unified (U+2B740)",
    text = "𫝀"
  }, {
    item = "丽",
    subText = "Ideographs Supplement, Cjk Compatibility (U+2F800)",
    text = "丽"
  }, {
    item = "㊀",
    subText = "Ideographs, Circled (U+3280)",
    text = "㊀"
  }, {
    item = "豈",
    subText = "Ideographs, Cjk Compatibility (U+F900)",
    text = "豈"
  }, {
    item = "一",
    subText = "Ideographs, Cjk Unified (U+4E00)",
    text = "一"
  }, {
    item = "並",
    subText = "Ideographs, Dprk Compatibility (U+FA70)",
    text = "並"
  }, {
    item = "一",
    subText = "Ideographs, Han (U+4E00)",
    text = "一"
  }, {
    item = "侮",
    subText = "Ideographs, Jis X 0213 Compatibility (U+FA30)",
    text = "侮"
  }, {
    item = "㈠",
    subText = "Ideographs, Parenthesized Cjk (U+3220)",
    text = "㈠"
  }, {
    item = "␖",
    subText = "Idle, Symbol For Synchronous (U+2416)",
    text = "␖"
  }, {
    item = "",
    subText = "Idle, Synchronous (U+0016)",
    text = ""
  }, {
    item = "ĳ",
    subText = "Ij, Latin Small Ligature (U+0133)",
    text = "ĳ"
  }, {
    item = "⊷",
    subText = "Image Of (U+22B7)",
    text = "⊷"
  }, {
    item = "⊏",
    subText = "Image Of, Square (U+228F)",
    text = "⊏"
  }, {
    item = "ℑ",
    subText = "Imaginary Part (U+2111)",
    text = "ℑ"
  }, {
    item = "👿",
    subText = "Imp (U+1F47F)",
    text = "👿"
  }, {
    item = "𐡀",
    subText = "Imperial Aramaic (U+10840)",
    text = "𐡀"
  }, {
    item = "⊢",
    subText = "Implies (U+22A2)",
    text = "⊢"
  }, {
    item = "″",
    subText = "Inches (U+2033)",
    text = "″"
  }, {
    item = "⊂",
    subText = "Included In Set (U+2282)",
    text = "⊂"
  }, {
    item = "⊃",
    subText = "Includes In Set (U+2283)",
    text = "⊃"
  }, {
    item = "㍿",
    subText = "Incorporated, Japanese (U+337F)",
    text = "㍿"
  }, {
    item = "⏶",
    subText = "Increase (U+23F6)",
    text = "⏶"
  }, {
    item = "∆",
    subText = "Increment (U+2206)",
    text = "∆"
  }, {
    item = "⫫",
    subText = "Independence (U+2AEB)",
    text = "⫫"
  }, {
    item = "⫝",
    subText = "Independent (U+2ADD)",
    text = "⫝"
  }, {
    item = "⫝̸",
    subText = "Independent, Not (U+2ADC)",
    text = "⫝̸"
  }, {
    item = "☚",
    subText = "Index Finger Dingbats, Pointing (U+261A)",
    text = "☚"
  }, {
    item = "👆",
    subText = "Index Finger Pointing Hand (U+1F446)",
    text = "👆"
  }, {
    item = "☚",
    subText = "Index, Black Left Pointing (U+261A)",
    text = "☚"
  }, {
    item = "☛",
    subText = "Index, Black Right Pointing (U+261B)",
    text = "☛"
  }, {
    item = "☟",
    subText = "Index, White Down Pointing (U+261F)",
    text = "☟"
  }, {
    item = "☜",
    subText = "Index, White Left Pointing (U+261C)",
    text = "☜"
  }, {
    item = "☞",
    subText = "Index, White Right Pointing (U+261E)",
    text = "☞"
  }, {
    item = "☝",
    subText = "Index, White Up Pointing (U+261D)",
    text = "☝"
  }, {
    item = "₨",
    subText = "Indian Currency (U+20A8)",
    text = "₨"
  }, {
    item = "₹",
    subText = "Indian Rupee Sign (U+20B9)",
    text = "₹"
  }, {
    item = "꠰",
    subText = "Indic Number Forms, Common (U+A830)",
    text = "꠰"
  }, {
    item = "𞱰",
    subText = "Indic Siyaq Numbers (U+1EC70)",
    text = "𞱰"
  }, {
    item = "◅",
    subText = "Indicator, Backward Arrow (U+25C5)",
    text = "◅"
  }, {
    item = "▻",
    subText = "Indicator, Forward Arrow (U+25BB)",
    text = "▻"
  }, {
    item = "≃",
    subText = "Inequality Signs, Equality And (U+2243)",
    text = "≃"
  }, {
    item = "⋕",
    subText = "Inequality Signs, Equality And (U+22D5)",
    text = "⋕"
  }, {
    item = "∞",
    subText = "Infinity (U+221E)",
    text = "∞"
  }, {
    item = "⧜",
    subText = "Infinity, Incomplete (U+29DC)",
    text = "⧜"
  }, {
    item = "♯",
    subText = "Infix Bag Count (U+266F)",
    text = "♯"
  }, {
    item = "🛈",
    subText = "Information (U+1F6C8)",
    text = "🛈"
  }, {
    item = "",
    subText = "Information Separator Four (U+001C)",
    text = ""
  }, {
    item = "",
    subText = "Information Separator One (U+001F)",
    text = ""
  }, {
    item = "",
    subText = "Information Separator Three (U+001D)",
    text = ""
  }, {
    item = "",
    subText = "Information Separator Two (U+001E)",
    text = ""
  }, {
    item = "ℹ",
    subText = "Information Source (U+2139)",
    text = "ℹ"
  }, {
    item = "↓",
    subText = "Ingressive Airflow (U+2193)",
    text = "↓"
  }, {
    item = "⤕",
    subText = "Injection, Finite (U+2915)",
    text = "⤕"
  }, {
    item = "⤘",
    subText = "Injection, Finite Surjective (U+2918)",
    text = "⤘"
  }, {
    item = "⤔",
    subText = "Injection, Partial (U+2914)",
    text = "⤔"
  }, {
    item = "⤗",
    subText = "Injection, Surjective (U+2917)",
    text = "⤗"
  }, {
    item = "↣",
    subText = "Injection, Total (U+21A3)",
    text = "↣"
  }, {
    item = "⁁",
    subText = "Insertion Point, Caret (U+2041)",
    text = "⁁"
  }, {
    item = "⎀",
    subText = "Insertion Symbol (U+2380)",
    text = "⎀"
  }, {
    item = "ℤ",
    subText = "Integers (U+2124)",
    text = "ℤ"
  }, {
    item = "∫",
    subText = "Integral (U+222B)",
    text = "∫"
  }, {
    item = "⨖",
    subText = "Integral Operator, Quaternion (U+2A16)",
    text = "⨖"
  }, {
    item = "∫",
    subText = "Integral Signs (U+222B)",
    text = "∫"
  }, {
    item = "∳",
    subText = "Integral, Anticlockwise Contour (U+2233)",
    text = "∳"
  }, {
    item = "⌡",
    subText = "Integral, Bottom Half (U+2321)",
    text = "⌡"
  }, {
    item = "∱",
    subText = "Integral, Clockwise (U+2231)",
    text = "∱"
  }, {
    item = "∲",
    subText = "Integral, Clockwise Contour (U+2232)",
    text = "∲"
  }, {
    item = "∮",
    subText = "Integral, Contour (U+222E)",
    text = "∮"
  }, {
    item = "∳",
    subText = "Integral, Counterclockwise Contour (U+2233)",
    text = "∳"
  }, {
    item = "∬",
    subText = "Integral, Double (U+222C)",
    text = "∬"
  }, {
    item = "⨜",
    subText = "Integral, Lower (U+2A1C)",
    text = "⨜"
  }, {
    item = "ℛ",
    subText = "Integral, Riemann (U+211B)",
    text = "ℛ"
  }, {
    item = "∯",
    subText = "Integral, Surface (U+222F)",
    text = "∯"
  }, {
    item = "⌠",
    subText = "Integral, Top Half (U+2320)",
    text = "⌠"
  }, {
    item = "∭",
    subText = "Integral, Triple (U+222D)",
    text = "∭"
  }, {
    item = "⨛",
    subText = "Integral, Upper (U+2A1B)",
    text = "⨛"
  }, {
    item = "∰",
    subText = "Integral, Volume (U+2230)",
    text = "∰"
  }, {
    item = "⨊",
    subText = "Integrals, Summations And (U+2A0A)",
    text = "⨊"
  }, {
    item = "⨑",
    subText = "Integration, Anticlockwise (U+2A11)",
    text = "⨑"
  }, {
    item = "⨑",
    subText = "Integration, Counterclockwise (U+2A11)",
    text = "⨑"
  }, {
    item = "⊺",
    subText = "Intercalate (U+22BA)",
    text = "⊺"
  }, {
    item = "⌘",
    subText = "Interest Sign, Place Of (U+2318)",
    text = "⌘"
  }, {
    item = "⨼",
    subText = "Interior Product (U+2A3C)",
    text = "⨼"
  }, {
    item = "⨽",
    subText = "Interior Product, Righthand (U+2A3D)",
    text = "⨽"
  }, {
    item = "⫴",
    subText = "Interleave (U+2AF4)",
    text = "⫴"
  }, {
    item = "￹",
    subText = "Interlinear Annotation (U+FFF9)",
    text = "￹"
  }, {
    item = "￹",
    subText = "Interlinear Annotation Anchor (U+FFF9)",
    text = "￹"
  }, {
    item = "￺",
    subText = "Interlinear Annotation Separator (U+FFFA)",
    text = "￺"
  }, {
    item = "￻",
    subText = "Interlinear Annotation Terminator (U+FFFB)",
    text = "￻"
  }, {
    item = "‽",
    subText = "Interrobang (U+203D)",
    text = "‽"
  }, {
    item = "⸘",
    subText = "Interrobang, Inverted (U+2E18)",
    text = "⸘"
  }, {
    item = "⎊",
    subText = "Interrupt (U+238A)",
    text = "⎊"
  }, {
    item = "∩",
    subText = "Intersection (U+2229)",
    text = "∩"
  }, {
    item = "⋒",
    subText = "Intersection, Double (U+22D2)",
    text = "⋒"
  }, {
    item = "⏧",
    subText = "Intersection, Electrical (U+23E7)",
    text = "⏧"
  }, {
    item = "⋂",
    subText = "Intersection, Generalized (U+22C2)",
    text = "⋂"
  }, {
    item = "⋂",
    subText = "Intersection, N-Ary (U+22C2)",
    text = "⋂"
  }, {
    item = "⋔",
    subText = "Intersection, Proper (U+22D4)",
    text = "⋔"
  }, {
    item = "⩀",
    subText = "Intersections And Unions (U+2A40)",
    text = "⩀"
  }, {
    item = "་",
    subText = "Intersyllabic Tsheg, Tibetan Mark (U+0F0B)",
    text = "་"
  }, {
    item = "",
    subText = "Introducer, Control Sequence (U+009B)",
    text = ""
  }, {
    item = "",
    subText = "Introducer, Single Character (U+009A)",
    text = ""
  }, {
    item = "❶",
    subText = "Inverse Numbers, Circled (U+2776)",
    text = "❶"
  }, {
    item = "̯",
    subText = "Inverted Breve Below, Combining (U+032F)",
    text = "̯"
  }, {
    item = "̑",
    subText = "Inverted Breve, Combining (U+0311)",
    text = "̑"
  }, {
    item = "͡",
    subText = "Inverted Breve, Combining Double (U+0361)",
    text = "͡"
  }, {
    item = "̺",
    subText = "Inverted Bridge Below, Combining (U+033A)",
    text = "̺"
  }, {
    item = "̫",
    subText = "Inverted Double Arch Below, Combining (U+032B)",
    text = "̫"
  }, {
    item = "¡",
    subText = "Inverted Exclamation Mark (U+00A1)",
    text = "¡"
  }, {
    item = "ʖ",
    subText = "Inverted Glottal Stop, Latin Letter (U+0296)",
    text = "ʖ"
  }, {
    item = "⸘",
    subText = "Inverted Interrobang (U+2E18)",
    text = "⸘"
  }, {
    item = "∾",
    subText = "Inverted Lazy S (U+223E)",
    text = "∾"
  }, {
    item = "℧",
    subText = "Inverted Ohm Sign (U+2127)",
    text = "℧"
  }, {
    item = "¿",
    subText = "Inverted Question Mark (U+00BF)",
    text = "¿"
  }, {
    item = "ʁ",
    subText = "Inverted R, Latin Letter Small Capital (U+0281)",
    text = "ʁ"
  }, {
    item = "ʶ",
    subText = "Inverted R, Modifier Letter Small Capital (U+02B6)",
    text = "ʶ"
  }, {
    item = "⁔",
    subText = "Inverted Undertie (U+2054)",
    text = "⁔"
  }, {
    item = "⁣",
    subText = "Invisible Comma (U+2063)",
    text = "⁣"
  }, {
    item = "⁤",
    subText = "Invisible Plus (U+2064)",
    text = "⁤"
  }, {
    item = "⁣",
    subText = "Invisible Separator (U+2063)",
    text = "⁣"
  }, {
    item = "⁢",
    subText = "Invisible Times (U+2062)",
    text = "⁢"
  }, {
    item = "ͅ",
    subText = "Iota Below, Greek Non-Spacing (U+0345)",
    text = "ͅ"
  }, {
    item = "ͅ",
    subText = "Iota Subscript, Greek (U+0345)",
    text = "ͅ"
  }, {
    item = "Ɩ",
    subText = "Iota, Latin Capital Letter (U+0196)",
    text = "Ɩ"
  }, {
    item = "ɩ",
    subText = "Iota, Latin Small Letter (U+0269)",
    text = "ɩ"
  }, {
    item = "℩",
    subText = "Iota, Turned Greek Small Letter (U+2129)",
    text = "℩"
  }, {
    item = "ɐ",
    subText = "Ipa Extensions (U+0250)",
    text = "ɐ"
  }, {
    item = "͆",
    subText = "Ipa, Diacritics For (U+0346)",
    text = "͆"
  }, {
    item = "﷼",
    subText = "Iranian Currency (U+FDFC)",
    text = "﷼"
  }, {
    item = "£",
    subText = "Irish Punt (U+00A3)",
    text = "£"
  }, {
    item = "⁨",
    subText = "Isolate, First Strong (U+2068)",
    text = "⁨"
  }, {
    item = "⁦",
    subText = "Isolate, Left-To-Right (U+2066)",
    text = "⁦"
  }, {
    item = "⁩",
    subText = "Isolate, Pop Directional (U+2069)",
    text = "⁩"
  }, {
    item = "⁧",
    subText = "Isolate, Right-To-Left (U+2067)",
    text = "⁧"
  }, {
    item = "₪",
    subText = "Israeli Currency (U+20AA)",
    text = "₪"
  }, {
    item = "৺",
    subText = "Isshar, Bengali (U+09FA)",
    text = "৺"
  }, {
    item = "୰",
    subText = "Isshar, Oriya (U+0B70)",
    text = "୰"
  }, {
    item = "₤",
    subText = "Italian Currency (U+20A4)",
    text = "₤"
  }, {
    item = "£",
    subText = "Italian Lira (U+00A3)",
    text = "£"
  }, {
    item = "𝛢",
    subText = "Italic Greek Mathematical Symbols (U+1D6E2)",
    text = "𝛢"
  }, {
    item = "𝜜",
    subText = "Italic Greek Mathematical Symbols, Bold (U+1D71C)",
    text = "𝜜"
  }, {
    item = "𝞐",
    subText = "Italic Greek Mathematical Symbols, Sans-Serif Bold (U+1D790)",
    text = "𝞐"
  }, {
    item = "𝐴",
    subText = "Italic Mathematical Symbols (U+1D434)",
    text = "𝐴"
  }, {
    item = "𝑨",
    subText = "Italic Mathematical Symbols, Bold (U+1D468)",
    text = "𝑨"
  }, {
    item = "𝘈",
    subText = "Italic Mathematical Symbols, Sans-Serif (U+1D608)",
    text = "𝘈"
  }, {
    item = "𝘼",
    subText = "Italic Mathematical Symbols, Sans-Serif Bold (U+1D63C)",
    text = "𝘼"
  }, {
    item = "𐌀",
    subText = "Italic, Old (U+10300)",
    text = "𐌀"
  }, {
    item = "✀",
    subText = "Itc Zapf Dingbats Series 100 (U+2700)",
    text = "✀"
  }, {
    item = "ゝ",
    subText = "Iteration Mark, Hiragana (U+309D)",
    text = "ゝ"
  }, {
    item = "ゞ",
    subText = "Iteration Mark, Hiragana Voiced (U+309E)",
    text = "ゞ"
  }, {
    item = "々",
    subText = "Iteration Mark, Ideographic (U+3005)",
    text = "々"
  }, {
    item = "ヽ",
    subText = "Iteration Mark, Katakana (U+30FD)",
    text = "ヽ"
  }, {
    item = "ヾ",
    subText = "Iteration Mark, Katakana Voiced (U+30FE)",
    text = "ヾ"
  }, {
    item = "〻",
    subText = "Iteration Mark, Vertical Ideographic (U+303B)",
    text = "〻"
  }, {
    item = "❧",
    subText = "Ivy Leaf (U+2767)",
    text = "❧"
  }, {
    item = "ۀ",
    subText = "Izafet (U+06C0)",
    text = "ۀ"
  }, {
    item = "ǰ",
    subText = "J With Caron, Latin Small Letter (U+01F0)",
    text = "ǰ"
  }, {
    item = "ĵ",
    subText = "J With Circumflex, Latin Small Letter (U+0135)",
    text = "ĵ"
  }, {
    item = "ʝ",
    subText = "J With Crossed-Tail, Latin Small Letter (U+029D)",
    text = "ʝ"
  }, {
    item = "Ɉ",
    subText = "J With Stroke, Latin Capital Letter (U+0248)",
    text = "Ɉ"
  }, {
    item = "ɉ",
    subText = "J With Stroke, Latin Small Letter (U+0249)",
    text = "ɉ"
  }, {
    item = "ɟ",
    subText = "J With Stroke, Latin Small Letter Dotless (U+025F)",
    text = "ɟ"
  }, {
    item = "ⅉ",
    subText = "J, Double-Struck Italic Small (U+2149)",
    text = "ⅉ"
  }, {
    item = "ᴊ",
    subText = "J, Latin Letter Small Capital (U+1D0A)",
    text = "ᴊ"
  }, {
    item = "ȷ",
    subText = "J, Latin Small Letter Dotless (U+0237)",
    text = "ȷ"
  }, {
    item = "ʲ",
    subText = "J, Modifier Letter Small (U+02B2)",
    text = "ʲ"
  }, {
    item = "❉",
    subText = "Jack (U+2749)",
    text = "❉"
  }, {
    item = "ᄀ",
    subText = "Jamo Combining Alphabet, Korean Hangul (U+1100)",
    text = "ᄀ"
  }, {
    item = "㄰",
    subText = "Jamo, Korean Hangul Compatibility (U+3130)",
    text = "㄰"
  }, {
    item = "◉",
    subText = "Japanese Bullet, Tainome (U+25C9)",
    text = "◉"
  }, {
    item = "☖",
    subText = "Japanese Chess Symbols (U+2616)",
    text = "☖"
  }, {
    item = "㋿",
    subText = "Japanese Era Name (U+32FF)",
    text = "㋿"
  }, {
    item = "㍻",
    subText = "Japanese Era Names (U+337B)",
    text = "㍻"
  }, {
    item = "぀",
    subText = "Japanese Hiragana (U+3040)",
    text = "぀"
  }, {
    item = "㍿",
    subText = "Japanese Incorporated (U+337F)",
    text = "㍿"
  }, {
    item = "〄",
    subText = "Japanese Industrial Standard Symbol (U+3004)",
    text = "〄"
  }, {
    item = "㆐",
    subText = "Japanese Kanbun Ideographic Annotation (U+3190)",
    text = "㆐"
  }, {
    item = "゠",
    subText = "Japanese Katakana (U+30A0)",
    text = "゠"
  }, {
    item = "｡",
    subText = "Japanese Katakana Variants, Halfwidth (U+FF61)",
    text = "｡"
  }, {
    item = "㌀",
    subText = "Japanese Katakana Words, Squared (U+3300)",
    text = "㌀"
  }, {
    item = "㋐",
    subText = "Japanese Katakana, Circled (U+32D0)",
    text = "㋐"
  }, {
    item = "※",
    subText = "Japanese Kome (U+203B)",
    text = "※"
  }, {
    item = "ꦀ",
    subText = "Javanese (U+A980)",
    text = "ꦀ"
  }, {
    item = "☩",
    subText = "Jerusalem, Cross Of (U+2629)",
    text = "☩"
  }, {
    item = "⃝",
    subText = "Jis Composition Circle (U+20DD)",
    text = "⃝"
  }, {
    item = "侮",
    subText = "Jis X 0213 Compatibility Ideographs (U+FA30)",
    text = "侮"
  }, {
    item = "⨝",
    subText = "Join (U+2A1D)",
    text = "⨝"
  }, {
    item = "͏",
    subText = "Joiner, Combining Grapheme (U+034F)",
    text = "͏"
  }, {
    item = "⁠",
    subText = "Joiner, Word (U+2060)",
    text = "⁠"
  }, {
    item = "‍",
    subText = "Joiner, Zero Width (U+200D)",
    text = "‍"
  }, {
    item = "☠",
    subText = "Jolly Roger (U+2620)",
    text = "☠"
  }, {
    item = "∘",
    subText = "Jot, Apl (U+2218)",
    text = "∘"
  }, {
    item = "♃",
    subText = "Jupiter (U+2643)",
    text = "♃"
  }, {
    item = "⚖",
    subText = "Jurisprudence Symbol (U+2696)",
    text = "⚖"
  }, {
    item = "ḱ",
    subText = "K With Acute, Latin Small Letter (U+1E31)",
    text = "ḱ"
  }, {
    item = "ǩ",
    subText = "K With Caron, Latin Small Letter (U+01E9)",
    text = "ǩ"
  }, {
    item = "ķ",
    subText = "K With Cedilla, Latin Small Letter (U+0137)",
    text = "ķ"
  }, {
    item = "ḳ",
    subText = "K With Dot Below, Latin Small Letter (U+1E33)",
    text = "ḳ"
  }, {
    item = "ƙ",
    subText = "K With Hook, Latin Small Letter (U+0199)",
    text = "ƙ"
  }, {
    item = "ḵ",
    subText = "K With Line Below, Latin Small Letter (U+1E35)",
    text = "ḵ"
  }, {
    item = "ᴋ",
    subText = "K, Latin Letter Small Capital (U+1D0B)",
    text = "ᴋ"
  }, {
    item = "ʞ",
    subText = "K, Latin Small Letter Turned (U+029E)",
    text = "ʞ"
  }, {
    item = "ₖ",
    subText = "K, Latin Subscript Small Letter (U+2096)",
    text = "ₖ"
  }, {
    item = "ゕ",
    subText = "Ka, Hiragana Letter Small (U+3095)",
    text = "ゕ"
  }, {
    item = "㍿",
    subText = "Kabusiki-Gaisya (U+337F)",
    text = "㍿"
  }, {
    item = "𑂀",
    subText = "Kaithi (U+11080)",
    text = "𑂀"
  }, {
    item = "𛄀",
    subText = "Kana Extended-A (U+1B100)",
    text = "𛄀"
  }, {
    item = "𛄰",
    subText = "Kana Extension, Small (U+1B130)",
    text = "𛄰"
  }, {
    item = "〱",
    subText = "Kana Repeat Marks (U+3031)",
    text = "〱"
  }, {
    item = "𛀀",
    subText = "Kana Supplement (U+1B000)",
    text = "𛀀"
  }, {
    item = "㆐",
    subText = "Kanbun Ideographic Annotation, Japanese (U+3190)",
    text = "㆐"
  }, {
    item = "⼀",
    subText = "Kangxi Radicals, Cjk (U+2F00)",
    text = "⼀"
  }, {
    item = "ಀ",
    subText = "Kannada (U+0C80)",
    text = "ಀ"
  }, {
    item = "ಕ",
    subText = "Kannada Consonants (U+0C95)",
    text = "ಕ"
  }, {
    item = "ಾ",
    subText = "Kannada Dependent Vowel Signs (U+0CBE)",
    text = "ಾ"
  }, {
    item = "೦",
    subText = "Kannada Digits (U+0CE6)",
    text = "೦"
  }, {
    item = "ಅ",
    subText = "Kannada Independent Vowels (U+0C85)",
    text = "ಅ"
  }, {
    item = "ـ",
    subText = "Kashida, Arabic (U+0640)",
    text = "ـ"
  }, {
    item = "゠",
    subText = "Katakana (U+30A0)",
    text = "゠"
  }, {
    item = "ヿ",
    subText = "Katakana Digraph Koto (U+30FF)",
    text = "ヿ"
  }, {
    item = "ㇰ",
    subText = "Katakana Extensions For Ainu (U+31F0)",
    text = "ㇰ"
  }, {
    item = "ヽ",
    subText = "Katakana Iteration Mark (U+30FD)",
    text = "ヽ"
  }, {
    item = "・",
    subText = "Katakana Middle Dot (U+30FB)",
    text = "・"
  }, {
    item = "ㇰ",
    subText = "Katakana Phonetic Extensions (U+31F0)",
    text = "ㇰ"
  }, {
    item = "｡",
    subText = "Katakana Variants, Halfwidth Japanese (U+FF61)",
    text = "｡"
  }, {
    item = "ヾ",
    subText = "Katakana Voiced Iteration Mark (U+30FE)",
    text = "ヾ"
  }, {
    item = "㌀",
    subText = "Katakana Words, Squared (U+3300)",
    text = "㌀"
  }, {
    item = "㋐",
    subText = "Katakana, Circled (U+32D0)",
    text = "㋐"
  }, {
    item = "゠",
    subText = "Katakana-Hiragana Double Hyphen (U+30A0)",
    text = "゠"
  }, {
    item = "ー",
    subText = "Katakana-Hiragana Prolonged Sound Mark (U+30FC)",
    text = "ー"
  }, {
    item = "꤀",
    subText = "Kayah Li (U+A900)",
    text = "꤀"
  }, {
    item = "K",
    subText = "Kelvin Sign (U+212A)",
    text = "K"
  }, {
    item = "⟩",
    subText = "Ket (U+27E9)",
    text = "⟩"
  }, {
    item = "⌧",
    subText = "Key, Clear (U+2327)",
    text = "⌧"
  }, {
    item = "⌘",
    subText = "Key, Command (U+2318)",
    text = "⌘"
  }, {
    item = "⌫",
    subText = "Key, Delete To The Left (U+232B)",
    text = "⌫"
  }, {
    item = "⌦",
    subText = "Key, Delete To The Right (U+2326)",
    text = "⌦"
  }, {
    item = "⌤",
    subText = "Key, Enter (U+2324)",
    text = "⌤"
  }, {
    item = "⌥",
    subText = "Key, Option (U+2325)",
    text = "⌥"
  }, {
    item = "⚿",
    subText = "Key, Squared (U+26BF)",
    text = "⚿"
  }, {
    item = "⌨",
    subText = "Keyboard (U+2328)",
    text = "⌨"
  }, {
    item = "⍽",
    subText = "Keyboard Symbol For No Break Space (U+237D)",
    text = "⍽"
  }, {
    item = "⇦",
    subText = "Keyboard Symbols (U+21E6)",
    text = "⇦"
  }, {
    item = "⌤",
    subText = "Keyboard Symbols (U+2324)",
    text = "⌤"
  }, {
    item = "⎀",
    subText = "Keyboard Symbols (U+2380)",
    text = "⎀"
  }, {
    item = "⎖",
    subText = "Keyboard Symbols (U+2396)",
    text = "⎖"
  }, {
    item = "⃣",
    subText = "Keycap, Combining Enclosing (U+20E3)",
    text = "⃣"
  }, {
    item = "☬",
    subText = "Khanda, Gurmukhi (U+262C)",
    text = "☬"
  }, {
    item = "𐨀",
    subText = "Kharoshthi (U+10A00)",
    text = "𐨀"
  }, {
    item = "𐩀",
    subText = "Kharoshthi Digits (U+10A40)",
    text = "𐩀"
  }, {
    item = "ក",
    subText = "Khmer (U+1780)",
    text = "ក"
  }, {
    item = "ំ",
    subText = "Khmer Anusvara (U+17C6)",
    text = "ំ"
  }, {
    item = "ក",
    subText = "Khmer Consonants (U+1780)",
    text = "ក"
  }, {
    item = "៛",
    subText = "Khmer Currency Symbol Riel (U+17DB)",
    text = "៛"
  }, {
    item = "ា",
    subText = "Khmer Dependent Vowel Signs (U+17B6)",
    text = "ា"
  }, {
    item = "០",
    subText = "Khmer Digits (U+17E0)",
    text = "០"
  }, {
    item = "ឥ",
    subText = "Khmer Independent Vowels (U+17A5)",
    text = "ឥ"
  }, {
    item = "៰",
    subText = "Khmer Numeric Symbols For Divination (U+17F0)",
    text = "៰"
  }, {
    item = "ំ",
    subText = "Khmer Sign Nikahit (U+17C6)",
    text = "ំ"
  }, {
    item = "ះ",
    subText = "Khmer Sign Reahmuk (U+17C7)",
    text = "ះ"
  }, {
    item = "ំ",
    subText = "Khmer Signs (U+17C6)",
    text = "ំ"
  }, {
    item = "ះ",
    subText = "Khmer Srak Ah (U+17C7)",
    text = "ះ"
  }, {
    item = "ំ",
    subText = "Khmer Srak Am (U+17C6)",
    text = "ំ"
  }, {
    item = "᧠",
    subText = "Khmer Symbols (U+19E0)",
    text = "᧠"
  }, {
    item = "ះ",
    subText = "Khmer Visarga (U+17C7)",
    text = "ះ"
  }, {
    item = "𑈀",
    subText = "Khojki (U+11200)",
    text = "𑈀"
  }, {
    item = "๛",
    subText = "Khomut, Thai Character (U+0E5B)",
    text = "๛"
  }, {
    item = "𑊰",
    subText = "Khudawadi (U+112B0)",
    text = "𑊰"
  }, {
    item = "Ⴀ",
    subText = "Khutsuri, Georgian (U+10A0)",
    text = "Ⴀ"
  }, {
    item = "𝇞",
    subText = "Kievan Musical Symbols (U+1D1DE)",
    text = "𝇞"
  }, {
    item = "္",
    subText = "Killer, Myanmar (U+1039)",
    text = "္"
  }, {
    item = "₭",
    subText = "Kip Sign (U+20AD)",
    text = "₭"
  }, {
    item = "⌑",
    subText = "Kissen (U+2311)",
    text = "⌑"
  }, {
    item = "🐨",
    subText = "Koala (U+1F428)",
    text = "🐨"
  }, {
    item = "※",
    subText = "Kome, Japanese (U+203B)",
    text = "※"
  }, {
    item = "Ԁ",
    subText = "Komi Letters (U+0500)",
    text = "Ԁ"
  }, {
    item = "ۖ",
    subText = "Koranic Annotation Signs, Arabic (U+06D6)",
    text = "ۖ"
  }, {
    item = "ᄀ",
    subText = "Korean Combining Alphabet (U+1100)",
    text = "ᄀ"
  }, {
    item = "₩",
    subText = "Korean Currency (U+20A9)",
    text = "₩"
  }, {
    item = "ㅥ",
    subText = "Korean Hangul Archaic Letters (U+3165)",
    text = "ㅥ"
  }, {
    item = "㄰",
    subText = "Korean Hangul Compatibility Jamo (U+3130)",
    text = "㄰"
  }, {
    item = "ᄀ",
    subText = "Korean Hangul Jamo Combining Alphabet (U+1100)",
    text = "ᄀ"
  }, {
    item = "ꥠ",
    subText = "Korean Hangul Jamo Extended-A (U+A960)",
    text = "ꥠ"
  }, {
    item = "ힰ",
    subText = "Korean Hangul Jamo Extended-B (U+D7B0)",
    text = "ힰ"
  }, {
    item = "㉠",
    subText = "Korean Hangul Letters, Circled (U+3260)",
    text = "㉠"
  }, {
    item = "㈀",
    subText = "Korean Hangul Letters, Parenthesized (U+3200)",
    text = "㈀"
  }, {
    item = "가",
    subText = "Korean Hangul Syllables (U+AC00)",
    text = "가"
  }, {
    item = "㉮",
    subText = "Korean Hangul Syllables, Circled (U+326E)",
    text = "㉮"
  }, {
    item = "㈎",
    subText = "Korean Hangul Syllables, Parenthesized (U+320E)",
    text = "㈎"
  }, {
    item = "ﾠ",
    subText = "Korean Hangul Variants, Halfwidth (U+FFA0)",
    text = "ﾠ"
  }, {
    item = "㉿",
    subText = "Korean Standard Symbol (U+327F)",
    text = "㉿"
  }, {
    item = "̓",
    subText = "Koronis, Combining Greek (U+0343)",
    text = "̓"
  }, {
    item = "ヿ",
    subText = "Koto, Katakana Digraph (U+30FF)",
    text = "ヿ"
  }, {
    item = "ĸ",
    subText = "Kra, Latin Small Letter (U+0138)",
    text = "ĸ"
  }, {
    item = "℔",
    subText = "L B Bar Symbol (U+2114)",
    text = "℔"
  }, {
    item = "ĺ",
    subText = "L With Acute, Latin Small Letter (U+013A)",
    text = "ĺ"
  }, {
    item = "Ƚ",
    subText = "L With Bar, Latin Capital Letter (U+023D)",
    text = "Ƚ"
  }, {
    item = "ƚ",
    subText = "L With Bar, Latin Small Letter (U+019A)",
    text = "ƚ"
  }, {
    item = "ɬ",
    subText = "L With Belt, Latin Small Letter (U+026C)",
    text = "ɬ"
  }, {
    item = "ľ",
    subText = "L With Caron, Latin Small Letter (U+013E)",
    text = "ľ"
  }, {
    item = "ļ",
    subText = "L With Cedilla, Latin Small Letter (U+013C)",
    text = "ļ"
  }, {
    item = "ḽ",
    subText = "L With Circumflex Below, Latin Small Letter (U+1E3D)",
    text = "ḽ"
  }, {
    item = "ȴ",
    subText = "L With Curl, Latin Small Letter (U+0234)",
    text = "ȴ"
  }, {
    item = "ḷ",
    subText = "L With Dot Below, Latin Small Letter (U+1E37)",
    text = "ḷ"
  }, {
    item = "ḻ",
    subText = "L With Line Below, Latin Small Letter (U+1E3B)",
    text = "ḻ"
  }, {
    item = "ŀ",
    subText = "L With Middle Dot, Latin Small Letter (U+0140)",
    text = "ŀ"
  }, {
    item = "ɫ",
    subText = "L With Middle Tilde, Latin Small Letter (U+026B)",
    text = "ɫ"
  }, {
    item = "ɭ",
    subText = "L With Retroflex Hook, Latin Small Letter (U+026D)",
    text = "ɭ"
  }, {
    item = "ᴌ",
    subText = "L With Stroke, Latin Letter Small Capital (U+1D0C)",
    text = "ᴌ"
  }, {
    item = "ł",
    subText = "L With Stroke, Latin Small Letter (U+0142)",
    text = "ł"
  }, {
    item = "ʟ",
    subText = "L, Latin Letter Small Capital (U+029F)",
    text = "ʟ"
  }, {
    item = "ₗ",
    subText = "L, Latin Subscript Small Letter (U+2097)",
    text = "ₗ"
  }, {
    item = "ˡ",
    subText = "L, Modifier Letter Small (U+02E1)",
    text = "ˡ"
  }, {
    item = "⅃",
    subText = "L, Reversed Sans-Serif Capital (U+2143)",
    text = "⅃"
  }, {
    item = "ℒ",
    subText = "L, Script Capital (U+2112)",
    text = "ℒ"
  }, {
    item = "ℓ",
    subText = "L, Script Small (U+2113)",
    text = "ℓ"
  }, {
    item = "⅂",
    subText = "L, Turned Sans-Serif Capital (U+2142)",
    text = "⅂"
  }, {
    item = "🐞",
    subText = "Lady Beetle (U+1F41E)",
    text = "🐞"
  }, {
    item = "ƛ",
    subText = "Lambda Bar, Latin Letter (U+019B)",
    text = "ƛ"
  }, {
    item = "󠀁",
    subText = "Language Tag (U+E0001)",
    text = "󠀁"
  }, {
    item = "຀",
    subText = "Lao (U+0E80)",
    text = "຀"
  }, {
    item = "໌",
    subText = "Lao Cancellation Mark (U+0ECC)",
    text = "໌"
  }, {
    item = "ກ",
    subText = "Lao Consonants (U+0E81)",
    text = "ກ"
  }, {
    item = "໐",
    subText = "Lao Digits (U+0ED0)",
    text = "໐"
  }, {
    item = "ຯ",
    subText = "Lao Ellipsis (U+0EAF)",
    text = "ຯ"
  }, {
    item = "່",
    subText = "Lao Marks And Signs (U+0EC8)",
    text = "່"
  }, {
    item = "ໍ",
    subText = "Lao Niggahita (U+0ECD)",
    text = "ໍ"
  }, {
    item = "ະ",
    subText = "Lao Vowels (U+0EB0)",
    text = "ະ"
  }, {
    item = "₭",
    subText = "Laotian Currency (U+20AD)",
    text = "₭"
  }, {
    item = "∆",
    subText = "Laplace Operator (U+2206)",
    text = "∆"
  }, {
    item = "ℒ",
    subText = "Laplace Transform (U+2112)",
    text = "ℒ"
  }, {
    item = "⨝",
    subText = "Large Bowtie (U+2A1D)",
    text = "⨝"
  }, {
    item = "◯",
    subText = "Large Circle (U+25EF)",
    text = "◯"
  }, {
    item = "⧸",
    subText = "Large Operators (U+29F8)",
    text = "⧸"
  }, {
    item = "₾",
    subText = "Lari Sign (U+20BE)",
    text = "₾"
  }, {
    item = "☾",
    subText = "Last Quarter Moon (U+263E)",
    text = "☾"
  }, {
    item = "ǁ",
    subText = "Lateral Click, Latin Letter (U+01C1)",
    text = "ǁ"
  }, {
    item = "㍱",
    subText = "Latin Abbreviations, Squared (U+3371)",
    text = "㍱"
  }, {
    item = "㎀",
    subText = "Latin Abbreviations, Squared (U+3380)",
    text = "㎀"
  }, {
    item = "🄐",
    subText = "Latin Capital Letters, Enclosed (U+1F110)",
    text = "🄐"
  }, {
    item = "🄐",
    subText = "Latin Capital Letters, Parenthesized (U+1F110)",
    text = "🄐"
  }, {
    item = "✝",
    subText = "Latin Cross (U+271D)",
    text = "✝"
  }, {
    item = "Ḁ",
    subText = "Latin Extended Additional (U+1E00)",
    text = "Ḁ"
  }, {
    item = "Ā",
    subText = "Latin Extended-A (U+0100)",
    text = "Ā"
  }, {
    item = "ƀ",
    subText = "Latin Extended-B (U+0180)",
    text = "ƀ"
  }, {
    item = "Ⱡ",
    subText = "Latin Extended-C (U+2C60)",
    text = "Ⱡ"
  }, {
    item = "꜠",
    subText = "Latin Extended-D (U+A720)",
    text = "꜠"
  }, {
    item = "ꬰ",
    subText = "Latin Extended-E (U+AB30)",
    text = "ꬰ"
  }, {
    item = "ᴀ",
    subText = "Latin Extensions (U+1D00)",
    text = "ᴀ"
  }, {
    item = "ᴥ",
    subText = "Latin Letter Ain (U+1D25)",
    text = "ᴥ"
  }, {
    item = "ǂ",
    subText = "Latin Letter Alveolar Click (U+01C2)",
    text = "ǂ"
  }, {
    item = "ʭ",
    subText = "Latin Letter Bidental Percussive (U+02AD)",
    text = "ʭ"
  }, {
    item = "ʘ",
    subText = "Latin Letter Bilabial Click (U+0298)",
    text = "ʘ"
  }, {
    item = "ʬ",
    subText = "Latin Letter Bilabial Percussive (U+02AC)",
    text = "ʬ"
  }, {
    item = "ʘ",
    subText = "Latin Letter Bullseye (U+0298)",
    text = "ʘ"
  }, {
    item = "ǀ",
    subText = "Latin Letter Dental Click (U+01C0)",
    text = "ǀ"
  }, {
    item = "ǃ",
    subText = "Latin Letter Exclamation Mark (U+01C3)",
    text = "ǃ"
  }, {
    item = "ʔ",
    subText = "Latin Letter Glottal Stop (U+0294)",
    text = "ʔ"
  }, {
    item = "ʖ",
    subText = "Latin Letter Inverted Glottal Stop (U+0296)",
    text = "ʖ"
  }, {
    item = "ƛ",
    subText = "Latin Letter Lambda Bar (U+019B)",
    text = "ƛ"
  }, {
    item = "ǁ",
    subText = "Latin Letter Lateral Click (U+01C1)",
    text = "ǁ"
  }, {
    item = "ʕ",
    subText = "Latin Letter Pharyngeal Voiced Fricative (U+0295)",
    text = "ʕ"
  }, {
    item = "ǃ",
    subText = "Latin Letter Retroflex Click (U+01C3)",
    text = "ǃ"
  }, {
    item = "ƪ",
    subText = "Latin Letter Reversed Esh Loop (U+01AA)",
    text = "ƪ"
  }, {
    item = "ʕ",
    subText = "Latin Letter Reversed Glottal Stop (U+0295)",
    text = "ʕ"
  }, {
    item = "ʗ",
    subText = "Latin Letter Stretched C (U+0297)",
    text = "ʗ"
  }, {
    item = "ᴤ",
    subText = "Latin Letter Voiced Laryngeal Spirant (U+1D24)",
    text = "ᴤ"
  }, {
    item = "ƿ",
    subText = "Latin Letter Wynn (U+01BF)",
    text = "ƿ"
  }, {
    item = "Ʀ",
    subText = "Latin Letter Yr (U+01A6)",
    text = "Ʀ"
  }, {
    item = "🄫",
    subText = "Latin Letters, Circled (U+1F12B)",
    text = "🄫"
  }, {
    item = "Ⓐ",
    subText = "Latin Letters, Circled (U+24B6)",
    text = "Ⓐ"
  }, {
    item = "🄐",
    subText = "Latin Letters, Parenthesized (U+1F110)",
    text = "🄐"
  }, {
    item = "⒜",
    subText = "Latin Letters, Parenthesized (U+249C)",
    text = "⒜"
  }, {
    item = "ʰ",
    subText = "Latin Letters, Phonetic Modifiers Derived From (U+02B0)",
    text = "ʰ"
  }, {
    item = "🄱",
    subText = "Latin Letters, Squared (U+1F131)",
    text = "🄱"
  }, {
    item = "ﬀ",
    subText = "Latin Ligatures (U+FB00)",
    text = "ﬀ"
  }, {
    item = "a",
    subText = "Latin Lowercase Alphabet (U+0061)",
    text = "a"
  }, {
    item = "æ",
    subText = "Latin Small Letter Ae (U+00E6)",
    text = "æ"
  }, {
    item = "ɑ",
    subText = "Latin Small Letter Alpha (U+0251)",
    text = "ɑ"
  }, {
    item = "ɤ",
    subText = "Latin Small Letter Baby Gamma (U+0264)",
    text = "ɤ"
  }, {
    item = "ʚ",
    subText = "Latin Small Letter Closed Epsilon (U+029A)",
    text = "ʚ"
  }, {
    item = "ɷ",
    subText = "Latin Small Letter Closed Omega (U+0277)",
    text = "ɷ"
  }, {
    item = "ɞ",
    subText = "Latin Small Letter Closed Reversed Epsilon (U+025E)",
    text = "ɞ"
  }, {
    item = "ȸ",
    subText = "Latin Small Letter Db Digraph (U+0238)",
    text = "ȸ"
  }, {
    item = "ŋ",
    subText = "Latin Small Letter Eng (U+014B)",
    text = "ŋ"
  }, {
    item = "ɛ",
    subText = "Latin Small Letter Epsilon (U+025B)",
    text = "ɛ"
  }, {
    item = "ʃ",
    subText = "Latin Small Letter Esh (U+0283)",
    text = "ʃ"
  }, {
    item = "ð",
    subText = "Latin Small Letter Eth (U+00F0)",
    text = "ð"
  }, {
    item = "ʒ",
    subText = "Latin Small Letter Ezh (U+0292)",
    text = "ʒ"
  }, {
    item = "ƹ",
    subText = "Latin Small Letter Ezh Reversed (U+01B9)",
    text = "ƹ"
  }, {
    item = "ǯ",
    subText = "Latin Small Letter Ezh With Caron (U+01EF)",
    text = "ǯ"
  }, {
    item = "ɣ",
    subText = "Latin Small Letter Gamma (U+0263)",
    text = "ɣ"
  }, {
    item = "ɂ",
    subText = "Latin Small Letter Glottal Stop (U+0242)",
    text = "ɂ"
  }, {
    item = "ƕ",
    subText = "Latin Small Letter Hv (U+0195)",
    text = "ƕ"
  }, {
    item = "ɩ",
    subText = "Latin Small Letter Iota (U+0269)",
    text = "ɩ"
  }, {
    item = "ĸ",
    subText = "Latin Small Letter Kra (U+0138)",
    text = "ĸ"
  }, {
    item = "ɮ",
    subText = "Latin Small Letter Lezh (U+026E)",
    text = "ɮ"
  }, {
    item = "ƣ",
    subText = "Latin Small Letter Oi (U+01A3)",
    text = "ƣ"
  }, {
    item = "ȣ",
    subText = "Latin Small Letter Ou (U+0223)",
    text = "ȣ"
  }, {
    item = "ɸ",
    subText = "Latin Small Letter Phi (U+0278)",
    text = "ɸ"
  }, {
    item = "ȹ",
    subText = "Latin Small Letter Qp Digraph (U+0239)",
    text = "ȹ"
  }, {
    item = "ɤ",
    subText = "Latin Small Letter Rams Horn (U+0264)",
    text = "ɤ"
  }, {
    item = "ə",
    subText = "Latin Small Letter Schwa (U+0259)",
    text = "ə"
  }, {
    item = "ʅ",
    subText = "Latin Small Letter Squat Reversed Esh (U+0285)",
    text = "ʅ"
  }, {
    item = "þ",
    subText = "Latin Small Letter Thorn (U+00FE)",
    text = "þ"
  }, {
    item = "ƅ",
    subText = "Latin Small Letter Tone Six (U+0185)",
    text = "ƅ"
  }, {
    item = "ᴂ",
    subText = "Latin Small Letter Turned Ae (U+1D02)",
    text = "ᴂ"
  }, {
    item = "ɒ",
    subText = "Latin Small Letter Turned Alpha (U+0252)",
    text = "ɒ"
  }, {
    item = "ƍ",
    subText = "Latin Small Letter Turned Delta (U+018D)",
    text = "ƍ"
  }, {
    item = "ᴔ",
    subText = "Latin Small Letter Turned Oe (U+1D14)",
    text = "ᴔ"
  }, {
    item = "ʊ",
    subText = "Latin Small Letter Upsilon (U+028A)",
    text = "ʊ"
  }, {
    item = "ȝ",
    subText = "Latin Small Letter Yogh (U+021D)",
    text = "ȝ"
  }, {
    item = "a",
    subText = "Latin Small Letters (U+0061)",
    text = "a"
  }, {
    item = "ͣ",
    subText = "Latin Small Letters, Combining (U+0363)",
    text = "ͣ"
  }, {
    item = "æ",
    subText = "Latin Small Ligature Ae (U+00E6)",
    text = "æ"
  }, {
    item = "ĳ",
    subText = "Latin Small Ligature Ij (U+0133)",
    text = "ĳ"
  }, {
    item = "œ",
    subText = "Latin Small Ligature Oe (U+0153)",
    text = "œ"
  }, {
    item = "ʰ",
    subText = "Latin Superscript Modifier Letters (U+02B0)",
    text = "ʰ"
  }, {
    item = "A",
    subText = "Latin Uppercase Alphabet (U+0041)",
    text = "A"
  }, {
    item = " ",
    subText = "Latin, Basic (U+0000)",
    text = " "
  }, {
    item = "Ā",
    subText = "Latin, European (U+0100)",
    text = "Ā"
  }, {
    item = " ",
    subText = "Latin-1 Punctuation And Symbols (U+00A0)",
    text = " "
  }, {
    item = " ",
    subText = "Latin-1 Supplement (U+00A0)",
    text = " "
  }, {
    item = "∽",
    subText = "Lazy S (U+223D)",
    text = "∽"
  }, {
    item = "∾",
    subText = "Lazy S, Inverted (U+223E)",
    text = "∾"
  }, {
    item = "․",
    subText = "Leader, One Dot (U+2024)",
    text = "․"
  }, {
    item = "…",
    subText = "Leader, Three Dot (U+2026)",
    text = "…"
  }, {
    item = "‥",
    subText = "Leader, Two Dot (U+2025)",
    text = "‥"
  }, {
    item = "🙐",
    subText = "Leaf Ornaments (U+1F650)",
    text = "🙐"
  }, {
    item = "❦",
    subText = "Leaf, Aldus (U+2766)",
    text = "❦"
  }, {
    item = "❧",
    subText = "Leaf, Ivy (U+2767)",
    text = "❧"
  }, {
    item = "〚",
    subText = "Left Abstract Syntax Bracket (U+301A)",
    text = "〚"
  }, {
    item = "̚",
    subText = "Left Angle Above, Combining (U+031A)",
    text = "̚"
  }, {
    item = "͉",
    subText = "Left Angle Below, Combining (U+0349)",
    text = "͉"
  }, {
    item = "〈",
    subText = "Left Angle Bracket (U+3008)",
    text = "〈"
  }, {
    item = "⟨",
    subText = "Left Angle Bracket, Mathematical (U+27E8)",
    text = "⟨"
  }, {
    item = "⃖",
    subText = "Left Arrow Above, Combining (U+20D6)",
    text = "⃖"
  }, {
    item = "⃮",
    subText = "Left Arrow Below, Combining (U+20EE)",
    text = "⃮"
  }, {
    item = "͔",
    subText = "Left Arrowhead Below, Combining (U+0354)",
    text = "͔"
  }, {
    item = "⟦",
    subText = "Left Bag Bracket (U+27E6)",
    text = "⟦"
  }, {
    item = "【",
    subText = "Left Black Lenticular Bracket (U+3010)",
    text = "【"
  }, {
    item = "⌈",
    subText = "Left Ceiling (U+2308)",
    text = "⌈"
  }, {
    item = "⟪",
    subText = "Left Chevron Bracket (U+27EA)",
    text = "⟪"
  }, {
    item = "「",
    subText = "Left Corner Bracket (U+300C)",
    text = "「"
  }, {
    item = "{",
    subText = "Left Curly Bracket (U+007B)",
    text = "{"
  }, {
    item = "《",
    subText = "Left Double Angle Bracket (U+300A)",
    text = "《"
  }, {
    item = "⟪",
    subText = "Left Double Angle Bracket, Mathematical (U+27EA)",
    text = "⟪"
  }, {
    item = "“",
    subText = "Left Double Quotation Mark (U+201C)",
    text = "“"
  }, {
    item = "⌊",
    subText = "Left Floor (U+230A)",
    text = "⌊"
  }, {
    item = "͑",
    subText = "Left Half Ring Above, Combining (U+0351)",
    text = "͑"
  }, {
    item = "̜",
    subText = "Left Half Ring Below, Combining (U+031C)",
    text = "̜"
  }, {
    item = "ՙ",
    subText = "Left Half Ring, Armenian Modifier Letter (U+0559)",
    text = "ՙ"
  }, {
    item = "ʿ",
    subText = "Left Half Ring, Modifier Letter (U+02BF)",
    text = "ʿ"
  }, {
    item = "˓",
    subText = "Left Half Ring, Modifier Letter Centred (U+02D3)",
    text = "˓"
  }, {
    item = "⃐",
    subText = "Left Harpoon Above, Combining (U+20D0)",
    text = "⃐"
  }, {
    item = "Ɲ",
    subText = "Left Hook, Latin Capital Letter N With (U+019D)",
    text = "Ɲ"
  }, {
    item = "ɲ",
    subText = "Left Hook, Latin Small Letter N With (U+0272)",
    text = "ɲ"
  }, {
    item = "⌫",
    subText = "Left Key, Delete To The (U+232B)",
    text = "⌫"
  }, {
    item = "⎰",
    subText = "Left Moustache (U+23B0)",
    text = "⎰"
  }, {
    item = "⋉",
    subText = "Left Normal Factor Semidirect Product (U+22C9)",
    text = "⋉"
  }, {
    item = "(",
    subText = "Left Parenthesis (U+0028)",
    text = "("
  }, {
    item = "﴾",
    subText = "Left Parenthesis, Ornate (U+FD3E)",
    text = "﴾"
  }, {
    item = "«",
    subText = "Left Pointing Guillemet (U+00AB)",
    text = "«"
  }, {
    item = "☚",
    subText = "Left Pointing Index, Black (U+261A)",
    text = "☚"
  }, {
    item = "☜",
    subText = "Left Pointing Index, White (U+261C)",
    text = "☜"
  }, {
    item = "‹",
    subText = "Left Pointing Single Guillemet (U+2039)",
    text = "‹"
  }, {
    item = "⃡",
    subText = "Left Right Arrow Above, Combining (U+20E1)",
    text = "⃡"
  }, {
    item = "͍",
    subText = "Left Right Arrow Below, Combining (U+034D)",
    text = "͍"
  }, {
    item = "⋋",
    subText = "Left Semidirect Product (U+22CB)",
    text = "⋋"
  }, {
    item = "⟨",
    subText = "Left Sequence Bracket (U+27E8)",
    text = "⟨"
  }, {
    item = "‘",
    subText = "Left Single Quotation Mark (U+2018)",
    text = "‘"
  }, {
    item = "[",
    subText = "Left Square Bracket (U+005B)",
    text = "["
  }, {
    item = "⁅",
    subText = "Left Square Bracket With Quill (U+2045)",
    text = "⁅"
  }, {
    item = "⊣",
    subText = "Left Tack (U+22A3)",
    text = "⊣"
  }, {
    item = "̘",
    subText = "Left Tack Below, Combining (U+0318)",
    text = "̘"
  }, {
    item = "〔",
    subText = "Left Tortoise Shell Bracket (U+3014)",
    text = "〔"
  }, {
    item = "『",
    subText = "Left White Corner Bracket (U+300E)",
    text = "『"
  }, {
    item = "⦃",
    subText = "Left White Curly Bracket (U+2983)",
    text = "⦃"
  }, {
    item = "〖",
    subText = "Left White Lenticular Bracket (U+3016)",
    text = "〖"
  }, {
    item = "⦅",
    subText = "Left White Parenthesis (U+2985)",
    text = "⦅"
  }, {
    item = "〚",
    subText = "Left White Square Bracket (U+301A)",
    text = "〚"
  }, {
    item = "〘",
    subText = "Left White Tortoise Shell Bracket (U+3018)",
    text = "〘"
  }, {
    item = "⌫",
    subText = "Left, Erase To The (U+232B)",
    text = "⌫"
  }, {
    item = "↞",
    subText = "Left, Fast Cursor (U+219E)",
    text = "↞"
  }, {
    item = "〈",
    subText = "Left-Pointing Angle Bracket (U+2329)",
    text = "〈"
  }, {
    item = "‹",
    subText = "Left-Pointing Angle Quotation Mark, Single (U+2039)",
    text = "‹"
  }, {
    item = "«",
    subText = "Left-Pointing Double Angle Quotation Mark (U+00AB)",
    text = "«"
  }, {
    item = "‪",
    subText = "Left-To-Right Embedding (U+202A)",
    text = "‪"
  }, {
    item = "⁦",
    subText = "Left-To-Right Isolate (U+2066)",
    text = "⁦"
  }, {
    item = "‎",
    subText = "Left-To-Right Mark (U+200E)",
    text = "‎"
  }, {
    item = "‭",
    subText = "Left-To-Right Override (U+202D)",
    text = "‭"
  }, {
    item = "⇤",
    subText = "Leftward Tab (U+21E4)",
    text = "⇤"
  }, {
    item = "←",
    subText = "Leftwards Arrow (U+2190)",
    text = "←"
  }, {
    item = "⃪",
    subText = "Leftwards Arrow Overlay, Combining (U+20EA)",
    text = "⃪"
  }, {
    item = "⁌",
    subText = "Leftwards Bullet, Black (U+204C)",
    text = "⁌"
  }, {
    item = "⃭",
    subText = "Leftwards Harpoon With Barb Downwards, Combining (U+20ED)",
    text = "⃭"
  }, {
    item = "【",
    subText = "Lenticular Bracket, Left Black (U+3010)",
    text = "【"
  }, {
    item = "〖",
    subText = "Lenticular Bracket, Left White (U+3016)",
    text = "〖"
  }, {
    item = "】",
    subText = "Lenticular Bracket, Right Black (U+3011)",
    text = "】"
  }, {
    item = "〗",
    subText = "Lenticular Bracket, Right White (U+3017)",
    text = "〗"
  }, {
    item = "♌",
    subText = "Leo (U+264C)",
    text = "♌"
  }, {
    item = "🐆",
    subText = "Leopard (U+1F406)",
    text = "🐆"
  }, {
    item = "ᰀ",
    subText = "Lepcha (U+1C00)",
    text = "ᰀ"
  }, {
    item = "�",
    subText = "Leppard (U+DEAF)",
    text = "�"
  }, {
    item = "≤",
    subText = "Less-Than Or Equal To (U+2264)",
    text = "≤"
  }, {
    item = "<",
    subText = "Less-Than Sign (U+003C)",
    text = "<"
  }, {
    item = "≪",
    subText = "Less-Than, Much (U+226A)",
    text = "≪"
  }, {
    item = "⋘",
    subText = "Less-Than, Very Much (U+22D8)",
    text = "⋘"
  }, {
    item = "ℵ",
    subText = "Letterlike Mathematical Symbols, Hebrew (U+2135)",
    text = "ℵ"
  }, {
    item = "℀",
    subText = "Letterlike Symbols (U+2100)",
    text = "℀"
  }, {
    item = "⇫",
    subText = "Level 2 Lock (U+21EB)",
    text = "⇫"
  }, {
    item = "⇧",
    subText = "Level 2 Select (Iso 9995-7) (U+21E7)",
    text = "⇧"
  }, {
    item = "⇯",
    subText = "Level 3 Lock (U+21EF)",
    text = "⇯"
  }, {
    item = "⇮",
    subText = "Level 3 Select (U+21EE)",
    text = "⇮"
  }, {
    item = "ɮ",
    subText = "Lezh, Latin Small Letter (U+026E)",
    text = "ɮ"
  }, {
    item = "\n",
    subText = "Lf (U+000A)",
    text = "\n"
  }, {
    item = "⟮",
    subText = "Lgroup (U+27EE)",
    text = "⟮"
  }, {
    item = "♎",
    subText = "Libra (U+264E)",
    text = "♎"
  }, {
    item = "Æ",
    subText = "Ligature Ae, Latin Capital (U+00C6)",
    text = "Æ"
  }, {
    item = "æ",
    subText = "Ligature Ae, Latin Small (U+00E6)",
    text = "æ"
  }, {
    item = "ĳ",
    subText = "Ligature Ij, Latin Small (U+0133)",
    text = "ĳ"
  }, {
    item = "œ",
    subText = "Ligature Oe, Latin Small (U+0153)",
    text = "œ"
  }, {
    item = "͡",
    subText = "Ligature Tie (U+0361)",
    text = "͡"
  }, {
    item = "͜",
    subText = "Ligature Tie Below (U+035C)",
    text = "͜"
  }, {
    item = "🙰",
    subText = "Ligature-Et Ornaments, Ampersand And (U+1F670)",
    text = "🙰"
  }, {
    item = "ﯪ",
    subText = "Ligatures, Arabic (U+FBEA)",
    text = "ﯪ"
  }, {
    item = "ﬓ",
    subText = "Ligatures, Armenian (U+FB13)",
    text = "ﬓ"
  }, {
    item = "ﬀ",
    subText = "Ligatures, Latin (U+FB00)",
    text = "ﬀ"
  }, {
    item = "💡",
    subText = "Light Bulb, Electric (U+1F4A1)",
    text = "💡"
  }, {
    item = "⛯",
    subText = "Lighthouse, Map Symbol For (U+26EF)",
    text = "⛯"
  }, {
    item = "☇",
    subText = "Lightning (U+2607)",
    text = "☇"
  }, {
    item = "⚡",
    subText = "Lightning (U+26A1)",
    text = "⚡"
  }, {
    item = "🗲",
    subText = "Lightning Bolt (U+1F5F2)",
    text = "🗲"
  }, {
    item = "ᤀ",
    subText = "Limbu (U+1900)",
    text = "ᤀ"
  }, {
    item = "᥆",
    subText = "Limbu Digits (U+1946)",
    text = "᥆"
  }, {
    item = "᥄",
    subText = "Limbu Exclamation Mark (U+1944)",
    text = "᥄"
  }, {
    item = "᥅",
    subText = "Limbu Question Mark (U+1945)",
    text = "᥅"
  }, {
    item = "᤹",
    subText = "Limbu Signs (U+1939)",
    text = "᤹"
  }, {
    item = "≐",
    subText = "Limit, Approaches The (U+2250)",
    text = "≐"
  }, {
    item = "̎",
    subText = "Line Above, Combining Double Vertical (U+030E)",
    text = "̎"
  }, {
    item = "̍",
    subText = "Line Above, Combining Vertical (U+030D)",
    text = "̍"
  }, {
    item = "",
    subText = "Line Backward, Partial (U+008C)",
    text = ""
  }, {
    item = "͈",
    subText = "Line Below, Combining Double Vertical (U+0348)",
    text = "͈"
  }, {
    item = "̩",
    subText = "Line Below, Combining Vertical (U+0329)",
    text = "̩"
  }, {
    item = "\n",
    subText = "Line Feed (U+000A)",
    text = "\n"
  }, {
    item = "↴",
    subText = "Line Feed (U+21B4)",
    text = "↴"
  }, {
    item = "",
    subText = "Line Feed, Reverse (U+008D)",
    text = ""
  }, {
    item = "␊",
    subText = "Line Feed, Symbol For (U+240A)",
    text = "␊"
  }, {
    item = "",
    subText = "Line Forward, Partial (U+008B)",
    text = ""
  }, {
    item = "⌙",
    subText = "Line Marker (U+2319)",
    text = "⌙"
  }, {
    item = "⫮",
    subText = "Line Operators, Vertical (U+2AEE)",
    text = "⫮"
  }, {
    item = "⃒",
    subText = "Line Overlay, Combining Long Vertical (U+20D2)",
    text = "⃒"
  }, {
    item = "⃓",
    subText = "Line Overlay, Combining Short Vertical (U+20D3)",
    text = "⃓"
  }, {
    item = " ",
    subText = "Line Separator (U+2028)",
    text = " "
  }, {
    item = "℄",
    subText = "Line Symbol, Centre (U+2104)",
    text = "℄"
  }, {
    item = "\v",
    subText = "Line Tabulation (U+000B)",
    text = "\v"
  }, {
    item = "",
    subText = "Line Tabulation Set (U+008A)",
    text = ""
  }, {
    item = "⍿",
    subText = "Line With Middle Dot, Vertical (U+237F)",
    text = "⍿"
  }, {
    item = "⌐",
    subText = "Line, Beginning Of (U+2310)",
    text = "⌐"
  }, {
    item = "﹎",
    subText = "Line, Centreline Low (U+FE4E)",
    text = "﹎"
  }, {
    item = "̳",
    subText = "Line, Combining Double Low (U+0333)",
    text = "̳"
  }, {
    item = "̲",
    subText = "Line, Combining Low (U+0332)",
    text = "̲"
  }, {
    item = "﹍",
    subText = "Line, Dashed Low (U+FE4D)",
    text = "﹍"
  }, {
    item = "‗",
    subText = "Line, Double Low (U+2017)",
    text = "‗"
  }, {
    item = "‖",
    subText = "Line, Double Vertical (U+2016)",
    text = "‖"
  }, {
    item = "\n",
    subText = "Line, End Of (U+000A)",
    text = "\n"
  }, {
    item = "_",
    subText = "Line, Low (U+005F)",
    text = "_"
  }, {
    item = "ˌ",
    subText = "Line, Modifier Letter Low Vertical (U+02CC)",
    text = "ˌ"
  }, {
    item = "ˈ",
    subText = "Line, Modifier Letter Vertical (U+02C8)",
    text = "ˈ"
  }, {
    item = "\n",
    subText = "Line, New (U+000A)",
    text = "\n"
  }, {
    item = "",
    subText = "Line, Next (U+0085)",
    text = ""
  }, {
    item = "⅊",
    subText = "Line, Property (U+214A)",
    text = "⅊"
  }, {
    item = "|",
    subText = "Line, Vertical (U+007C)",
    text = "|"
  }, {
    item = "⌇",
    subText = "Line, Wavy (U+2307)",
    text = "⌇"
  }, {
    item = "﹏",
    subText = "Line, Wavy Low (U+FE4F)",
    text = "﹏"
  }, {
    item = "𐘀",
    subText = "Linear A (U+10600)",
    text = "𐘀"
  }, {
    item = "𐂀",
    subText = "Linear B Ideograms (U+10080)",
    text = "𐂀"
  }, {
    item = "𐀀",
    subText = "Linear B Syllabary (U+10000)",
    text = "𐀀"
  }, {
    item = "⎺",
    subText = "Lines, Horizontal Scan (U+23BA)",
    text = "⎺"
  }, {
    item = "∣",
    subText = "Lines, Vertical (U+2223)",
    text = "∣"
  }, {
    item = "🦁",
    subText = "Lion Face (U+1F981)",
    text = "🦁"
  }, {
    item = "🗢",
    subText = "Lips (U+1F5E2)",
    text = "🗢"
  }, {
    item = "₤",
    subText = "Lira Sign (U+20A4)",
    text = "₤"
  }, {
    item = "₺",
    subText = "Lira Sign, Turkish (U+20BA)",
    text = "₺"
  }, {
    item = "£",
    subText = "Lira, Italian (U+00A3)",
    text = "£"
  }, {
    item = "ꓐ",
    subText = "Lisu (U+A4D0)",
    text = "ꓐ"
  }, {
    item = "ℓ",
    subText = "Liter (U+2113)",
    text = "ℓ"
  }, {
    item = "₶",
    subText = "Livre Tournois Sign (U+20B6)",
    text = "₶"
  }, {
    item = "🦞",
    subText = "Lobster (U+1F99E)",
    text = "🦞"
  }, {
    item = "🔏",
    subText = "Lock Symbols (U+1F50F)",
    text = "🔏"
  }, {
    item = "⇪",
    subText = "Lock, Caps (U+21EA)",
    text = "⇪"
  }, {
    item = "⇬",
    subText = "Lock, Caps (U+21EC)",
    text = "⇬"
  }, {
    item = "⇭",
    subText = "Lock, Numerics (U+21ED)",
    text = "⇭"
  }, {
    item = "⚿",
    subText = "Lock, Parental (U+26BF)",
    text = "⚿"
  }, {
    item = "⟘",
    subText = "Logic Operators, Modal (U+27D8)",
    text = "⟘"
  }, {
    item = "⟠",
    subText = "Logic Operators, Modal (U+27E0)",
    text = "⟠"
  }, {
    item = "∧",
    subText = "Logical And (U+2227)",
    text = "∧"
  }, {
    item = "⋏",
    subText = "Logical And, Curly (U+22CF)",
    text = "⋏"
  }, {
    item = "⋀",
    subText = "Logical And, N-Ary (U+22C0)",
    text = "⋀"
  }, {
    item = "⩑",
    subText = "Logical Ands And Ors (U+2A51)",
    text = "⩑"
  }, {
    item = "∨",
    subText = "Logical Or (U+2228)",
    text = "∨"
  }, {
    item = "⋎",
    subText = "Logical Or, Curly (U+22CE)",
    text = "⋎"
  }, {
    item = "⋁",
    subText = "Logical Or, N-Ary (U+22C1)",
    text = "⋁"
  }, {
    item = "̄",
    subText = "Long (U+0304)",
    text = "̄"
  }, {
    item = "⟵",
    subText = "Long Arrows (U+27F5)",
    text = "⟵"
  }, {
    item = "⟌",
    subText = "Long Division (U+27CC)",
    text = "⟌"
  }, {
    item = "⃫",
    subText = "Long Double Slash Overlay (U+20EB)",
    text = "⃫"
  }, {
    item = "ſ",
    subText = "Long S, Latin Small Letter (U+017F)",
    text = "ſ"
  }, {
    item = "̸",
    subText = "Long Slash Overlay (U+0338)",
    text = "̸"
  }, {
    item = "̸",
    subText = "Long Solidus Overlay, Combining (U+0338)",
    text = "̸"
  }, {
    item = "̶",
    subText = "Long Stroke Overlay, Combining (U+0336)",
    text = "̶"
  }, {
    item = "⃒",
    subText = "Long Vertical Line Overlay, Combining (U+20D2)",
    text = "⃒"
  }, {
    item = "➰",
    subText = "Loop, Curly (U+27B0)",
    text = "➰"
  }, {
    item = "➿",
    subText = "Loop, Double Curly (U+27BF)",
    text = "➿"
  }, {
    item = "☨",
    subText = "Lorraine, Cross Of (U+2628)",
    text = "☨"
  }, {
    item = "⛟",
    subText = "Lorry, Black (U+26DF)",
    text = "⛟"
  }, {
    item = "🤟",
    subText = "Love, Hand Sign (U+1F91F)",
    text = "🤟"
  }, {
    item = "ˏ",
    subText = "Low Acute Accent, Modifier Letter (U+02CF)",
    text = "ˏ"
  }, {
    item = "⁎",
    subText = "Low Asterisk (U+204E)",
    text = "⁎"
  }, {
    item = "„",
    subText = "Low Double Comma Quotation Mark (U+201E)",
    text = "„"
  }, {
    item = "〟",
    subText = "Low Double Prime Quotation Mark (U+301F)",
    text = "〟"
  }, {
    item = "ˎ",
    subText = "Low Grave Accent, Modifier Letter (U+02CE)",
    text = "ˎ"
  }, {
    item = "_",
    subText = "Low Line (U+005F)",
    text = "_"
  }, {
    item = "﹎",
    subText = "Low Line, Centreline (U+FE4E)",
    text = "﹎"
  }, {
    item = "̲",
    subText = "Low Line, Combining (U+0332)",
    text = "̲"
  }, {
    item = "̳",
    subText = "Low Line, Combining Double (U+0333)",
    text = "̳"
  }, {
    item = "﹍",
    subText = "Low Line, Dashed (U+FE4D)",
    text = "﹍"
  }, {
    item = "‗",
    subText = "Low Line, Double (U+2017)",
    text = "‗"
  }, {
    item = "﹏",
    subText = "Low Line, Wavy (U+FE4F)",
    text = "﹏"
  }, {
    item = "ˍ",
    subText = "Low Macron, Modifier Letter (U+02CD)",
    text = "ˍ"
  }, {
    item = "‚",
    subText = "Low Single Comma Quotation Mark (U+201A)",
    text = "‚"
  }, {
    item = "�",
    subText = "Low Surrogates (U+DC00)",
    text = "�"
  }, {
    item = "ˌ",
    subText = "Low Vertical Line, Modifier Letter (U+02CC)",
    text = "ˌ"
  }, {
    item = "„",
    subText = "Low-9 Quotation Mark, Double (U+201E)",
    text = "„"
  }, {
    item = "‚",
    subText = "Low-9 Quotation Mark, Single (U+201A)",
    text = "‚"
  }, {
    item = "⨜",
    subText = "Lower Integral (U+2A1C)",
    text = "⨜"
  }, {
    item = "≺",
    subText = "Lower Rank Than (U+227A)",
    text = "≺"
  }, {
    item = "a",
    subText = "Lowercase Alphabet, Latin (U+0061)",
    text = "a"
  }, {
    item = "◊",
    subText = "Lozenge (U+25CA)",
    text = "◊"
  }, {
    item = "⧫",
    subText = "Lozenge, Black (U+29EB)",
    text = "⧫"
  }, {
    item = "⌑",
    subText = "Lozenge, Square (U+2311)",
    text = "⌑"
  }, {
    item = "🞝",
    subText = "Lozenges (U+1F79D)",
    text = "🞝"
  }, {
    item = "‪",
    subText = "Lre (U+202A)",
    text = "‪"
  }, {
    item = "‎",
    subText = "Lrm (U+200E)",
    text = "‎"
  }, {
    item = "‭",
    subText = "Lro (U+202D)",
    text = "‭"
  }, {
    item = "ϵ",
    subText = "Lunate Epsilon Symbol, Greek (U+03F5)",
    text = "ϵ"
  }, {
    item = "϶",
    subText = "Lunate Epsilon Symbol, Greek Reversed (U+03F6)",
    text = "϶"
  }, {
    item = "ϲ",
    subText = "Lunate Sigma Symbol, Greek (U+03F2)",
    text = "ϲ"
  }, {
    item = "𐊀",
    subText = "Lycian (U+10280)",
    text = "𐊀"
  }, {
    item = "𐤠",
    subText = "Lydian (U+10920)",
    text = "𐤠"
  }, {
    item = "ḿ",
    subText = "M With Acute, Latin Small Letter (U+1E3F)",
    text = "ḿ"
  }, {
    item = "ṁ",
    subText = "M With Dot Above, Latin Small Letter (U+1E41)",
    text = "ṁ"
  }, {
    item = "ṃ",
    subText = "M With Dot Below, Latin Small Letter (U+1E43)",
    text = "ṃ"
  }, {
    item = "ɱ",
    subText = "M With Hook, Latin Small Letter (U+0271)",
    text = "ɱ"
  }, {
    item = "ɰ",
    subText = "M With Long Leg, Latin Small Letter Turned (U+0270)",
    text = "ɰ"
  }, {
    item = "ͫ",
    subText = "M, Combining Latin Small Letter (U+036B)",
    text = "ͫ"
  }, {
    item = "Ɯ",
    subText = "M, Latin Capital Letter Turned (U+019C)",
    text = "Ɯ"
  }, {
    item = "ᴍ",
    subText = "M, Latin Letter Small Capital (U+1D0D)",
    text = "ᴍ"
  }, {
    item = "ᴟ",
    subText = "M, Latin Small Letter Sideways Turned (U+1D1F)",
    text = "ᴟ"
  }, {
    item = "ɯ",
    subText = "M, Latin Small Letter Turned (U+026F)",
    text = "ɯ"
  }, {
    item = "ₘ",
    subText = "M, Latin Subscript Small Letter (U+2098)",
    text = "ₘ"
  }, {
    item = "ℳ",
    subText = "M, Script Capital (U+2133)",
    text = "ℳ"
  }, {
    item = "ℳ",
    subText = "M-Matrix (U+2133)",
    text = "ℳ"
  }, {
    item = "௴",
    subText = "Maatham, Tamil (U+0BF4)",
    text = "௴"
  }, {
    item = "¯",
    subText = "Macron (U+00AF)",
    text = "¯"
  }, {
    item = "̱",
    subText = "Macron Below, Combining (U+0331)",
    text = "̱"
  }, {
    item = "͟",
    subText = "Macron Below, Combining Double (U+035F)",
    text = "͟"
  }, {
    item = "︤",
    subText = "Macron Left Half, Combining (U+FE24)",
    text = "︤"
  }, {
    item = "︥",
    subText = "Macron Right Half, Combining (U+FE25)",
    text = "︥"
  }, {
    item = "̄",
    subText = "Macron, Combining (U+0304)",
    text = "̄"
  }, {
    item = "͞",
    subText = "Macron, Combining Double (U+035E)",
    text = "͞"
  }, {
    item = "ˉ",
    subText = "Macron, Modifier Letter (U+02C9)",
    text = "ˉ"
  }, {
    item = "ˍ",
    subText = "Macron, Modifier Letter Low (U+02CD)",
    text = "ˍ"
  }, {
    item = "¯",
    subText = "Macron, Spacing (U+00AF)",
    text = "¯"
  }, {
    item = "⑆",
    subText = "Magnetic Ink Character Recognition, Micr (U+2446)",
    text = "⑆"
  }, {
    item = "🔍",
    subText = "Magnifying Glass, Left-Pointing (U+1F50D)",
    text = "🔍"
  }, {
    item = "🔎",
    subText = "Magnifying Glass, Right-Pointing (U+1F50E)",
    text = "🔎"
  }, {
    item = "𑅐",
    subText = "Mahajani (U+11150)",
    text = "𑅐"
  }, {
    item = "🀀",
    subText = "Mahjong Tiles (U+1F000)",
    text = "🀀"
  }, {
    item = "📤",
    subText = "Mail Symbols (U+1F4E4)",
    text = "📤"
  }, {
    item = "𑻠",
    subText = "Makasar (U+11EE0)",
    text = "𑻠"
  }, {
    item = "ഀ",
    subText = "Malayalam (U+0D00)",
    text = "ഀ"
  }, {
    item = "്",
    subText = "Malayalam Chandrakkala (U+0D4D)",
    text = "്"
  }, {
    item = "ൺ",
    subText = "Malayalam Chillu Letters (U+0D7A)",
    text = "ൺ"
  }, {
    item = "ക",
    subText = "Malayalam Consonants (U+0D15)",
    text = "ക"
  }, {
    item = "ാ",
    subText = "Malayalam Dependent Vowel Signs (U+0D3E)",
    text = "ാ"
  }, {
    item = "൦",
    subText = "Malayalam Digits (U+0D66)",
    text = "൦"
  }, {
    item = "അ",
    subText = "Malayalam Independent Vowels (U+0D05)",
    text = "അ"
  }, {
    item = "്",
    subText = "Malayalam Sign Virama (U+0D4D)",
    text = "്"
  }, {
    item = "്",
    subText = "Malayalam Vowel Half-U (U+0D4D)",
    text = "്"
  }, {
    item = "♂",
    subText = "Male Sign (U+2642)",
    text = "♂"
  }, {
    item = "✠",
    subText = "Maltese Cross (U+2720)",
    text = "✠"
  }, {
    item = "👨",
    subText = "Man (U+1F468)",
    text = "👨"
  }, {
    item = "👫",
    subText = "Man And Woman Holding Hands (U+1F46B)",
    text = "👫"
  }, {
    item = "👴",
    subText = "Man, Older (U+1F474)",
    text = "👴"
  }, {
    item = "₼",
    subText = "Manat Sign (U+20BC)",
    text = "₼"
  }, {
    item = "᠈",
    subText = "Manchu Comma, Mongolian (U+1808)",
    text = "᠈"
  }, {
    item = "᠉",
    subText = "Manchu Full Stop, Mongolian (U+1809)",
    text = "᠉"
  }, {
    item = "ࡀ",
    subText = "Mandaic (U+0840)",
    text = "ࡀ"
  }, {
    item = "˙",
    subText = "Mandarin Chinese Fifth Or Neutral Tone (U+02D9)",
    text = "˙"
  }, {
    item = "ˉ",
    subText = "Mandarin Chinese First Tone (U+02C9)",
    text = "ˉ"
  }, {
    item = "ˋ",
    subText = "Mandarin Chinese Fourth Tone (U+02CB)",
    text = "ˋ"
  }, {
    item = "ˊ",
    subText = "Mandarin Chinese Second Tone (U+02CA)",
    text = "ˊ"
  }, {
    item = "ˇ",
    subText = "Mandarin Chinese Third Tone (U+02C7)",
    text = "ˇ"
  }, {
    item = "𐫀",
    subText = "Manichaean (U+10AC0)",
    text = "𐫀"
  }, {
    item = "⚐",
    subText = "Map Symbols, Dictionary And (U+2690)",
    text = "⚐"
  }, {
    item = "↦",
    subText = "Maplet (U+21A6)",
    text = "↦"
  }, {
    item = "⟻",
    subText = "Maps From (U+27FB)",
    text = "⟻"
  }, {
    item = "⤆",
    subText = "Maps From (U+2906)",
    text = "⤆"
  }, {
    item = "⟼",
    subText = "Maps To (U+27FC)",
    text = "⟼"
  }, {
    item = "⤅",
    subText = "Maps To (U+2905)",
    text = "⤅"
  }, {
    item = "⤇",
    subText = "Maps To (U+2907)",
    text = "⤇"
  }, {
    item = "𑱰",
    subText = "Marchen (U+11C70)",
    text = "𑱰"
  }, {
    item = "⛴",
    subText = "Marina Or Yacht Harbour (U+26F4)",
    text = "⛴"
  }, {
    item = "ℳ",
    subText = "Mark Pre-Wwii, German (U+2133)",
    text = "ℳ"
  }, {
    item = "▮",
    subText = "Marker, Histogram (U+25AE)",
    text = "▮"
  }, {
    item = "⌙",
    subText = "Marker, Line (U+2319)",
    text = "⌙"
  }, {
    item = "⚆",
    subText = "Markers, Go (U+2686)",
    text = "⚆"
  }, {
    item = "̀",
    subText = "Marks, Combining Diacritical (U+0300)",
    text = "̀"
  }, {
    item = "︠",
    subText = "Marks, Combining Half (U+FE20)",
    text = "︠"
  }, {
    item = "🅪",
    subText = "Marque De Commerce (U+1F16A)",
    text = "🅪"
  }, {
    item = "🅫",
    subText = "Marque Deposee (U+1F16B)",
    text = "🅫"
  }, {
    item = "⚭",
    subText = "Marriage Symbol (U+26AD)",
    text = "⚭"
  }, {
    item = "♂",
    subText = "Mars (U+2642)",
    text = "♂"
  }, {
    item = "𑴀",
    subText = "Masaram Gondi (U+11D00)",
    text = "𑴀"
  }, {
    item = "º",
    subText = "Masculine Ordinal Indicator (U+00BA)",
    text = "º"
  }, {
    item = "🎭",
    subText = "Masks Of Comedy And Tragedy (U+1F3AD)",
    text = "🎭"
  }, {
    item = "〼",
    subText = "Masu Mark (U+303C)",
    text = "〼"
  }, {
    item = "𝐀",
    subText = "Mathematical Alphanumeric Symbols (U+1D400)",
    text = "𝐀"
  }, {
    item = "⟦",
    subText = "Mathematical Brackets (U+27E6)",
    text = "⟦"
  }, {
    item = "π",
    subText = "Mathematical Constant 3.141592... Pi (U+03C0)",
    text = "π"
  }, {
    item = "𝟎",
    subText = "Mathematical Digits Symbols (U+1D7CE)",
    text = "𝟎"
  }, {
    item = "∀",
    subText = "Mathematical Operators (U+2200)",
    text = "∀"
  }, {
    item = "∴",
    subText = "Mathematical Operators, Dotted (U+2234)",
    text = "∴"
  }, {
    item = "⊕",
    subText = "Mathematical Operators, Enclosed (U+2295)",
    text = "⊕"
  }, {
    item = "⨀",
    subText = "Mathematical Operators, Supplemental (U+2A00)",
    text = "⨀"
  }, {
    item = "∻",
    subText = "Mathematical Operators, Tilde (U+223B)",
    text = "∻"
  }, {
    item = " ",
    subText = "Mathematical Space, Medium (U+205F)",
    text = " "
  }, {
    item = "⟀",
    subText = "Mathematical Symbols (U+27C0)",
    text = "⟀"
  }, {
    item = "⦀",
    subText = "Mathematical Symbols (U+2980)",
    text = "⦀"
  }, {
    item = "𝔄",
    subText = "Mathematical Symbols, Black-Letter (U+1D504)",
    text = "𝔄"
  }, {
    item = "𝕬",
    subText = "Mathematical Symbols, Bold Fraktur (U+1D56C)",
    text = "𝕬"
  }, {
    item = "𝚨",
    subText = "Mathematical Symbols, Bold Greek (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝑨",
    subText = "Mathematical Symbols, Bold Italic (U+1D468)",
    text = "𝑨"
  }, {
    item = "𝜜",
    subText = "Mathematical Symbols, Bold Italic Greek (U+1D71C)",
    text = "𝜜"
  }, {
    item = "𝓐",
    subText = "Mathematical Symbols, Bold Script (U+1D4D0)",
    text = "𝓐"
  }, {
    item = "𝚤",
    subText = "Mathematical Symbols, Dotless (U+1D6A4)",
    text = "𝚤"
  }, {
    item = "𝔸",
    subText = "Mathematical Symbols, Double-Struck (U+1D538)",
    text = "𝔸"
  }, {
    item = "𝔄",
    subText = "Mathematical Symbols, Fraktur (U+1D504)",
    text = "𝔄"
  }, {
    item = "𝚨",
    subText = "Mathematical Symbols, Greek (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "ℵ",
    subText = "Mathematical Symbols, Hebrew Letterlike (U+2135)",
    text = "ℵ"
  }, {
    item = "𝐴",
    subText = "Mathematical Symbols, Italic (U+1D434)",
    text = "𝐴"
  }, {
    item = "𝛢",
    subText = "Mathematical Symbols, Italic Greek (U+1D6E2)",
    text = "𝛢"
  }, {
    item = "𝙰",
    subText = "Mathematical Symbols, Monospace (U+1D670)",
    text = "𝙰"
  }, {
    item = "𝖠",
    subText = "Mathematical Symbols, Sans-Serif (U+1D5A0)",
    text = "𝖠"
  }, {
    item = "𝗔",
    subText = "Mathematical Symbols, Sans-Serif Bold (U+1D5D4)",
    text = "𝗔"
  }, {
    item = "𝝖",
    subText = "Mathematical Symbols, Sans-Serif Bold Greek (U+1D756)",
    text = "𝝖"
  }, {
    item = "𝘼",
    subText = "Mathematical Symbols, Sans-Serif Bold Italic (U+1D63C)",
    text = "𝘼"
  }, {
    item = "𝞐",
    subText = "Mathematical Symbols, Sans-Serif Bold Italic Greek (U+1D790)",
    text = "𝞐"
  }, {
    item = "𝘈",
    subText = "Mathematical Symbols, Sans-Serif Italic (U+1D608)",
    text = "𝘈"
  }, {
    item = "𝒜",
    subText = "Mathematical Symbols, Script (U+1D49C)",
    text = "𝒜"
  }, {
    item = "⟀",
    subText = "Mathematical Symbols-A, Miscellaneous (U+27C0)",
    text = "⟀"
  }, {
    item = "⦀",
    subText = "Mathematical Symbols-B, Miscellaneous (U+2980)",
    text = "⦀"
  }, {
    item = "⊹",
    subText = "Matrix, Hermitian Conjugate (U+22B9)",
    text = "⊹"
  }, {
    item = "𝋠",
    subText = "Mayan Numerals (U+1D2E0)",
    text = "𝋠"
  }, {
    item = "🅪",
    subText = "Mc Sign, Raised (U+1F16A)",
    text = "🅪"
  }, {
    item = "🅫",
    subText = "Md Sign, Raised (U+1F16B)",
    text = "🅫"
  }, {
    item = "∡",
    subText = "Measured Angle (U+2221)",
    text = "∡"
  }, {
    item = "⦛",
    subText = "Measured Angles, Angles And (U+299B)",
    text = "⦛"
  }, {
    item = "≞",
    subText = "Measured By (U+225E)",
    text = "≞"
  }, {
    item = "⁒",
    subText = "Med Avdrag Av (U+2052)",
    text = "⁒"
  }, {
    item = "𖹀",
    subText = "Medefaidrin (U+16E40)",
    text = "𖹀"
  }, {
    item = "ͣ",
    subText = "Medieval Superscript Letter Diacritics (U+0363)",
    text = "ͣ"
  }, {
    item = "ᷓ",
    subText = "Medieval Superscript Letter Diacritics, Latin (U+1DD3)",
    text = "ᷓ"
  }, {
    item = "⸪",
    subText = "Medievalist Punctuation (U+2E2A)",
    text = "⸪"
  }, {
    item = "⚫",
    subText = "Medium Black Circle (U+26AB)",
    text = "⚫"
  }, {
    item = " ",
    subText = "Medium Mathematical Space (U+205F)",
    text = " "
  }, {
    item = "◾",
    subText = "Medium Small Square, Black (U+25FE)",
    text = "◾"
  }, {
    item = "⚬",
    subText = "Medium Small White Circle (U+26AC)",
    text = "⚬"
  }, {
    item = "◼",
    subText = "Medium Square, Black (U+25FC)",
    text = "◼"
  }, {
    item = "⚪",
    subText = "Medium White Circle (U+26AA)",
    text = "⚪"
  }, {
    item = "",
    subText = "Medium, End Of (U+0019)",
    text = ""
  }, {
    item = "␙",
    subText = "Medium, Symbol For End Of (U+2419)",
    text = "␙"
  }, {
    item = "ꯀ",
    subText = "Meetei Mayek (U+ABC0)",
    text = "ꯀ"
  }, {
    item = "ꫠ",
    subText = "Meetei Mayek Extensions (U+AAE0)",
    text = "ꫠ"
  }, {
    item = "∋",
    subText = "Member, Contains As (U+220B)",
    text = "∋"
  }, {
    item = "∌",
    subText = "Member, Does Not Contain As (U+220C)",
    text = "∌"
  }, {
    item = "∍",
    subText = "Member, Small Contains As (U+220D)",
    text = "∍"
  }, {
    item = "∈",
    subText = "Membership Signs, Set (U+2208)",
    text = "∈"
  }, {
    item = "⋿",
    subText = "Membership, Z Notation Bag (U+22FF)",
    text = "⋿"
  }, {
    item = "👬",
    subText = "Men Holding Hands, Two (U+1F46C)",
    text = "👬"
  }, {
    item = "𞠀",
    subText = "Mende Kikakui (U+1E800)",
    text = "𞠀"
  }, {
    item = "☿",
    subText = "Mercury (U+263F)",
    text = "☿"
  }, {
    item = "⨇",
    subText = "Merge (U+2A07)",
    text = "⨇"
  }, {
    item = "𐦠",
    subText = "Meroitic Cursive (U+109A0)",
    text = "𐦠"
  }, {
    item = "𐦀",
    subText = "Meroitic Hieroglyphs (U+10980)",
    text = "𐦀"
  }, {
    item = "௸",
    subText = "Merpadi, Tamil (U+0BF8)",
    text = "௸"
  }, {
    item = "",
    subText = "Message Waiting (U+0095)",
    text = ""
  }, {
    item = "",
    subText = "Message, Privacy (U+009E)",
    text = ""
  }, {
    item = "⏑",
    subText = "Metrical Symbols (U+23D1)",
    text = "⏑"
  }, {
    item = "℧",
    subText = "Mho (U+2127)",
    text = "℧"
  }, {
    item = "𖼀",
    subText = "Miao (U+16F00)",
    text = "𖼀"
  }, {
    item = "⑆",
    subText = "Micr, Magnetic Ink Character Recognition (U+2446)",
    text = "⑆"
  }, {
    item = "µ",
    subText = "Micro Sign (U+00B5)",
    text = "µ"
  }, {
    item = " ",
    subText = "Mid Space (U+2005)",
    text = " "
  }, {
    item = "·",
    subText = "Middle Dot (U+00B7)",
    text = "·"
  }, {
    item = "·",
    subText = "Middle Dot, Greek (U+00B7)",
    text = "·"
  }, {
    item = "・",
    subText = "Middle Dot, Katakana (U+30FB)",
    text = "・"
  }, {
    item = "ŀ",
    subText = "Middle Dot, Latin Small Letter L With (U+0140)",
    text = "ŀ"
  }, {
    item = "⍿",
    subText = "Middle Dot, Vertical Line With (U+237F)",
    text = "⍿"
  }, {
    item = "⸱",
    subText = "Middle Dot, Word Separator (U+2E31)",
    text = "⸱"
  }, {
    item = "Ɵ",
    subText = "Middle Tilde, Latin Capital Letter O With (U+019F)",
    text = "Ɵ"
  }, {
    item = "ɫ",
    subText = "Middle Tilde, Latin Small Letter L With (U+026B)",
    text = "ɫ"
  }, {
    item = "⋯",
    subText = "Midline Horizontal Ellipsis (U+22EF)",
    text = "⋯"
  }, {
    item = "·",
    subText = "Midpoint (U+00B7)",
    text = "·"
  }, {
    item = "₥",
    subText = "Mill Sign (U+20A5)",
    text = "₥"
  }, {
    item = "‰",
    subText = "Mille Sign, Per (U+2030)",
    text = "‰"
  }, {
    item = "$",
    subText = "Milreis (U+0024)",
    text = "$"
  }, {
    item = "𝅗𝅥",
    subText = "Minim (U+1D15E)",
    text = "𝅗𝅥"
  }, {
    item = "♏",
    subText = "Minim (U+264F)",
    text = "♏"
  }, {
    item = "♍",
    subText = "Minim Alternate Glyph (U+264D)",
    text = "♍"
  }, {
    item = "⚒",
    subText = "Mining Symbol (U+2692)",
    text = "⚒"
  }, {
    item = "−",
    subText = "Minus Sign (U+2212)",
    text = "−"
  }, {
    item = "̠",
    subText = "Minus Sign Below, Combining (U+0320)",
    text = "̠"
  }, {
    item = "⨢",
    subText = "Minus Sign Operators, Plus And (U+2A22)",
    text = "⨢"
  }, {
    item = "⁒",
    subText = "Minus Sign, Commercial (U+2052)",
    text = "⁒"
  }, {
    item = "-",
    subText = "Minus Sign, Hyphen Or (U+002D)",
    text = "-"
  }, {
    item = "˗",
    subText = "Minus Sign, Modifier Letter (U+02D7)",
    text = "˗"
  }, {
    item = "≂",
    subText = "Minus Tilde (U+2242)",
    text = "≂"
  }, {
    item = "⊖",
    subText = "Minus, Circled (U+2296)",
    text = "⊖"
  }, {
    item = "∸",
    subText = "Minus, Dot (U+2238)",
    text = "∸"
  }, {
    item = "∖",
    subText = "Minus, Set (U+2216)",
    text = "∖"
  }, {
    item = "⊟",
    subText = "Minus, Squared (U+229F)",
    text = "⊟"
  }, {
    item = "∓",
    subText = "Minus-Or-Plus Sign (U+2213)",
    text = "∓"
  }, {
    item = "′",
    subText = "Minutes (U+2032)",
    text = "′"
  }, {
    item = "⧿",
    subText = "Miny (U+29FF)",
    text = "⧿"
  }, {
    item = "🥀",
    subText = "Miscellaneous Symbols (U+1F940)",
    text = "🥀"
  }, {
    item = "☀",
    subText = "Miscellaneous Symbols (U+2600)",
    text = "☀"
  }, {
    item = "ა",
    subText = "Mkhedruli, Georgian (U+10D0)",
    text = "ა"
  }, {
    item = " ",
    subText = "Mmsp (U+205F)",
    text = " "
  }, {
    item = "⟠",
    subText = "Modal Logic Operators (U+27E0)",
    text = "⟠"
  }, {
    item = "⊧",
    subText = "Models (U+22A7)",
    text = "⊧"
  }, {
    item = "𑘀",
    subText = "Modi (U+11600)",
    text = "𑘀"
  }, {
    item = "ᴬ",
    subText = "Modifier Letter Extensions (U+1D2C)",
    text = "ᴬ"
  }, {
    item = "ʰ",
    subText = "Modifier Letters, Latin Superscript (U+02B0)",
    text = "ʰ"
  }, {
    item = "ʰ",
    subText = "Modifier Letters, Spacing (U+02B0)",
    text = "ʰ"
  }, {
    item = "꜀",
    subText = "Modifier Tone Letters (U+A700)",
    text = "꜀"
  }, {
    item = "ʰ",
    subText = "Modifiers Derived From Latin Letters, Phonetic (U+02B0)",
    text = "ʰ"
  }, {
    item = "ʹ",
    subText = "Modifiers, Phonetic (U+02B9)",
    text = "ʹ"
  }, {
    item = "˯",
    subText = "Modifiers, Upa (U+02EF)",
    text = "˯"
  }, {
    item = "💰",
    subText = "Money Symbols (U+1F4B0)",
    text = "💰"
  }, {
    item = "᠀",
    subText = "Mongolian (U+1800)",
    text = "᠀"
  }, {
    item = "ᠠ",
    subText = "Mongolian Basic Letters (U+1820)",
    text = "ᠠ"
  }, {
    item = "᠀",
    subText = "Mongolian Birga (U+1800)",
    text = "᠀"
  }, {
    item = "᠄",
    subText = "Mongolian Colon (U+1804)",
    text = "᠄"
  }, {
    item = "᠂",
    subText = "Mongolian Comma (U+1802)",
    text = "᠂"
  }, {
    item = "₮",
    subText = "Mongolian Currency (U+20AE)",
    text = "₮"
  }, {
    item = "᠐",
    subText = "Mongolian Digits (U+1810)",
    text = "᠐"
  }, {
    item = "᠁",
    subText = "Mongolian Ellipsis (U+1801)",
    text = "᠁"
  }, {
    item = "ᡃ",
    subText = "Mongolian Extensions (U+1843)",
    text = "ᡃ"
  }, {
    item = "᠋",
    subText = "Mongolian Format Controls (U+180B)",
    text = "᠋"
  }, {
    item = "᠅",
    subText = "Mongolian Four Dots (U+1805)",
    text = "᠅"
  }, {
    item = "᠋",
    subText = "Mongolian Free Variation Selector One (U+180B)",
    text = "᠋"
  }, {
    item = "᠍",
    subText = "Mongolian Free Variation Selector Three (U+180D)",
    text = "᠍"
  }, {
    item = "᠌",
    subText = "Mongolian Free Variation Selector Two (U+180C)",
    text = "᠌"
  }, {
    item = "᠃",
    subText = "Mongolian Full Stop (U+1803)",
    text = "᠃"
  }, {
    item = "᠈",
    subText = "Mongolian Manchu Comma (U+1808)",
    text = "᠈"
  }, {
    item = "᠉",
    subText = "Mongolian Manchu Full Stop (U+1809)",
    text = "᠉"
  }, {
    item = "᠊",
    subText = "Mongolian Nirugu (U+180A)",
    text = "᠊"
  }, {
    item = "᠀",
    subText = "Mongolian Punctuation (U+1800)",
    text = "᠀"
  }, {
    item = "᠇",
    subText = "Mongolian Sibe Syllable Boundary Marker (U+1807)",
    text = "᠇"
  }, {
    item = "𑙠",
    subText = "Mongolian Supplement (U+11660)",
    text = "𑙠"
  }, {
    item = "᠆",
    subText = "Mongolian Todo Soft Hyphen (U+1806)",
    text = "᠆"
  }, {
    item = "᠎",
    subText = "Mongolian Vowel Separator (U+180E)",
    text = "᠎"
  }, {
    item = "🐒",
    subText = "Monkey (U+1F412)",
    text = "🐒"
  }, {
    item = "🐵",
    subText = "Monkey Face (U+1F435)",
    text = "🐵"
  }, {
    item = "⚊",
    subText = "Monogram And Digram Symbols, Yijing / I Ching (U+268A)",
    text = "⚊"
  }, {
    item = "𝟶",
    subText = "Monospace Digits (U+1D7F6)",
    text = "𝟶"
  }, {
    item = "𝙰",
    subText = "Monospace Mathematical Symbols (U+1D670)",
    text = "𝙰"
  }, {
    item = "⎍",
    subText = "Monostable Symbol (U+238D)",
    text = "⎍"
  }, {
    item = "௴",
    subText = "Month Sign, Tamil (U+0BF4)",
    text = "௴"
  }, {
    item = "㈀",
    subText = "Months, Enclosed Cjk Letters And (U+3200)",
    text = "㈀"
  }, {
    item = "㋀",
    subText = "Months, Ideographic Telegraph Symbols For (U+32C0)",
    text = "㋀"
  }, {
    item = "🌙",
    subText = "Moon, Crescent (U+1F319)",
    text = "🌙"
  }, {
    item = "☽",
    subText = "Moon, First Quarter (U+263D)",
    text = "☽"
  }, {
    item = "☾",
    subText = "Moon, Last Quarter (U+263E)",
    text = "☾"
  }, {
    item = "🌑",
    subText = "Moon, Sun, And Star Symbols (U+1F311)",
    text = "🌑"
  }, {
    item = "🎓",
    subText = "Mortarboard (U+1F393)",
    text = "🎓"
  }, {
    item = "∾",
    subText = "Most Positive (U+223E)",
    text = "∾"
  }, {
    item = "🛣",
    subText = "Motorway (U+1F6E3)",
    text = "🛣"
  }, {
    item = "⛰",
    subText = "Mountain (U+26F0)",
    text = "⛰"
  }, {
    item = "🐁",
    subText = "Mouse (U+1F401)",
    text = "🐁"
  }, {
    item = "🐭",
    subText = "Mouse Face (U+1F42D)",
    text = "🐭"
  }, {
    item = "⎰",
    subText = "Moustache, Left (U+23B0)",
    text = "⎰"
  }, {
    item = "⎱",
    subText = "Moustache, Right (U+23B1)",
    text = "⎱"
  }, {
    item = "👄",
    subText = "Mouth (U+1F444)",
    text = "👄"
  }, {
    item = "𖩀",
    subText = "Mro (U+16A40)",
    text = "𖩀"
  }, {
    item = "≫",
    subText = "Much Greater-Than (U+226B)",
    text = "≫"
  }, {
    item = "⋙",
    subText = "Much Greater-Than, Very (U+22D9)",
    text = "⋙"
  }, {
    item = "≪",
    subText = "Much Less-Than (U+226A)",
    text = "≪"
  }, {
    item = "⋘",
    subText = "Much Less-Than, Very (U+22D8)",
    text = "⋘"
  }, {
    item = "𑊀",
    subText = "Multani (U+11280)",
    text = "𑊀"
  }, {
    item = "⊸",
    subText = "Multimap (U+22B8)",
    text = "⊸"
  }, {
    item = "⨯",
    subText = "Multiplication And Division Sign Operators (U+2A2F)",
    text = "⨯"
  }, {
    item = "×",
    subText = "Multiplication Sign (U+00D7)",
    text = "×"
  }, {
    item = "✕",
    subText = "Multiplication X (U+2715)",
    text = "✕"
  }, {
    item = "✖",
    subText = "Multiplication X, Heavy (U+2716)",
    text = "✖"
  }, {
    item = "⊍",
    subText = "Multiplication, Multiset (U+228D)",
    text = "⊍"
  }, {
    item = "⊌",
    subText = "Multiset (U+228C)",
    text = "⊌"
  }, {
    item = "⊍",
    subText = "Multiset Multiplication (U+228D)",
    text = "⊍"
  }, {
    item = "⊎",
    subText = "Multiset Union (U+228E)",
    text = "⊎"
  }, {
    item = "♩",
    subText = "Music Dingbats (U+2669)",
    text = "♩"
  }, {
    item = "♭",
    subText = "Music Flat Sign (U+266D)",
    text = "♭"
  }, {
    item = "♮",
    subText = "Music Natural Sign (U+266E)",
    text = "♮"
  }, {
    item = "♯",
    subText = "Music Sharp Sign (U+266F)",
    text = "♯"
  }, {
    item = "🎵",
    subText = "Music Symbols (U+1F3B5)",
    text = "🎵"
  }, {
    item = "𝈀",
    subText = "Musical Notation, Ancient Greek (U+1D200)",
    text = "𝈀"
  }, {
    item = "🎜",
    subText = "Musical Notes, Beamed Ascending (U+1F39C)",
    text = "🎜"
  }, {
    item = "🎝",
    subText = "Musical Notes, Beamed Descending (U+1F39D)",
    text = "🎝"
  }, {
    item = "🎶",
    subText = "Musical Notes, Multiple (U+1F3B6)",
    text = "🎶"
  }, {
    item = "𝄀",
    subText = "Musical Symbols (U+1D100)",
    text = "𝄀"
  }, {
    item = "᭡",
    subText = "Musical Symbols, Balinese (U+1B61)",
    text = "᭡"
  }, {
    item = "♩",
    subText = "Musical Symbols, Basic (U+2669)",
    text = "♩"
  }, {
    item = "𝀀",
    subText = "Musical Symbols, Byzantine (U+1D000)",
    text = "𝀀"
  }, {
    item = " ",
    subText = "Mutton (U+2003)",
    text = " "
  }, {
    item = " ",
    subText = "Mutton Quad (U+2001)",
    text = " "
  }, {
    item = "က",
    subText = "Myanmar (U+1000)",
    text = "က"
  }, {
    item = "က",
    subText = "Myanmar Consonants (U+1000)",
    text = "က"
  }, {
    item = "ာ",
    subText = "Myanmar Dependent Vowel Signs (U+102C)",
    text = "ာ"
  }, {
    item = "၀",
    subText = "Myanmar Digits (U+1040)",
    text = "၀"
  }, {
    item = "ꩠ",
    subText = "Myanmar Extended-A (U+AA60)",
    text = "ꩠ"
  }, {
    item = "ꧠ",
    subText = "Myanmar Extended-B (U+A9E0)",
    text = "ꧠ"
  }, {
    item = "အ",
    subText = "Myanmar Independent Vowels (U+1021)",
    text = "အ"
  }, {
    item = "္",
    subText = "Myanmar Killer (U+1039)",
    text = "္"
  }, {
    item = "္",
    subText = "Myanmar Sign Virama (U+1039)",
    text = "္"
  }, {
    item = "ံ",
    subText = "Myanmar Signs (U+1036)",
    text = "ံ"
  }, {
    item = "ń",
    subText = "N With Acute, Latin Small Letter (U+0144)",
    text = "ń"
  }, {
    item = "ň",
    subText = "N With Caron, Latin Small Letter (U+0148)",
    text = "ň"
  }, {
    item = "ņ",
    subText = "N With Cedilla, Latin Small Letter (U+0146)",
    text = "ņ"
  }, {
    item = "ṋ",
    subText = "N With Circumflex Below, Latin Small Letter (U+1E4B)",
    text = "ṋ"
  }, {
    item = "ȵ",
    subText = "N With Curl, Latin Small Letter (U+0235)",
    text = "ȵ"
  }, {
    item = "ṅ",
    subText = "N With Dot Above, Latin Small Letter (U+1E45)",
    text = "ṅ"
  }, {
    item = "ṇ",
    subText = "N With Dot Below, Latin Small Letter (U+1E47)",
    text = "ṇ"
  }, {
    item = "ǹ",
    subText = "N With Grave, Latin Small Letter (U+01F9)",
    text = "ǹ"
  }, {
    item = "Ɲ",
    subText = "N With Left Hook, Latin Capital Letter (U+019D)",
    text = "Ɲ"
  }, {
    item = "ɲ",
    subText = "N With Left Hook, Latin Small Letter (U+0272)",
    text = "ɲ"
  }, {
    item = "ṉ",
    subText = "N With Line Below, Latin Small Letter (U+1E49)",
    text = "ṉ"
  }, {
    item = "Ƞ",
    subText = "N With Long Right Leg, Latin Capital Letter (U+0220)",
    text = "Ƞ"
  }, {
    item = "ƞ",
    subText = "N With Long Right Leg, Latin Small Letter (U+019E)",
    text = "ƞ"
  }, {
    item = "ɳ",
    subText = "N With Retroflex Hook, Latin Small Letter (U+0273)",
    text = "ɳ"
  }, {
    item = "Ñ",
    subText = "N With Tilde, Latin Capital Letter (U+00D1)",
    text = "Ñ"
  }, {
    item = "ñ",
    subText = "N With Tilde, Latin Small Letter (U+00F1)",
    text = "ñ"
  }, {
    item = "ℕ",
    subText = "N, Double-Struck Capital (U+2115)",
    text = "ℕ"
  }, {
    item = "ɴ",
    subText = "N, Latin Letter Small Capital (U+0274)",
    text = "ɴ"
  }, {
    item = "ᴎ",
    subText = "N, Latin Letter Small Capital Reversed (U+1D0E)",
    text = "ᴎ"
  }, {
    item = "ₙ",
    subText = "N, Latin Subscript Small Letter (U+2099)",
    text = "ₙ"
  }, {
    item = "∐",
    subText = "N-Ary Coproduct (U+2210)",
    text = "∐"
  }, {
    item = "⫿",
    subText = "N-Ary Dijkstra Choice (U+2AFF)",
    text = "⫿"
  }, {
    item = "⋂",
    subText = "N-Ary Intersection (U+22C2)",
    text = "⋂"
  }, {
    item = "⋀",
    subText = "N-Ary Logical And (U+22C0)",
    text = "⋀"
  }, {
    item = "⋁",
    subText = "N-Ary Logical Or (U+22C1)",
    text = "⋁"
  }, {
    item = "⋀",
    subText = "N-Ary Operators (U+22C0)",
    text = "⋀"
  }, {
    item = "⨀",
    subText = "N-Ary Operators (U+2A00)",
    text = "⨀"
  }, {
    item = "∏",
    subText = "N-Ary Product (U+220F)",
    text = "∏"
  }, {
    item = "∑",
    subText = "N-Ary Summation (U+2211)",
    text = "∑"
  }, {
    item = "⅀",
    subText = "N-Ary Summation, Double-Struck (U+2140)",
    text = "⅀"
  }, {
    item = "⨉",
    subText = "N-Ary Times Operator (U+2A09)",
    text = "⨉"
  }, {
    item = "⋃",
    subText = "N-Ary Union (U+22C3)",
    text = "⋃"
  }, {
    item = "⫿",
    subText = "N-Ary White Vertical Bar (U+2AFF)",
    text = "⫿"
  }, {
    item = "௳",
    subText = "Naal, Tamil (U+0BF3)",
    text = "௳"
  }, {
    item = "𐢀",
    subText = "Nabataean (U+10880)",
    text = "𐢀"
  }, {
    item = "∇",
    subText = "Nabla (U+2207)",
    text = "∇"
  }, {
    item = "₦",
    subText = "Naira Sign (U+20A6)",
    text = "₦"
  }, {
    item = "⊼",
    subText = "Nand (U+22BC)",
    text = "⊼"
  }, {
    item = "𑦠",
    subText = "Nandinagari (U+119A0)",
    text = "𑦠"
  }, {
    item = " ",
    subText = "Narrow No-Break Space (U+202F)",
    text = " "
  }, {
    item = "̨",
    subText = "Nasal Hook (U+0328)",
    text = "̨"
  }, {
    item = "ℯ",
    subText = "Natural Exponent (U+212F)",
    text = "ℯ"
  }, {
    item = "ℕ",
    subText = "Natural Number (U+2115)",
    text = "ℕ"
  }, {
    item = "♮",
    subText = "Natural Sign, Music (U+266E)",
    text = "♮"
  }, {
    item = " ",
    subText = "Nbsp (U+00A0)",
    text = " "
  }, {
    item = "≒",
    subText = "Nearly Equals (U+2252)",
    text = "≒"
  }, {
    item = "⫱",
    subText = "Necessarily Satisfies (U+2AF1)",
    text = "⫱"
  }, {
    item = "",
    subText = "Negative Acknowledge (U+0015)",
    text = ""
  }, {
    item = "␕",
    subText = "Negative Acknowledge, Symbol For (U+2415)",
    text = "␕"
  }, {
    item = "❎",
    subText = "Negative Squared Cross Mark, Negative Squared (U+274E)",
    text = "❎"
  }, {
    item = "",
    subText = "Nel (U+0085)",
    text = ""
  }, {
    item = "♆",
    subText = "Neptune (U+2646)",
    text = "♆"
  }, {
    item = "⚲",
    subText = "Neuter (U+26B2)",
    text = "⚲"
  }, {
    item = '"',
    subText = "Neutral Quotation Mark (U+0022)",
    text = '"'
  }, {
    item = "'",
    subText = "Neutral Single Quotation Mark (U+0027)",
    text = "'"
  }, {
    item = "˙",
    subText = "Neutral Tone, Mandarin Chinese Fifth Or (U+02D9)",
    text = "˙"
  }, {
    item = "\n",
    subText = "New Line (U+000A)",
    text = "\n"
  }, {
    item = "₪",
    subText = "New Sheqel Sign (U+20AA)",
    text = "₪"
  }, {
    item = "ᦀ",
    subText = "New Tai Lue (U+1980)",
    text = "ᦀ"
  }, {
    item = "᧐",
    subText = "New Tai Lue Digits (U+19D0)",
    text = "᧐"
  }, {
    item = "⸀",
    subText = "New Testament Editorial Symbols (U+2E00)",
    text = "⸀"
  }, {
    item = "𝔐",
    subText = "New Testament Majority Text (U+1D510)",
    text = "𝔐"
  }, {
    item = "𑐀",
    subText = "Newa (U+11400)",
    text = "𑐀"
  }, {
    item = "␤",
    subText = "Newline, Symbol For (U+2424)",
    text = "␤"
  }, {
    item = "",
    subText = "Next Line (U+0085)",
    text = ""
  }, {
    item = "⎘",
    subText = "Next Page (U+2398)",
    text = "⎘"
  }, {
    item = "✒",
    subText = "Nib, Black (U+2712)",
    text = "✒"
  }, {
    item = "✑",
    subText = "Nib, White (U+2711)",
    text = "✑"
  }, {
    item = "₦",
    subText = "Nigerian Currency (U+20A6)",
    text = "₦"
  }, {
    item = "ໍ",
    subText = "Niggahita, Lao (U+0ECD)",
    text = "ໍ"
  }, {
    item = "ំ",
    subText = "Nikahit, Khmer Sign (U+17C6)",
    text = "ំ"
  }, {
    item = "ํ",
    subText = "Nikhahit, Thai Character (U+0E4D)",
    text = "ํ"
  }, {
    item = "⨧",
    subText = "Nim-Addition (U+2A27)",
    text = "⨧"
  }, {
    item = "᠊",
    subText = "Nirugu, Mongolian (U+180A)",
    text = "᠊"
  }, {
    item = "߀",
    subText = "Nko (U+07C0)",
    text = "߀"
  }, {
    item = "\n",
    subText = "Nl (U+000A)",
    text = "\n"
  }, {
    item = " ",
    subText = "Nnbsp (U+202F)",
    text = " "
  }, {
    item = "⃠",
    subText = "No (U+20E0)",
    text = "⃠"
  }, {
    item = "",
    subText = "No Break Here (U+0083)",
    text = ""
  }, {
    item = "⍽",
    subText = "No Break Space, Keyboard Symbol For (U+237D)",
    text = "⍽"
  }, {
    item = "⛔",
    subText = "No Entry (U+26D4)",
    text = "⛔"
  }, {
    item = "🚫",
    subText = "No Entry Sign (U+1F6AB)",
    text = "🚫"
  }, {
    item = " ",
    subText = "No-Break Space (U+00A0)",
    text = " "
  }, {
    item = " ",
    subText = "No-Break Space, Narrow (U+202F)",
    text = " "
  }, {
    item = "﻿",
    subText = "No-Break Space, Zero Width (U+FEFF)",
    text = "﻿"
  }, {
    item = "☊",
    subText = "Node, Ascending (U+260A)",
    text = "☊"
  }, {
    item = "☋",
    subText = "Node, Descending (U+260B)",
    text = "☋"
  }, {
    item = "‑",
    subText = "Non-Breaking Hyphen (U+2011)",
    text = "‑"
  }, {
    item = " ",
    subText = "Non-Breaking Space (U+00A0)",
    text = " "
  }, {
    item = "‌",
    subText = "Non-Joiner, Zero Width (U+200C)",
    text = "‌"
  }, {
    item = "ͅ",
    subText = "Non-Spacing Iota Below, Greek (U+0345)",
    text = "ͅ"
  }, {
    item = "⊣",
    subText = "Non-Theorem (U+22A3)",
    text = "⊣"
  }, {
    item = "﷐",
    subText = "Noncharacters (Fdd0..Fdef) (U+FDD0)",
    text = "﷐"
  }, {
    item = "￾",
    subText = "Noncharacters (Fffe..Ffff) (U+FFFE)",
    text = "￾"
  }, {
    item = "⊽",
    subText = "Nor (U+22BD)",
    text = "⊽"
  }, {
    item = "⋉",
    subText = "Normal Factor Semidirect Product, Left (U+22C9)",
    text = "⋉"
  }, {
    item = "⋊",
    subText = "Normal Factor Semidirect Product, Right (U+22CA)",
    text = "⋊"
  }, {
    item = "⊲",
    subText = "Normal Subgroup Of (U+22B2)",
    text = "⊲"
  }, {
    item = "⋪",
    subText = "Normal Subgroup Signs (U+22EA)",
    text = "⋪"
  }, {
    item = "⊳",
    subText = "Normal Subgroup, Contains As (U+22B3)",
    text = "⊳"
  }, {
    item = "👃",
    subText = "Nose (U+1F443)",
    text = "👃"
  }, {
    item = "∼",
    subText = "Not (U+223C)",
    text = "∼"
  }, {
    item = "⊄",
    subText = "Not A Subset Of (U+2284)",
    text = "⊄"
  }, {
    item = "⊅",
    subText = "Not A Superset Of (U+2285)",
    text = "⊅"
  }, {
    item = "≉",
    subText = "Not Almost Equal To (U+2249)",
    text = "≉"
  }, {
    item = "∉",
    subText = "Not An Element Of (U+2209)",
    text = "∉"
  }, {
    item = "≄",
    subText = "Not Asymptotically Equal To (U+2244)",
    text = "≄"
  }, {
    item = "⍻",
    subText = "Not Check Mark (U+237B)",
    text = "⍻"
  }, {
    item = "≠",
    subText = "Not Equal To (U+2260)",
    text = "≠"
  }, {
    item = "≢",
    subText = "Not Identical To (U+2262)",
    text = "≢"
  }, {
    item = "⫝̸",
    subText = "Not Independent (U+2ADC)",
    text = "⫝̸"
  }, {
    item = "∦",
    subText = "Not Parallel To (U+2226)",
    text = "∦"
  }, {
    item = "¬",
    subText = "Not Sign (U+00AC)",
    text = "¬"
  }, {
    item = "⌐",
    subText = "Not Sign, Reversed (U+2310)",
    text = "⌐"
  }, {
    item = "⌙",
    subText = "Not Sign, Turned (U+2319)",
    text = "⌙"
  }, {
    item = "≁",
    subText = "Not Tilde (U+2241)",
    text = "≁"
  }, {
    item = "͊",
    subText = "Not Tilde Above, Combining (U+034A)",
    text = "͊"
  }, {
    item = "⊣",
    subText = "Not Yield, Does (U+22A3)",
    text = "⊣"
  }, {
    item = "♪",
    subText = "Note, Eighth (U+266A)",
    text = "♪"
  }, {
    item = "♩",
    subText = "Note, Quarter (U+2669)",
    text = "♩"
  }, {
    item = "♫",
    subText = "Notes, Beamed Eighth (U+266B)",
    text = "♫"
  }, {
    item = "♬",
    subText = "Notes, Beamed Sixteenth (U+266C)",
    text = "♬"
  }, {
    item = "़",
    subText = "Nukta, Devanagari Sign (U+093C)",
    text = "़"
  }, {
    item = " ",
    subText = "Null (U+0000)",
    text = " "
  }, {
    item = "∅",
    subText = "Null Set (U+2205)",
    text = "∅"
  }, {
    item = "␀",
    subText = "Null, Symbol For (U+2400)",
    text = "␀"
  }, {
    item = "⅐",
    subText = "Number Forms (U+2150)",
    text = "⅐"
  }, {
    item = "#",
    subText = "Number Sign (U+0023)",
    text = "#"
  }, {
    item = "௺",
    subText = "Number Sign, Tamil (U+0BFA)",
    text = "௺"
  }, {
    item = "ℊ",
    subText = "Number Symbol, Real (U+210A)",
    text = "ℊ"
  }, {
    item = "〇",
    subText = "Number Zero, Ideographic (U+3007)",
    text = "〇"
  }, {
    item = "ℕ",
    subText = "Number, Natural (U+2115)",
    text = "ℕ"
  }, {
    item = "𒐀",
    subText = "Numbers And Punctuation, Cuneiform (U+12400)",
    text = "𒐀"
  }, {
    item = "⒈",
    subText = "Numbers Followed By Period (U+2488)",
    text = "⒈"
  }, {
    item = "𐅀",
    subText = "Numbers, Ancient Greek (U+10140)",
    text = "𐅀"
  }, {
    item = "①",
    subText = "Numbers, Circled (U+2460)",
    text = "①"
  }, {
    item = "㉑",
    subText = "Numbers, Circled (U+3251)",
    text = "㉑"
  }, {
    item = "㊱",
    subText = "Numbers, Circled (U+32B1)",
    text = "㊱"
  }, {
    item = "❶",
    subText = "Numbers, Circled Inverse (U+2776)",
    text = "❶"
  }, {
    item = "ℂ",
    subText = "Numbers, Complex (U+2102)",
    text = "ℂ"
  }, {
    item = "⓵",
    subText = "Numbers, Double Circled (U+24F5)",
    text = "⓵"
  }, {
    item = "፩",
    subText = "Numbers, Ethiopic (U+1369)",
    text = "፩"
  }, {
    item = "𞱰",
    subText = "Numbers, Indic Siyaq (U+1EC70)",
    text = "𞱰"
  }, {
    item = "𞴀",
    subText = "Numbers, Ottoman Siyaq (U+1ED00)",
    text = "𞴀"
  }, {
    item = "⑴",
    subText = "Numbers, Parenthesized (U+2474)",
    text = "⑴"
  }, {
    item = "ℚ",
    subText = "Numbers, Rational (U+211A)",
    text = "ℚ"
  }, {
    item = "ℝ",
    subText = "Numbers, Real (U+211D)",
    text = "ℝ"
  }, {
    item = "ᛮ",
    subText = "Numbers, Runic Golden (U+16EE)",
    text = "ᛮ"
  }, {
    item = "௧",
    subText = "Numbers, Tamil (U+0BE7)",
    text = "௧"
  }, {
    item = "⓫",
    subText = "Numbers, White On Black Circled (U+24EB)",
    text = "⓫"
  }, {
    item = "〡",
    subText = "Numerals, Hangzhou (U+3021)",
    text = "〡"
  }, {
    item = "𝋠",
    subText = "Numerals, Mayan (U+1D2E0)",
    text = "𝋠"
  }, {
    item = "𐌠",
    subText = "Numerals, Old Italic (U+10320)",
    text = "𐌠"
  }, {
    item = "Ⅰ",
    subText = "Numerals, Roman (U+2160)",
    text = "Ⅰ"
  }, {
    item = "〡",
    subText = "Numerals, Suzhou (U+3021)",
    text = "〡"
  }, {
    item = "⅟",
    subText = "Numerator One, Fraction (U+215F)",
    text = "⅟"
  }, {
    item = "៰",
    subText = "Numeric Symbols For Divination, Khmer (U+17F0)",
    text = "៰"
  }, {
    item = "⇭",
    subText = "Numerics Lock (U+21ED)",
    text = "⇭"
  }, {
    item = "№",
    subText = "Numero Sign (U+2116)",
    text = "№"
  }, {
    item = "𛅰",
    subText = "Nushu (U+1B170)",
    text = "𛅰"
  }, {
    item = " ",
    subText = "Nut (U+2002)",
    text = " "
  }, {
    item = "𞄀",
    subText = "Nyiakeng Puachue Hmong (U+1E100)",
    text = "𞄀"
  }, {
    item = "Ɵ",
    subText = "O Bar, Latin Capital Letter (U+019F)",
    text = "Ɵ"
  }, {
    item = "ɵ",
    subText = "O Bar, Latin Small Letter (U+0275)",
    text = "ɵ"
  }, {
    item = "œ",
    subText = "O E, Latin Small Letter (U+0153)",
    text = "œ"
  }, {
    item = "Ø",
    subText = "O Slash, Latin Capital Letter (U+00D8)",
    text = "Ø"
  }, {
    item = "ø",
    subText = "O Slash, Latin Small Letter (U+00F8)",
    text = "ø"
  }, {
    item = "Ó",
    subText = "O With Acute, Latin Capital Letter (U+00D3)",
    text = "Ó"
  }, {
    item = "ó",
    subText = "O With Acute, Latin Small Letter (U+00F3)",
    text = "ó"
  }, {
    item = "ŏ",
    subText = "O With Breve, Latin Small Letter (U+014F)",
    text = "ŏ"
  }, {
    item = "ǒ",
    subText = "O With Caron, Latin Small Letter (U+01D2)",
    text = "ǒ"
  }, {
    item = "Ô",
    subText = "O With Circumflex, Latin Capital Letter (U+00D4)",
    text = "Ô"
  }, {
    item = "ô",
    subText = "O With Circumflex, Latin Small Letter (U+00F4)",
    text = "ô"
  }, {
    item = "Ö",
    subText = "O With Diaeresis, Latin Capital Letter (U+00D6)",
    text = "Ö"
  }, {
    item = "ö",
    subText = "O With Diaeresis, Latin Small Letter (U+00F6)",
    text = "ö"
  }, {
    item = "ȯ",
    subText = "O With Dot Above, Latin Small Letter (U+022F)",
    text = "ȯ"
  }, {
    item = "ọ",
    subText = "O With Dot Below, Latin Small Letter (U+1ECD)",
    text = "ọ"
  }, {
    item = "ő",
    subText = "O With Double Acute, Latin Small Letter (U+0151)",
    text = "ő"
  }, {
    item = "ȍ",
    subText = "O With Double Grave, Latin Small Letter (U+020D)",
    text = "ȍ"
  }, {
    item = "Ò",
    subText = "O With Grave, Latin Capital Letter (U+00D2)",
    text = "Ò"
  }, {
    item = "ò",
    subText = "O With Grave, Latin Small Letter (U+00F2)",
    text = "ò"
  }, {
    item = "ỏ",
    subText = "O With Hook Above, Latin Small Letter (U+1ECF)",
    text = "ỏ"
  }, {
    item = "ơ",
    subText = "O With Horn, Latin Small Letter (U+01A1)",
    text = "ơ"
  }, {
    item = "ȏ",
    subText = "O With Inverted Breve, Latin Small Letter (U+020F)",
    text = "ȏ"
  }, {
    item = "ō",
    subText = "O With Macron, Latin Small Letter (U+014D)",
    text = "ō"
  }, {
    item = "Ɵ",
    subText = "O With Middle Tilde, Latin Capital Letter (U+019F)",
    text = "Ɵ"
  }, {
    item = "ǫ",
    subText = "O With Ogonek, Latin Small Letter (U+01EB)",
    text = "ǫ"
  }, {
    item = "Ø",
    subText = "O With Stroke, Latin Capital Letter (U+00D8)",
    text = "Ø"
  }, {
    item = "ø",
    subText = "O With Stroke, Latin Small Letter (U+00F8)",
    text = "ø"
  }, {
    item = "ᴓ",
    subText = "O With Stroke, Latin Small Letter Sideways (U+1D13)",
    text = "ᴓ"
  }, {
    item = "Õ",
    subText = "O With Tilde, Latin Capital Letter (U+00D5)",
    text = "Õ"
  }, {
    item = "õ",
    subText = "O With Tilde, Latin Small Letter (U+00F5)",
    text = "õ"
  }, {
    item = "ͦ",
    subText = "O, Combining Latin Small Letter (U+0366)",
    text = "ͦ"
  }, {
    item = "Ɵ",
    subText = "O, Latin Capital Letter Barred (U+019F)",
    text = "Ɵ"
  }, {
    item = "Ɔ",
    subText = "O, Latin Capital Letter Open (U+0186)",
    text = "Ɔ"
  }, {
    item = "ᴏ",
    subText = "O, Latin Letter Small Capital (U+1D0F)",
    text = "ᴏ"
  }, {
    item = "ᴐ",
    subText = "O, Latin Letter Small Capital Open (U+1D10)",
    text = "ᴐ"
  }, {
    item = "ɵ",
    subText = "O, Latin Small Letter Barred (U+0275)",
    text = "ɵ"
  }, {
    item = "ᴗ",
    subText = "O, Latin Small Letter Bottom Half (U+1D17)",
    text = "ᴗ"
  }, {
    item = "ɔ",
    subText = "O, Latin Small Letter Open (U+0254)",
    text = "ɔ"
  }, {
    item = "ᴑ",
    subText = "O, Latin Small Letter Sideways (U+1D11)",
    text = "ᴑ"
  }, {
    item = "ᴒ",
    subText = "O, Latin Small Letter Sideways Open (U+1D12)",
    text = "ᴒ"
  }, {
    item = "ᴖ",
    subText = "O, Latin Small Letter Top Half (U+1D16)",
    text = "ᴖ"
  }, {
    item = "ℴ",
    subText = "O, Script Small (U+2134)",
    text = "ℴ"
  }, {
    item = "÷",
    subText = "Obelus (U+00F7)",
    text = "÷"
  }, {
    item = "￼",
    subText = "Object Replacement Character (U+FFFC)",
    text = "￼"
  }, {
    item = "⑀",
    subText = "Ocr, Optical Character Recognition (U+2440)",
    text = "⑀"
  }, {
    item = "🐙",
    subText = "Octopus (U+1F419)",
    text = "🐙"
  }, {
    item = "#",
    subText = "Octothorpe (U+0023)",
    text = "#"
  }, {
    item = "ɶ",
    subText = "Oe, Latin Letter Small Capital (U+0276)",
    text = "ɶ"
  }, {
    item = "ᴔ",
    subText = "Oe, Latin Small Letter Turned (U+1D14)",
    text = "ᴔ"
  }, {
    item = "œ",
    subText = "Oe, Latin Small Ligature (U+0153)",
    text = "œ"
  }, {
    item = "💺",
    subText = "Office Symbols (U+1F4BA)",
    text = "💺"
  }, {
    item = " ",
    subText = "Ogham (U+1680)",
    text = " "
  }, {
    item = "ᚕ",
    subText = "Ogham Forfeda Supplement (U+1695)",
    text = "ᚕ"
  }, {
    item = "᚛",
    subText = "Ogham Punctuation (U+169B)",
    text = "᚛"
  }, {
    item = " ",
    subText = "Ogham Space Mark (U+1680)",
    text = " "
  }, {
    item = "ᚁ",
    subText = "Ogham Traditional Letters (U+1681)",
    text = "ᚁ"
  }, {
    item = "˛",
    subText = "Ogonek (U+02DB)",
    text = "˛"
  }, {
    item = "̨",
    subText = "Ogonek, Combining (U+0328)",
    text = "̨"
  }, {
    item = "👹",
    subText = "Ogre, Japanese (U+1F479)",
    text = "👹"
  }, {
    item = "Ω",
    subText = "Ohm Sign (U+2126)",
    text = "Ω"
  }, {
    item = "℧",
    subText = "Ohm Sign, Inverted (U+2127)",
    text = "℧"
  }, {
    item = "ƣ",
    subText = "Oi, Latin Small Letter (U+01A3)",
    text = "ƣ"
  }, {
    item = "👌",
    subText = "Ok Hand Sign (U+1F44C)",
    text = "👌"
  }, {
    item = "᱐",
    subText = "Ol Chiki (U+1C50)",
    text = "᱐"
  }, {
    item = "𐲀",
    subText = "Old Hungarian (U+10C80)",
    text = "𐲀"
  }, {
    item = "𐌀",
    subText = "Old Italic (U+10300)",
    text = "𐌀"
  }, {
    item = "𐍐",
    subText = "Old Permic (U+10350)",
    text = "𐍐"
  }, {
    item = "𐎠",
    subText = "Old Persian (U+103A0)",
    text = "𐎠"
  }, {
    item = "𐼀",
    subText = "Old Sogdian (U+10F00)",
    text = "𐼀"
  }, {
    item = "𝔖",
    subText = "Old Testament, Greek (U+1D516)",
    text = "𝔖"
  }, {
    item = "🕉",
    subText = "Om Symbol (U+1F549)",
    text = "🕉"
  }, {
    item = "ॐ",
    subText = "Om, Devanagari (U+0950)",
    text = "ॐ"
  }, {
    item = "ༀ",
    subText = "Om, Tibetan Syllable (U+0F00)",
    text = "ༀ"
  }, {
    item = "ϖ",
    subText = "Omega Pi (U+03D6)",
    text = "ϖ"
  }, {
    item = "ɷ",
    subText = "Omega, Latin Small Letter Closed (U+0277)",
    text = "ɷ"
  }, {
    item = "⸺",
    subText = "Omission Dash (U+2E3A)",
    text = "⸺"
  }, {
    item = "․",
    subText = "One Dot Leader (U+2024)",
    text = "․"
  }, {
    item = "½",
    subText = "One Half, Vulgar Fraction (U+00BD)",
    text = "½"
  }, {
    item = "¼",
    subText = "One Quarter, Vulgar Fraction (U+00BC)",
    text = "¼"
  }, {
    item = "⅟",
    subText = "One, Fraction Numerator (U+215F)",
    text = "⅟"
  }, {
    item = "¹",
    subText = "One, Superscript (U+00B9)",
    text = "¹"
  }, {
    item = "␣",
    subText = "Open Box (U+2423)",
    text = "␣"
  }, {
    item = "⍽",
    subText = "Open Box, Shouldered (U+237D)",
    text = "⍽"
  }, {
    item = "ɝ",
    subText = "Open E With Hook, Latin Small Letter Reversed (U+025D)",
    text = "ɝ"
  }, {
    item = "Ɛ",
    subText = "Open E, Latin Capital Letter (U+0190)",
    text = "Ɛ"
  }, {
    item = "ɛ",
    subText = "Open E, Latin Small Letter (U+025B)",
    text = "ɛ"
  }, {
    item = "ʚ",
    subText = "Open E, Latin Small Letter Closed (U+029A)",
    text = "ʚ"
  }, {
    item = "ɞ",
    subText = "Open E, Latin Small Letter Closed Reversed (U+025E)",
    text = "ɞ"
  }, {
    item = "ɜ",
    subText = "Open E, Latin Small Letter Reversed (U+025C)",
    text = "ɜ"
  }, {
    item = "ᴈ",
    subText = "Open E, Latin Small Letter Turned (U+1D08)",
    text = "ᴈ"
  }, {
    item = "Ɔ",
    subText = "Open O, Latin Capital Letter (U+0186)",
    text = "Ɔ"
  }, {
    item = "ᴐ",
    subText = "Open O, Latin Letter Small Capital (U+1D10)",
    text = "ᴐ"
  }, {
    item = "ɔ",
    subText = "Open O, Latin Small Letter (U+0254)",
    text = "ɔ"
  }, {
    item = "ᴒ",
    subText = "Open O, Latin Small Letter Sideways (U+1D12)",
    text = "ᴒ"
  }, {
    item = "{",
    subText = "Opening Brace (U+007B)",
    text = "{"
  }, {
    item = "{",
    subText = "Opening Curly Bracket (U+007B)",
    text = "{"
  }, {
    item = "(",
    subText = "Opening Parenthesis (U+0028)",
    text = "("
  }, {
    item = "[",
    subText = "Opening Square Bracket (U+005B)",
    text = "["
  }, {
    item = "",
    subText = "Operating System Command (U+009D)",
    text = ""
  }, {
    item = "⌘",
    subText = "Operating System Key (Iso 9995-7) (U+2318)",
    text = "⌘"
  }, {
    item = "⨀",
    subText = "Operators Supplement, Mathematical (U+2A00)",
    text = "⨀"
  }, {
    item = "⟕",
    subText = "Operators, Database Theory (U+27D5)",
    text = "⟕"
  }, {
    item = "∴",
    subText = "Operators, Dotted Mathematical (U+2234)",
    text = "∴"
  }, {
    item = "⋐",
    subText = "Operators, Double (U+22D0)",
    text = "⋐"
  }, {
    item = "⊕",
    subText = "Operators, Enclosed Mathematical (U+2295)",
    text = "⊕"
  }, {
    item = "⁡",
    subText = "Operators, Invisible (U+2061)",
    text = "⁡"
  }, {
    item = "⧸",
    subText = "Operators, Large (U+29F8)",
    text = "⧸"
  }, {
    item = "∀",
    subText = "Operators, Mathematical (U+2200)",
    text = "∀"
  }, {
    item = "⟠",
    subText = "Operators, Modal Logic (U+27E0)",
    text = "⟠"
  }, {
    item = "⨯",
    subText = "Operators, Multiplication And Division Sign (U+2A2F)",
    text = "⨯"
  }, {
    item = "⋀",
    subText = "Operators, N-Ary (U+22C0)",
    text = "⋀"
  }, {
    item = "⨀",
    subText = "Operators, N-Ary (U+2A00)",
    text = "⨀"
  }, {
    item = "⨢",
    subText = "Operators, Plus And Minus Sign (U+2A22)",
    text = "⨢"
  }, {
    item = "⧣",
    subText = "Operators, Relational (U+29E3)",
    text = "⧣"
  }, {
    item = "⧺",
    subText = "Operators, Specialized Plus Sign (U+29FA)",
    text = "⧺"
  }, {
    item = "⨀",
    subText = "Operators, Supplemental Mathematical (U+2A00)",
    text = "⨀"
  }, {
    item = "∻",
    subText = "Operators, Tilde Mathematical (U+223B)",
    text = "∻"
  }, {
    item = "⫮",
    subText = "Operators, Vertical Line (U+2AEE)",
    text = "⫮"
  }, {
    item = "⛎",
    subText = "Ophiuchus (U+26CE)",
    text = "⛎"
  }, {
    item = "☍",
    subText = "Opposition (U+260D)",
    text = "☍"
  }, {
    item = "⑀",
    subText = "Optical Character Recognition, Ocr (U+2440)",
    text = "⑀"
  }, {
    item = "💿",
    subText = "Optical Disc (U+1F4BF)",
    text = "💿"
  }, {
    item = "⌥",
    subText = "Option Key (U+2325)",
    text = "⌥"
  }, {
    item = "⋎",
    subText = "Or, Curly Logical (U+22CE)",
    text = "⋎"
  }, {
    item = "⩔",
    subText = "Or, Double Logical (U+2A54)",
    text = "⩔"
  }, {
    item = "∨",
    subText = "Or, Logical (U+2228)",
    text = "∨"
  }, {
    item = "⋁",
    subText = "Or, N-Ary Logical (U+22C1)",
    text = "⋁"
  }, {
    item = "ℴ",
    subText = "Order (U+2134)",
    text = "ℴ"
  }, {
    item = "≺",
    subText = "Order Relation Precedence Signs (U+227A)",
    text = "≺"
  }, {
    item = "⋞",
    subText = "Order Relation Precedence Signs (U+22DE)",
    text = "⋞"
  }, {
    item = "ª",
    subText = "Ordinal Indicator, Feminine (U+00AA)",
    text = "ª"
  }, {
    item = "º",
    subText = "Ordinal Indicator, Masculine (U+00BA)",
    text = "º"
  }, {
    item = "⫢",
    subText = "Ordinarily Satisfies (U+2AE2)",
    text = "⫢"
  }, {
    item = "̀",
    subText = "Ordinary Diacritics (U+0300)",
    text = "̀"
  }, {
    item = "⌱",
    subText = "Origin, Dimension (U+2331)",
    text = "⌱"
  }, {
    item = "⊶",
    subText = "Original Of (U+22B6)",
    text = "⊶"
  }, {
    item = "⊐",
    subText = "Original Of, Square (U+2290)",
    text = "⊐"
  }, {
    item = "଀",
    subText = "Oriya (U+0B00)",
    text = "଀"
  }, {
    item = "କ",
    subText = "Oriya Consonants (U+0B15)",
    text = "କ"
  }, {
    item = "ା",
    subText = "Oriya Dependent Vowel Signs (U+0B3E)",
    text = "ା"
  }, {
    item = "୦",
    subText = "Oriya Digits (U+0B66)",
    text = "୦"
  }, {
    item = "ଅ",
    subText = "Oriya Independent Vowels (U+0B05)",
    text = "ଅ"
  }, {
    item = "୰",
    subText = "Oriya Isshar (U+0B70)",
    text = "୰"
  }, {
    item = "❮",
    subText = "Ornamental Angle Quotation Marks (U+276E)",
    text = "❮"
  }, {
    item = "❨",
    subText = "Ornamental Brackets (U+2768)",
    text = "❨"
  }, {
    item = "🙐",
    subText = "Ornamental Dingbats (U+1F650)",
    text = "🙐"
  }, {
    item = "❣",
    subText = "Ornaments, Heart (U+2763)",
    text = "❣"
  }, {
    item = "🙶",
    subText = "Ornaments, Punctuation Mark (U+1F676)",
    text = "🙶"
  }, {
    item = "❛",
    subText = "Ornaments, Punctuation Mark (U+275B)",
    text = "❛"
  }, {
    item = "❛",
    subText = "Ornaments, Quotation Mark (U+275B)",
    text = "❛"
  }, {
    item = "﴾",
    subText = "Ornate Left Parenthesis (U+FD3E)",
    text = "﴾"
  }, {
    item = "﴿",
    subText = "Ornate Right Parenthesis (U+FD3F)",
    text = "﴿"
  }, {
    item = "⩑",
    subText = "Ors, Logical Ands And (U+2A51)",
    text = "⩑"
  }, {
    item = "☦",
    subText = "Orthodox Cross (U+2626)",
    text = "☦"
  }, {
    item = "⊥",
    subText = "Orthogonal To (U+22A5)",
    text = "⊥"
  }, {
    item = "𐒰",
    subText = "Osage (U+104B0)",
    text = "𐒰"
  }, {
    item = "𐒀",
    subText = "Osmanya (U+10480)",
    text = "𐒀"
  }, {
    item = "𐒠",
    subText = "Osmanya Digits (U+104A0)",
    text = "𐒠"
  }, {
    item = "𞴀",
    subText = "Ottoman Siyaq Numbers (U+1ED00)",
    text = "𞴀"
  }, {
    item = "ᴕ",
    subText = "Ou, Latin Letter Small Capital (U+1D15)",
    text = "ᴕ"
  }, {
    item = "ȣ",
    subText = "Ou, Latin Small Letter (U+0223)",
    text = "ȣ"
  }, {
    item = "℥",
    subText = "Ounce Sign (U+2125)",
    text = "℥"
  }, {
    item = "¯",
    subText = "Overbar, Apl (U+00AF)",
    text = "¯"
  }, {
    item = "⃚",
    subText = "Overlay, Combining Anticlockwise Ring (U+20DA)",
    text = "⃚"
  }, {
    item = "⃙",
    subText = "Overlay, Combining Clockwise Ring (U+20D9)",
    text = "⃙"
  }, {
    item = "⃚",
    subText = "Overlay, Combining Counterclockwise Ring (U+20DA)",
    text = "⃚"
  }, {
    item = "⃦",
    subText = "Overlay, Combining Double Vertical Stroke (U+20E6)",
    text = "⃦"
  }, {
    item = "⃪",
    subText = "Overlay, Combining Leftwards Arrow (U+20EA)",
    text = "⃪"
  }, {
    item = "⃫",
    subText = "Overlay, Combining Long Double Solidus (U+20EB)",
    text = "⃫"
  }, {
    item = "̸",
    subText = "Overlay, Combining Long Solidus (U+0338)",
    text = "̸"
  }, {
    item = "̶",
    subText = "Overlay, Combining Long Stroke (U+0336)",
    text = "̶"
  }, {
    item = "⃒",
    subText = "Overlay, Combining Long Vertical Line (U+20D2)",
    text = "⃒"
  }, {
    item = "⃥",
    subText = "Overlay, Combining Reverse Solidus (U+20E5)",
    text = "⃥"
  }, {
    item = "⃘",
    subText = "Overlay, Combining Ring (U+20D8)",
    text = "⃘"
  }, {
    item = "̷",
    subText = "Overlay, Combining Short Solidus (U+0337)",
    text = "̷"
  }, {
    item = "̵",
    subText = "Overlay, Combining Short Stroke (U+0335)",
    text = "̵"
  }, {
    item = "⃓",
    subText = "Overlay, Combining Short Vertical Line (U+20D3)",
    text = "⃓"
  }, {
    item = "̴",
    subText = "Overlay, Combining Tilde (U+0334)",
    text = "̴"
  }, {
    item = "⃫",
    subText = "Overlay, Long Double Slash (U+20EB)",
    text = "⃫"
  }, {
    item = "̸",
    subText = "Overlay, Long Slash (U+0338)",
    text = "̸"
  }, {
    item = "̷",
    subText = "Overlay, Short Slash (U+0337)",
    text = "̷"
  }, {
    item = "¯",
    subText = "Overline (U+00AF)",
    text = "¯"
  }, {
    item = "‾",
    subText = "Overline (U+203E)",
    text = "‾"
  }, {
    item = "﹊",
    subText = "Overline, Centreline (U+FE4A)",
    text = "﹊"
  }, {
    item = "̅",
    subText = "Overline, Combining (U+0305)",
    text = "̅"
  }, {
    item = "̿",
    subText = "Overline, Combining Double (U+033F)",
    text = "̿"
  }, {
    item = "﹉",
    subText = "Overline, Dashed (U+FE49)",
    text = "﹉"
  }, {
    item = "﹌",
    subText = "Overline, Double Wavy (U+FE4C)",
    text = "﹌"
  }, {
    item = "﹋",
    subText = "Overline, Wavy (U+FE4B)",
    text = "﹋"
  }, {
    item = "‭",
    subText = "Override, Left-To-Right (U+202D)",
    text = "‭"
  }, {
    item = "‮",
    subText = "Override, Right-To-Left (U+202E)",
    text = "‮"
  }, {
    item = "̅",
    subText = "Overscore (U+0305)",
    text = "̅"
  }, {
    item = "‾",
    subText = "Overscore, Spacing (U+203E)",
    text = "‾"
  }, {
    item = "﹉",
    subText = "Overscores And Underscores (U+FE49)",
    text = "﹉"
  }, {
    item = "̴",
    subText = "Overstruck Diacritics (U+0334)",
    text = "̴"
  }, {
    item = "🐂",
    subText = "Ox (U+1F402)",
    text = "🐂"
  }, {
    item = "́",
    subText = "Oxia, Greek (U+0301)",
    text = "́"
  }, {
    item = "ṕ",
    subText = "P With Acute, Latin Small Letter (U+1E55)",
    text = "ṕ"
  }, {
    item = "ṗ",
    subText = "P With Dot Above, Latin Small Letter (U+1E57)",
    text = "ṗ"
  }, {
    item = "ƥ",
    subText = "P With Hook, Latin Small Letter (U+01A5)",
    text = "ƥ"
  }, {
    item = "ℙ",
    subText = "P, Double-Struck Capital (U+2119)",
    text = "ℙ"
  }, {
    item = "ᴘ",
    subText = "P, Latin Letter Small Capital (U+1D18)",
    text = "ᴘ"
  }, {
    item = "ₚ",
    subText = "P, Latin Subscript Small Letter (U+209A)",
    text = "ₚ"
  }, {
    item = "℘",
    subText = "P, Script Capital (U+2118)",
    text = "℘"
  }, {
    item = "🥘",
    subText = "Paella (U+1F958)",
    text = "🥘"
  }, {
    item = "⇟",
    subText = "Page Down (U+21DF)",
    text = "⇟"
  }, {
    item = "⭽",
    subText = "Page Down (U+2B7D)",
    text = "⭽"
  }, {
    item = "📄",
    subText = "Page Facing Up (U+1F4C4)",
    text = "📄"
  }, {
    item = "⇞",
    subText = "Page Up (U+21DE)",
    text = "⇞"
  }, {
    item = "⭻",
    subText = "Page Up (U+2B7B)",
    text = "⭻"
  }, {
    item = "⎘",
    subText = "Page, Next (U+2398)",
    text = "⎘"
  }, {
    item = "⎗",
    subText = "Page, Previous (U+2397)",
    text = "⎗"
  }, {
    item = "𖬀",
    subText = "Pahawh Hmong (U+16B00)",
    text = "𖬀"
  }, {
    item = "𐭠",
    subText = "Pahlavi (U+10B60)",
    text = "𐭠"
  }, {
    item = "𐮀",
    subText = "Pahlavi, Psalter (U+10B80)",
    text = "𐮀"
  }, {
    item = "⸲",
    subText = "Palaeotype Transliteration Symbols (U+2E32)",
    text = "⸲"
  }, {
    item = "ƫ",
    subText = "Palatal Hook, Latin Small Letter T With (U+01AB)",
    text = "ƫ"
  }, {
    item = "̡",
    subText = "Palatalized Hook Below, Combining (U+0321)",
    text = "̡"
  }, {
    item = "⸙",
    subText = "Palm Branch (U+2E19)",
    text = "⸙"
  }, {
    item = "𐡠",
    subText = "Palmyrene (U+10860)",
    text = "𐡠"
  }, {
    item = "྅",
    subText = "Paluta, Tibetan Mark (U+0F85)",
    text = "྅"
  }, {
    item = "᜴",
    subText = "Pamudpod, Hanunoo Sign (U+1734)",
    text = "᜴"
  }, {
    item = "🐼",
    subText = "Panda Face (U+1F43C)",
    text = "🐼"
  }, {
    item = "✋",
    subText = "Paper In Rock, Paper, Scissors Game (U+270B)",
    text = "✋"
  }, {
    item = "♾",
    subText = "Paper Sign, Permanent (U+267E)",
    text = "♾"
  }, {
    item = "♽",
    subText = "Paper Symbol, Partially-Recycled (U+267D)",
    text = "♽"
  }, {
    item = "♼",
    subText = "Paper Symbol, Recycled (U+267C)",
    text = "♼"
  }, {
    item = "͜",
    subText = "Papyrological Hyphen (U+035C)",
    text = "͜"
  }, {
    item = " ",
    subText = "Paragraph Separator (U+2029)",
    text = " "
  }, {
    item = "፨",
    subText = "Paragraph Separator, Ethiopic (U+1368)",
    text = "፨"
  }, {
    item = "჻",
    subText = "Paragraph Separator, Georgian (U+10FB)",
    text = "჻"
  }, {
    item = "※",
    subText = "Paragraph Separator, Urdu (U+203B)",
    text = "※"
  }, {
    item = "¶",
    subText = "Paragraph Sign (U+00B6)",
    text = "¶"
  }, {
    item = "❡",
    subText = "Paragraph Sign Ornament, Curved Stem (U+2761)",
    text = "❡"
  }, {
    item = "§",
    subText = "Paragraph Sign, European (U+00A7)",
    text = "§"
  }, {
    item = "₲",
    subText = "Paraguayan Currency (U+20B2)",
    text = "₲"
  }, {
    item = "∥",
    subText = "Parallel To (U+2225)",
    text = "∥"
  }, {
    item = "∦",
    subText = "Parallel To, Not (U+2226)",
    text = "∦"
  }, {
    item = "▰",
    subText = "Parallelogram, Black (U+25B0)",
    text = "▰"
  }, {
    item = "⚿",
    subText = "Parental Lock (U+26BF)",
    text = "⚿"
  }, {
    item = ")",
    subText = "Parenthesis, Closing (U+0029)",
    text = ")"
  }, {
    item = "(",
    subText = "Parenthesis, Left (U+0028)",
    text = "("
  }, {
    item = "⦅",
    subText = "Parenthesis, Left White (U+2985)",
    text = "⦅"
  }, {
    item = "(",
    subText = "Parenthesis, Opening (U+0028)",
    text = "("
  }, {
    item = "﴾",
    subText = "Parenthesis, Ornate Left (U+FD3E)",
    text = "﴾"
  }, {
    item = "﴿",
    subText = "Parenthesis, Ornate Right (U+FD3F)",
    text = "﴿"
  }, {
    item = ")",
    subText = "Parenthesis, Right (U+0029)",
    text = ")"
  }, {
    item = "⦆",
    subText = "Parenthesis, Right White (U+2986)",
    text = "⦆"
  }, {
    item = "㈠",
    subText = "Parenthesized Cjk Ideographs (U+3220)",
    text = "㈠"
  }, {
    item = "㈀",
    subText = "Parenthesized Korean Hangul Letters (U+3200)",
    text = "㈀"
  }, {
    item = "㈎",
    subText = "Parenthesized Korean Hangul Syllables (U+320E)",
    text = "㈎"
  }, {
    item = "🄐",
    subText = "Parenthesized Latin Capital Letters (U+1F110)",
    text = "🄐"
  }, {
    item = "🄐",
    subText = "Parenthesized Latin Letters (U+1F110)",
    text = "🄐"
  }, {
    item = "⒜",
    subText = "Parenthesized Latin Letters (U+249C)",
    text = "⒜"
  }, {
    item = "⑴",
    subText = "Parenthesized Numbers (U+2474)",
    text = "⑴"
  }, {
    item = "⛲",
    subText = "Park (U+26F2)",
    text = "⛲"
  }, {
    item = "¦",
    subText = "Parted Rule (U+00A6)",
    text = "¦"
  }, {
    item = "𐭀",
    subText = "Parthian, Inscriptional (U+10B40)",
    text = "𐭀"
  }, {
    item = "∂",
    subText = "Partial Differential (U+2202)",
    text = "∂"
  }, {
    item = "⇸",
    subText = "Partial Function (U+21F8)",
    text = "⇸"
  }, {
    item = "⤔",
    subText = "Partial Injection (U+2914)",
    text = "⤔"
  }, {
    item = "",
    subText = "Partial Line Backward (U+008C)",
    text = ""
  }, {
    item = "",
    subText = "Partial Line Forward (U+008B)",
    text = ""
  }, {
    item = "⇹",
    subText = "Partial Relation (U+21F9)",
    text = "⇹"
  }, {
    item = "⤀",
    subText = "Partial Surjection (U+2900)",
    text = "⤀"
  }, {
    item = "♽",
    subText = "Partially-Recycled Paper Symbol (U+267D)",
    text = "♽"
  }, {
    item = "⛅",
    subText = "Partly Cloudy (U+26C5)",
    text = "⛅"
  }, {
    item = "⚯",
    subText = "Partnership Symbol, Unmarried (U+26AF)",
    text = "⚯"
  }, {
    item = "՟",
    subText = "Patiw, Armenian (U+055F)",
    text = "՟"
  }, {
    item = "௶",
    subText = "Patru, Tamil (U+0BF6)",
    text = "௶"
  }, {
    item = "𑫀",
    subText = "Pau Cin Hau (U+11AC0)",
    text = "𑫀"
  }, {
    item = "⎉",
    subText = "Pause (U+2389)",
    text = "⎉"
  }, {
    item = "⏸",
    subText = "Pause Play (U+23F8)",
    text = "⏸"
  }, {
    item = "🐾",
    subText = "Paw Prints (U+1F43E)",
    text = "🐾"
  }, {
    item = "‬",
    subText = "Pdf (U+202C)",
    text = "‬"
  }, {
    item = "☮",
    subText = "Peace Symbol (U+262E)",
    text = "☮"
  }, {
    item = "🕊",
    subText = "Peace, Dove Of (U+1F54A)",
    text = "🕊"
  }, {
    item = "✏",
    subText = "Pencil (U+270F)",
    text = "✏"
  }, {
    item = "✎",
    subText = "Pencil Dingbats (U+270E)",
    text = "✎"
  }, {
    item = "✎",
    subText = "Pencil, Lower Right (U+270E)",
    text = "✎"
  }, {
    item = "✐",
    subText = "Pencil, Upper Right (U+2710)",
    text = "✐"
  }, {
    item = "🐧",
    subText = "Penguin (U+1F427)",
    text = "🐧"
  }, {
    item = "🏲",
    subText = "Pennant, Black (U+1F3F2)",
    text = "🏲"
  }, {
    item = "🏱",
    subText = "Pennant, White (U+1F3F1)",
    text = "🏱"
  }, {
    item = "₰",
    subText = "Penny Sign, German (U+20B0)",
    text = "₰"
  }, {
    item = "⛤",
    subText = "Pentagram (U+26E4)",
    text = "⛤"
  }, {
    item = "⛤",
    subText = "Pentalpha, Pentangle (U+26E4)",
    text = "⛤"
  }, {
    item = "⁙",
    subText = "Pentonkion, Greek (U+2059)",
    text = "⁙"
  }, {
    item = "🌶",
    subText = "Pepper, Hot (U+1F336)",
    text = "🌶"
  }, {
    item = "‰",
    subText = "Per Mille Sign (U+2030)",
    text = "‰"
  }, {
    item = "⅌",
    subText = "Per Sign (U+214C)",
    text = "⅌"
  }, {
    item = "‱",
    subText = "Per Ten Thousand Sign (U+2031)",
    text = "‱"
  }, {
    item = "‰",
    subText = "Per Thousand (U+2030)",
    text = "‰"
  }, {
    item = "%",
    subText = "Percent Sign (U+0025)",
    text = "%"
  }, {
    item = "ʭ",
    subText = "Percussive, Latin Letter Bidental (U+02AD)",
    text = "ʭ"
  }, {
    item = "ʬ",
    subText = "Percussive, Latin Letter Bilabial (U+02AC)",
    text = "ʬ"
  }, {
    item = ".",
    subText = "Period (U+002E)",
    text = "."
  }, {
    item = "⒈",
    subText = "Period, Numbers Followed By (U+2488)",
    text = "⒈"
  }, {
    item = "͂",
    subText = "Perispomeni, Combining Greek (U+0342)",
    text = "͂"
  }, {
    item = "♾",
    subText = "Permanent Paper Sign (U+267E)",
    text = "♾"
  }, {
    item = "🚬",
    subText = "Permission And Prohibition Signs (U+1F6AC)",
    text = "🚬"
  }, {
    item = "⊥",
    subText = "Perpendicular (U+22A5)",
    text = "⊥"
  }, {
    item = "𐎠",
    subText = "Persian, Old (U+103A0)",
    text = "𐎠"
  }, {
    item = "💄",
    subText = "Personal Care Symbols (U+1F484)",
    text = "💄"
  }, {
    item = "⌆",
    subText = "Perspective (U+2306)",
    text = "⌆"
  }, {
    item = "₧",
    subText = "Peseta Sign (U+20A7)",
    text = "₧"
  }, {
    item = "₱",
    subText = "Peso Sign (U+20B1)",
    text = "₱"
  }, {
    item = "⛽",
    subText = "Petrol Station (U+26FD)",
    text = "⛽"
  }, {
    item = "ꡀ",
    subText = "Phags-Pa (U+A840)",
    text = "ꡀ"
  }, {
    item = "𐇐",
    subText = "Phaistos Disc (U+101D0)",
    text = "𐇐"
  }, {
    item = "ʕ",
    subText = "Pharyngeal Voiced Fricative, Latin Letter (U+0295)",
    text = "ʕ"
  }, {
    item = "ϕ",
    subText = "Phi Symbol, Greek (U+03D5)",
    text = "ϕ"
  }, {
    item = "ɸ",
    subText = "Phi, Latin Small Letter (U+0278)",
    text = "ɸ"
  }, {
    item = "᜶",
    subText = "Philippine Double Punctuation (U+1736)",
    text = "᜶"
  }, {
    item = "᜵",
    subText = "Philippine Single Punctuation (U+1735)",
    text = "᜵"
  }, {
    item = "₱",
    subText = "Phillipine Currency (U+20B1)",
    text = "₱"
  }, {
    item = "𐤀",
    subText = "Phoenician (U+10900)",
    text = "𐤀"
  }, {
    item = "ʣ",
    subText = "Phonetic Digraphs (U+02A3)",
    text = "ʣ"
  }, {
    item = "ᴀ",
    subText = "Phonetic Extensions (U+1D00)",
    text = "ᴀ"
  }, {
    item = "ㇰ",
    subText = "Phonetic Extensions, Katakana (U+31F0)",
    text = "ㇰ"
  }, {
    item = "ʹ",
    subText = "Phonetic Modifiers (U+02B9)",
    text = "ʹ"
  }, {
    item = "ʰ",
    subText = "Phonetic Modifiers Derived From Latin Letters (U+02B0)",
    text = "ʰ"
  }, {
    item = "⺀",
    subText = "Phonetics And Symbols Area, Cjk (U+2E80)",
    text = "⺀"
  }, {
    item = "℗",
    subText = "Phonorecord Sign (U+2117)",
    text = "℗"
  }, {
    item = "⁕",
    subText = "Phul (U+2055)",
    text = "⁕"
  }, {
    item = "ϖ",
    subText = "Pi Symbol, Greek (U+03D6)",
    text = "ϖ"
  }, {
    item = "ℿ",
    subText = "Pi, Double-Struck Capital (U+213F)",
    text = "ℿ"
  }, {
    item = "ℼ",
    subText = "Pi, Double-Struck Small (U+213C)",
    text = "ℼ"
  }, {
    item = "π",
    subText = "Pi, Greek Small Letter (U+03C0)",
    text = "π"
  }, {
    item = "π",
    subText = "Pi, Mathematical Constant 3.141592... (U+03C0)",
    text = "π"
  }, {
    item = "⛏",
    subText = "Pick (U+26CF)",
    text = "⛏"
  }, {
    item = "🩰",
    subText = "Pictographs Extended-A, Symbols And (U+1FA70)",
    text = "🩰"
  }, {
    item = "🌀",
    subText = "Pictographs, Miscellaneous Symbols And (U+1F300)",
    text = "🌀"
  }, {
    item = "🤀",
    subText = "Pictographs, Supplemental Symbols And (U+1F900)",
    text = "🤀"
  }, {
    item = "␀",
    subText = "Pictures For Control Codes, Graphic (U+2400)",
    text = "␀"
  }, {
    item = "🐖",
    subText = "Pig (U+1F416)",
    text = "🐖"
  }, {
    item = "🐷",
    subText = "Pig Face (U+1F437)",
    text = "🐷"
  }, {
    item = "🐽",
    subText = "Pig Nose (U+1F43D)",
    text = "🐽"
  }, {
    item = "¶",
    subText = "Pilcrow Sign (U+00B6)",
    text = "¶"
  }, {
    item = "⁋",
    subText = "Pilcrow Sign, Reversed (U+204B)",
    text = "⁋"
  }, {
    item = "⌑",
    subText = "Pillow (U+2311)",
    text = "⌑"
  }, {
    item = "ǀ",
    subText = "Pipe (U+01C0)",
    text = "ǀ"
  }, {
    item = "ǁ",
    subText = "Pipe, Double (U+01C1)",
    text = "ǁ"
  }, {
    item = "ǂ",
    subText = "Pipe, Double-Barred (U+01C2)",
    text = "ǂ"
  }, {
    item = "♓",
    subText = "Pisces (U+2653)",
    text = "♓"
  }, {
    item = "⁒",
    subText = "Piska (U+2052)",
    text = "⁒"
  }, {
    item = "⋔",
    subText = "Pitchfork (U+22D4)",
    text = "⋔"
  }, {
    item = "⌘",
    subText = "Place Of Interest Sign (U+2318)",
    text = "⌘"
  }, {
    item = "≬",
    subText = "Plaintiff (U+226C)",
    text = "≬"
  }, {
    item = "ℎ",
    subText = "Planck Constant (U+210E)",
    text = "ℎ"
  }, {
    item = "ℏ",
    subText = "Planck Constant Over Two Pi (U+210F)",
    text = "ℏ"
  }, {
    item = "☿",
    subText = "Planet Symbols (U+263F)",
    text = "☿"
  }, {
    item = "🌰",
    subText = "Plant Symbols (U+1F330)",
    text = "🌰"
  }, {
    item = "♳",
    subText = "Plastics Recycling Symbols (U+2673)",
    text = "♳"
  }, {
    item = "♠",
    subText = "Playing Card Suits (U+2660)",
    text = "♠"
  }, {
    item = "♠",
    subText = "Playing Card Symbols (U+2660)",
    text = "♠"
  }, {
    item = "🂠",
    subText = "Playing Cards (U+1F0A0)",
    text = "🂠"
  }, {
    item = "💦",
    subText = "Plewds (U+1F4A6)",
    text = "💦"
  }, {
    item = "⨢",
    subText = "Plus And Minus Sign Operators (U+2A22)",
    text = "⨢"
  }, {
    item = "+",
    subText = "Plus Sign (U+002B)",
    text = "+"
  }, {
    item = "̟",
    subText = "Plus Sign Below, Combining (U+031F)",
    text = "̟"
  }, {
    item = "⧺",
    subText = "Plus Sign Operators, Specialized (U+29FA)",
    text = "⧺"
  }, {
    item = "˖",
    subText = "Plus Sign, Modifier Letter (U+02D6)",
    text = "˖"
  }, {
    item = "⊕",
    subText = "Plus, Circled (U+2295)",
    text = "⊕"
  }, {
    item = "∔",
    subText = "Plus, Dot (U+2214)",
    text = "∔"
  }, {
    item = "⧺",
    subText = "Plus, Double (U+29FA)",
    text = "⧺"
  }, {
    item = "⁤",
    subText = "Plus, Invisible (U+2064)",
    text = "⁤"
  }, {
    item = "⊞",
    subText = "Plus, Squared (U+229E)",
    text = "⊞"
  }, {
    item = "⧻",
    subText = "Plus, Triple (U+29FB)",
    text = "⧻"
  }, {
    item = "±",
    subText = "Plus-Minus Sign (U+00B1)",
    text = "±"
  }, {
    item = "♇",
    subText = "Pluto (U+2647)",
    text = "♇"
  }, {
    item = ".",
    subText = "Point, Decimal (U+002E)",
    text = "."
  }, {
    item = "‧",
    subText = "Point, Hyphenation (U+2027)",
    text = "‧"
  }, {
    item = "►",
    subText = "Pointers (U+25BA)",
    text = "►"
  }, {
    item = "🖗",
    subText = "Pointing Hand Indexes (U+1F597)",
    text = "🖗"
  }, {
    item = "☚",
    subText = "Pointing Hand Symbols (U+261A)",
    text = "☚"
  }, {
    item = "☚",
    subText = "Pointing Index Finger Dingbats (U+261A)",
    text = "☚"
  }, {
    item = "☚",
    subText = "Pointing Index, Black Left (U+261A)",
    text = "☚"
  }, {
    item = "☛",
    subText = "Pointing Index, Black Right (U+261B)",
    text = "☛"
  }, {
    item = "☟",
    subText = "Pointing Index, White Down (U+261F)",
    text = "☟"
  }, {
    item = "☜",
    subText = "Pointing Index, White Left (U+261C)",
    text = "☜"
  }, {
    item = "☞",
    subText = "Pointing Index, White Right (U+261E)",
    text = "☞"
  }, {
    item = "☝",
    subText = "Pointing Index, White Up (U+261D)",
    text = "☝"
  }, {
    item = "ְ",
    subText = "Points And Punctuation, Hebrew (U+05B0)",
    text = "ְ"
  }, {
    item = "ְ",
    subText = "Points, Hebrew (U+05B0)",
    text = "ְ"
  }, {
    item = "ܰ",
    subText = "Points, Syriac (U+0730)",
    text = "ܰ"
  }, {
    item = "☠",
    subText = "Poison (U+2620)",
    text = "☠"
  }, {
    item = "👮",
    subText = "Police Officer (U+1F46E)",
    text = "👮"
  }, {
    item = "☦",
    subText = "Political Symbols, Religious And (U+2626)",
    text = "☦"
  }, {
    item = "⬒",
    subText = "Polygonal Symbols (U+2B12)",
    text = "⬒"
  }, {
    item = "ἀ",
    subText = "Polytonic Greek, Precomposed (U+1F00)",
    text = "ἀ"
  }, {
    item = "💩",
    subText = "Poo, Pile Of (U+1F4A9)",
    text = "💩"
  }, {
    item = "🐩",
    subText = "Poodle (U+1F429)",
    text = "🐩"
  }, {
    item = "‬",
    subText = "Pop Directional Formatting (U+202C)",
    text = "‬"
  }, {
    item = "⁩",
    subText = "Pop Directional Isolate (U+2069)",
    text = "⁩"
  }, {
    item = "🐖",
    subText = "Pork (On Menus) (U+1F416)",
    text = "🐖"
  }, {
    item = "👤",
    subText = "Portrait And Role Symbols (U+1F464)",
    text = "👤"
  }, {
    item = "🤰",
    subText = "Portrait And Role Symbols (U+1F930)",
    text = "🤰"
  }, {
    item = "🧐",
    subText = "Portrait And Role Symbols (U+1F9D0)",
    text = "🧐"
  }, {
    item = "⌖",
    subText = "Position Indicator (U+2316)",
    text = "⌖"
  }, {
    item = "⯐",
    subText = "Position Indicator, Square (U+2BD0)",
    text = "⯐"
  }, {
    item = "⨤",
    subText = "Positive Difference Or Sum (U+2A24)",
    text = "⨤"
  }, {
    item = "⨦",
    subText = "Positive Difference, Sum Or (U+2A26)",
    text = "⨦"
  }, {
    item = "∾",
    subText = "Positive, Most (U+223E)",
    text = "∾"
  }, {
    item = "📯",
    subText = "Postal Horn (U+1F4EF)",
    text = "📯"
  }, {
    item = "〒",
    subText = "Postal Mark (U+3012)",
    text = "〒"
  }, {
    item = "〠",
    subText = "Postal Mark Face (U+3020)",
    text = "〠"
  }, {
    item = "〶",
    subText = "Postal Mark, Circled (U+3036)",
    text = "〶"
  }, {
    item = "🐔",
    subText = "Poultry (On Menus) (U+1F414)",
    text = "🐔"
  }, {
    item = "#",
    subText = "Pound Sign (U+0023)",
    text = "#"
  }, {
    item = "£",
    subText = "Pound Sign (U+00A3)",
    text = "£"
  }, {
    item = "£",
    subText = "Pound Sterling (U+00A3)",
    text = "£"
  }, {
    item = "℔",
    subText = "Pounds (U+2114)",
    text = "℔"
  }, {
    item = "⏻",
    subText = "Power On/Off Symbols (U+23FB)",
    text = "⏻"
  }, {
    item = "⛮",
    subText = "Power Plant (U+26EE)",
    text = "⛮"
  }, {
    item = "𝒫",
    subText = "Power Set (U+1D4AB)",
    text = "𝒫"
  }, {
    item = "≺",
    subText = "Precedence Signs, Order Relation (U+227A)",
    text = "≺"
  }, {
    item = "⋞",
    subText = "Precedence Signs, Order Relation (U+22DE)",
    text = "⋞"
  }, {
    item = "≺",
    subText = "Precedes (U+227A)",
    text = "≺"
  }, {
    item = "⊰",
    subText = "Precedes Under Relation (U+22B0)",
    text = "⊰"
  }, {
    item = "⪻",
    subText = "Precedes, Double (U+2ABB)",
    text = "⪻"
  }, {
    item = "ἀ",
    subText = "Precomposed Polytonic Greek (U+1F00)",
    text = "ἀ"
  }, {
    item = "℞",
    subText = "Prescription Take (U+211E)",
    text = "℞"
  }, {
    item = "ﬀ",
    subText = "Presentation Forms, Alphabetic (U+FB00)",
    text = "ﬀ"
  }, {
    item = "יִ",
    subText = "Presentation Forms, Hebrew (U+FB1D)",
    text = "יִ"
  }, {
    item = "ﭐ",
    subText = "Presentation Forms-A, Arabic (U+FB50)",
    text = "ﭐ"
  }, {
    item = "ﹰ",
    subText = "Presentation Forms-B, Arabic (U+FE70)",
    text = "ﹰ"
  }, {
    item = "⎗",
    subText = "Previous Page (U+2397)",
    text = "⎗"
  }, {
    item = "′",
    subText = "Prime (U+2032)",
    text = "′"
  }, {
    item = "〞",
    subText = "Prime Quotation Mark, Double (U+301E)",
    text = "〞"
  }, {
    item = "〟",
    subText = "Prime Quotation Mark, Low Double (U+301F)",
    text = "〟"
  }, {
    item = "〝",
    subText = "Prime Quotation Mark, Reversed Double (U+301D)",
    text = "〝"
  }, {
    item = "″",
    subText = "Prime, Double (U+2033)",
    text = "″"
  }, {
    item = "ʹ",
    subText = "Prime, Modifier Letter (U+02B9)",
    text = "ʹ"
  }, {
    item = "ʺ",
    subText = "Prime, Modifier Letter Double (U+02BA)",
    text = "ʺ"
  }, {
    item = "⁗",
    subText = "Prime, Quadruple (U+2057)",
    text = "⁗"
  }, {
    item = "‵",
    subText = "Prime, Reversed (U+2035)",
    text = "‵"
  }, {
    item = "‶",
    subText = "Prime, Reversed Double (U+2036)",
    text = "‶"
  }, {
    item = "‷",
    subText = "Prime, Reversed Triple (U+2037)",
    text = "‷"
  }, {
    item = "‴",
    subText = "Prime, Triple (U+2034)",
    text = "‴"
  }, {
    item = "👸",
    subText = "Princess (U+1F478)",
    text = "👸"
  }, {
    item = "⎙",
    subText = "Print Screen Symbol (U+2399)",
    text = "⎙"
  }, {
    item = "",
    subText = "Privacy Message (U+009E)",
    text = ""
  }, {
    item = "",
    subText = "Private Use Area (U+E000)",
    text = ""
  }, {
    item = "󰀀",
    subText = "Private Use Area-A, Supplementary (U+F0000)",
    text = "󰀀"
  }, {
    item = "􀀀",
    subText = "Private Use Area-B, Supplementary (U+100000)",
    text = "􀀀"
  }, {
    item = "",
    subText = "Private Use One (U+0091)",
    text = ""
  }, {
    item = "",
    subText = "Private Use Two (U+0092)",
    text = ""
  }, {
    item = "∏",
    subText = "Product Sign (U+220F)",
    text = "∏"
  }, {
    item = "×",
    subText = "Product, Cartesian (U+00D7)",
    text = "×"
  }, {
    item = "⊙",
    subText = "Product, Direct (U+2299)",
    text = "⊙"
  }, {
    item = "⨼",
    subText = "Product, Interior (U+2A3C)",
    text = "⨼"
  }, {
    item = "⋉",
    subText = "Product, Left Normal Factor Semidirect (U+22C9)",
    text = "⋉"
  }, {
    item = "⋋",
    subText = "Product, Left Semidirect (U+22CB)",
    text = "⋋"
  }, {
    item = "∏",
    subText = "Product, N-Ary (U+220F)",
    text = "∏"
  }, {
    item = "⋊",
    subText = "Product, Right Normal Factor Semidirect (U+22CA)",
    text = "⋊"
  }, {
    item = "⋌",
    subText = "Product, Right Semidirect (U+22CC)",
    text = "⋌"
  }, {
    item = "⨽",
    subText = "Product, Righthand Interior (U+2A3D)",
    text = "⨽"
  }, {
    item = "⧢",
    subText = "Product, Shuffle (U+29E2)",
    text = "⧢"
  }, {
    item = "⨳",
    subText = "Product, Smash (U+2A33)",
    text = "⨳"
  }, {
    item = "⊗",
    subText = "Product, Tensor (U+2297)",
    text = "⊗"
  }, {
    item = "⨯",
    subText = "Product, Vector Or Cross (U+2A2F)",
    text = "⨯"
  }, {
    item = "≀",
    subText = "Product, Wreath (U+2240)",
    text = "≀"
  }, {
    item = "",
    subText = "Program Command, Application (U+009F)",
    text = ""
  }, {
    item = "🛇",
    subText = "Prohibited Sign (U+1F6C7)",
    text = "🛇"
  }, {
    item = "⃠",
    subText = "Prohibition (U+20E0)",
    text = "⃠"
  }, {
    item = "🚬",
    subText = "Prohibition Signs, Permission And (U+1F6AC)",
    text = "🚬"
  }, {
    item = "⌅",
    subText = "Projective (U+2305)",
    text = "⌅"
  }, {
    item = "∎",
    subText = "Proof, End Of (U+220E)",
    text = "∎"
  }, {
    item = "⋔",
    subText = "Proper Intersection (U+22D4)",
    text = "⋔"
  }, {
    item = "⅊",
    subText = "Property Line (U+214A)",
    text = "⅊"
  }, {
    item = "∷",
    subText = "Proportion (U+2237)",
    text = "∷"
  }, {
    item = "∺",
    subText = "Proportion, Geometric (U+223A)",
    text = "∺"
  }, {
    item = "∝",
    subText = "Proportional To (U+221D)",
    text = "∝"
  }, {
    item = "∼",
    subText = "Proportional To (U+223C)",
    text = "∼"
  }, {
    item = "⊢",
    subText = "Proves (U+22A2)",
    text = "⊢"
  }, {
    item = "𝁯",
    subText = "Psifistoparakalesma (U+1D06F)",
    text = "𝁯"
  }, {
    item = "̓",
    subText = "Psili, Greek (U+0313)",
    text = "̓"
  }, {
    item = "℗",
    subText = "Published (U+2117)",
    text = "℗"
  }, {
    item = "⟓",
    subText = "Pullback (U+27D3)",
    text = "⟓"
  }, {
    item = "👊",
    subText = "Punch (U+1F44A)",
    text = "👊"
  }, {
    item = "ʹ",
    subText = "Punctuation And Signs, Greek (U+0374)",
    text = "ʹ"
  }, {
    item = "၊",
    subText = "Punctuation And Signs, Myanmar (U+104A)",
    text = "၊"
  }, {
    item = "܀",
    subText = "Punctuation And Signs, Syriac (U+0700)",
    text = "܀"
  }, {
    item = " ",
    subText = "Punctuation And Symbols, Ascii (U+0020)",
    text = " "
  }, {
    item = " ",
    subText = "Punctuation And Symbols, Latin-1 (U+00A0)",
    text = " "
  }, {
    item = "⁇",
    subText = "Punctuation For Vertical Text, Double (U+2047)",
    text = "⁇"
  }, {
    item = "🙶",
    subText = "Punctuation Mark Ornaments (U+1F676)",
    text = "🙶"
  }, {
    item = "❛",
    subText = "Punctuation Mark Ornaments (U+275B)",
    text = "❛"
  }, {
    item = " ",
    subText = "Punctuation Space (U+2008)",
    text = " "
  }, {
    item = "،",
    subText = "Punctuation, Arabic (U+060C)",
    text = "،"
  }, {
    item = "᙭",
    subText = "Punctuation, Canadian Syllabics (U+166D)",
    text = "᙭"
  }, {
    item = "　",
    subText = "Punctuation, Cjk Symbols And (U+3000)",
    text = "　"
  }, {
    item = "𒐀",
    subText = "Punctuation, Cuneiform Numbers And (U+12400)",
    text = "𒐀"
  }, {
    item = "፡",
    subText = "Punctuation, Ethiopic (U+1361)",
    text = "፡"
  }, {
    item = " ",
    subText = "Punctuation, General (U+2000)",
    text = " "
  }, {
    item = "｡",
    subText = "Punctuation, Halfwidth Cjk (U+FF61)",
    text = "｡"
  }, {
    item = "ְ",
    subText = "Punctuation, Hebrew Points And (U+05B0)",
    text = "ְ"
  }, {
    item = "᠀",
    subText = "Punctuation, Mongolian (U+1800)",
    text = "᠀"
  }, {
    item = "᚛",
    subText = "Punctuation, Ogham (U+169B)",
    text = "᚛"
  }, {
    item = "᜶",
    subText = "Punctuation, Philippine Double (U+1736)",
    text = "᜶"
  }, {
    item = "᜵",
    subText = "Punctuation, Philippine Single (U+1735)",
    text = "᜵"
  }, {
    item = "᛫",
    subText = "Punctuation, Runic (U+16EB)",
    text = "᛫"
  }, {
    item = "⸀",
    subText = "Punctuation, Supplemental (U+2E00)",
    text = "⸀"
  }, {
    item = "£",
    subText = "Punt, Irish (U+00A3)",
    text = "£"
  }, {
    item = "।",
    subText = "Purna Viram, Devanagari (U+0964)",
    text = "।"
  }, {
    item = "⟔",
    subText = "Pushout (U+27D4)",
    text = "⟔"
  }, {
    item = "⁕",
    subText = "Puspika (U+2055)",
    text = "⁕"
  }, {
    item = "Ɋ",
    subText = "Q With Hook Tail, Latin Capital Letter Small (U+024A)",
    text = "Ɋ"
  }, {
    item = "ɋ",
    subText = "Q With Hook Tail, Latin Small Letter (U+024B)",
    text = "ɋ"
  }, {
    item = "ʠ",
    subText = "Q With Hook, Latin Small Letter (U+02A0)",
    text = "ʠ"
  }, {
    item = "ℚ",
    subText = "Q, Double-Struck Capital (U+211A)",
    text = "ℚ"
  }, {
    item = "℺",
    subText = "Q, Rotated Capital (U+213A)",
    text = "℺"
  }, {
    item = "∎",
    subText = "Q.E.D. (U+220E)",
    text = "∎"
  }, {
    item = "ȹ",
    subText = "Qp Digraph, Latin Small Letter (U+0239)",
    text = "ȹ"
  }, {
    item = " ",
    subText = "Quad, Em (U+2001)",
    text = " "
  }, {
    item = " ",
    subText = "Quad, En (U+2000)",
    text = " "
  }, {
    item = " ",
    subText = "Quad, Mutton (U+2001)",
    text = " "
  }, {
    item = "◰",
    subText = "Quadrant Control Code Graphics (U+25F0)",
    text = "◰"
  }, {
    item = "□",
    subText = "Quadrature (U+25A1)",
    text = "□"
  }, {
    item = "⁗",
    subText = "Quadruple Prime (U+2057)",
    text = "⁗"
  }, {
    item = "≬",
    subText = "Quantic (U+226C)",
    text = "≬"
  }, {
    item = "∃",
    subText = "Quantifier, Existential (U+2203)",
    text = "∃"
  }, {
    item = "∀",
    subText = "Quantifier, Universal (U+2200)",
    text = "∀"
  }, {
    item = "☽",
    subText = "Quarter Moon, First (U+263D)",
    text = "☽"
  }, {
    item = "☾",
    subText = "Quarter Moon, Last (U+263E)",
    text = "☾"
  }, {
    item = "♩",
    subText = "Quarter Note (U+2669)",
    text = "♩"
  }, {
    item = "¼",
    subText = "Quarter, Vulgar Fraction One (U+00BC)",
    text = "¼"
  }, {
    item = "¼",
    subText = "Quarters, Fractions (U+00BC)",
    text = "¼"
  }, {
    item = "¾",
    subText = "Quarters, Vulgar Fraction Three (U+00BE)",
    text = "¾"
  }, {
    item = "⨖",
    subText = "Quaternion Integral Operator (U+2A16)",
    text = "⨖"
  }, {
    item = "𝅘𝅥𝅮",
    subText = "Quaver (U+1D160)",
    text = "𝅘𝅥𝅮"
  }, {
    item = "♪",
    subText = "Quaver (U+266A)",
    text = "♪"
  }, {
    item = "♫",
    subText = "Quavers, Beamed (U+266B)",
    text = "♫"
  }, {
    item = "⁈",
    subText = "Question Exclamation Mark (U+2048)",
    text = "⁈"
  }, {
    item = "?",
    subText = "Question Mark (U+003F)",
    text = "?"
  }, {
    item = "❓",
    subText = "Question Mark Ornament, Black (U+2753)",
    text = "❓"
  }, {
    item = "❔",
    subText = "Question Mark Ornament, White (U+2754)",
    text = "❔"
  }, {
    item = "؟",
    subText = "Question Mark, Arabic (U+061F)",
    text = "؟"
  }, {
    item = "՞",
    subText = "Question Mark, Armenian (U+055E)",
    text = "՞"
  }, {
    item = "⁇",
    subText = "Question Mark, Double (U+2047)",
    text = "⁇"
  }, {
    item = "፧",
    subText = "Question Mark, Ethiopic (U+1367)",
    text = "፧"
  }, {
    item = "⁉",
    subText = "Question Mark, Exclamation (U+2049)",
    text = "⁉"
  }, {
    item = ";",
    subText = "Question Mark, Greek (U+003B)",
    text = ";"
  }, {
    item = ";",
    subText = "Question Mark, Greek (U+037E)",
    text = ";"
  }, {
    item = "¿",
    subText = "Question Mark, Inverted (U+00BF)",
    text = "¿"
  }, {
    item = "᥅",
    subText = "Question Mark, Limbu (U+1945)",
    text = "᥅"
  }, {
    item = "¿",
    subText = "Question Mark, Turned (U+00BF)",
    text = "¿"
  }, {
    item = "≟",
    subText = "Questioned Equal To (U+225F)",
    text = "≟"
  }, {
    item = "⁅",
    subText = "Quill, Left Square Bracket With (U+2045)",
    text = "⁅"
  }, {
    item = "⁆",
    subText = "Quill, Right Square Bracket With (U+2046)",
    text = "⁆"
  }, {
    item = "🙨",
    subText = "Quilt Square Ornaments (U+1F668)",
    text = "🙨"
  }, {
    item = "⌜",
    subText = "Quine Corners (U+231C)",
    text = "⌜"
  }, {
    item = "―",
    subText = "Quotation Dash (U+2015)",
    text = "―"
  }, {
    item = '"',
    subText = "Quotation Mark (U+0022)",
    text = '"'
  }, {
    item = "❛",
    subText = "Quotation Mark Dingbats (U+275B)",
    text = "❛"
  }, {
    item = "❛",
    subText = "Quotation Mark Ornaments (U+275B)",
    text = "❛"
  }, {
    item = "”",
    subText = "Quotation Mark, Double Comma (U+201D)",
    text = "”"
  }, {
    item = "‟",
    subText = "Quotation Mark, Double High-Reversed-9 (U+201F)",
    text = "‟"
  }, {
    item = "„",
    subText = "Quotation Mark, Double Low-9 (U+201E)",
    text = "„"
  }, {
    item = "⹂",
    subText = "Quotation Mark, Double Low-Reversed-9 (U+2E42)",
    text = "⹂"
  }, {
    item = "〞",
    subText = "Quotation Mark, Double Prime (U+301E)",
    text = "〞"
  }, {
    item = "‟",
    subText = "Quotation Mark, Double Reversed Comma (U+201F)",
    text = "‟"
  }, {
    item = "“",
    subText = "Quotation Mark, Double Turned Comma (U+201C)",
    text = "“"
  }, {
    item = "“",
    subText = "Quotation Mark, Left Double (U+201C)",
    text = "“"
  }, {
    item = "‘",
    subText = "Quotation Mark, Left Single (U+2018)",
    text = "‘"
  }, {
    item = "«",
    subText = "Quotation Mark, Left-Pointing Double Angle (U+00AB)",
    text = "«"
  }, {
    item = "„",
    subText = "Quotation Mark, Low Double Comma (U+201E)",
    text = "„"
  }, {
    item = "〟",
    subText = "Quotation Mark, Low Double Prime (U+301F)",
    text = "〟"
  }, {
    item = "‚",
    subText = "Quotation Mark, Low Single Comma (U+201A)",
    text = "‚"
  }, {
    item = '"',
    subText = "Quotation Mark, Neutral (U+0022)",
    text = '"'
  }, {
    item = "'",
    subText = "Quotation Mark, Neutral Single (U+0027)",
    text = "'"
  }, {
    item = "〝",
    subText = "Quotation Mark, Reversed Double Prime (U+301D)",
    text = "〝"
  }, {
    item = "”",
    subText = "Quotation Mark, Right Double (U+201D)",
    text = "”"
  }, {
    item = "’",
    subText = "Quotation Mark, Right Single (U+2019)",
    text = "’"
  }, {
    item = "»",
    subText = "Quotation Mark, Right-Pointing Double Angle (U+00BB)",
    text = "»"
  }, {
    item = "’",
    subText = "Quotation Mark, Single Comma (U+2019)",
    text = "’"
  }, {
    item = "‛",
    subText = "Quotation Mark, Single High-Reversed-9 (U+201B)",
    text = "‛"
  }, {
    item = "‹",
    subText = "Quotation Mark, Single Left-Pointing Angle (U+2039)",
    text = "‹"
  }, {
    item = "‚",
    subText = "Quotation Mark, Single Low-9 (U+201A)",
    text = "‚"
  }, {
    item = "‛",
    subText = "Quotation Mark, Single Reversed Comma (U+201B)",
    text = "‛"
  }, {
    item = "›",
    subText = "Quotation Mark, Single Right-Pointing Angle (U+203A)",
    text = "›"
  }, {
    item = "‘",
    subText = "Quotation Mark, Single Turned Comma (U+2018)",
    text = "‘"
  }, {
    item = "‘",
    subText = "Quotation Marks (U+2018)",
    text = "‘"
  }, {
    item = "「",
    subText = "Quotation Marks, Cjk (U+300C)",
    text = "「"
  }, {
    item = "❮",
    subText = "Quotation Marks, Ornamental Angle (U+276E)",
    text = "❮"
  }, {
    item = "'",
    subText = "Quote, Apl (U+0027)",
    text = "'"
  }, {
    item = "ۖ",
    subText = "Qur'Anic Annotation Signs, Arabic (U+06D6)",
    text = "ۖ"
  }, {
    item = "ŕ",
    subText = "R With Acute, Latin Small Letter (U+0155)",
    text = "ŕ"
  }, {
    item = "ř",
    subText = "R With Caron, Latin Small Letter (U+0159)",
    text = "ř"
  }, {
    item = "ŗ",
    subText = "R With Cedilla, Latin Small Letter (U+0157)",
    text = "ŗ"
  }, {
    item = "ṙ",
    subText = "R With Dot Above, Latin Small Letter (U+1E59)",
    text = "ṙ"
  }, {
    item = "ṛ",
    subText = "R With Dot Below, Latin Small Letter (U+1E5B)",
    text = "ṛ"
  }, {
    item = "ȑ",
    subText = "R With Double Grave, Latin Small Letter (U+0211)",
    text = "ȑ"
  }, {
    item = "ɾ",
    subText = "R With Fishhook, Latin Small Letter (U+027E)",
    text = "ɾ"
  }, {
    item = "ɿ",
    subText = "R With Fishhook, Latin Small Letter Reversed (U+027F)",
    text = "ɿ"
  }, {
    item = "ɻ",
    subText = "R With Hook, Latin Small Letter Turned (U+027B)",
    text = "ɻ"
  }, {
    item = "ȓ",
    subText = "R With Inverted Breve, Latin Small Letter (U+0213)",
    text = "ȓ"
  }, {
    item = "ṟ",
    subText = "R With Line Below, Latin Small Letter (U+1E5F)",
    text = "ṟ"
  }, {
    item = "ɼ",
    subText = "R With Long Leg, Latin Small Letter (U+027C)",
    text = "ɼ"
  }, {
    item = "ɺ",
    subText = "R With Long Leg, Latin Small Letter Turned (U+027A)",
    text = "ɺ"
  }, {
    item = "Ɍ",
    subText = "R With Stroke, Latin Capital Letter (U+024C)",
    text = "Ɍ"
  }, {
    item = "ɍ",
    subText = "R With Stroke, Latin Small Letter (U+024D)",
    text = "ɍ"
  }, {
    item = "ɽ",
    subText = "R With Tail, Latin Small Letter (U+027D)",
    text = "ɽ"
  }, {
    item = "ℜ",
    subText = "R, Black-Letter Capital (U+211C)",
    text = "ℜ"
  }, {
    item = "ͬ",
    subText = "R, Combining Latin Small Letter (U+036C)",
    text = "ͬ"
  }, {
    item = "ℝ",
    subText = "R, Double-Struck Capital (U+211D)",
    text = "ℝ"
  }, {
    item = "ʀ",
    subText = "R, Latin Letter Small Capital (U+0280)",
    text = "ʀ"
  }, {
    item = "ʁ",
    subText = "R, Latin Letter Small Capital Inverted (U+0281)",
    text = "ʁ"
  }, {
    item = "ᴙ",
    subText = "R, Latin Letter Small Capital Reversed (U+1D19)",
    text = "ᴙ"
  }, {
    item = "ᴚ",
    subText = "R, Latin Letter Small Capital Turned (U+1D1A)",
    text = "ᴚ"
  }, {
    item = "ɹ",
    subText = "R, Latin Small Letter Turned (U+0279)",
    text = "ɹ"
  }, {
    item = "ᵣ",
    subText = "R, Latin Subscript Small Letter (U+1D63)",
    text = "ᵣ"
  }, {
    item = "ʳ",
    subText = "R, Modifier Letter Small (U+02B3)",
    text = "ʳ"
  }, {
    item = "ʶ",
    subText = "R, Modifier Letter Small Capital Inverted (U+02B6)",
    text = "ʶ"
  }, {
    item = "ʴ",
    subText = "R, Modifier Letter Small Turned (U+02B4)",
    text = "ʴ"
  }, {
    item = "ℛ",
    subText = "R, Script Capital (U+211B)",
    text = "ℛ"
  }, {
    item = "🐇",
    subText = "Rabbit (U+1F407)",
    text = "🐇"
  }, {
    item = "🐰",
    subText = "Rabbit Face (U+1F430)",
    text = "🐰"
  }, {
    item = "⟟",
    subText = "Radial Component (U+27DF)",
    text = "⟟"
  }, {
    item = "√",
    subText = "Radical Sign (U+221A)",
    text = "√"
  }, {
    item = "⺀",
    subText = "Radicals Supplement, Cjk (U+2E80)",
    text = "⺀"
  }, {
    item = "⼀",
    subText = "Radicals, Cjk Kangxi (U+2F00)",
    text = "⼀"
  }, {
    item = "꒐",
    subText = "Radicals, Yi (U+A490)",
    text = "꒐"
  }, {
    item = "☢",
    subText = "Radioactive Sign (U+2622)",
    text = "☢"
  }, {
    item = "🛤",
    subText = "Railway Track (U+1F6E4)",
    text = "🛤"
  }, {
    item = "⛆",
    subText = "Rain (U+26C6)",
    text = "⛆"
  }, {
    item = "☔",
    subText = "Rain Drops, Umbrella With (U+2614)",
    text = "☔"
  }, {
    item = "🌈",
    subText = "Rainbow (U+1F308)",
    text = "🌈"
  }, {
    item = "☂",
    subText = "Rainy Weather (U+2602)",
    text = "☂"
  }, {
    item = "🐏",
    subText = "Ram (U+1F40F)",
    text = "🐏"
  }, {
    item = "ɤ",
    subText = "Rams Horn, Latin Small Letter (U+0264)",
    text = "ɤ"
  }, {
    item = "▷",
    subText = "Range Restriction (U+25B7)",
    text = "▷"
  }, {
    item = "🐀",
    subText = "Rat (U+1F400)",
    text = "🐀"
  }, {
    item = "∶",
    subText = "Ratio (U+2236)",
    text = "∶"
  }, {
    item = "℞",
    subText = "Ratio, Cross (U+211E)",
    text = "℞"
  }, {
    item = "ℚ",
    subText = "Rational Numbers (U+211A)",
    text = "ℚ"
  }, {
    item = "ះ",
    subText = "Reahmuk, Khmer Sign (U+17C7)",
    text = "ះ"
  }, {
    item = "ℊ",
    subText = "Real Number Symbol (U+210A)",
    text = "ℊ"
  }, {
    item = "ℝ",
    subText = "Real Numbers (U+211D)",
    text = "ℝ"
  }, {
    item = "ℜ",
    subText = "Real Part (U+211C)",
    text = "ℜ"
  }, {
    item = "℞",
    subText = "Recipe (U+211E)",
    text = "℞"
  }, {
    item = "⏺",
    subText = "Record (U+23FA)",
    text = "⏺"
  }, {
    item = "",
    subText = "Record Separator (U+001E)",
    text = ""
  }, {
    item = "␞",
    subText = "Record Separator, Symbol For (U+241E)",
    text = "␞"
  }, {
    item = "⌕",
    subText = "Recorder, Telephone (U+2315)",
    text = "⌕"
  }, {
    item = "℗",
    subText = "Recording Copyright, Sound (U+2117)",
    text = "℗"
  }, {
    item = "⌧",
    subText = "Rectangle Box, X In A (U+2327)",
    text = "⌧"
  }, {
    item = "▬",
    subText = "Rectangles (U+25AC)",
    text = "▬"
  }, {
    item = "♼",
    subText = "Recycled Paper Symbol (U+267C)",
    text = "♼"
  }, {
    item = "♽",
    subText = "Recycled Paper Symbol, Partially- (U+267D)",
    text = "♽"
  }, {
    item = "♲",
    subText = "Recycling Symbol, Universal (U+2672)",
    text = "♲"
  }, {
    item = "♲",
    subText = "Recycling Symbols (U+2672)",
    text = "♲"
  }, {
    item = "♳",
    subText = "Recycling Symbols, Plastics (U+2673)",
    text = "♳"
  }, {
    item = "⊦",
    subText = "Reduces To (U+22A6)",
    text = "⊦"
  }, {
    item = "⊢",
    subText = "Reducible (U+22A2)",
    text = "⊢"
  }, {
    item = "※",
    subText = "Reference Mark (U+203B)",
    text = "※"
  }, {
    item = "®",
    subText = "Registered Sign (U+00AE)",
    text = "®"
  }, {
    item = "®",
    subText = "Registered Trade Mark Sign (U+00AE)",
    text = "®"
  }, {
    item = "ꤰ",
    subText = "Rejang (U+A930)",
    text = "ꤰ"
  }, {
    item = "↔",
    subText = "Relation (U+2194)",
    text = "↔"
  }, {
    item = "⇼",
    subText = "Relation, Finite (U+21FC)",
    text = "⇼"
  }, {
    item = "⇹",
    subText = "Relation, Partial (U+21F9)",
    text = "⇹"
  }, {
    item = "⧣",
    subText = "Relational Operators (U+29E3)",
    text = "⧣"
  }, {
    item = "⪽",
    subText = "Relations, Subset And Superset (U+2ABD)",
    text = "⪽"
  }, {
    item = "☦",
    subText = "Religious And Political Symbols (U+2626)",
    text = "☦"
  }, {
    item = "〱",
    subText = "Repeat Marks, Kana (U+3031)",
    text = "〱"
  }, {
    item = "�",
    subText = "Replacement Character (U+FFFD)",
    text = "�"
  }, {
    item = "￼",
    subText = "Replacement Character, Object (U+FFFC)",
    text = "￼"
  }, {
    item = "℟",
    subText = "Response (U+211F)",
    text = "℟"
  }, {
    item = "🍴",
    subText = "Restaurant, Meal (Glyph May Vary) (U+1F374)",
    text = "🍴"
  }, {
    item = "◁",
    subText = "Restriction, Domain (U+25C1)",
    text = "◁"
  }, {
    item = "▷",
    subText = "Restriction, Range (U+25B7)",
    text = "▷"
  }, {
    item = "🚹",
    subText = "Restroom Symbols (U+1F6B9)",
    text = "🚹"
  }, {
    item = "⊨",
    subText = "Results In (U+22A8)",
    text = "⊨"
  }, {
    item = "ǃ",
    subText = "Retroflex Click, Latin Letter (U+01C3)",
    text = "ǃ"
  }, {
    item = "̢",
    subText = "Retroflex Hook Below, Combining (U+0322)",
    text = "̢"
  }, {
    item = "Ʈ",
    subText = "Retroflex Hook, Latin Capital Letter T With (U+01AE)",
    text = "Ʈ"
  }, {
    item = "ɖ",
    subText = "Retroflex Hook, Latin Small Letter D (U+0256)",
    text = "ɖ"
  }, {
    item = "ɭ",
    subText = "Retroflex Hook, Latin Small Letter L With (U+026D)",
    text = "ɭ"
  }, {
    item = "ɳ",
    subText = "Retroflex Hook, Latin Small Letter N With (U+0273)",
    text = "ɳ"
  }, {
    item = "ʈ",
    subText = "Retroflex Hook, Latin Small Letter T With (U+0288)",
    text = "ʈ"
  }, {
    item = "ʐ",
    subText = "Retroflex Hook, Latin Small Letter Z With (U+0290)",
    text = "ʐ"
  }, {
    item = "⏎",
    subText = "Return Symbol (U+23CE)",
    text = "⏎"
  }, {
    item = "\r",
    subText = "Return, Carriage (U+000D)",
    text = "\r"
  }, {
    item = "␍",
    subText = "Return, Symbol For Carriage (U+240D)",
    text = "␍"
  }, {
    item = "",
    subText = "Reverse Line Feed (U+008D)",
    text = ""
  }, {
    item = "⏴",
    subText = "Reverse Play (U+23F4)",
    text = "⏴"
  }, {
    item = "\\",
    subText = "Reverse Solidus (U+005C)",
    text = "\\"
  }, {
    item = "⧵",
    subText = "Reverse Solidus Operator (U+29F5)",
    text = "⧵"
  }, {
    item = "⃥",
    subText = "Reverse Solidus Overlay, Combining (U+20E5)",
    text = "⃥"
  }, {
    item = "⧹",
    subText = "Reverse Solidus, Big (U+29F9)",
    text = "⧹"
  }, {
    item = "⊣",
    subText = "Reverse Turnstile (U+22A3)",
    text = "⊣"
  }, {
    item = "ↄ",
    subText = "Reversed C, Latin Small Letter (U+2184)",
    text = "ↄ"
  }, {
    item = "̔",
    subText = "Reversed Comma Above, Combining (U+0314)",
    text = "̔"
  }, {
    item = "‟",
    subText = "Reversed Comma Quotation Mark, Double (U+201F)",
    text = "‟"
  }, {
    item = "‛",
    subText = "Reversed Comma Quotation Mark, Single (U+201B)",
    text = "‛"
  }, {
    item = "ʽ",
    subText = "Reversed Comma, Modifier Letter (U+02BD)",
    text = "ʽ"
  }, {
    item = "‶",
    subText = "Reversed Double Prime (U+2036)",
    text = "‶"
  }, {
    item = "〝",
    subText = "Reversed Double Prime Quotation Mark (U+301D)",
    text = "〝"
  }, {
    item = "Ǝ",
    subText = "Reversed E, Latin Capital Letter (U+018E)",
    text = "Ǝ"
  }, {
    item = "ɘ",
    subText = "Reversed E, Latin Small Letter (U+0258)",
    text = "ɘ"
  }, {
    item = "ɞ",
    subText = "Reversed Epsilon, Latin Small Letter Closed (U+025E)",
    text = "ɞ"
  }, {
    item = "ƪ",
    subText = "Reversed Esh Loop, Latin Letter (U+01AA)",
    text = "ƪ"
  }, {
    item = "ʅ",
    subText = "Reversed Esh, Latin Small Letter Squat (U+0285)",
    text = "ʅ"
  }, {
    item = "ʕ",
    subText = "Reversed Glottal Stop, Latin Letter (U+0295)",
    text = "ʕ"
  }, {
    item = "ˁ",
    subText = "Reversed Glottal Stop, Modifier Letter (U+02C1)",
    text = "ˁ"
  }, {
    item = "ˤ",
    subText = "Reversed Glottal Stop, Modifier Letter Small (U+02E4)",
    text = "ˤ"
  }, {
    item = "϶",
    subText = "Reversed Lunate Epsilon Symbol, Greek (U+03F6)",
    text = "϶"
  }, {
    item = "ᴎ",
    subText = "Reversed N, Latin Letter Small Capital (U+1D0E)",
    text = "ᴎ"
  }, {
    item = "⌐",
    subText = "Reversed Not Sign (U+2310)",
    text = "⌐"
  }, {
    item = "ɝ",
    subText = "Reversed Open E With Hook, Latin Small Letter (U+025D)",
    text = "ɝ"
  }, {
    item = "ɜ",
    subText = "Reversed Open E, Latin Small Letter (U+025C)",
    text = "ɜ"
  }, {
    item = "ɞ",
    subText = "Reversed Open E, Latin Small Letter Closed (U+025E)",
    text = "ɞ"
  }, {
    item = "⁋",
    subText = "Reversed Pilcrow Sign (U+204B)",
    text = "⁋"
  }, {
    item = "‵",
    subText = "Reversed Prime (U+2035)",
    text = "‵"
  }, {
    item = "ɿ",
    subText = "Reversed R With Fishhook, Latin Small Letter (U+027F)",
    text = "ɿ"
  }, {
    item = "ᴙ",
    subText = "Reversed R, Latin Letter Small Capital (U+1D19)",
    text = "ᴙ"
  }, {
    item = "☙",
    subText = "Reversed Rotated Floral Heart Bullet (U+2619)",
    text = "☙"
  }, {
    item = "⅃",
    subText = "Reversed Sans-Serif Capital L (U+2143)",
    text = "⅃"
  }, {
    item = "⁏",
    subText = "Reversed Semicolon (U+204F)",
    text = "⁏"
  }, {
    item = "϶",
    subText = "Reversed Straight Epsilon (U+03F6)",
    text = "϶"
  }, {
    item = "∽",
    subText = "Reversed Tilde (U+223D)",
    text = "∽"
  }, {
    item = "⋍",
    subText = "Reversed Tilde Equals (U+22CD)",
    text = "⋍"
  }, {
    item = "‷",
    subText = "Reversed Triple Prime (U+2037)",
    text = "‷"
  }, {
    item = "ƹ",
    subText = "Reversed, Latin Small Letter Ezh (U+01B9)",
    text = "ƹ"
  }, {
    item = "⏪",
    subText = "Rewind, Fast (U+23EA)",
    text = "⏪"
  }, {
    item = "⟯",
    subText = "Rgroup (U+27EF)",
    text = "⟯"
  }, {
    item = "˞",
    subText = "Rhotic Hook, Modifier Letter (U+02DE)",
    text = "˞"
  }, {
    item = "﷼",
    subText = "Rial Sign (U+FDFC)",
    text = "﷼"
  }, {
    item = "🎗",
    subText = "Ribbon, Reminder (U+1F397)",
    text = "🎗"
  }, {
    item = "៛",
    subText = "Riel, Khmer Currency Symbol (U+17DB)",
    text = "៛"
  }, {
    item = "ℛ",
    subText = "Riemann Integral (U+211B)",
    text = "ℛ"
  }, {
    item = "〛",
    subText = "Right Abstract Syntax Bracket (U+301B)",
    text = "〛"
  }, {
    item = "∟",
    subText = "Right Angle (U+221F)",
    text = "∟"
  }, {
    item = "〉",
    subText = "Right Angle Bracket (U+3009)",
    text = "〉"
  }, {
    item = "⟩",
    subText = "Right Angle Bracket, Mathematical (U+27E9)",
    text = "⟩"
  }, {
    item = "⊾",
    subText = "Right Angle With Arc (U+22BE)",
    text = "⊾"
  }, {
    item = "⃗",
    subText = "Right Arrow Above, Combining (U+20D7)",
    text = "⃗"
  }, {
    item = "⃡",
    subText = "Right Arrow Above, Combining Left (U+20E1)",
    text = "⃡"
  }, {
    item = "⃯",
    subText = "Right Arrow Below, Combining (U+20EF)",
    text = "⃯"
  }, {
    item = "͍",
    subText = "Right Arrow Below, Combining Left (U+034D)",
    text = "͍"
  }, {
    item = "⧴",
    subText = "Right Arrow, Colon (U+29F4)",
    text = "⧴"
  }, {
    item = "͐",
    subText = "Right Arrowhead Above, Combining (U+0350)",
    text = "͐"
  }, {
    item = "͕",
    subText = "Right Arrowhead Below, Combining (U+0355)",
    text = "͕"
  }, {
    item = "⟧",
    subText = "Right Bag Bracket (U+27E7)",
    text = "⟧"
  }, {
    item = "】",
    subText = "Right Black Lenticular Bracket (U+3011)",
    text = "】"
  }, {
    item = "⌉",
    subText = "Right Ceiling (U+2309)",
    text = "⌉"
  }, {
    item = "⟫",
    subText = "Right Chevron Bracket (U+27EB)",
    text = "⟫"
  }, {
    item = "」",
    subText = "Right Corner Bracket (U+300D)",
    text = "」"
  }, {
    item = "}",
    subText = "Right Curly Bracket (U+007D)",
    text = "}"
  }, {
    item = "⋱",
    subText = "Right Diagonal Ellipsis, Down (U+22F1)",
    text = "⋱"
  }, {
    item = "⋰",
    subText = "Right Diagonal Ellipsis, Up (U+22F0)",
    text = "⋰"
  }, {
    item = "》",
    subText = "Right Double Angle Bracket (U+300B)",
    text = "》"
  }, {
    item = "⟫",
    subText = "Right Double Angle Bracket, Mathematical (U+27EB)",
    text = "⟫"
  }, {
    item = "”",
    subText = "Right Double Quotation Mark (U+201D)",
    text = "”"
  }, {
    item = "⌋",
    subText = "Right Floor (U+230B)",
    text = "⌋"
  }, {
    item = "͗",
    subText = "Right Half Ring Above, Combining (U+0357)",
    text = "͗"
  }, {
    item = "̹",
    subText = "Right Half Ring Below, Combining (U+0339)",
    text = "̹"
  }, {
    item = "՚",
    subText = "Right Half Ring, Armenian Modifier Letter (U+055A)",
    text = "՚"
  }, {
    item = "⃑",
    subText = "Right Harpoon Above, Combining (U+20D1)",
    text = "⃑"
  }, {
    item = "⌦",
    subText = "Right Key, Delete To The (U+2326)",
    text = "⌦"
  }, {
    item = "⎱",
    subText = "Right Moustache (U+23B1)",
    text = "⎱"
  }, {
    item = "⋊",
    subText = "Right Normal Factor Semidirect Product (U+22CA)",
    text = "⋊"
  }, {
    item = ")",
    subText = "Right Parenthesis (U+0029)",
    text = ")"
  }, {
    item = "﴿",
    subText = "Right Parenthesis, Ornate (U+FD3F)",
    text = "﴿"
  }, {
    item = "✎",
    subText = "Right Pencil, Lower (U+270E)",
    text = "✎"
  }, {
    item = "✐",
    subText = "Right Pencil, Upper (U+2710)",
    text = "✐"
  }, {
    item = "»",
    subText = "Right Pointing Guillemet (U+00BB)",
    text = "»"
  }, {
    item = "☛",
    subText = "Right Pointing Index, Black (U+261B)",
    text = "☛"
  }, {
    item = "☞",
    subText = "Right Pointing Index, White (U+261E)",
    text = "☞"
  }, {
    item = "›",
    subText = "Right Pointing Single Guillemet (U+203A)",
    text = "›"
  }, {
    item = "⋌",
    subText = "Right Semidirect Product (U+22CC)",
    text = "⋌"
  }, {
    item = "⟩",
    subText = "Right Sequence Bracket (U+27E9)",
    text = "⟩"
  }, {
    item = "’",
    subText = "Right Single Quotation Mark (U+2019)",
    text = "’"
  }, {
    item = "]",
    subText = "Right Square Bracket (U+005D)",
    text = "]"
  }, {
    item = "⁆",
    subText = "Right Square Bracket With Quill (U+2046)",
    text = "⁆"
  }, {
    item = "⊢",
    subText = "Right Tack (U+22A2)",
    text = "⊢"
  }, {
    item = "̙",
    subText = "Right Tack Below, Combining (U+0319)",
    text = "̙"
  }, {
    item = "〕",
    subText = "Right Tortoise Shell Bracket (U+3015)",
    text = "〕"
  }, {
    item = "⊿",
    subText = "Right Triangle (U+22BF)",
    text = "⊿"
  }, {
    item = "』",
    subText = "Right White Corner Bracket (U+300F)",
    text = "』"
  }, {
    item = "⦄",
    subText = "Right White Curly Bracket (U+2984)",
    text = "⦄"
  }, {
    item = "〗",
    subText = "Right White Lenticular Bracket (U+3017)",
    text = "〗"
  }, {
    item = "⦆",
    subText = "Right White Parenthesis (U+2986)",
    text = "⦆"
  }, {
    item = "〛",
    subText = "Right White Square Bracket (U+301B)",
    text = "〛"
  }, {
    item = "〙",
    subText = "Right White Tortoise Shell Bracket (U+3019)",
    text = "〙"
  }, {
    item = "̕",
    subText = "Right, Combining Comma Above (U+0315)",
    text = "̕"
  }, {
    item = "͘",
    subText = "Right, Combining Dot Above (U+0358)",
    text = "͘"
  }, {
    item = "⌦",
    subText = "Right, Erase To The (U+2326)",
    text = "⌦"
  }, {
    item = "↠",
    subText = "Right, Fast Cursor (U+21A0)",
    text = "↠"
  }, {
    item = "〉",
    subText = "Right-Pointing Angle Bracket (U+232A)",
    text = "〉"
  }, {
    item = "›",
    subText = "Right-Pointing Angle Quotation Mark, Single (U+203A)",
    text = "›"
  }, {
    item = "»",
    subText = "Right-Pointing Double Angle Quotation Mark (U+00BB)",
    text = "»"
  }, {
    item = "‫",
    subText = "Right-To-Left Embedding (U+202B)",
    text = "‫"
  }, {
    item = "⁧",
    subText = "Right-To-Left Isolate (U+2067)",
    text = "⁧"
  }, {
    item = "‏",
    subText = "Right-To-Left Mark (U+200F)",
    text = "‏"
  }, {
    item = "‮",
    subText = "Right-To-Left Override (U+202E)",
    text = "‮"
  }, {
    item = "⨽",
    subText = "Righthand Interior Product (U+2A3D)",
    text = "⨽"
  }, {
    item = "⇥",
    subText = "Rightward Tab (U+21E5)",
    text = "⇥"
  }, {
    item = "→",
    subText = "Rightwards Arrow (U+2192)",
    text = "→"
  }, {
    item = "͢",
    subText = "Rightwards Arrow Below, Combining Double (U+0362)",
    text = "͢"
  }, {
    item = "⁍",
    subText = "Rightwards Bullet, Black (U+204D)",
    text = "⁍"
  }, {
    item = "⃬",
    subText = "Rightwards Harpoon With Barb Downwards, Combining (U+20EC)",
    text = "⃬"
  }, {
    item = "˚",
    subText = "Ring Above (U+02DA)",
    text = "˚"
  }, {
    item = "̊",
    subText = "Ring Above, Combining (U+030A)",
    text = "̊"
  }, {
    item = "͑",
    subText = "Ring Above, Combining Left Half (U+0351)",
    text = "͑"
  }, {
    item = "͗",
    subText = "Ring Above, Combining Right Half (U+0357)",
    text = "͗"
  }, {
    item = "Å",
    subText = "Ring Above, Latin Capital Letter A With (U+00C5)",
    text = "Å"
  }, {
    item = "å",
    subText = "Ring Above, Latin Small Letter A With (U+00E5)",
    text = "å"
  }, {
    item = "̥",
    subText = "Ring Below, Combining (U+0325)",
    text = "̥"
  }, {
    item = "͚",
    subText = "Ring Below, Combining Double (U+035A)",
    text = "͚"
  }, {
    item = "̜",
    subText = "Ring Below, Combining Left Half (U+031C)",
    text = "̜"
  }, {
    item = "̹",
    subText = "Ring Below, Combining Right Half (U+0339)",
    text = "̹"
  }, {
    item = "ḁ",
    subText = "Ring Below, Latin Small Letter A With (U+1E01)",
    text = "ḁ"
  }, {
    item = "≗",
    subText = "Ring Equal To (U+2257)",
    text = "≗"
  }, {
    item = "≖",
    subText = "Ring In Equal To (U+2256)",
    text = "≖"
  }, {
    item = "∘",
    subText = "Ring Operator (U+2218)",
    text = "∘"
  }, {
    item = "⊚",
    subText = "Ring Operator, Circled (U+229A)",
    text = "⊚"
  }, {
    item = "⃘",
    subText = "Ring Overlay, Combining (U+20D8)",
    text = "⃘"
  }, {
    item = "⃚",
    subText = "Ring Overlay, Combining Anticlockwise (U+20DA)",
    text = "⃚"
  }, {
    item = "⃙",
    subText = "Ring Overlay, Combining Clockwise (U+20D9)",
    text = "⃙"
  }, {
    item = "⃚",
    subText = "Ring Overlay, Combining Counterclockwise (U+20DA)",
    text = "⃚"
  }, {
    item = "ՙ",
    subText = "Ring, Armenian Modifier Letter Left Half (U+0559)",
    text = "ՙ"
  }, {
    item = "՚",
    subText = "Ring, Armenian Modifier Letter Right Half (U+055A)",
    text = "՚"
  }, {
    item = "⌬",
    subText = "Ring, Benzene (U+232C)",
    text = "⌬"
  }, {
    item = "˓",
    subText = "Ring, Modifier Letter Centred Left Half (U+02D3)",
    text = "˓"
  }, {
    item = "ʿ",
    subText = "Ring, Modifier Letter Left Half (U+02BF)",
    text = "ʿ"
  }, {
    item = "ཾ",
    subText = "Rjes Su Nga Ro, Tibetan Sign (U+0F7E)",
    text = "ཾ"
  }, {
    item = "‫",
    subText = "Rle (U+202B)",
    text = "‫"
  }, {
    item = "‏",
    subText = "Rlm (U+200F)",
    text = "‏"
  }, {
    item = "‮",
    subText = "Rlo (U+202E)",
    text = "‮"
  }, {
    item = "ཿ",
    subText = "Rnam Bcad, Tibetan Sign (U+0F7F)",
    text = "ཿ"
  }, {
    item = "⛒",
    subText = "Road Closed (U+26D2)",
    text = "⛒"
  }, {
    item = "✊",
    subText = "Rock In Rock, Paper, Scissors Game (U+270A)",
    text = "✊"
  }, {
    item = "🤣",
    subText = "Rofl (U+1F923)",
    text = "🤣"
  }, {
    item = "𐴀",
    subText = "Rohingya, Hanifi (U+10D00)",
    text = "𐴀"
  }, {
    item = "💁",
    subText = "Role Symbols (U+1F481)",
    text = "💁"
  }, {
    item = "👤",
    subText = "Role Symbols, Portrait And (U+1F464)",
    text = "👤"
  }, {
    item = "🤰",
    subText = "Role Symbols, Portrait And (U+1F930)",
    text = "🤰"
  }, {
    item = "🧐",
    subText = "Role Symbols, Portrait And (U+1F9D0)",
    text = "🧐"
  }, {
    item = "🤣",
    subText = "Rolling On The Floor Laughing (U+1F923)",
    text = "🤣"
  }, {
    item = "Ⅰ",
    subText = "Roman Numerals (U+2160)",
    text = "Ⅰ"
  }, {
    item = "ↅ",
    subText = "Roman Numerals, Archaic (U+2185)",
    text = "ↅ"
  }, {
    item = "𐆐",
    subText = "Roman Symbols (U+10190)",
    text = "𐆐"
  }, {
    item = "💋",
    subText = "Romance Symbols (U+1F48B)",
    text = "💋"
  }, {
    item = "🐓",
    subText = "Rooster (U+1F413)",
    text = "🐓"
  }, {
    item = "∛",
    subText = "Root, Cube (U+221B)",
    text = "∛"
  }, {
    item = "∜",
    subText = "Root, Fourth (U+221C)",
    text = "∜"
  }, {
    item = "√",
    subText = "Root, Square (U+221A)",
    text = "√"
  }, {
    item = "℺",
    subText = "Rotated Capital Q (U+213A)",
    text = "℺"
  }, {
    item = "̔",
    subText = "Rough Breathing Mark, Greek (U+0314)",
    text = "̔"
  }, {
    item = "₽",
    subText = "Ruble Sign (U+20BD)",
    text = "₽"
  }, {
    item = "¦",
    subText = "Rule, Parted (U+00A6)",
    text = "¦"
  }, {
    item = "⧴",
    subText = "Rule-Delayed (U+29F4)",
    text = "⧴"
  }, {
    item = "𐹠",
    subText = "Rumi Numeral Symbols (U+10E60)",
    text = "𐹠"
  }, {
    item = "ᚠ",
    subText = "Runic (U+16A0)",
    text = "ᚠ"
  }, {
    item = "ᛮ",
    subText = "Runic Golden Numbers (U+16EE)",
    text = "ᛮ"
  }, {
    item = "᛫",
    subText = "Runic Punctuation (U+16EB)",
    text = "᛫"
  }, {
    item = "⌰",
    subText = "Runout, Total (U+2330)",
    text = "⌰"
  }, {
    item = "௹",
    subText = "Rupai, Tamil (U+0BF9)",
    text = "௹"
  }, {
    item = "৲",
    subText = "Rupee Mark, Bengali (U+09F2)",
    text = "৲"
  }, {
    item = "₨",
    subText = "Rupee Sign (U+20A8)",
    text = "₨"
  }, {
    item = "৳",
    subText = "Rupee Sign, Bengali (U+09F3)",
    text = "৳"
  }, {
    item = "૱",
    subText = "Rupee Sign, Gujarati (U+0AF1)",
    text = "૱"
  }, {
    item = "₹",
    subText = "Rupee Sign, Indian (U+20B9)",
    text = "₹"
  }, {
    item = "௹",
    subText = "Rupee Sign, Tamil (U+0BF9)",
    text = "௹"
  }, {
    item = "А",
    subText = "Russian Alphabet (U+0410)",
    text = "А"
  }, {
    item = "ś",
    subText = "S With Acute, Latin Small Letter (U+015B)",
    text = "ś"
  }, {
    item = "š",
    subText = "S With Caron, Latin Small Letter (U+0161)",
    text = "š"
  }, {
    item = "ş",
    subText = "S With Cedilla, Latin Small Letter (U+015F)",
    text = "ş"
  }, {
    item = "ŝ",
    subText = "S With Circumflex, Latin Small Letter (U+015D)",
    text = "ŝ"
  }, {
    item = "ș",
    subText = "S With Comma Below, Latin Small Letter (U+0219)",
    text = "ș"
  }, {
    item = "ṡ",
    subText = "S With Dot Above, Latin Small Letter (U+1E61)",
    text = "ṡ"
  }, {
    item = "ẛ",
    subText = "S With Dot Above, Latin Small Letter Long (U+1E9B)",
    text = "ẛ"
  }, {
    item = "ṣ",
    subText = "S With Dot Below, Latin Small Letter (U+1E63)",
    text = "ṣ"
  }, {
    item = "ʂ",
    subText = "S With Hook, Latin Small Letter (U+0282)",
    text = "ʂ"
  }, {
    item = "ȿ",
    subText = "S With Swash Tail, Latin Small Letter (U+023F)",
    text = "ȿ"
  }, {
    item = "∾",
    subText = "S, Inverted Lazy (U+223E)",
    text = "∾"
  }, {
    item = "ſ",
    subText = "S, Latin Small Letter Long (U+017F)",
    text = "ſ"
  }, {
    item = "ß",
    subText = "S, Latin Small Letter Sharp (U+00DF)",
    text = "ß"
  }, {
    item = "ₛ",
    subText = "S, Latin Subscript Small Letter (U+209B)",
    text = "ₛ"
  }, {
    item = "∽",
    subText = "S, Lazy (U+223D)",
    text = "∽"
  }, {
    item = "ˢ",
    subText = "S, Modifier Letter Small (U+02E2)",
    text = "ˢ"
  }, {
    item = "♐",
    subText = "Sagittarius (U+2650)",
    text = "♐"
  }, {
    item = "⛴",
    subText = "Sailboat (U+26F4)",
    text = "⛴"
  }, {
    item = "☓",
    subText = "Saltire (U+2613)",
    text = "☓"
  }, {
    item = "🞨",
    subText = "Saltires (U+1F7A8)",
    text = "🞨"
  }, {
    item = "܏",
    subText = "Sam, Syriac (U+070F)",
    text = "܏"
  }, {
    item = "ࠀ",
    subText = "Samaritan (U+0800)",
    text = "ࠀ"
  }, {
    item = "⅏",
    subText = "Samaritan Source, Symbol For (U+214F)",
    text = "⅏"
  }, {
    item = "𝟬",
    subText = "Sans-Serif Bold Digits (U+1D7EC)",
    text = "𝟬"
  }, {
    item = "𝝖",
    subText = "Sans-Serif Bold Greek Mathematical Symbols (U+1D756)",
    text = "𝝖"
  }, {
    item = "𝞐",
    subText = "Sans-Serif Bold Italic Greek Mathematical Symbols (U+1D790)",
    text = "𝞐"
  }, {
    item = "𝘼",
    subText = "Sans-Serif Bold Italic Mathematical Symbols (U+1D63C)",
    text = "𝘼"
  }, {
    item = "𝗔",
    subText = "Sans-Serif Bold Mathematical Symbols (U+1D5D4)",
    text = "𝗔"
  }, {
    item = "⅁",
    subText = "Sans-Serif Capital G, Turned (U+2141)",
    text = "⅁"
  }, {
    item = "⅃",
    subText = "Sans-Serif Capital L, Reversed (U+2143)",
    text = "⅃"
  }, {
    item = "⅂",
    subText = "Sans-Serif Capital L, Turned (U+2142)",
    text = "⅂"
  }, {
    item = "⅄",
    subText = "Sans-Serif Capital Y, Turned (U+2144)",
    text = "⅄"
  }, {
    item = "𝟢",
    subText = "Sans-Serif Digits (U+1D7E2)",
    text = "𝟢"
  }, {
    item = "𝘈",
    subText = "Sans-Serif Italic Mathematical Symbols (U+1D608)",
    text = "𝘈"
  }, {
    item = "𝖠",
    subText = "Sans-Serif Mathematical Symbols (U+1D5A0)",
    text = "𝖠"
  }, {
    item = "🎅",
    subText = "Santa Claus (U+1F385)",
    text = "🎅"
  }, {
    item = "⊨",
    subText = "Satisfies (U+22A8)",
    text = "⊨"
  }, {
    item = "⫱",
    subText = "Satisfies, Necessarily (U+2AF1)",
    text = "⫱"
  }, {
    item = "⫢",
    subText = "Satisfies, Ordinarily (U+2AE2)",
    text = "⫢"
  }, {
    item = "∸",
    subText = "Saturating Subtraction (U+2238)",
    text = "∸"
  }, {
    item = "♄",
    subText = "Saturn (U+2644)",
    text = "♄"
  }, {
    item = "ꢀ",
    subText = "Saurashtra (U+A880)",
    text = "ꢀ"
  }, {
    item = "⚖",
    subText = "Scales (U+2696)",
    text = "⚖"
  }, {
    item = "⎺",
    subText = "Scan Lines, Horizontal (U+23BA)",
    text = "⎺"
  }, {
    item = "⧹",
    subText = "Schema Hiding (U+29F9)",
    text = "⧹"
  }, {
    item = "💮",
    subText = "School Grade Symbols, Japanese (U+1F4AE)",
    text = "💮"
  }, {
    item = "Ə",
    subText = "Schwa, Latin Capital Letter (U+018F)",
    text = "Ə"
  }, {
    item = "ə",
    subText = "Schwa, Latin Small Letter (U+0259)",
    text = "ə"
  }, {
    item = "✌",
    subText = "Scissors In Rock, Paper, Scissors Game (U+270C)",
    text = "✌"
  }, {
    item = "✂",
    subText = "Scissors, Black (U+2702)",
    text = "✂"
  }, {
    item = "✁",
    subText = "Scissors, Upper Blade (U+2701)",
    text = "✁"
  }, {
    item = "✄",
    subText = "Scissors, White (U+2704)",
    text = "✄"
  }, {
    item = "🦂",
    subText = "Scorpion (U+1F982)",
    text = "🦂"
  }, {
    item = "♏",
    subText = "Scorpius (U+264F)",
    text = "♏"
  }, {
    item = "⎚",
    subText = "Screen Symbol, Clear (U+239A)",
    text = "⎚"
  }, {
    item = "⎙",
    subText = "Screen Symbol, Print (U+2399)",
    text = "⎙"
  }, {
    item = "⃢",
    subText = "Screen, Combining Enclosing (U+20E2)",
    text = "⃢"
  }, {
    item = "ɑ",
    subText = "Script A, Latin Small Letter (U+0251)",
    text = "ɑ"
  }, {
    item = "ℬ",
    subText = "Script Capital B (U+212C)",
    text = "ℬ"
  }, {
    item = "ℰ",
    subText = "Script Capital E (U+2130)",
    text = "ℰ"
  }, {
    item = "ℱ",
    subText = "Script Capital F (U+2131)",
    text = "ℱ"
  }, {
    item = "ℋ",
    subText = "Script Capital H (U+210B)",
    text = "ℋ"
  }, {
    item = "ℐ",
    subText = "Script Capital I (U+2110)",
    text = "ℐ"
  }, {
    item = "ℒ",
    subText = "Script Capital L (U+2112)",
    text = "ℒ"
  }, {
    item = "ℳ",
    subText = "Script Capital M (U+2133)",
    text = "ℳ"
  }, {
    item = "℘",
    subText = "Script Capital P (U+2118)",
    text = "℘"
  }, {
    item = "ℛ",
    subText = "Script Capital R (U+211B)",
    text = "ℛ"
  }, {
    item = "ƒ",
    subText = "Script F, Latin Small Letter (U+0192)",
    text = "ƒ"
  }, {
    item = "ɡ",
    subText = "Script G, Latin Small Letter (U+0261)",
    text = "ɡ"
  }, {
    item = "𝒜",
    subText = "Script Mathematical Symbols (U+1D49C)",
    text = "𝒜"
  }, {
    item = "𝓐",
    subText = "Script Mathematical Symbols, Bold (U+1D4D0)",
    text = "𝓐"
  }, {
    item = "ℯ",
    subText = "Script Small E (U+212F)",
    text = "ℯ"
  }, {
    item = "ℊ",
    subText = "Script Small G (U+210A)",
    text = "ℊ"
  }, {
    item = "ℓ",
    subText = "Script Small L (U+2113)",
    text = "ℓ"
  }, {
    item = "ℴ",
    subText = "Script Small O (U+2134)",
    text = "ℴ"
  }, {
    item = "ϑ",
    subText = "Script Theta (U+03D1)",
    text = "ϑ"
  }, {
    item = "Ʋ",
    subText = "Script V, Latin Capital Letter (U+01B2)",
    text = "Ʋ"
  }, {
    item = "ʋ",
    subText = "Script V, Latin Small Letter (U+028B)",
    text = "ʋ"
  }, {
    item = "⇳",
    subText = "Scrolling (U+21F3)",
    text = "⇳"
  }, {
    item = "℈",
    subText = "Scruple (U+2108)",
    text = "℈"
  }, {
    item = "̼",
    subText = "Seagull Below, Combining (U+033C)",
    text = "̼"
  }, {
    item = "🐚",
    subText = "Seashell (U+1F41A)",
    text = "🐚"
  }, {
    item = "ˊ",
    subText = "Second Tone, Mandarin Chinese (U+02CA)",
    text = "ˊ"
  }, {
    item = "″",
    subText = "Seconds (U+2033)",
    text = "″"
  }, {
    item = "§",
    subText = "Section Sign (U+00A7)",
    text = "§"
  }, {
    item = "¶",
    subText = "Section Sign, European (U+00B6)",
    text = "¶"
  }, {
    item = "⌔",
    subText = "Sector (U+2314)",
    text = "⌔"
  }, {
    item = "⌓",
    subText = "Segment (U+2313)",
    text = "⌓"
  }, {
    item = "",
    subText = "Selected Area, End Of (U+0087)",
    text = ""
  }, {
    item = "",
    subText = "Selected Area, Start Of (U+0086)",
    text = ""
  }, {
    item = "󠄀",
    subText = "Selectors Supplement, Variation (U+E0100)",
    text = "󠄀"
  }, {
    item = "︀",
    subText = "Selectors, Variation (U+FE00)",
    text = "︀"
  }, {
    item = "🤳",
    subText = "Selfie (U+1F933)",
    text = "🤳"
  }, {
    item = "𝅝",
    subText = "Semibreve (U+1D15D)",
    text = "𝅝"
  }, {
    item = ";",
    subText = "Semicolon (U+003B)",
    text = ";"
  }, {
    item = "؛",
    subText = "Semicolon, Arabic (U+061B)",
    text = "؛"
  }, {
    item = "፤",
    subText = "Semicolon, Ethiopic (U+1364)",
    text = "፤"
  }, {
    item = "⁏",
    subText = "Semicolon, Reversed (U+204F)",
    text = "⁏"
  }, {
    item = "⋋",
    subText = "Semidirect Product, Left (U+22CB)",
    text = "⋋"
  }, {
    item = "⋉",
    subText = "Semidirect Product, Left Normal Factor (U+22C9)",
    text = "⋉"
  }, {
    item = "⋌",
    subText = "Semidirect Product, Right (U+22CC)",
    text = "⋌"
  }, {
    item = "⋊",
    subText = "Semidirect Product, Right Normal Factor (U+22CA)",
    text = "⋊"
  }, {
    item = "𝅘𝅥𝅯",
    subText = "Semiquaver (U+1D161)",
    text = "𝅘𝅥𝅯"
  }, {
    item = "♬",
    subText = "Semiquavers, Beamed (U+266C)",
    text = "♬"
  }, {
    item = "𐄁",
    subText = "Separator Dot, Aegean Word (U+10101)",
    text = "𐄁"
  }, {
    item = "⎖",
    subText = "Separator Key Symbol, Decimal (U+2396)",
    text = "⎖"
  }, {
    item = "𐄀",
    subText = "Separator Line, Aegean Word (U+10100)",
    text = "𐄀"
  }, {
    item = "⸱",
    subText = "Separator Middle Dot, Word (U+2E31)",
    text = "⸱"
  }, {
    item = "؍",
    subText = "Separator, Arabic Date (U+060D)",
    text = "؍"
  }, {
    item = "٫",
    subText = "Separator, Arabic Decimal (U+066B)",
    text = "٫"
  }, {
    item = "٬",
    subText = "Separator, Arabic Phrase (U+066C)",
    text = "٬"
  }, {
    item = "٬",
    subText = "Separator, Arabic Thousands (U+066C)",
    text = "٬"
  }, {
    item = ",",
    subText = "Separator, Decimal (U+002C)",
    text = ","
  }, {
    item = "।",
    subText = "Separator, Devanagari Phrase (U+0964)",
    text = "।"
  }, {
    item = "፨",
    subText = "Separator, Ethiopic Paragraph (U+1368)",
    text = "፨"
  }, {
    item = "",
    subText = "Separator, File (U+001C)",
    text = ""
  }, {
    item = "჻",
    subText = "Separator, Georgian Paragraph (U+10FB)",
    text = "჻"
  }, {
    item = "",
    subText = "Separator, Group (U+001D)",
    text = ""
  }, {
    item = "￺",
    subText = "Separator, Interlinear Annotation (U+FFFA)",
    text = "￺"
  }, {
    item = "⁣",
    subText = "Separator, Invisible (U+2063)",
    text = "⁣"
  }, {
    item = " ",
    subText = "Separator, Line (U+2028)",
    text = " "
  }, {
    item = "᠎",
    subText = "Separator, Mongolian Vowel (U+180E)",
    text = "᠎"
  }, {
    item = " ",
    subText = "Separator, Paragraph (U+2029)",
    text = " "
  }, {
    item = "",
    subText = "Separator, Record (U+001E)",
    text = ""
  }, {
    item = "",
    subText = "Separator, Unit (U+001F)",
    text = ""
  }, {
    item = "※",
    subText = "Separator, Urdu Paragraph (U+203B)",
    text = "※"
  }, {
    item = "𝔖",
    subText = "Septuagint (U+1D516)",
    text = "𝔖"
  }, {
    item = "⟨",
    subText = "Sequence Bracket, Left (U+27E8)",
    text = "⟨"
  }, {
    item = "⟩",
    subText = "Sequence Bracket, Right (U+27E9)",
    text = "⟩"
  }, {
    item = "⁀",
    subText = "Sequence Concatenation (U+2040)",
    text = "⁀"
  }, {
    item = "",
    subText = "Sequence Introducer, Control (U+009B)",
    text = ""
  }, {
    item = "℠",
    subText = "Service Mark (U+2120)",
    text = "℠"
  }, {
    item = "﹅",
    subText = "Sesame Dot (U+FE45)",
    text = "﹅"
  }, {
    item = "﹆",
    subText = "Sesame Dot, White (U+FE46)",
    text = "﹆"
  }, {
    item = "∈",
    subText = "Set Membership Signs (U+2208)",
    text = "∈"
  }, {
    item = "∖",
    subText = "Set Minus (U+2216)",
    text = "∖"
  }, {
    item = "ℂ",
    subText = "Set Of Complex Numbers, The (U+2102)",
    text = "ℂ"
  }, {
    item = "ℤ",
    subText = "Set Of Integers, The (U+2124)",
    text = "ℤ"
  }, {
    item = "ℚ",
    subText = "Set Of Rational Numbers, The (U+211A)",
    text = "ℚ"
  }, {
    item = "ℝ",
    subText = "Set Of Real Numbers, The (U+211D)",
    text = "ℝ"
  }, {
    item = "",
    subText = "Set Transmit State (U+0093)",
    text = ""
  }, {
    item = "∅",
    subText = "Set, Empty (U+2205)",
    text = "∅"
  }, {
    item = "⊂",
    subText = "Set, Included In (U+2282)",
    text = "⊂"
  }, {
    item = "⊃",
    subText = "Set, Includes In (U+2283)",
    text = "⊃"
  }, {
    item = "∅",
    subText = "Set, Null (U+2205)",
    text = "∅"
  }, {
    item = "𝒫",
    subText = "Set, Power (U+1D4AB)",
    text = "𝒫"
  }, {
    item = "⦰",
    subText = "Sets, Empty (U+29B0)",
    text = "⦰"
  }, {
    item = "✶",
    subText = "Sextile (U+2736)",
    text = "✶"
  }, {
    item = "░",
    subText = "Shade Characters (U+2591)",
    text = "░"
  }, {
    item = "❍",
    subText = "Shadowed White Circle (U+274D)",
    text = "❍"
  }, {
    item = "☘",
    subText = "Shamrock (U+2618)",
    text = "☘"
  }, {
    item = "♣",
    subText = "Shamrock (U+2663)",
    text = "♣"
  }, {
    item = "■",
    subText = "Shapes, Geometric (U+25A0)",
    text = "■"
  }, {
    item = "𑆀",
    subText = "Sharada (U+11180)",
    text = "𑆀"
  }, {
    item = "ß",
    subText = "Sharp S, Latin Small Letter (U+00DF)",
    text = "ß"
  }, {
    item = "♯",
    subText = "Sharp Sign, Music (U+266F)",
    text = "♯"
  }, {
    item = "𐑐",
    subText = "Shavian (U+10450)",
    text = "𐑐"
  }, {
    item = "🐑",
    subText = "Sheep (U+1F411)",
    text = "🐑"
  }, {
    item = "🐚",
    subText = "Shell, Spiral (U+1F41A)",
    text = "🐚"
  }, {
    item = "₪",
    subText = "Sheqel Sign, New (U+20AA)",
    text = "₪"
  }, {
    item = "՛",
    subText = "Shesht, Armenian (U+055B)",
    text = "՛"
  }, {
    item = "⛨",
    subText = "Shield, Black Cross On (U+26E8)",
    text = "⛨"
  }, {
    item = "⇧",
    subText = "Shift (U+21E7)",
    text = "⇧"
  }, {
    item = "",
    subText = "Shift In (U+000F)",
    text = ""
  }, {
    item = "␏",
    subText = "Shift In, Symbol For (U+240F)",
    text = "␏"
  }, {
    item = "",
    subText = "Shift Out (U+000E)",
    text = ""
  }, {
    item = "␎",
    subText = "Shift Out, Symbol For (U+240E)",
    text = "␎"
  }, {
    item = "⛩",
    subText = "Shinto Shrine (U+26E9)",
    text = "⛩"
  }, {
    item = "☗",
    subText = "Shogi Piece, Black (U+2617)",
    text = "☗"
  }, {
    item = "⛊",
    subText = "Shogi Piece, Turned Black (U+26CA)",
    text = "⛊"
  }, {
    item = "⛉",
    subText = "Shogi Piece, Turned White (U+26C9)",
    text = "⛉"
  }, {
    item = "☖",
    subText = "Shogi Piece, White (U+2616)",
    text = "☖"
  }, {
    item = "🌠",
    subText = "Shooting Star (U+1F320)",
    text = "🌠"
  }, {
    item = "🛒",
    subText = "Shopping Cart (U+1F6D2)",
    text = "🛒"
  }, {
    item = "̆",
    subText = "Short (U+0306)",
    text = "̆"
  }, {
    item = "̷",
    subText = "Short Slash Overlay (U+0337)",
    text = "̷"
  }, {
    item = "̷",
    subText = "Short Solidus Overlay, Combining (U+0337)",
    text = "̷"
  }, {
    item = "̵",
    subText = "Short Stroke Overlay, Combining (U+0335)",
    text = "̵"
  }, {
    item = "⃓",
    subText = "Short Vertical Line Overlay, Combining (U+20D3)",
    text = "⃓"
  }, {
    item = "𛲠",
    subText = "Shorthand Format Controls (U+1BCA0)",
    text = "𛲠"
  }, {
    item = "⍽",
    subText = "Shouldered Open Box (U+237D)",
    text = "⍽"
  }, {
    item = "☔",
    subText = "Showery Weather (U+2614)",
    text = "☔"
  }, {
    item = "⧢",
    subText = "Shuffle Product (U+29E2)",
    text = "⧢"
  }, {
    item = "­",
    subText = "Shy (U+00AD)",
    text = "­"
  }, {
    item = "᠇",
    subText = "Sibe Syllable Boundary Marker, Mongolian (U+1807)",
    text = "᠇"
  }, {
    item = "𑖀",
    subText = "Siddham (U+11580)",
    text = "𑖀"
  }, {
    item = "﹅",
    subText = "Sidelining Emphasis Marks (U+FE45)",
    text = "﹅"
  }, {
    item = "ᴞ",
    subText = "Sideways Diaeresized U, Latin Small Letter (U+1D1E)",
    text = "ᴞ"
  }, {
    item = "ᴓ",
    subText = "Sideways O With Stroke, Latin Small Letter (U+1D13)",
    text = "ᴓ"
  }, {
    item = "ᴑ",
    subText = "Sideways O, Latin Small Letter (U+1D11)",
    text = "ᴑ"
  }, {
    item = "ᴒ",
    subText = "Sideways Open O, Latin Small Letter (U+1D12)",
    text = "ᴒ"
  }, {
    item = "ᴟ",
    subText = "Sideways Turned M, Latin Small Letter (U+1D1F)",
    text = "ᴟ"
  }, {
    item = "ᴝ",
    subText = "Sideways U, Latin Small Letter (U+1D1D)",
    text = "ᴝ"
  }, {
    item = "ϲ",
    subText = "Sigma Symbol, Greek Lunate (U+03F2)",
    text = "ϲ"
  }, {
    item = "ϲ",
    subText = "Sigma, Greek Small Letter Lunate (U+03F2)",
    text = "ϲ"
  }, {
    item = "🚩",
    subText = "Signage And Other Symbols (U+1F6A9)",
    text = "🚩"
  }, {
    item = "☠",
    subText = "Signs, Warning (U+2620)",
    text = "☠"
  }, {
    item = "⚠",
    subText = "Signs, Warning (U+26A0)",
    text = "⚠"
  }, {
    item = "𝠀",
    subText = "Signwriting, Sutton (U+1D800)",
    text = "𝠀"
  }, {
    item = "🥈",
    subText = "Silver Medal (U+1F948)",
    text = "🥈"
  }, {
    item = "∼",
    subText = "Similar To (U+223C)",
    text = "∼"
  }, {
    item = "∿",
    subText = "Sine Wave (U+223F)",
    text = "∿"
  }, {
    item = "",
    subText = "Single Character Introducer (U+009A)",
    text = ""
  }, {
    item = "’",
    subText = "Single Comma Quotation Mark (U+2019)",
    text = "’"
  }, {
    item = "‚",
    subText = "Single Comma Quotation Mark, Low (U+201A)",
    text = "‚"
  }, {
    item = "‹",
    subText = "Single Guillemet, Left Pointing (U+2039)",
    text = "‹"
  }, {
    item = "›",
    subText = "Single Guillemet, Right Pointing (U+203A)",
    text = "›"
  }, {
    item = "‛",
    subText = "Single High-Reversed-9 Quotation Mark (U+201B)",
    text = "‛"
  }, {
    item = "‹",
    subText = "Single Left-Pointing Angle Quotation Mark (U+2039)",
    text = "‹"
  }, {
    item = "‚",
    subText = "Single Low-9 Quotation Mark (U+201A)",
    text = "‚"
  }, {
    item = "᜵",
    subText = "Single Punctuation, Philippine (U+1735)",
    text = "᜵"
  }, {
    item = "‘",
    subText = "Single Quotation Mark, Left (U+2018)",
    text = "‘"
  }, {
    item = "'",
    subText = "Single Quotation Mark, Neutral (U+0027)",
    text = "'"
  }, {
    item = "’",
    subText = "Single Quotation Mark, Right (U+2019)",
    text = "’"
  }, {
    item = "‛",
    subText = "Single Reversed Comma Quotation Mark (U+201B)",
    text = "‛"
  }, {
    item = "›",
    subText = "Single Right-Pointing Angle Quotation Mark (U+203A)",
    text = "›"
  }, {
    item = "",
    subText = "Single Shift Three (U+008F)",
    text = ""
  }, {
    item = "",
    subText = "Single Shift Two (U+008E)",
    text = ""
  }, {
    item = "‘",
    subText = "Single Turned Comma Quotation Mark (U+2018)",
    text = "‘"
  }, {
    item = "඀",
    subText = "Sinhala (U+0D80)",
    text = "඀"
  }, {
    item = "𑇠",
    subText = "Sinhala Archaic Numbers (U+111E0)",
    text = "𑇠"
  }, {
    item = "ක",
    subText = "Sinhala Consonants (U+0D9A)",
    text = "ක"
  }, {
    item = "ා",
    subText = "Sinhala Dependent Vowel Signs (U+0DCF)",
    text = "ා"
  }, {
    item = "අ",
    subText = "Sinhala Independent Vowels (U+0D85)",
    text = "අ"
  }, {
    item = "්",
    subText = "Sinhala Sign Al-Lakuna (U+0DCA)",
    text = "්"
  }, {
    item = "්",
    subText = "Sinhala Virama (U+0DCA)",
    text = "්"
  }, {
    item = "ꞏ",
    subText = "Sinological Dot, Latin Letter (U+A78F)",
    text = "ꞏ"
  }, {
    item = "⸽",
    subText = "Six Dots, Vertical (U+2E3D)",
    text = "⸽"
  }, {
    item = " ",
    subText = "Six-Per-Em Space (U+2006)",
    text = " "
  }, {
    item = "♬",
    subText = "Sixteenth Notes, Beamed (U+266C)",
    text = "♬"
  }, {
    item = "⅙",
    subText = "Sixths, Fractions (U+2159)",
    text = "⅙"
  }, {
    item = "⛷",
    subText = "Skier (U+26F7)",
    text = "⛷"
  }, {
    item = "💀",
    subText = "Skull (U+1F480)",
    text = "💀"
  }, {
    item = "☠",
    subText = "Skull And Crossbones (U+2620)",
    text = "☠"
  }, {
    item = "🕱",
    subText = "Skull And Crossbones, Black (U+1F571)",
    text = "🕱"
  }, {
    item = "/",
    subText = "Slash (U+002F)",
    text = "/"
  }, {
    item = "̸",
    subText = "Slash Overlay, Long (U+0338)",
    text = "̸"
  }, {
    item = "⃫",
    subText = "Slash Overlay, Long Double (U+20EB)",
    text = "⃫"
  }, {
    item = "̷",
    subText = "Slash Overlay, Short (U+0337)",
    text = "̷"
  }, {
    item = "⊘",
    subText = "Slash, Circled Division (U+2298)",
    text = "⊘"
  }, {
    item = "∕",
    subText = "Slash, Division (U+2215)",
    text = "∕"
  }, {
    item = "⁄",
    subText = "Slash, Fraction (U+2044)",
    text = "⁄"
  }, {
    item = "Ø",
    subText = "Slash, Latin Capital Letter O (U+00D8)",
    text = "Ø"
  }, {
    item = "ø",
    subText = "Slash, Latin Small Letter O (U+00F8)",
    text = "ø"
  }, {
    item = "💤",
    subText = "Sleeping Symbol (U+1F4A4)",
    text = "💤"
  }, {
    item = "⌳",
    subText = "Slope (U+2333)",
    text = "⌳"
  }, {
    item = "ᴁ",
    subText = "Small Capital Ae, Latin Letter (U+1D01)",
    text = "ᴁ"
  }, {
    item = "ᴆ",
    subText = "Small Capital Eth, Latin Letter (U+1D06)",
    text = "ᴆ"
  }, {
    item = "ᴣ",
    subText = "Small Capital Ezh, Latin Letter (U+1D23)",
    text = "ᴣ"
  }, {
    item = "ɶ",
    subText = "Small Capital Oe, Latin Letter (U+0276)",
    text = "ɶ"
  }, {
    item = "ᴕ",
    subText = "Small Capital Ou, Latin Letter (U+1D15)",
    text = "ᴕ"
  }, {
    item = "•",
    subText = "Small Circle, Black (U+2022)",
    text = "•"
  }, {
    item = "∍",
    subText = "Small Contains As Member (U+220D)",
    text = "∍"
  }, {
    item = "∊",
    subText = "Small Element Of (U+220A)",
    text = "∊"
  }, {
    item = "﹐",
    subText = "Small Form Variants (U+FE50)",
    text = "﹐"
  }, {
    item = "ℽ",
    subText = "Small Gamma, Double-Struck (U+213D)",
    text = "ℽ"
  }, {
    item = "ˠ",
    subText = "Small Gamma, Modifier Letter (U+02E0)",
    text = "ˠ"
  }, {
    item = "ゕ",
    subText = "Small Ka, Hiragana Letter (U+3095)",
    text = "ゕ"
  }, {
    item = "ゖ",
    subText = "Small Ke, Hiragana Letter (U+3096)",
    text = "ゖ"
  }, {
    item = "ա",
    subText = "Small Letters, Armenian (U+0561)",
    text = "ա"
  }, {
    item = "ͣ",
    subText = "Small Letters, Combining Latin (U+0363)",
    text = "ͣ"
  }, {
    item = "а",
    subText = "Small Letters, Cyrillic (U+0430)",
    text = "а"
  }, {
    item = "ა",
    subText = "Small Letters, Georgian (U+10D0)",
    text = "ა"
  }, {
    item = "α",
    subText = "Small Letters, Greek (U+03B1)",
    text = "α"
  }, {
    item = "a",
    subText = "Small Letters, Latin (U+0061)",
    text = "a"
  }, {
    item = "æ",
    subText = "Small Ligature Ae, Latin (U+00E6)",
    text = "æ"
  }, {
    item = "ĳ",
    subText = "Small Ligature Ij, Latin (U+0133)",
    text = "ĳ"
  }, {
    item = "œ",
    subText = "Small Ligature Oe, Latin (U+0153)",
    text = "œ"
  }, {
    item = "ℼ",
    subText = "Small Pi, Double-Struck (U+213C)",
    text = "ℼ"
  }, {
    item = "ˤ",
    subText = "Small Reversed Glottal Stop, Modifier Letter (U+02E4)",
    text = "ˤ"
  }, {
    item = "◾",
    subText = "Small Square, Black Medium (U+25FE)",
    text = "◾"
  }, {
    item = "˜",
    subText = "Small Tilde (U+02DC)",
    text = "˜"
  }, {
    item = "⚬",
    subText = "Small White Circle, Medium (U+26AC)",
    text = "⚬"
  }, {
    item = "⨳",
    subText = "Smash Product (U+2A33)",
    text = "⨳"
  }, {
    item = "⌣",
    subText = "Smile (U+2323)",
    text = "⌣"
  }, {
    item = "☻",
    subText = "Smiling Face, Black (U+263B)",
    text = "☻"
  }, {
    item = "☺",
    subText = "Smiling Face, White (U+263A)",
    text = "☺"
  }, {
    item = "⍨",
    subText = "Smirk (U+2368)",
    text = "⍨"
  }, {
    item = "̓",
    subText = "Smooth Breathing Mark, Greek (U+0313)",
    text = "̓"
  }, {
    item = "🐌",
    subText = "Snail (U+1F40C)",
    text = "🐌"
  }, {
    item = "🐍",
    subText = "Snake (U+1F40D)",
    text = "🐍"
  }, {
    item = "⛇",
    subText = "Snow, Heavy (U+26C7)",
    text = "⛇"
  }, {
    item = "⛄",
    subText = "Snow, Light (U+26C4)",
    text = "⛄"
  }, {
    item = "❄",
    subText = "Snowflake Dingbats (U+2744)",
    text = "❄"
  }, {
    item = "✡",
    subText = "Snowflakes (U+2721)",
    text = "✡"
  }, {
    item = "☃",
    subText = "Snowman (U+2603)",
    text = "☃"
  }, {
    item = "⛄",
    subText = "Snowman Without Snow (U+26C4)",
    text = "⛄"
  }, {
    item = "⛇",
    subText = "Snowman, Black (U+26C7)",
    text = "⛇"
  }, {
    item = "☃",
    subText = "Snowy Weather (U+2603)",
    text = "☃"
  }, {
    item = "⚽",
    subText = "Soccer Ball (U+26BD)",
    text = "⚽"
  }, {
    item = "­",
    subText = "Soft Hyphen (U+00AD)",
    text = "­"
  }, {
    item = "᠆",
    subText = "Soft Hyphen, Mongolian Todo (U+1806)",
    text = "᠆"
  }, {
    item = "⎔",
    subText = "Software-Function Symbol (U+2394)",
    text = "⎔"
  }, {
    item = "𐼰",
    subText = "Sogdian (U+10F30)",
    text = "𐼰"
  }, {
    item = "𐼀",
    subText = "Sogdian, Old (U+10F00)",
    text = "𐼀"
  }, {
    item = "█",
    subText = "Solid (U+2588)",
    text = "█"
  }, {
    item = "/",
    subText = "Solidus (U+002F)",
    text = "/"
  }, {
    item = "⁄",
    subText = "Solidus (U+2044)",
    text = "⁄"
  }, {
    item = "⫽",
    subText = "Solidus Operator, Double (U+2AFD)",
    text = "⫽"
  }, {
    item = "⧵",
    subText = "Solidus Operator, Reverse (U+29F5)",
    text = "⧵"
  }, {
    item = "̸",
    subText = "Solidus Overlay, Combining Long (U+0338)",
    text = "̸"
  }, {
    item = "⃫",
    subText = "Solidus Overlay, Combining Long Double (U+20EB)",
    text = "⃫"
  }, {
    item = "⃥",
    subText = "Solidus Overlay, Combining Reverse (U+20E5)",
    text = "⃥"
  }, {
    item = "̷",
    subText = "Solidus Overlay, Combining Short (U+0337)",
    text = "̷"
  }, {
    item = "⧸",
    subText = "Solidus, Big (U+29F8)",
    text = "⧸"
  }, {
    item = "⧹",
    subText = "Solidus, Big Reverse (U+29F9)",
    text = "⧹"
  }, {
    item = "\\",
    subText = "Solidus, Reverse (U+005C)",
    text = "\\"
  }, {
    item = "𑃐",
    subText = "Sora Sompeng (U+110D0)",
    text = "𑃐"
  }, {
    item = "🔊",
    subText = "Sound (U+1F50A)",
    text = "🔊"
  }, {
    item = "℗",
    subText = "Sound Recording Copyright (U+2117)",
    text = "℗"
  }, {
    item = "ℹ",
    subText = "Source, Information (U+2139)",
    text = "ℹ"
  }, {
    item = "𑩐",
    subText = "Soyombo (U+11A50)",
    text = "𑩐"
  }, {
    item = " ",
    subText = "Space (U+0020)",
    text = " "
  }, {
    item = " ",
    subText = "Space Mark, Ogham (U+1680)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Em (U+2003)",
    text = " "
  }, {
    item = " ",
    subText = "Space, En (U+2002)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Figure (U+2007)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Four-Per-Em (U+2005)",
    text = " "
  }, {
    item = "␣",
    subText = "Space, Graphic For (U+2423)",
    text = "␣"
  }, {
    item = " ",
    subText = "Space, Hair (U+200A)",
    text = " "
  }, {
    item = "ℌ",
    subText = "Space, Hilbert (U+210C)",
    text = "ℌ"
  }, {
    item = "　",
    subText = "Space, Ideographic (U+3000)",
    text = "　"
  }, {
    item = "〿",
    subText = "Space, Ideographic Half Fill (U+303F)",
    text = "〿"
  }, {
    item = "⍽",
    subText = "Space, Keyboard Symbol For No Break (U+237D)",
    text = "⍽"
  }, {
    item = " ",
    subText = "Space, Medium Mathematical (U+205F)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Mid (U+2005)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Narrow No-Break (U+202F)",
    text = " "
  }, {
    item = " ",
    subText = "Space, No-Break (U+00A0)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Non-Breaking (U+00A0)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Punctuation (U+2008)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Six-Per-Em (U+2006)",
    text = " "
  }, {
    item = "␠",
    subText = "Space, Symbol For (U+2420)",
    text = "␠"
  }, {
    item = " ",
    subText = "Space, Thick (U+2004)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Thin (U+2009)",
    text = " "
  }, {
    item = " ",
    subText = "Space, Three-Per-Em (U+2004)",
    text = " "
  }, {
    item = "​",
    subText = "Space, Zero Width (U+200B)",
    text = "​"
  }, {
    item = "﻿",
    subText = "Space, Zero Width No-Break (U+FEFF)",
    text = "﻿"
  }, {
    item = " ",
    subText = "Spaces (U+2000)",
    text = " "
  }, {
    item = "´",
    subText = "Spacing Acute Accent (U+00B4)",
    text = "´"
  }, {
    item = "¸",
    subText = "Spacing Cedilla (U+00B8)",
    text = "¸"
  }, {
    item = "^",
    subText = "Spacing Circumflex Accent (U+005E)",
    text = "^"
  }, {
    item = "˘",
    subText = "Spacing Clones Of Diacritics (U+02D8)",
    text = "˘"
  }, {
    item = "¨",
    subText = "Spacing Diaeresis (U+00A8)",
    text = "¨"
  }, {
    item = "‗",
    subText = "Spacing Double Underscore (U+2017)",
    text = "‗"
  }, {
    item = "`",
    subText = "Spacing Grave Accent (U+0060)",
    text = "`"
  }, {
    item = "¯",
    subText = "Spacing Macron (U+00AF)",
    text = "¯"
  }, {
    item = "ʰ",
    subText = "Spacing Modifier Letters (U+02B0)",
    text = "ʰ"
  }, {
    item = "‾",
    subText = "Spacing Overscore (U+203E)",
    text = "‾"
  }, {
    item = "~",
    subText = "Spacing Tilde (U+007E)",
    text = "~"
  }, {
    item = "_",
    subText = "Spacing Underscore (U+005F)",
    text = "_"
  }, {
    item = "₧",
    subText = "Spanish Currency (U+20A7)",
    text = "₧"
  }, {
    item = "❇",
    subText = "Sparkle (U+2747)",
    text = "❇"
  }, {
    item = "❈",
    subText = "Sparkle, Heavy (U+2748)",
    text = "❈"
  }, {
    item = "✨",
    subText = "Sparkles (U+2728)",
    text = "✨"
  }, {
    item = "🔇",
    subText = "Speaker Symbols (U+1F507)",
    text = "🔇"
  }, {
    item = "￰",
    subText = "Specials (U+FFF0)",
    text = "￰"
  }, {
    item = "豈",
    subText = "Specials Area, Compatibility And (U+F900)",
    text = "豈"
  }, {
    item = "🗨",
    subText = "Speech And Thought Bubble Symbols (U+1F5E8)",
    text = "🗨"
  }, {
    item = "₷",
    subText = "Spesmilo Sign (U+20B7)",
    text = "₷"
  }, {
    item = "∢",
    subText = "Spherical Angle (U+2222)",
    text = "∢"
  }, {
    item = "🌶",
    subText = "Spicy (U+1F336)",
    text = "🌶"
  }, {
    item = "🎽",
    subText = "Sport Symbols (U+1F3BD)",
    text = "🎽"
  }, {
    item = "🏏",
    subText = "Sport Symbols (U+1F3CF)",
    text = "🏏"
  }, {
    item = "̻",
    subText = "Square Below, Combining (U+033B)",
    text = "̻"
  }, {
    item = "⁅",
    subText = "Square Bracket With Quill, Left (U+2045)",
    text = "⁅"
  }, {
    item = "⁆",
    subText = "Square Bracket With Quill, Right (U+2046)",
    text = "⁆"
  }, {
    item = "]",
    subText = "Square Bracket, Closing (U+005D)",
    text = "]"
  }, {
    item = "[",
    subText = "Square Bracket, Left (U+005B)",
    text = "["
  }, {
    item = "〚",
    subText = "Square Bracket, Left White (U+301A)",
    text = "〚"
  }, {
    item = "[",
    subText = "Square Bracket, Opening (U+005B)",
    text = "["
  }, {
    item = "]",
    subText = "Square Bracket, Right (U+005D)",
    text = "]"
  }, {
    item = "〛",
    subText = "Square Bracket, Right White (U+301B)",
    text = "〛"
  }, {
    item = "⊓",
    subText = "Square Cap (U+2293)",
    text = "⊓"
  }, {
    item = "⊔",
    subText = "Square Cup (U+2294)",
    text = "⊔"
  }, {
    item = "⏍",
    subText = "Square Foot (U+23CD)",
    text = "⏍"
  }, {
    item = "⊏",
    subText = "Square Image Of (U+228F)",
    text = "⊏"
  }, {
    item = "⌑",
    subText = "Square Lozenge (U+2311)",
    text = "⌑"
  }, {
    item = "⊐",
    subText = "Square Original Of (U+2290)",
    text = "⊐"
  }, {
    item = "√",
    subText = "Square Root (U+221A)",
    text = "√"
  }, {
    item = "⧄",
    subText = "Square Symbols (U+29C4)",
    text = "⧄"
  }, {
    item = "◼",
    subText = "Square, Black Medium (U+25FC)",
    text = "◼"
  }, {
    item = "◾",
    subText = "Square, Black Medium Small (U+25FE)",
    text = "◾"
  }, {
    item = "⃞",
    subText = "Square, Combining Enclosing (U+20DE)",
    text = "⃞"
  }, {
    item = "⌗",
    subText = "Square, Viewdata (U+2317)",
    text = "⌗"
  }, {
    item = "²",
    subText = "Squared (U+00B2)",
    text = "²"
  }, {
    item = "⊡",
    subText = "Squared Dot Operator (U+22A1)",
    text = "⊡"
  }, {
    item = "㌀",
    subText = "Squared Japanese Katakana Words (U+3300)",
    text = "㌀"
  }, {
    item = "㍱",
    subText = "Squared Latin Abbreviations (U+3371)",
    text = "㍱"
  }, {
    item = "🄱",
    subText = "Squared Latin Letters (U+1F131)",
    text = "🄱"
  }, {
    item = "⊟",
    subText = "Squared Minus (U+229F)",
    text = "⊟"
  }, {
    item = "⊞",
    subText = "Squared Plus (U+229E)",
    text = "⊞"
  }, {
    item = "⊠",
    subText = "Squared Times (U+22A0)",
    text = "⊠"
  }, {
    item = "■",
    subText = "Squares (U+25A0)",
    text = "■"
  }, {
    item = "⬚",
    subText = "Squares (U+2B1A)",
    text = "⬚"
  }, {
    item = "ʅ",
    subText = "Squat Reversed Esh, Latin Small Letter (U+0285)",
    text = "ʅ"
  }, {
    item = "💫",
    subText = "Squeans (U+1F4AB)",
    text = "💫"
  }, {
    item = "ះ",
    subText = "Srak Ah, Khmer (U+17C7)",
    text = "ះ"
  }, {
    item = "ំ",
    subText = "Srak Am, Khmer (U+17C6)",
    text = "ំ"
  }, {
    item = "྄",
    subText = "Srog Med, Tibetan (U+0F84)",
    text = "྄"
  }, {
    item = "☓",
    subText = "St. Andrew'S Cross (U+2613)",
    text = "☓"
  }, {
    item = "⚕",
    subText = "Staff Of Aesculapius (U+2695)",
    text = "⚕"
  }, {
    item = "⚚",
    subText = "Staff Of Hermes (U+269A)",
    text = "⚚"
  }, {
    item = "*",
    subText = "Star (U+002A)",
    text = "*"
  }, {
    item = "☪",
    subText = "Star And Crescent (U+262A)",
    text = "☪"
  }, {
    item = "✦",
    subText = "Star Dingbats (U+2726)",
    text = "✦"
  }, {
    item = "≛",
    subText = "Star Equals (U+225B)",
    text = "≛"
  }, {
    item = "✡",
    subText = "Star Of David (U+2721)",
    text = "✡"
  }, {
    item = "⋆",
    subText = "Star Operator (U+22C6)",
    text = "⋆"
  }, {
    item = "٭",
    subText = "Star, Arabic Five Pointed (U+066D)",
    text = "٭"
  }, {
    item = "★",
    subText = "Star, Black (U+2605)",
    text = "★"
  }, {
    item = "🌠",
    subText = "Star, Shooting (U+1F320)",
    text = "🌠"
  }, {
    item = "☆",
    subText = "Star, White (U+2606)",
    text = "☆"
  }, {
    item = "✺",
    subText = "Starburst (U+273A)",
    text = "✺"
  }, {
    item = "🟀",
    subText = "Stars (U+1F7C0)",
    text = "🟀"
  }, {
    item = "✡",
    subText = "Stars (U+2721)",
    text = "✡"
  }, {
    item = "",
    subText = "Start Of Guarded Area (U+0096)",
    text = ""
  }, {
    item = "",
    subText = "Start Of Heading (U+0001)",
    text = ""
  }, {
    item = "␁",
    subText = "Start Of Heading, Symbol For (U+2401)",
    text = "␁"
  }, {
    item = "",
    subText = "Start Of Selected Area (U+0086)",
    text = ""
  }, {
    item = "",
    subText = "Start Of String (U+0098)",
    text = ""
  }, {
    item = "",
    subText = "Start Of Text (U+0002)",
    text = ""
  }, {
    item = "␂",
    subText = "Start Of Text, Symbol For (U+2402)",
    text = "␂"
  }, {
    item = "⊨",
    subText = "Statement Is True (U+22A8)",
    text = "⊨"
  }, {
    item = "⸼",
    subText = "Stenographic Full Stop (U+2E3C)",
    text = "⸼"
  }, {
    item = "£",
    subText = "Sterling, Pound (U+00A3)",
    text = "£"
  }, {
    item = "∣",
    subText = "Stile, Apl (U+2223)",
    text = "∣"
  }, {
    item = "⏹",
    subText = "Stop Play (U+23F9)",
    text = "⏹"
  }, {
    item = "🛑",
    subText = "Stop Sign (U+1F6D1)",
    text = "🛑"
  }, {
    item = "⏱",
    subText = "Stopwatch (U+23F1)",
    text = "⏱"
  }, {
    item = "ϵ",
    subText = "Straight Epsilon (U+03F5)",
    text = "ϵ"
  }, {
    item = "϶",
    subText = "Straight Epsilon, Reversed (U+03F6)",
    text = "϶"
  }, {
    item = "⏤",
    subText = "Straightness (U+23E4)",
    text = "⏤"
  }, {
    item = "́",
    subText = "Stress Mark (U+0301)",
    text = "́"
  }, {
    item = "ʗ",
    subText = "Stretched C, Latin Letter (U+0297)",
    text = "ʗ"
  }, {
    item = "≣",
    subText = "Strictly Equivalent To (U+2263)",
    text = "≣"
  }, {
    item = "",
    subText = "String Terminator (U+009C)",
    text = ""
  }, {
    item = "",
    subText = "String, Device Control (U+0090)",
    text = ""
  }, {
    item = "",
    subText = "String, Start Of (U+0098)",
    text = ""
  }, {
    item = "⃦",
    subText = "Stroke Overlay, Combining Double Vertical (U+20E6)",
    text = "⃦"
  }, {
    item = "̶",
    subText = "Stroke Overlay, Combining Long (U+0336)",
    text = "̶"
  }, {
    item = "̵",
    subText = "Stroke Overlay, Combining Short (U+0335)",
    text = "̵"
  }, {
    item = "Ø",
    subText = "Stroke, Latin Capital Letter O With (U+00D8)",
    text = "Ø"
  }, {
    item = "ø",
    subText = "Stroke, Latin Small Letter O With (U+00F8)",
    text = "ø"
  }, {
    item = "㇀",
    subText = "Strokes, Cjk (U+31C0)",
    text = "㇀"
  }, {
    item = "⊲",
    subText = "Subgroup Of, Normal (U+22B2)",
    text = "⊲"
  }, {
    item = "⋪",
    subText = "Subgroup Signs, Normal (U+22EA)",
    text = "⋪"
  }, {
    item = "⊳",
    subText = "Subgroup, Contains As Normal (U+22B3)",
    text = "⊳"
  }, {
    item = "ྐ",
    subText = "Subjoined Consonants, Tibetan (U+0F90)",
    text = "ྐ"
  }, {
    item = "₀",
    subText = "Subscript Digits (U+2080)",
    text = "₀"
  }, {
    item = "ͅ",
    subText = "Subscript, Greek Iota (U+0345)",
    text = "ͅ"
  }, {
    item = "₀",
    subText = "Subscripts (U+2080)",
    text = "₀"
  }, {
    item = "⪽",
    subText = "Subset And Superset Relations (U+2ABD)",
    text = "⪽"
  }, {
    item = "⊂",
    subText = "Subset Of (U+2282)",
    text = "⊂"
  }, {
    item = "⊄",
    subText = "Subset Of, Not A (U+2284)",
    text = "⊄"
  }, {
    item = "⊂",
    subText = "Subset Signs, Superset And (U+2282)",
    text = "⊂"
  }, {
    item = "⋐",
    subText = "Subset, Double (U+22D0)",
    text = "⋐"
  }, {
    item = "",
    subText = "Substitute (U+001A)",
    text = ""
  }, {
    item = "␦",
    subText = "Substitute Form Two, Symbol For (U+2426)",
    text = "␦"
  }, {
    item = "␚",
    subText = "Substitute, Symbol For (U+241A)",
    text = "␚"
  }, {
    item = "؀",
    subText = "Subtending Marks, Arabic (U+0600)",
    text = "؀"
  }, {
    item = "⩁",
    subText = "Subtraction, Bag (U+2A41)",
    text = "⩁"
  }, {
    item = "∸",
    subText = "Subtraction, Saturating (U+2238)",
    text = "∸"
  }, {
    item = "≻",
    subText = "Succeeds (U+227B)",
    text = "≻"
  }, {
    item = "⊱",
    subText = "Succeeds Under Relation (U+22B1)",
    text = "⊱"
  }, {
    item = "⪼",
    subText = "Succeeds, Double (U+2ABC)",
    text = "⪼"
  }, {
    item = "∋",
    subText = "Such That (U+220B)",
    text = "∋"
  }, {
    item = "∣",
    subText = "Such That (U+2223)",
    text = "∣"
  }, {
    item = "♠",
    subText = "Suits, Playing Card (U+2660)",
    text = "♠"
  }, {
    item = "⨦",
    subText = "Sum Or Positive Difference (U+2A26)",
    text = "⨦"
  }, {
    item = "⊕",
    subText = "Sum, Direct (U+2295)",
    text = "⊕"
  }, {
    item = "⨤",
    subText = "Sum, Positive Difference Or (U+2A24)",
    text = "⨤"
  }, {
    item = "∑",
    subText = "Summation Sign (U+2211)",
    text = "∑"
  }, {
    item = "⎲",
    subText = "Summation Sign Parts (U+23B2)",
    text = "⎲"
  }, {
    item = "⅀",
    subText = "Summation, Double-Struck N-Ary (U+2140)",
    text = "⅀"
  }, {
    item = "∑",
    subText = "Summation, N-Ary (U+2211)",
    text = "∑"
  }, {
    item = "⨊",
    subText = "Summations And Integrals (U+2A0A)",
    text = "⨊"
  }, {
    item = "☉",
    subText = "Sun (U+2609)",
    text = "☉"
  }, {
    item = "⛅",
    subText = "Sun Behind Cloud (U+26C5)",
    text = "⛅"
  }, {
    item = "☀",
    subText = "Sun With Rays, Black (U+2600)",
    text = "☀"
  }, {
    item = "☼",
    subText = "Sun With Rays, White (U+263C)",
    text = "☼"
  }, {
    item = "ᮀ",
    subText = "Sundanese (U+1B80)",
    text = "ᮀ"
  }, {
    item = "᳀",
    subText = "Sundanese Supplement (U+1CC0)",
    text = "᳀"
  }, {
    item = "ం",
    subText = "Sunna, Telugu (U+0C02)",
    text = "ం"
  }, {
    item = "⁰",
    subText = "Superscript Digits (U+2070)",
    text = "⁰"
  }, {
    item = "ᷓ",
    subText = "Superscript Letter Diacritics, Latin Medieval (U+1DD3)",
    text = "ᷓ"
  }, {
    item = "ͣ",
    subText = "Superscript Letter Diacritics, Medieval (U+0363)",
    text = "ͣ"
  }, {
    item = "ʰ",
    subText = "Superscript Modifier Letters, Latin (U+02B0)",
    text = "ʰ"
  }, {
    item = "¹",
    subText = "Superscript One (U+00B9)",
    text = "¹"
  }, {
    item = "³",
    subText = "Superscript Three (U+00B3)",
    text = "³"
  }, {
    item = "²",
    subText = "Superscript Two (U+00B2)",
    text = "²"
  }, {
    item = "⁰",
    subText = "Superscript Zero (U+2070)",
    text = "⁰"
  }, {
    item = "⁰",
    subText = "Superscripts (U+2070)",
    text = "⁰"
  }, {
    item = "⊂",
    subText = "Superset And Subset Signs (U+2282)",
    text = "⊂"
  }, {
    item = "⊃",
    subText = "Superset Of (U+2283)",
    text = "⊃"
  }, {
    item = "⊅",
    subText = "Superset Of, Not A (U+2285)",
    text = "⊅"
  }, {
    item = "⪽",
    subText = "Superset Relations, Subset And (U+2ABD)",
    text = "⪽"
  }, {
    item = "⋑",
    subText = "Superset, Double (U+22D1)",
    text = "⋑"
  }, {
    item = "⤀",
    subText = "Supplemental Arrows-B (U+2900)",
    text = "⤀"
  }, {
    item = "⨀",
    subText = "Supplemental Mathematical Operators (U+2A00)",
    text = "⨀"
  }, {
    item = "⸀",
    subText = "Supplemental Punctuation (U+2E00)",
    text = "⸀"
  }, {
    item = "𠀀",
    subText = "Supplementary Cjk Ideographs Area (U+20000)",
    text = "𠀀"
  }, {
    item = "𐀀",
    subText = "Supplementary General Scripts Area (U+10000)",
    text = "𐀀"
  }, {
    item = "󰀀",
    subText = "Supplementary Private Use Area-A (U+F0000)",
    text = "󰀀"
  }, {
    item = "􀀀",
    subText = "Supplementary Private Use Area-B (U+100000)",
    text = "􀀀"
  }, {
    item = "∯",
    subText = "Surface Integral (U+222F)",
    text = "∯"
  }, {
    item = "⤁",
    subText = "Surjection, Finite (U+2901)",
    text = "⤁"
  }, {
    item = "⤀",
    subText = "Surjection, Partial (U+2900)",
    text = "⤀"
  }, {
    item = "↠",
    subText = "Surjection, Total (U+21A0)",
    text = "↠"
  }, {
    item = "⤗",
    subText = "Surjective Injection (U+2917)",
    text = "⤗"
  }, {
    item = "⤘",
    subText = "Surjective Injection, Finite (U+2918)",
    text = "⤘"
  }, {
    item = "�",
    subText = "Surrogates Area (U+D800)",
    text = "�"
  }, {
    item = "�",
    subText = "Surrogates, High (U+D800)",
    text = "�"
  }, {
    item = "�",
    subText = "Surrogates, Low (U+DC00)",
    text = "�"
  }, {
    item = "𝠀",
    subText = "Sutton Signwriting (U+1D800)",
    text = "𝠀"
  }, {
    item = "〡",
    subText = "Suzhou Numerals (U+3021)",
    text = "〡"
  }, {
    item = "࿕",
    subText = "Svasti Signs (U+0FD5)",
    text = "࿕"
  }, {
    item = "ȿ",
    subText = "Swash Tail, Latin Small Letter S With (U+023F)",
    text = "ȿ"
  }, {
    item = "ɀ",
    subText = "Swash Tail, Latin Small Letter Z With (U+0240)",
    text = "ɀ"
  }, {
    item = "💦",
    subText = "Sweat Symbol, Splashing (U+1F4A6)",
    text = "💦"
  }, {
    item = "˟",
    subText = "Swedish Grave Accent (U+02DF)",
    text = "˟"
  }, {
    item = "⚔",
    subText = "Swords, Crossed (U+2694)",
    text = "⚔"
  }, {
    item = "⁓",
    subText = "Swung Dash (U+2053)",
    text = "⁓"
  }, {
    item = "𐠀",
    subText = "Syllabary, Cypriot (U+10800)",
    text = "𐠀"
  }, {
    item = "𐀀",
    subText = "Syllabary, Linear B (U+10000)",
    text = "𐀀"
  }, {
    item = "᙮",
    subText = "Syllabics Full Stop, Canadian (U+166E)",
    text = "᙮"
  }, {
    item = "᙭",
    subText = "Syllabics Punctuation, Canadian (U+166D)",
    text = "᙭"
  }, {
    item = "᐀",
    subText = "Syllabics, Unified Canadian Aboriginal (U+1400)",
    text = "᐀"
  }, {
    item = "Ꭰ",
    subText = "Syllables, Cherokee (U+13A0)",
    text = "Ꭰ"
  }, {
    item = "㉮",
    subText = "Syllables, Circled Korean Hangul (U+326E)",
    text = "㉮"
  }, {
    item = "ሀ",
    subText = "Syllables, Ethiopic (U+1200)",
    text = "ሀ"
  }, {
    item = "가",
    subText = "Syllables, Korean Hangul (U+AC00)",
    text = "가"
  }, {
    item = "㈎",
    subText = "Syllables, Parenthesized Korean Hangul (U+320E)",
    text = "㈎"
  }, {
    item = "ꀀ",
    subText = "Syllables, Yi (U+A000)",
    text = "ꀀ"
  }, {
    item = "ꠀ",
    subText = "Syloti Nagri (U+A800)",
    text = "ꠀ"
  }, {
    item = "￠",
    subText = "Symbol Variants, Fullwidth (U+FFE0)",
    text = "￠"
  }, {
    item = "￨",
    subText = "Symbol Variants, Halfwidth (U+FFE8)",
    text = "￨"
  }, {
    item = "🩰",
    subText = "Symbols And Pictographs Extended-A (U+1FA70)",
    text = "🩰"
  }, {
    item = "🌀",
    subText = "Symbols And Pictographs, Miscellaneous (U+1F300)",
    text = "🌀"
  }, {
    item = "🤀",
    subText = "Symbols And Pictographs, Supplemental (U+1F900)",
    text = "🤀"
  }, {
    item = "　",
    subText = "Symbols And Punctuation, Cjk (U+3000)",
    text = "　"
  }, {
    item = " ",
    subText = "Symbols Area (U+2000)",
    text = " "
  }, {
    item = "⺀",
    subText = "Symbols Area, Cjk Phonetics And (U+2E80)",
    text = "⺀"
  }, {
    item = "㏠",
    subText = "Symbols For Days, Ideographic Telegraph (U+33E0)",
    text = "㏠"
  }, {
    item = "៰",
    subText = "Symbols For Divination, Khmer Numeric (U+17F0)",
    text = "៰"
  }, {
    item = "㍘",
    subText = "Symbols For Hours, Ideographic Telegraph (U+3358)",
    text = "㍘"
  }, {
    item = "㋀",
    subText = "Symbols For Months, Ideographic Telegraph (U+32C0)",
    text = "㋀"
  }, {
    item = "🦮",
    subText = "Symbols, Accessibility (U+1F9AE)",
    text = "🦮"
  }, {
    item = "🜀",
    subText = "Symbols, Alchemical (U+1F700)",
    text = "🜀"
  }, {
    item = "⸎",
    subText = "Symbols, Ancient Greek Textual (U+2E0E)",
    text = "⸎"
  }, {
    item = "🐀",
    subText = "Symbols, Animal (U+1F400)",
    text = "🐀"
  }, {
    item = "🦀",
    subText = "Symbols, Animal (U+1F980)",
    text = "🦀"
  }, {
    item = "⌶",
    subText = "Symbols, Apl Functional (U+2336)",
    text = "⌶"
  }, {
    item = "𞸀",
    subText = "Symbols, Arabic Mathematical Alphabetic (U+1EE00)",
    text = "𞸀"
  }, {
    item = " ",
    subText = "Symbols, Area, (U+2000)",
    text = " "
  }, {
    item = "⺀",
    subText = "Symbols, Area, Cjk Phonetics And (U+2E80)",
    text = "⺀"
  }, {
    item = " ",
    subText = "Symbols, Ascii Punctuation And (U+0020)",
    text = " "
  }, {
    item = "☽",
    subText = "Symbols, Astrological (U+263D)",
    text = "☽"
  }, {
    item = "⯓",
    subText = "Symbols, Astrological (U+2BD3)",
    text = "⯓"
  }, {
    item = "📷",
    subText = "Symbols, Audio And Video (U+1F4F7)",
    text = "📷"
  }, {
    item = "᭡",
    subText = "Symbols, Balinese Musical (U+1B61)",
    text = "᭡"
  }, {
    item = "🗳",
    subText = "Symbols, Ballot (U+1F5F3)",
    text = "🗳"
  }, {
    item = "♩",
    subText = "Symbols, Basic Musical (U+2669)",
    text = "♩"
  }, {
    item = "🍵",
    subText = "Symbols, Beverage (U+1F375)",
    text = "🍵"
  }, {
    item = "𝔄",
    subText = "Symbols, Black-Letter Mathematical (U+1D504)",
    text = "𝔄"
  }, {
    item = "𝕬",
    subText = "Symbols, Bold Fraktur Mathematical (U+1D56C)",
    text = "𝕬"
  }, {
    item = "𝚨",
    subText = "Symbols, Bold Greek Mathematical (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝜜",
    subText = "Symbols, Bold Italic Greek Mathematical (U+1D71C)",
    text = "𝜜"
  }, {
    item = "𝑨",
    subText = "Symbols, Bold Italic Mathematical (U+1D468)",
    text = "𝑨"
  }, {
    item = "𝐀",
    subText = "Symbols, Bold Mathematical (U+1D400)",
    text = "𝐀"
  }, {
    item = "𝓐",
    subText = "Symbols, Bold Script Mathematical (U+1D4D0)",
    text = "𝓐"
  }, {
    item = "⧑",
    subText = "Symbols, Bowtie (U+29D1)",
    text = "⧑"
  }, {
    item = "🏔",
    subText = "Symbols, Building And Map (U+1F3D4)",
    text = "🏔"
  }, {
    item = "🏠",
    subText = "Symbols, Building And Map (U+1F3E0)",
    text = "🏠"
  }, {
    item = "𝀀",
    subText = "Symbols, Byzantine Musical (U+1D000)",
    text = "𝀀"
  }, {
    item = "🎀",
    subText = "Symbols, Celebration (U+1F380)",
    text = "🎀"
  }, {
    item = "🨀",
    subText = "Symbols, Chess (U+1FA00)",
    text = "🨀"
  }, {
    item = "♔",
    subText = "Symbols, Chess (U+2654)",
    text = "♔"
  }, {
    item = "⦵",
    subText = "Symbols, Circle (U+29B5)",
    text = "⦵"
  }, {
    item = "🕐",
    subText = "Symbols, Clock Face (U+1F550)",
    text = "🕐"
  }, {
    item = "⃐",
    subText = "Symbols, Combining Diacritical Marks For (U+20D0)",
    text = "⃐"
  }, {
    item = "💠",
    subText = "Symbols, Comic Style (U+1F4A0)",
    text = "💠"
  }, {
    item = "📝",
    subText = "Symbols, Communication (U+1F4DD)",
    text = "📝"
  }, {
    item = "🕻",
    subText = "Symbols, Communication (U+1F57B)",
    text = "🕻"
  }, {
    item = "🖥",
    subText = "Symbols, Computer Component (U+1F5A5)",
    text = "🖥"
  }, {
    item = "🗻",
    subText = "Symbols, Cultural (U+1F5FB)",
    text = "🗻"
  }, {
    item = "₠",
    subText = "Symbols, Currency (U+20A0)",
    text = "₠"
  }, {
    item = "⎾",
    subText = "Symbols, Dentistry Notation (U+23BE)",
    text = "⎾"
  }, {
    item = "⃐",
    subText = "Symbols, Diacritical Marks For (U+20D0)",
    text = "⃐"
  }, {
    item = "⚐",
    subText = "Symbols, Dictionary And Map (U+2690)",
    text = "⚐"
  }, {
    item = "𝚤",
    subText = "Symbols, Dotless Mathematical (U+1D6A4)",
    text = "𝚤"
  }, {
    item = "ⅅ",
    subText = "Symbols, Double-Struck Italic Mathematical (U+2145)",
    text = "ⅅ"
  }, {
    item = "𝔸",
    subText = "Symbols, Double-Struck Mathematical (U+1D538)",
    text = "𝔸"
  }, {
    item = "⌭",
    subText = "Symbols, Drafting (U+232D)",
    text = "⌭"
  }, {
    item = "⎍",
    subText = "Symbols, Electrotechnical (U+238D)",
    text = "⎍"
  }, {
    item = "🎠",
    subText = "Symbols, Entertainment (U+1F3A0)",
    text = "🎠"
  }, {
    item = "⧮",
    subText = "Symbols, Error Bar (U+29EE)",
    text = "⧮"
  }, {
    item = "👀",
    subText = "Symbols, Facial Parts (U+1F440)",
    text = "👀"
  }, {
    item = "👸",
    subText = "Symbols, Fairy Tale (U+1F478)",
    text = "👸"
  }, {
    item = "🍔",
    subText = "Symbols, Food (U+1F354)",
    text = "🍔"
  }, {
    item = "🥐",
    subText = "Symbols, Food (U+1F950)",
    text = "🥐"
  }, {
    item = "𝔄",
    subText = "Symbols, Fraktur Mathematical (U+1D504)",
    text = "𝔄"
  }, {
    item = "🍅",
    subText = "Symbols, Fruit And Vegetable (U+1F345)",
    text = "🍅"
  }, {
    item = "🎮",
    subText = "Symbols, Game (U+1F3AE)",
    text = "🎮"
  }, {
    item = "⚢",
    subText = "Symbols, Gender (U+26A2)",
    text = "⚢"
  }, {
    item = "⚭",
    subText = "Symbols, Genealogical (U+26AD)",
    text = "⚭"
  }, {
    item = "🙅",
    subText = "Symbols, Gesture (U+1F645)",
    text = "🙅"
  }, {
    item = "🌍",
    subText = "Symbols, Globe (U+1F30D)",
    text = "🌍"
  }, {
    item = "𝚨",
    subText = "Symbols, Greek Mathematical (U+1D6A8)",
    text = "𝚨"
  }, {
    item = "𝇐",
    subText = "Symbols, Gregorian Musical (U+1D1D0)",
    text = "𝇐"
  }, {
    item = "👆",
    subText = "Symbols, Hand (U+1F446)",
    text = "👆"
  }, {
    item = "🖎",
    subText = "Symbols, Hand (U+1F58E)",
    text = "🖎"
  }, {
    item = "🤘",
    subText = "Symbols, Hand (U+1F918)",
    text = "🤘"
  }, {
    item = "💓",
    subText = "Symbols, Heart (U+1F493)",
    text = "💓"
  }, {
    item = "ℵ",
    subText = "Symbols, Hebrew Letterlike Mathematical (U+2135)",
    text = "ℵ"
  }, {
    item = "䷀",
    subText = "Symbols, I Ching / Yijing Hexagram (U+4DC0)",
    text = "䷀"
  }, {
    item = "⚊",
    subText = "Symbols, I Ching / Yijing Monogram And Digram (U+268A)",
    text = "⚊"
  }, {
    item = "☰",
    subText = "Symbols, I Ching / Yijing Trigram (U+2630)",
    text = "☰"
  }, {
    item = "𝛢",
    subText = "Symbols, Italic Greek Mathematical (U+1D6E2)",
    text = "𝛢"
  }, {
    item = "𝐴",
    subText = "Symbols, Italic Mathematical (U+1D434)",
    text = "𝐴"
  }, {
    item = "☖",
    subText = "Symbols, Japanese Chess (U+2616)",
    text = "☖"
  }, {
    item = "⇦",
    subText = "Symbols, Keyboard (U+21E6)",
    text = "⇦"
  }, {
    item = "⌤",
    subText = "Symbols, Keyboard (U+2324)",
    text = "⌤"
  }, {
    item = "⎀",
    subText = "Symbols, Keyboard (U+2380)",
    text = "⎀"
  }, {
    item = "⎖",
    subText = "Symbols, Keyboard (U+2396)",
    text = "⎖"
  }, {
    item = "᧠",
    subText = "Symbols, Khmer (U+19E0)",
    text = "᧠"
  }, {
    item = "𝇞",
    subText = "Symbols, Kievan Musical (U+1D1DE)",
    text = "𝇞"
  }, {
    item = " ",
    subText = "Symbols, Latin-1 Punctuation And (U+00A0)",
    text = " "
  }, {
    item = "℀",
    subText = "Symbols, Letterlike (U+2100)",
    text = "℀"
  }, {
    item = "🔏",
    subText = "Symbols, Lock (U+1F50F)",
    text = "🔏"
  }, {
    item = "📤",
    subText = "Symbols, Mail (U+1F4E4)",
    text = "📤"
  }, {
    item = "⟀",
    subText = "Symbols, Mathematical (U+27C0)",
    text = "⟀"
  }, {
    item = "⦀",
    subText = "Symbols, Mathematical (U+2980)",
    text = "⦀"
  }, {
    item = "𝐀",
    subText = "Symbols, Mathematical Alphanumeric (U+1D400)",
    text = "𝐀"
  }, {
    item = "𝟎",
    subText = "Symbols, Mathematical Digits (U+1D7CE)",
    text = "𝟎"
  }, {
    item = "⏑",
    subText = "Symbols, Metrical (U+23D1)",
    text = "⏑"
  }, {
    item = "🥀",
    subText = "Symbols, Miscellaneous (U+1F940)",
    text = "🥀"
  }, {
    item = "☀",
    subText = "Symbols, Miscellaneous (U+2600)",
    text = "☀"
  }, {
    item = "💰",
    subText = "Symbols, Money (U+1F4B0)",
    text = "💰"
  }, {
    item = "𝙰",
    subText = "Symbols, Monospace Mathematical (U+1D670)",
    text = "𝙰"
  }, {
    item = "🌑",
    subText = "Symbols, Moon, Sun, And Star (U+1F311)",
    text = "🌑"
  }, {
    item = "🎵",
    subText = "Symbols, Music (U+1F3B5)",
    text = "🎵"
  }, {
    item = "𝄀",
    subText = "Symbols, Musical (U+1D100)",
    text = "𝄀"
  }, {
    item = "⸀",
    subText = "Symbols, New Testament Editorial (U+2E00)",
    text = "⸀"
  }, {
    item = "💺",
    subText = "Symbols, Office (U+1F4BA)",
    text = "💺"
  }, {
    item = "⸲",
    subText = "Symbols, Palaeotype Transliteration (U+2E32)",
    text = "⸲"
  }, {
    item = "💄",
    subText = "Symbols, Personal Care (U+1F484)",
    text = "💄"
  }, {
    item = "☿",
    subText = "Symbols, Planet (U+263F)",
    text = "☿"
  }, {
    item = "🌰",
    subText = "Symbols, Plant (U+1F330)",
    text = "🌰"
  }, {
    item = "♳",
    subText = "Symbols, Plastics Recycling (U+2673)",
    text = "♳"
  }, {
    item = "♠",
    subText = "Symbols, Playing Card (U+2660)",
    text = "♠"
  }, {
    item = "☚",
    subText = "Symbols, Pointing Hand (U+261A)",
    text = "☚"
  }, {
    item = "⬒",
    subText = "Symbols, Polygonal (U+2B12)",
    text = "⬒"
  }, {
    item = "👤",
    subText = "Symbols, Portrait And Role (U+1F464)",
    text = "👤"
  }, {
    item = "🤰",
    subText = "Symbols, Portrait And Role (U+1F930)",
    text = "🤰"
  }, {
    item = "⏻",
    subText = "Symbols, Power On/Off (U+23FB)",
    text = "⏻"
  }, {
    item = "♲",
    subText = "Symbols, Recycling (U+2672)",
    text = "♲"
  }, {
    item = "☦",
    subText = "Symbols, Religious And Political (U+2626)",
    text = "☦"
  }, {
    item = "🚹",
    subText = "Symbols, Restroom (U+1F6B9)",
    text = "🚹"
  }, {
    item = "💁",
    subText = "Symbols, Role (U+1F481)",
    text = "💁"
  }, {
    item = "𐆐",
    subText = "Symbols, Roman (U+10190)",
    text = "𐆐"
  }, {
    item = "💋",
    subText = "Symbols, Romance (U+1F48B)",
    text = "💋"
  }, {
    item = "𐹠",
    subText = "Symbols, Rumi Numeral (U+10E60)",
    text = "𐹠"
  }, {
    item = "𝝖",
    subText = "Symbols, Sans-Serif Bold Greek Mathematical (U+1D756)",
    text = "𝝖"
  }, {
    item = "𝞐",
    subText = "Symbols, Sans-Serif Bold Italic Greek Mathematical (U+1D790)",
    text = "𝞐"
  }, {
    item = "𝘼",
    subText = "Symbols, Sans-Serif Bold Italic Mathematical (U+1D63C)",
    text = "𝘼"
  }, {
    item = "𝗔",
    subText = "Symbols, Sans-Serif Bold Mathematical (U+1D5D4)",
    text = "𝗔"
  }, {
    item = "𝘈",
    subText = "Symbols, Sans-Serif Italic Mathematical (U+1D608)",
    text = "𝘈"
  }, {
    item = "𝖠",
    subText = "Symbols, Sans-Serif Mathematical (U+1D5A0)",
    text = "𝖠"
  }, {
    item = "𝒜",
    subText = "Symbols, Script Mathematical (U+1D49C)",
    text = "𝒜"
  }, {
    item = "🚩",
    subText = "Symbols, Signage And Other (U+1F6A9)",
    text = "🚩"
  }, {
    item = "🔇",
    subText = "Symbols, Speaker (U+1F507)",
    text = "🔇"
  }, {
    item = "🗨",
    subText = "Symbols, Speech And Thought Bubble (U+1F5E8)",
    text = "🗨"
  }, {
    item = "🎽",
    subText = "Symbols, Sport (U+1F3BD)",
    text = "🎽"
  }, {
    item = "🏏",
    subText = "Symbols, Sport (U+1F3CF)",
    text = "🏏"
  }, {
    item = "⧄",
    subText = "Symbols, Square (U+29C4)",
    text = "⧄"
  }, {
    item = "𝌀",
    subText = "Symbols, Tai Xuan Jing (U+1D300)",
    text = "𝌀"
  }, {
    item = "௳",
    subText = "Symbols, Tamil (U+0BF3)",
    text = "௳"
  }, {
    item = "࿄",
    subText = "Symbols, Tibetan (U+0FC4)",
    text = "࿄"
  }, {
    item = "🔥",
    subText = "Symbols, Tool (U+1F525)",
    text = "🔥"
  }, {
    item = "🚀",
    subText = "Symbols, Transport And Map (U+1F680)",
    text = "🚀"
  }, {
    item = "⧊",
    subText = "Symbols, Triangle (U+29CA)",
    text = "⧊"
  }, {
    item = "🔀",
    subText = "Symbols, User Interface (U+1F500)",
    text = "🔀"
  }, {
    item = "🔺",
    subText = "Symbols, User Interface (U+1F53A)",
    text = "🔺"
  }, {
    item = "🖿",
    subText = "Symbols, User Interface (U+1F5BF)",
    text = "🖿"
  }, {
    item = "🔠",
    subText = "Symbols, User Interface Input Status (U+1F520)",
    text = "🔠"
  }, {
    item = "🛥",
    subText = "Symbols, Vehicle (U+1F6E5)",
    text = "🛥"
  }, {
    item = "🌡",
    subText = "Symbols, Weather (U+1F321)",
    text = "🌡"
  }, {
    item = "☀",
    subText = "Symbols, Weather And Astrological (U+2600)",
    text = "☀"
  }, {
    item = "🌀",
    subText = "Symbols, Weather, Landscape, And Sky (U+1F300)",
    text = "🌀"
  }, {
    item = "䷀",
    subText = "Symbols, Yijing / I Ching Hexagram (U+4DC0)",
    text = "䷀"
  }, {
    item = "⚊",
    subText = "Symbols, Yijing / I Ching Monogram And Digram (U+268A)",
    text = "⚊"
  }, {
    item = "☰",
    subText = "Symbols, Yijing / I Ching Trigram (U+2630)",
    text = "☰"
  }, {
    item = "♈",
    subText = "Symbols, Zodiacal (U+2648)",
    text = "♈"
  }, {
    item = "⟀",
    subText = "Symbols-A, Miscellaneous Mathematical (U+27C0)",
    text = "⟀"
  }, {
    item = "⦀",
    subText = "Symbols-B, Miscellaneous Mathematical (U+2980)",
    text = "⦀"
  }, {
    item = "∆",
    subText = "Symmetric Difference (U+2206)",
    text = "∆"
  }, {
    item = "∸",
    subText = "Symmetric Difference (U+2238)",
    text = "∸"
  }, {
    item = "⊖",
    subText = "Symmetric Difference (U+2296)",
    text = "⊖"
  }, {
    item = "⌯",
    subText = "Symmetry (U+232F)",
    text = "⌯"
  }, {
    item = "",
    subText = "Synchronous Idle (U+0016)",
    text = ""
  }, {
    item = "␖",
    subText = "Synchronous Idle, Symbol For (U+2416)",
    text = "␖"
  }, {
    item = "܀",
    subText = "Syriac (U+0700)",
    text = "܀"
  }, {
    item = "♱",
    subText = "Syriac Cross, East (U+2671)",
    text = "♱"
  }, {
    item = "♰",
    subText = "Syriac Cross, West (U+2670)",
    text = "♰"
  }, {
    item = "ܐ",
    subText = "Syriac Letters (U+0710)",
    text = "ܐ"
  }, {
    item = "܀",
    subText = "Syriac Punctuation And Signs (U+0700)",
    text = "܀"
  }, {
    item = "܏",
    subText = "Syriac Sam (U+070F)",
    text = "܏"
  }, {
    item = "ࡠ",
    subText = "Syriac Supplement (U+0860)",
    text = "ࡠ"
  }, {
    item = "ť",
    subText = "T With Caron, Latin Small Letter (U+0165)",
    text = "ť"
  }, {
    item = "ţ",
    subText = "T With Cedilla, Latin Small Letter (U+0163)",
    text = "ţ"
  }, {
    item = "ṱ",
    subText = "T With Circumflex Below, Latin Small Letter (U+1E71)",
    text = "ṱ"
  }, {
    item = "ț",
    subText = "T With Comma Below, Latin Small Letter (U+021B)",
    text = "ț"
  }, {
    item = "ȶ",
    subText = "T With Curl, Latin Small Letter (U+0236)",
    text = "ȶ"
  }, {
    item = "ẗ",
    subText = "T With Diaeresis, Latin Small Letter (U+1E97)",
    text = "ẗ"
  }, {
    item = "Ⱦ",
    subText = "T With Diagonal Stroke, Latin Capital Letter (U+023E)",
    text = "Ⱦ"
  }, {
    item = "ṫ",
    subText = "T With Dot Above, Latin Small Letter (U+1E6B)",
    text = "ṫ"
  }, {
    item = "ṭ",
    subText = "T With Dot Below, Latin Small Letter (U+1E6D)",
    text = "ṭ"
  }, {
    item = "ƭ",
    subText = "T With Hook, Latin Small Letter (U+01AD)",
    text = "ƭ"
  }, {
    item = "ṯ",
    subText = "T With Line Below, Latin Small Letter (U+1E6F)",
    text = "ṯ"
  }, {
    item = "ƫ",
    subText = "T With Palatal Hook, Latin Small Letter (U+01AB)",
    text = "ƫ"
  }, {
    item = "Ʈ",
    subText = "T With Retroflex Hook, Latin Capital Letter (U+01AE)",
    text = "Ʈ"
  }, {
    item = "ʈ",
    subText = "T With Retroflex Hook, Latin Small Letter (U+0288)",
    text = "ʈ"
  }, {
    item = "ŧ",
    subText = "T With Stroke, Latin Small Letter (U+0167)",
    text = "ŧ"
  }, {
    item = "ͭ",
    subText = "T, Combining Latin Small Letter (U+036D)",
    text = "ͭ"
  }, {
    item = "ᴛ",
    subText = "T, Latin Letter Small Capital (U+1D1B)",
    text = "ᴛ"
  }, {
    item = "ʇ",
    subText = "T, Latin Small Letter Turned (U+0287)",
    text = "ʇ"
  }, {
    item = "ₜ",
    subText = "T, Latin Subscript Small Letter (U+209C)",
    text = "ₜ"
  }, {
    item = "🦖",
    subText = "T-Rex (U+1F996)",
    text = "🦖"
  }, {
    item = "\t",
    subText = "Tab (U+0009)",
    text = "\t"
  }, {
    item = "⭾",
    subText = "Tab Key, Horizontal (U+2B7E)",
    text = "⭾"
  }, {
    item = "⭿",
    subText = "Tab Key, Vertical (U+2B7F)",
    text = "⭿"
  }, {
    item = "↹",
    subText = "Tab With Shift Tab (U+21B9)",
    text = "↹"
  }, {
    item = "⭳",
    subText = "Tab, Down (U+2B73)",
    text = "⭳"
  }, {
    item = "⭰",
    subText = "Tab, Left (U+2B70)",
    text = "⭰"
  }, {
    item = "⇤",
    subText = "Tab, Leftward (U+21E4)",
    text = "⇤"
  }, {
    item = "⭲",
    subText = "Tab, Right (U+2B72)",
    text = "⭲"
  }, {
    item = "⇥",
    subText = "Tab, Rightward (U+21E5)",
    text = "⇥"
  }, {
    item = "⭱",
    subText = "Tab, Up (U+2B71)",
    text = "⭱"
  }, {
    item = "",
    subText = "Tabulation Set, Character (U+0088)",
    text = ""
  }, {
    item = "",
    subText = "Tabulation Set, Line (U+008A)",
    text = ""
  }, {
    item = "",
    subText = "Tabulation With Justification, Character (U+0089)",
    text = ""
  }, {
    item = "\t",
    subText = "Tabulation, Character (U+0009)",
    text = "\t"
  }, {
    item = "\t",
    subText = "Tabulation, Horizontal (U+0009)",
    text = "\t"
  }, {
    item = "\v",
    subText = "Tabulation, Line (U+000B)",
    text = "\v"
  }, {
    item = "␉",
    subText = "Tabulation, Symbol For Horizontal (U+2409)",
    text = "␉"
  }, {
    item = "␋",
    subText = "Tabulation, Symbol For Vertical (U+240B)",
    text = "␋"
  }, {
    item = "\v",
    subText = "Tabulation, Vertical (U+000B)",
    text = "\v"
  }, {
    item = "̞",
    subText = "Tack Below, Combining Down (U+031E)",
    text = "̞"
  }, {
    item = "̘",
    subText = "Tack Below, Combining Left (U+0318)",
    text = "̘"
  }, {
    item = "̙",
    subText = "Tack Below, Combining Right (U+0319)",
    text = "̙"
  }, {
    item = "̝",
    subText = "Tack Below, Combining Up (U+031D)",
    text = "̝"
  }, {
    item = "⊤",
    subText = "Tack, Down (U+22A4)",
    text = "⊤"
  }, {
    item = "⊣",
    subText = "Tack, Left (U+22A3)",
    text = "⊣"
  }, {
    item = "˔",
    subText = "Tack, Modifier Letter Up (U+02D4)",
    text = "˔"
  }, {
    item = "⊢",
    subText = "Tack, Right (U+22A2)",
    text = "⊢"
  }, {
    item = "⊥",
    subText = "Tack, Up (U+22A5)",
    text = "⊥"
  }, {
    item = "⊢",
    subText = "Tacks And Turnstiles (U+22A2)",
    text = "⊢"
  }, {
    item = "⟘",
    subText = "Tacks And Turnstiles (U+27D8)",
    text = "⟘"
  }, {
    item = "⫞",
    subText = "Tacks And Turnstiles (U+2ADE)",
    text = "⫞"
  }, {
    item = "ᜀ",
    subText = "Tagalog (U+1700)",
    text = "ᜀ"
  }, {
    item = "᜔",
    subText = "Tagalog Sign Virama (U+1714)",
    text = "᜔"
  }, {
    item = "ᝠ",
    subText = "Tagbanwa (U+1760)",
    text = "ᝠ"
  }, {
    item = "󠀀",
    subText = "Tags (U+E0000)",
    text = "󠀀"
  }, {
    item = "ᥐ",
    subText = "Tai Le (U+1950)",
    text = "ᥐ"
  }, {
    item = "᧐",
    subText = "Tai Lue Digits, New (U+19D0)",
    text = "᧐"
  }, {
    item = "ᦀ",
    subText = "Tai Lue, New (U+1980)",
    text = "ᦀ"
  }, {
    item = "ᨠ",
    subText = "Tai Tham (U+1A20)",
    text = "ᨠ"
  }, {
    item = "ꪀ",
    subText = "Tai Viet (U+AA80)",
    text = "ꪀ"
  }, {
    item = "𝌀",
    subText = "Tai Xuan Jing Symbols (U+1D300)",
    text = "𝌀"
  }, {
    item = "⥼",
    subText = "Tails, Fish (U+297C)",
    text = "⥼"
  }, {
    item = "◉",
    subText = "Tainome Japanese Bullet (U+25C9)",
    text = "◉"
  }, {
    item = "℞",
    subText = "Take, Prescription (U+211E)",
    text = "℞"
  }, {
    item = "𑚀",
    subText = "Takri (U+11680)",
    text = "𑚀"
  }, {
    item = "𝍲",
    subText = "Tally Marks (U+1D372)",
    text = "𝍲"
  }, {
    item = "஀",
    subText = "Tamil (U+0B80)",
    text = "஀"
  }, {
    item = "௸",
    subText = "Tamil As Above Sign (U+0BF8)",
    text = "௸"
  }, {
    item = "ஃ",
    subText = "Tamil Aytham (U+0B83)",
    text = "ஃ"
  }, {
    item = "க",
    subText = "Tamil Consonants (U+0B95)",
    text = "க"
  }, {
    item = "௷",
    subText = "Tamil Credit Sign (U+0BF7)",
    text = "௷"
  }, {
    item = "௳",
    subText = "Tamil Day Sign (U+0BF3)",
    text = "௳"
  }, {
    item = "௶",
    subText = "Tamil Debit Sign (U+0BF6)",
    text = "௶"
  }, {
    item = "ா",
    subText = "Tamil Dependent Vowel Signs (U+0BBE)",
    text = "ா"
  }, {
    item = "௧",
    subText = "Tamil Digits (U+0BE7)",
    text = "௧"
  }, {
    item = "௺",
    subText = "Tamil Enn (U+0BFA)",
    text = "௺"
  }, {
    item = "அ",
    subText = "Tamil Independent Vowels (U+0B85)",
    text = "அ"
  }, {
    item = "௴",
    subText = "Tamil Maatham (U+0BF4)",
    text = "௴"
  }, {
    item = "௸",
    subText = "Tamil Merpadi (U+0BF8)",
    text = "௸"
  }, {
    item = "௴",
    subText = "Tamil Month Sign (U+0BF4)",
    text = "௴"
  }, {
    item = "௳",
    subText = "Tamil Naal (U+0BF3)",
    text = "௳"
  }, {
    item = "௺",
    subText = "Tamil Number Sign (U+0BFA)",
    text = "௺"
  }, {
    item = "௧",
    subText = "Tamil Numbers (U+0BE7)",
    text = "௧"
  }, {
    item = "௶",
    subText = "Tamil Patru (U+0BF6)",
    text = "௶"
  }, {
    item = "௹",
    subText = "Tamil Rupai (U+0BF9)",
    text = "௹"
  }, {
    item = "௹",
    subText = "Tamil Rupee Sign (U+0BF9)",
    text = "௹"
  }, {
    item = "ஃ",
    subText = "Tamil Sign Visarga (U+0B83)",
    text = "ஃ"
  }, {
    item = "𑿀",
    subText = "Tamil Supplement (U+11FC0)",
    text = "𑿀"
  }, {
    item = "௳",
    subText = "Tamil Symbols (U+0BF3)",
    text = "௳"
  }, {
    item = "௷",
    subText = "Tamil Varavu (U+0BF7)",
    text = "௷"
  }, {
    item = "௵",
    subText = "Tamil Varudam (U+0BF5)",
    text = "௵"
  }, {
    item = "௵",
    subText = "Tamil Year Sign (U+0BF5)",
    text = "௵"
  }, {
    item = "𗀀",
    subText = "Tangut (U+17000)",
    text = "𗀀"
  }, {
    item = "𘠀",
    subText = "Tangut Components (U+18800)",
    text = "𘠀"
  }, {
    item = "✇",
    subText = "Tape Drive (U+2707)",
    text = "✇"
  }, {
    item = "⌲",
    subText = "Taper, Conical (U+2332)",
    text = "⌲"
  }, {
    item = "🞋",
    subText = "Target, Round (U+1F78B)",
    text = "🞋"
  }, {
    item = "🞖",
    subText = "Target, Square (U+1F796)",
    text = "🞖"
  }, {
    item = "ـ",
    subText = "Tatweel, Arabic (U+0640)",
    text = "ـ"
  }, {
    item = "♉",
    subText = "Taurus (U+2649)",
    text = "♉"
  }, {
    item = "⧦",
    subText = "Tautological Equivalent (U+29E6)",
    text = "⧦"
  }, {
    item = "⊨",
    subText = "Tautology (U+22A8)",
    text = "⊨"
  }, {
    item = "☕",
    subText = "Tea, Cup Of (U+2615)",
    text = "☕"
  }, {
    item = "⌀",
    subText = "Technical, Miscellaneous (U+2300)",
    text = "⌀"
  }, {
    item = "㏠",
    subText = "Telegraph Symbols For Days, Ideographic (U+33E0)",
    text = "㏠"
  }, {
    item = "㍘",
    subText = "Telegraph Symbols For Hours, Ideographic (U+3358)",
    text = "㍘"
  }, {
    item = "㋀",
    subText = "Telegraph Symbols For Months, Ideographic (U+32C0)",
    text = "㋀"
  }, {
    item = "🕽",
    subText = "Telephone Handset (U+1F57D)",
    text = "🕽"
  }, {
    item = "✆",
    subText = "Telephone Location Sign (U+2706)",
    text = "✆"
  }, {
    item = "⌕",
    subText = "Telephone Recorder (U+2315)",
    text = "⌕"
  }, {
    item = "℡",
    subText = "Telephone Sign (U+2121)",
    text = "℡"
  }, {
    item = "☎",
    subText = "Telephone, Black (U+260E)",
    text = "☎"
  }, {
    item = "☏",
    subText = "Telephone, White (U+260F)",
    text = "☏"
  }, {
    item = "ఀ",
    subText = "Telugu (U+0C00)",
    text = "ఀ"
  }, {
    item = "క",
    subText = "Telugu Consonants (U+0C15)",
    text = "క"
  }, {
    item = "ా",
    subText = "Telugu Dependent Vowel Signs (U+0C3E)",
    text = "ా"
  }, {
    item = "౦",
    subText = "Telugu Digits (U+0C66)",
    text = "౦"
  }, {
    item = "అ",
    subText = "Telugu Independent Vowels (U+0C05)",
    text = "అ"
  }, {
    item = "ం",
    subText = "Telugu Sign Anusvara (U+0C02)",
    text = "ం"
  }, {
    item = "ం",
    subText = "Telugu Sunna (U+0C02)",
    text = "ం"
  }, {
    item = "‱",
    subText = "Ten Thousand Sign, Per (U+2031)",
    text = "‱"
  }, {
    item = "₸",
    subText = "Tenge Sign (U+20B8)",
    text = "₸"
  }, {
    item = "⊗",
    subText = "Tensor Product (U+2297)",
    text = "⊗"
  }, {
    item = "⛺",
    subText = "Tent (U+26FA)",
    text = "⛺"
  }, {
    item = "⎷",
    subText = "Terminal Graphic Characters (U+23B7)",
    text = "⎷"
  }, {
    item = "▖",
    subText = "Terminal Graphic Characters (U+2596)",
    text = "▖"
  }, {
    item = "￻",
    subText = "Terminator, Interlinear Annotation (U+FFFB)",
    text = "￻"
  }, {
    item = "",
    subText = "Terminator, String (U+009C)",
    text = ""
  }, {
    item = "",
    subText = "Text, End Of (U+0003)",
    text = ""
  }, {
    item = "",
    subText = "Text, Start Of (U+0002)",
    text = ""
  }, {
    item = "␃",
    subText = "Text, Symbol For End Of (U+2403)",
    text = "␃"
  }, {
    item = "␂",
    subText = "Text, Symbol For Start Of (U+2402)",
    text = "␂"
  }, {
    item = "ހ",
    subText = "Thaana (U+0780)",
    text = "ހ"
  }, {
    item = "฀",
    subText = "Thai (U+0E00)",
    text = "฀"
  }, {
    item = "๚",
    subText = "Thai Character Angkhankhu (U+0E5A)",
    text = "๚"
  }, {
    item = "๏",
    subText = "Thai Character Fongman (U+0E4F)",
    text = "๏"
  }, {
    item = "๛",
    subText = "Thai Character Khomut (U+0E5B)",
    text = "๛"
  }, {
    item = "ํ",
    subText = "Thai Character Nikhahit (U+0E4D)",
    text = "ํ"
  }, {
    item = "์",
    subText = "Thai Character Thanthakhat (U+0E4C)",
    text = "์"
  }, {
    item = "๎",
    subText = "Thai Character Yamakkan (U+0E4E)",
    text = "๎"
  }, {
    item = "ก",
    subText = "Thai Consonants (U+0E01)",
    text = "ก"
  }, {
    item = "฿",
    subText = "Thai Currency Symbol Baht (U+0E3F)",
    text = "฿"
  }, {
    item = "๐",
    subText = "Thai Digits (U+0E50)",
    text = "๐"
  }, {
    item = "่",
    subText = "Thai Marks And Signs (U+0E48)",
    text = "่"
  }, {
    item = "ะ",
    subText = "Thai Vowels (U+0E30)",
    text = "ะ"
  }, {
    item = "์",
    subText = "Thanthakhat, Thai Character (U+0E4C)",
    text = "์"
  }, {
    item = "🎭",
    subText = "Theater Masks (U+1F3AD)",
    text = "🎭"
  }, {
    item = "∄",
    subText = "There Does Not Exist (U+2204)",
    text = "∄"
  }, {
    item = "∃",
    subText = "There Exists (U+2203)",
    text = "∃"
  }, {
    item = "∴",
    subText = "Therefore (U+2234)",
    text = "∴"
  }, {
    item = "⧧",
    subText = "Thermodynamic (U+29E7)",
    text = "⧧"
  }, {
    item = "🌡",
    subText = "Thermometer (U+1F321)",
    text = "🌡"
  }, {
    item = "ϑ",
    subText = "Theta Symbol, Greek (U+03D1)",
    text = "ϑ"
  }, {
    item = "ϑ",
    subText = "Theta, Script (U+03D1)",
    text = "ϑ"
  }, {
    item = " ",
    subText = "Thick Space (U+2004)",
    text = " "
  }, {
    item = " ",
    subText = "Thin Space (U+2009)",
    text = " "
  }, {
    item = "⃛",
    subText = "Third Derivative (U+20DB)",
    text = "⃛"
  }, {
    item = "ˇ",
    subText = "Third Tone, Mandarin Chinese (U+02C7)",
    text = "ˇ"
  }, {
    item = "⅓",
    subText = "Thirds, Fractions (U+2153)",
    text = "⅓"
  }, {
    item = "Þ",
    subText = "Thorn, Latin Capital Letter (U+00DE)",
    text = "Þ"
  }, {
    item = "þ",
    subText = "Thorn, Latin Small Letter (U+00FE)",
    text = "þ"
  }, {
    item = "٬",
    subText = "Thousands Separator, Arabic (U+066C)",
    text = "٬"
  }, {
    item = "…",
    subText = "Three Dot Leader (U+2026)",
    text = "…"
  }, {
    item = "⁖",
    subText = "Three Dot Punctuation (U+2056)",
    text = "⁖"
  }, {
    item = "⃛",
    subText = "Three Dots Above, Combining (U+20DB)",
    text = "⃛"
  }, {
    item = "¾",
    subText = "Three Quarters, Vulgar Fraction (U+00BE)",
    text = "¾"
  }, {
    item = "³",
    subText = "Three, Superscript (U+00B3)",
    text = "³"
  }, {
    item = " ",
    subText = "Three-Per-Em Space (U+2004)",
    text = " "
  }, {
    item = "👎",
    subText = "Thumbs Down Sign (U+1F44E)",
    text = "👎"
  }, {
    item = "👍",
    subText = "Thumbs Up Sign (U+1F44D)",
    text = "👍"
  }, {
    item = "⚡",
    subText = "Thunder (U+26A1)",
    text = "⚡"
  }, {
    item = "☈",
    subText = "Thunderstorm (U+2608)",
    text = "☈"
  }, {
    item = "⛈",
    subText = "Thunderstorm (U+26C8)",
    text = "⛈"
  }, {
    item = "ༀ",
    subText = "Tibetan (U+0F00)",
    text = "ༀ"
  }, {
    item = "ཾ",
    subText = "Tibetan Anusvara (U+0F7E)",
    text = "ཾ"
  }, {
    item = "༕",
    subText = "Tibetan Astrological Signs (U+0F15)",
    text = "༕"
  }, {
    item = "࿀",
    subText = "Tibetan Cantillation Signs (U+0FC0)",
    text = "࿀"
  }, {
    item = "ཀ",
    subText = "Tibetan Consonants (U+0F40)",
    text = "ཀ"
  }, {
    item = "ཱ",
    subText = "Tibetan Dependent Vowel Signs (U+0F71)",
    text = "ཱ"
  }, {
    item = "༠",
    subText = "Tibetan Digits (U+0F20)",
    text = "༠"
  }, {
    item = "༪",
    subText = "Tibetan Digits Minus Half (U+0F2A)",
    text = "༪"
  }, {
    item = "༁",
    subText = "Tibetan Head Marks (U+0F01)",
    text = "༁"
  }, {
    item = "྾",
    subText = "Tibetan Ku Ru Kha (U+0FBE)",
    text = "྾"
  }, {
    item = "྿",
    subText = "Tibetan Ku Ru Kha Bzhi Mig Can (U+0FBF)",
    text = "྿"
  }, {
    item = "༌",
    subText = "Tibetan Mark Delimiter Tsheg Bstar (U+0F0C)",
    text = "༌"
  }, {
    item = "྄",
    subText = "Tibetan Mark Halanta (U+0F84)",
    text = "྄"
  }, {
    item = "་",
    subText = "Tibetan Mark Intersyllabic Tsheg (U+0F0B)",
    text = "་"
  }, {
    item = "྅",
    subText = "Tibetan Mark Paluta (U+0F85)",
    text = "྅"
  }, {
    item = "༈",
    subText = "Tibetan Marks And Signs (U+0F08)",
    text = "༈"
  }, {
    item = "༴",
    subText = "Tibetan Marks And Signs (U+0F34)",
    text = "༴"
  }, {
    item = "ྂ",
    subText = "Tibetan Marks And Signs (U+0F82)",
    text = "ྂ"
  }, {
    item = "྾",
    subText = "Tibetan Marks And Signs (U+0FBE)",
    text = "྾"
  }, {
    item = "ཾ",
    subText = "Tibetan Sign Rjes Su Nga Ro (U+0F7E)",
    text = "ཾ"
  }, {
    item = "ཿ",
    subText = "Tibetan Sign Rnam Bcad (U+0F7F)",
    text = "ཿ"
  }, {
    item = "྄",
    subText = "Tibetan Srog Med (U+0F84)",
    text = "྄"
  }, {
    item = "ྐ",
    subText = "Tibetan Subjoined Consonants (U+0F90)",
    text = "ྐ"
  }, {
    item = "ༀ",
    subText = "Tibetan Syllable Om (U+0F00)",
    text = "ༀ"
  }, {
    item = "࿄",
    subText = "Tibetan Symbols (U+0FC4)",
    text = "࿄"
  }, {
    item = "ཿ",
    subText = "Tibetan Visarga (U+0F7F)",
    text = "ཿ"
  }, {
    item = "ཾ",
    subText = "Tibetan Vocalic Modification (U+0F7E)",
    text = "ཾ"
  }, {
    item = "͜",
    subText = "Tie Below, Ligature (U+035C)",
    text = "͜"
  }, {
    item = "⁀",
    subText = "Tie, Character (U+2040)",
    text = "⁀"
  }, {
    item = "͡",
    subText = "Tie, Ligature (U+0361)",
    text = "͡"
  }, {
    item = "ⴰ",
    subText = "Tifinagh (U+2D30)",
    text = "ⴰ"
  }, {
    item = "🐅",
    subText = "Tiger (U+1F405)",
    text = "🐅"
  }, {
    item = "🐯",
    subText = "Tiger Face (U+1F42F)",
    text = "🐯"
  }, {
    item = "~",
    subText = "Tilde (U+007E)",
    text = "~"
  }, {
    item = "͊",
    subText = "Tilde Above, Combining Not (U+034A)",
    text = "͊"
  }, {
    item = "̰",
    subText = "Tilde Below, Combining (U+0330)",
    text = "̰"
  }, {
    item = "⋍",
    subText = "Tilde Equals, Reversed (U+22CD)",
    text = "⋍"
  }, {
    item = "∻",
    subText = "Tilde Mathematical Operators (U+223B)",
    text = "∻"
  }, {
    item = "∼",
    subText = "Tilde Operator (U+223C)",
    text = "∼"
  }, {
    item = "̴",
    subText = "Tilde Overlay, Combining (U+0334)",
    text = "̴"
  }, {
    item = "∼",
    subText = "Tilde, Apl (U+223C)",
    text = "∼"
  }, {
    item = "̃",
    subText = "Tilde, Combining (U+0303)",
    text = "̃"
  }, {
    item = "͠",
    subText = "Tilde, Combining Double (U+0360)",
    text = "͠"
  }, {
    item = "̾",
    subText = "Tilde, Combining Vertical (U+033E)",
    text = "̾"
  }, {
    item = "≂",
    subText = "Tilde, Minus (U+2242)",
    text = "≂"
  }, {
    item = "≁",
    subText = "Tilde, Not (U+2241)",
    text = "≁"
  }, {
    item = "∽",
    subText = "Tilde, Reversed (U+223D)",
    text = "∽"
  }, {
    item = "˜",
    subText = "Tilde, Small (U+02DC)",
    text = "˜"
  }, {
    item = "~",
    subText = "Tilde, Spacing (U+007E)",
    text = "~"
  }, {
    item = "≋",
    subText = "Tilde, Triple (U+224B)",
    text = "≋"
  }, {
    item = "🀰",
    subText = "Tiles, Domino (U+1F030)",
    text = "🀰"
  }, {
    item = "🀀",
    subText = "Tiles, Mahjong (U+1F000)",
    text = "🀀"
  }, {
    item = "⏲",
    subText = "Timer Clock (U+23F2)",
    text = "⏲"
  }, {
    item = "⨉",
    subText = "Times Operator, N-Ary (U+2A09)",
    text = "⨉"
  }, {
    item = "⊗",
    subText = "Times, Circled (U+2297)",
    text = "⊗"
  }, {
    item = "⋇",
    subText = "Times, Division (U+22C7)",
    text = "⋇"
  }, {
    item = "⁢",
    subText = "Times, Invisible (U+2062)",
    text = "⁢"
  }, {
    item = "⊠",
    subText = "Times, Squared (U+22A0)",
    text = "⊠"
  }, {
    item = "⧾",
    subText = "Tiny (U+29FE)",
    text = "⧾"
  }, {
    item = "ੰ",
    subText = "Tippi, Gurmukhi (U+0A70)",
    text = "ੰ"
  }, {
    item = "𑒀",
    subText = "Tirhuta (U+11480)",
    text = "𑒀"
  }, {
    item = "⁊",
    subText = "Tironian Sign Et (U+204A)",
    text = "⁊"
  }, {
    item = "︮",
    subText = "Titlo Left Half, Combining Cyrillic (U+FE2E)",
    text = "︮"
  }, {
    item = "᠆",
    subText = "Todo Soft Hyphen, Mongolian (U+1806)",
    text = "᠆"
  }, {
    item = "˥",
    subText = "Tone Letters (U+02E5)",
    text = "˥"
  }, {
    item = "꜀",
    subText = "Tone Letters, Modifier (U+A700)",
    text = "꜀"
  }, {
    item = "́",
    subText = "Tone Mark, Combining Acute (U+0341)",
    text = "́"
  }, {
    item = "̀",
    subText = "Tone Mark, Combining Grave (U+0340)",
    text = "̀"
  }, {
    item = "꜀",
    subText = "Tone Marks For Chinese, Corner (U+A700)",
    text = "꜀"
  }, {
    item = "᷋",
    subText = "Tone Marks, Contour (U+1DCB)",
    text = "᷋"
  }, {
    item = "〪",
    subText = "Tone Marks, Ideographic (U+302A)",
    text = "〪"
  }, {
    item = "˙",
    subText = "Tone, Mandarin Chinese Fifth Or Neutral (U+02D9)",
    text = "˙"
  }, {
    item = "ˉ",
    subText = "Tone, Mandarin Chinese First (U+02C9)",
    text = "ˉ"
  }, {
    item = "ˋ",
    subText = "Tone, Mandarin Chinese Fourth (U+02CB)",
    text = "ˋ"
  }, {
    item = "ˊ",
    subText = "Tone, Mandarin Chinese Second (U+02CA)",
    text = "ˊ"
  }, {
    item = "ˇ",
    subText = "Tone, Mandarin Chinese Third (U+02C7)",
    text = "ˇ"
  }, {
    item = "👅",
    subText = "Tongue (U+1F445)",
    text = "👅"
  }, {
    item = "̈́",
    subText = "Tonos, Combining Greek Dialytika (U+0344)",
    text = "̈́"
  }, {
    item = "́",
    subText = "Tonos, Greek (U+0301)",
    text = "́"
  }, {
    item = "🔥",
    subText = "Tool Symbols (U+1F525)",
    text = "🔥"
  }, {
    item = "⊤",
    subText = "Top (U+22A4)",
    text = "⊤"
  }, {
    item = "⌠",
    subText = "Top Half Integral (U+2320)",
    text = "⌠"
  }, {
    item = "⛩",
    subText = "Torii (U+26E9)",
    text = "⛩"
  }, {
    item = "〔",
    subText = "Tortoise Shell Bracket, Left (U+3014)",
    text = "〔"
  }, {
    item = "〘",
    subText = "Tortoise Shell Bracket, Left White (U+3018)",
    text = "〘"
  }, {
    item = "〕",
    subText = "Tortoise Shell Bracket, Right (U+3015)",
    text = "〕"
  }, {
    item = "〙",
    subText = "Tortoise Shell Bracket, Right White (U+3019)",
    text = "〙"
  }, {
    item = "→",
    subText = "Total Function (U+2192)",
    text = "→"
  }, {
    item = "↣",
    subText = "Total Injection (U+21A3)",
    text = "↣"
  }, {
    item = "⌰",
    subText = "Total Runout (U+2330)",
    text = "⌰"
  }, {
    item = "↠",
    subText = "Total Surjection (U+21A0)",
    text = "↠"
  }, {
    item = "™",
    subText = "Trade Mark Sign (U+2122)",
    text = "™"
  }, {
    item = "®",
    subText = "Trade Mark Sign, Registered (U+00AE)",
    text = "®"
  }, {
    item = "🚥",
    subText = "Traffic Signs (U+1F6A5)",
    text = "🚥"
  }, {
    item = "ℵ",
    subText = "Transfinite Cardinal, First (U+2135)",
    text = "ℵ"
  }, {
    item = "ℸ",
    subText = "Transfinite Cardinal, Fourth (U+2138)",
    text = "ℸ"
  }, {
    item = "ℶ",
    subText = "Transfinite Cardinal, Second (U+2136)",
    text = "ℶ"
  }, {
    item = "ℷ",
    subText = "Transfinite Cardinal, Third (U+2137)",
    text = "ℷ"
  }, {
    item = "ℱ",
    subText = "Transform, Fourier (U+2131)",
    text = "ℱ"
  }, {
    item = "",
    subText = "Transmission Block, End Of (U+0017)",
    text = ""
  }, {
    item = "␗",
    subText = "Transmission Block, Symbol For End Of (U+2417)",
    text = "␗"
  }, {
    item = "⌁",
    subText = "Transmission Symbol, End Of (U+2301)",
    text = "⌁"
  }, {
    item = "",
    subText = "Transmission, End Of (U+0004)",
    text = ""
  }, {
    item = "␄",
    subText = "Transmission, Symbol For End Of (U+2404)",
    text = "␄"
  }, {
    item = "",
    subText = "Transmit State, Set (U+0093)",
    text = ""
  }, {
    item = "🚀",
    subText = "Transport And Map Symbols (U+1F680)",
    text = "🚀"
  }, {
    item = "⏢",
    subText = "Trapezium, White (U+23E2)",
    text = "⏢"
  }, {
    item = "🗑",
    subText = "Trashcan (U+1F5D1)",
    text = "🗑"
  }, {
    item = "⧊",
    subText = "Triangle Symbols (U+29CA)",
    text = "⧊"
  }, {
    item = "⃤",
    subText = "Triangle, Combining Enclosing Upward Pointing (U+20E4)",
    text = "⃤"
  }, {
    item = "⊿",
    subText = "Triangle, Right (U+22BF)",
    text = "⊿"
  }, {
    item = "▲",
    subText = "Triangles (U+25B2)",
    text = "▲"
  }, {
    item = "⏩",
    subText = "Triangles, Double (U+23E9)",
    text = "⏩"
  }, {
    item = "‣",
    subText = "Triangular Bullet (U+2023)",
    text = "‣"
  }, {
    item = "ː",
    subText = "Triangular Colon, Modifier Letter (U+02D0)",
    text = "ː"
  }, {
    item = "ˑ",
    subText = "Triangular Colon, Modifier Letter Half (U+02D1)",
    text = "ˑ"
  }, {
    item = "⁝",
    subText = "Tricolon (U+205D)",
    text = "⁝"
  }, {
    item = "☰",
    subText = "Trigram Symbols, Yijing / I Ching (U+2630)",
    text = "☰"
  }, {
    item = "△",
    subText = "Trine (U+25B3)",
    text = "△"
  }, {
    item = "∭",
    subText = "Triple Integral (U+222D)",
    text = "∭"
  }, {
    item = "⧻",
    subText = "Triple Plus (U+29FB)",
    text = "⧻"
  }, {
    item = "‴",
    subText = "Triple Prime (U+2034)",
    text = "‴"
  }, {
    item = "‷",
    subText = "Triple Prime, Reversed (U+2037)",
    text = "‷"
  }, {
    item = "≋",
    subText = "Triple Tilde (U+224B)",
    text = "≋"
  }, {
    item = "⃨",
    subText = "Triple Underdot, Combining (U+20E8)",
    text = "⃨"
  }, {
    item = "⛟",
    subText = "Truck, Black (U+26DF)",
    text = "⛟"
  }, {
    item = "⊨",
    subText = "True (U+22A8)",
    text = "⊨"
  }, {
    item = "༌",
    subText = "Tsheg Bstar, Tibetan Mark Delimiter (U+0F0C)",
    text = "༌"
  }, {
    item = "་",
    subText = "Tsheg, Tibetan Mark Intersyllabic (U+0F0B)",
    text = "་"
  }, {
    item = "₮",
    subText = "Tugrik Sign (U+20AE)",
    text = "₮"
  }, {
    item = "👳",
    subText = "Turban, Man With (U+1F473)",
    text = "👳"
  }, {
    item = "❋",
    subText = "Turbofan (U+274B)",
    text = "❋"
  }, {
    item = "🦃",
    subText = "Turkey (U+1F983)",
    text = "🦃"
  }, {
    item = "𐰀",
    subText = "Turkic, Old (U+10C00)",
    text = "𐰀"
  }, {
    item = "₺",
    subText = "Turkish Lira Sign (U+20BA)",
    text = "₺"
  }, {
    item = "ɐ",
    subText = "Turned A, Latin Small Letter (U+0250)",
    text = "ɐ"
  }, {
    item = "ᴂ",
    subText = "Turned Ae, Latin Small Letter (U+1D02)",
    text = "ᴂ"
  }, {
    item = "ɒ",
    subText = "Turned Alpha, Latin Small Letter (U+0252)",
    text = "ɒ"
  }, {
    item = "⅋",
    subText = "Turned Ampersand (U+214B)",
    text = "⅋"
  }, {
    item = "Ⅎ",
    subText = "Turned Capital F (U+2132)",
    text = "Ⅎ"
  }, {
    item = "̒",
    subText = "Turned Comma Above, Combining (U+0312)",
    text = "̒"
  }, {
    item = "“",
    subText = "Turned Comma Quotation Mark, Double (U+201C)",
    text = "“"
  }, {
    item = "‘",
    subText = "Turned Comma Quotation Mark, Single (U+2018)",
    text = "‘"
  }, {
    item = "ʻ",
    subText = "Turned Comma, Modifier Letter (U+02BB)",
    text = "ʻ"
  }, {
    item = "ƍ",
    subText = "Turned Delta, Latin Small Letter (U+018D)",
    text = "ƍ"
  }, {
    item = "Ǝ",
    subText = "Turned E, Latin Capital Letter (U+018E)",
    text = "Ǝ"
  }, {
    item = "ǝ",
    subText = "Turned E, Latin Small Letter (U+01DD)",
    text = "ǝ"
  }, {
    item = "℩",
    subText = "Turned Greek Small Letter Iota (U+2129)",
    text = "℩"
  }, {
    item = "ʮ",
    subText = "Turned H With Fishhook, Latin Small Letter (U+02AE)",
    text = "ʮ"
  }, {
    item = "ɥ",
    subText = "Turned H, Latin Small Letter (U+0265)",
    text = "ɥ"
  }, {
    item = "ᴉ",
    subText = "Turned I, Latin Small Letter (U+1D09)",
    text = "ᴉ"
  }, {
    item = "ʞ",
    subText = "Turned K, Latin Small Letter (U+029E)",
    text = "ʞ"
  }, {
    item = "ɰ",
    subText = "Turned M With Long Leg, Latin Small Letter (U+0270)",
    text = "ɰ"
  }, {
    item = "Ɯ",
    subText = "Turned M, Latin Capital Letter (U+019C)",
    text = "Ɯ"
  }, {
    item = "ɯ",
    subText = "Turned M, Latin Small Letter (U+026F)",
    text = "ɯ"
  }, {
    item = "ᴟ",
    subText = "Turned M, Latin Small Letter Sideways (U+1D1F)",
    text = "ᴟ"
  }, {
    item = "⌙",
    subText = "Turned Not Sign (U+2319)",
    text = "⌙"
  }, {
    item = "ᴔ",
    subText = "Turned Oe, Latin Small Letter (U+1D14)",
    text = "ᴔ"
  }, {
    item = "ᴈ",
    subText = "Turned Open E, Latin Small Letter (U+1D08)",
    text = "ᴈ"
  }, {
    item = "¿",
    subText = "Turned Question Mark (U+00BF)",
    text = "¿"
  }, {
    item = "ɻ",
    subText = "Turned R With Hook, Latin Small Letter (U+027B)",
    text = "ɻ"
  }, {
    item = "ɺ",
    subText = "Turned R With Long Leg, Latin Small Letter (U+027A)",
    text = "ɺ"
  }, {
    item = "ᴚ",
    subText = "Turned R, Latin Letter Small Capital (U+1D1A)",
    text = "ᴚ"
  }, {
    item = "ɹ",
    subText = "Turned R, Latin Small Letter (U+0279)",
    text = "ɹ"
  }, {
    item = "ʴ",
    subText = "Turned R, Modifier Letter Small (U+02B4)",
    text = "ʴ"
  }, {
    item = "⅁",
    subText = "Turned Sans-Serif Capital G (U+2141)",
    text = "⅁"
  }, {
    item = "⅂",
    subText = "Turned Sans-Serif Capital L (U+2142)",
    text = "⅂"
  }, {
    item = "⅄",
    subText = "Turned Sans-Serif Capital Y (U+2144)",
    text = "⅄"
  }, {
    item = "ⅎ",
    subText = "Turned Small F (U+214E)",
    text = "ⅎ"
  }, {
    item = "ʇ",
    subText = "Turned T, Latin Small Letter (U+0287)",
    text = "ʇ"
  }, {
    item = "Ʌ",
    subText = "Turned V, Latin Capital Letter (U+0245)",
    text = "Ʌ"
  }, {
    item = "ʌ",
    subText = "Turned V, Latin Small Letter (U+028C)",
    text = "ʌ"
  }, {
    item = "ʍ",
    subText = "Turned W, Latin Small Letter (U+028D)",
    text = "ʍ"
  }, {
    item = "ʎ",
    subText = "Turned Y, Latin Small Letter (U+028E)",
    text = "ʎ"
  }, {
    item = "⊢",
    subText = "Turnstile (U+22A2)",
    text = "⊢"
  }, {
    item = "⊣",
    subText = "Turnstile, Reverse (U+22A3)",
    text = "⊣"
  }, {
    item = "⊢",
    subText = "Turnstiles, Tacks And (U+22A2)",
    text = "⊢"
  }, {
    item = "⟘",
    subText = "Turnstiles, Tacks And (U+27D8)",
    text = "⟘"
  }, {
    item = "⫞",
    subText = "Turnstiles, Tacks And (U+2ADE)",
    text = "⫞"
  }, {
    item = "🐢",
    subText = "Turtle (U+1F422)",
    text = "🐢"
  }, {
    item = "⁑",
    subText = "Two Asterisks Aligned Vertically (U+2051)",
    text = "⁑"
  }, {
    item = "‥",
    subText = "Two Dot Leader (U+2025)",
    text = "‥"
  }, {
    item = "⁚",
    subText = "Two Dot Punctuation (U+205A)",
    text = "⁚"
  }, {
    item = "²",
    subText = "Two, Superscript (U+00B2)",
    text = "²"
  }, {
    item = "⸺",
    subText = "Two-Em Dash (U+2E3A)",
    text = "⸺"
  }, {
    item = "⹄",
    subText = "Typicon Punctuation (U+2E44)",
    text = "⹄"
  }, {
    item = "🤀",
    subText = "Typicon Symbols (U+1F900)",
    text = "🤀"
  }, {
    item = "🦖",
    subText = "Tyrannosaurus Rex (U+1F996)",
    text = "🦖"
  }, {
    item = "Ʉ",
    subText = "U Bar, Latin Capital Letter (U+0244)",
    text = "Ʉ"
  }, {
    item = "ʉ",
    subText = "U Bar, Latin Small Letter (U+0289)",
    text = "ʉ"
  }, {
    item = "Ú",
    subText = "U With Acute, Latin Capital Letter (U+00DA)",
    text = "Ú"
  }, {
    item = "ú",
    subText = "U With Acute, Latin Small Letter (U+00FA)",
    text = "ú"
  }, {
    item = "ŭ",
    subText = "U With Breve, Latin Small Letter (U+016D)",
    text = "ŭ"
  }, {
    item = "ǔ",
    subText = "U With Caron, Latin Small Letter (U+01D4)",
    text = "ǔ"
  }, {
    item = "ṷ",
    subText = "U With Circumflex Below, Latin Small Letter (U+1E77)",
    text = "ṷ"
  }, {
    item = "Û",
    subText = "U With Circumflex, Latin Capital Letter (U+00DB)",
    text = "Û"
  }, {
    item = "û",
    subText = "U With Circumflex, Latin Small Letter (U+00FB)",
    text = "û"
  }, {
    item = "ṳ",
    subText = "U With Diaeresis Below, Latin Small Letter (U+1E73)",
    text = "ṳ"
  }, {
    item = "Ü",
    subText = "U With Diaeresis, Latin Capital Letter (U+00DC)",
    text = "Ü"
  }, {
    item = "ü",
    subText = "U With Diaeresis, Latin Small Letter (U+00FC)",
    text = "ü"
  }, {
    item = "ụ",
    subText = "U With Dot Below, Latin Small Letter (U+1EE5)",
    text = "ụ"
  }, {
    item = "ű",
    subText = "U With Double Acute, Latin Small Letter (U+0171)",
    text = "ű"
  }, {
    item = "ȕ",
    subText = "U With Double Grave, Latin Small Letter (U+0215)",
    text = "ȕ"
  }, {
    item = "Ù",
    subText = "U With Grave, Latin Capital Letter (U+00D9)",
    text = "Ù"
  }, {
    item = "ù",
    subText = "U With Grave, Latin Small Letter (U+00F9)",
    text = "ù"
  }, {
    item = "ủ",
    subText = "U With Hook Above, Latin Small Letter (U+1EE7)",
    text = "ủ"
  }, {
    item = "ư",
    subText = "U With Horn, Latin Small Letter (U+01B0)",
    text = "ư"
  }, {
    item = "ȗ",
    subText = "U With Inverted Breve, Latin Small Letter (U+0217)",
    text = "ȗ"
  }, {
    item = "ū",
    subText = "U With Macron, Latin Small Letter (U+016B)",
    text = "ū"
  }, {
    item = "ų",
    subText = "U With Ogonek, Latin Small Letter (U+0173)",
    text = "ų"
  }, {
    item = "ů",
    subText = "U With Ring Above, Latin Small Letter (U+016F)",
    text = "ů"
  }, {
    item = "ṵ",
    subText = "U With Tilde Below, Latin Small Letter (U+1E75)",
    text = "ṵ"
  }, {
    item = "ũ",
    subText = "U With Tilde, Latin Small Letter (U+0169)",
    text = "ũ"
  }, {
    item = "ͧ",
    subText = "U, Combining Latin Small Letter (U+0367)",
    text = "ͧ"
  }, {
    item = "ᴜ",
    subText = "U, Latin Letter Small Capital (U+1D1C)",
    text = "ᴜ"
  }, {
    item = "ᴝ",
    subText = "U, Latin Small Letter Sideways (U+1D1D)",
    text = "ᴝ"
  }, {
    item = "ᴞ",
    subText = "U, Latin Small Letter Sideways Diaeresized (U+1D1E)",
    text = "ᴞ"
  }, {
    item = "ᵤ",
    subText = "U, Latin Subscript Small Letter (U+1D64)",
    text = "ᵤ"
  }, {
    item = "𐎀",
    subText = "Ugaritic (U+10380)",
    text = "𐎀"
  }, {
    item = "₴",
    subText = "Ukrainian Currency (U+20B4)",
    text = "₴"
  }, {
    item = "☂",
    subText = "Umbrella (U+2602)",
    text = "☂"
  }, {
    item = "⛱",
    subText = "Umbrella On Ground (U+26F1)",
    text = "⛱"
  }, {
    item = "☔",
    subText = "Umbrella With Rain Drops (U+2614)",
    text = "☔"
  }, {
    item = "̈",
    subText = "Umlaut (U+0308)",
    text = "̈"
  }, {
    item = "˭",
    subText = "Unaspirated, Modifier Letter (U+02ED)",
    text = "˭"
  }, {
    item = "⯑",
    subText = "Uncertainty Sign (U+2BD1)",
    text = "⯑"
  }, {
    item = "⃨",
    subText = "Underdot, Combining Triple (U+20E8)",
    text = "⃨"
  }, {
    item = "̲",
    subText = "Underline (U+0332)",
    text = "̲"
  }, {
    item = "⎁",
    subText = "Underline Symbol, Continuous (U+2381)",
    text = "⎁"
  }, {
    item = "⎂",
    subText = "Underline Symbol, Discontinuous (U+2382)",
    text = "⎂"
  }, {
    item = "̳",
    subText = "Underline, Double (U+0333)",
    text = "̳"
  }, {
    item = "̲",
    subText = "Underscore (U+0332)",
    text = "̲"
  }, {
    item = "̳",
    subText = "Underscore, Double (U+0333)",
    text = "̳"
  }, {
    item = "_",
    subText = "Underscore, Spacing (U+005F)",
    text = "_"
  }, {
    item = "‗",
    subText = "Underscore, Spacing Double (U+2017)",
    text = "‗"
  }, {
    item = "﹉",
    subText = "Underscores, Overscores And (U+FE49)",
    text = "﹉"
  }, {
    item = "‿",
    subText = "Undertie (U+203F)",
    text = "‿"
  }, {
    item = "⁔",
    subText = "Undertie, Inverted (U+2054)",
    text = "⁔"
  }, {
    item = "⎌",
    subText = "Undo Symbol (U+238C)",
    text = "⎌"
  }, {
    item = "🦄",
    subText = "Unicorn Face (U+1F984)",
    text = "🦄"
  }, {
    item = "᐀",
    subText = "Unified Canadian Aboriginal Syllabics (U+1400)",
    text = "᐀"
  }, {
    item = "ᢰ",
    subText = "Unified Canadian Aboriginal Syllabics Extended (U+18B0)",
    text = "ᢰ"
  }, {
    item = "㐀",
    subText = "Unified Ideographs Extension A, Cjk (U+3400)",
    text = "㐀"
  }, {
    item = "𠀀",
    subText = "Unified Ideographs Extension B, Cjk (U+20000)",
    text = "𠀀"
  }, {
    item = "𪜀",
    subText = "Unified Ideographs Extension C, Cjk (U+2A700)",
    text = "𪜀"
  }, {
    item = "𫝀",
    subText = "Unified Ideographs Extension D, Cjk (U+2B740)",
    text = "𫝀"
  }, {
    item = "一",
    subText = "Unified Ideographs, Cjk (U+4E00)",
    text = "一"
  }, {
    item = "∪",
    subText = "Union (U+222A)",
    text = "∪"
  }, {
    item = "⋓",
    subText = "Union, Double (U+22D3)",
    text = "⋓"
  }, {
    item = "⋃",
    subText = "Union, Generalized (U+22C3)",
    text = "⋃"
  }, {
    item = "⊎",
    subText = "Union, Multiset (U+228E)",
    text = "⊎"
  }, {
    item = "⋃",
    subText = "Union, N-Ary (U+22C3)",
    text = "⋃"
  }, {
    item = "⩀",
    subText = "Unions, Intersections And (U+2A40)",
    text = "⩀"
  }, {
    item = "℩",
    subText = "Unique Element (U+2129)",
    text = "℩"
  }, {
    item = "",
    subText = "Unit Separator (U+001F)",
    text = ""
  }, {
    item = "␟",
    subText = "Unit Separator, Symbol For (U+241F)",
    text = "␟"
  }, {
    item = "∀",
    subText = "Universal Quantifier (U+2200)",
    text = "∀"
  }, {
    item = "♲",
    subText = "Universal Recycling Symbol (U+2672)",
    text = "♲"
  }, {
    item = "⚯",
    subText = "Unmarried Partnership Symbol (U+26AF)",
    text = "⚯"
  }, {
    item = "⌃",
    subText = "Up Arrowhead (U+2303)",
    text = "⌃"
  }, {
    item = "☝",
    subText = "Up Pointing Index, White (U+261D)",
    text = "☝"
  }, {
    item = "⋰",
    subText = "Up Right Diagonal Ellipsis (U+22F0)",
    text = "⋰"
  }, {
    item = "⊥",
    subText = "Up Tack (U+22A5)",
    text = "⊥"
  }, {
    item = "̝",
    subText = "Up Tack Below, Combining (U+031D)",
    text = "̝"
  }, {
    item = "˔",
    subText = "Up Tack, Modifier Letter (U+02D4)",
    text = "˔"
  }, {
    item = "⁐",
    subText = "Up, Close (U+2050)",
    text = "⁐"
  }, {
    item = "↟",
    subText = "Up, Fast Cursor (U+219F)",
    text = "↟"
  }, {
    item = "⇞",
    subText = "Up, Page (U+21DE)",
    text = "⇞"
  }, {
    item = "˯",
    subText = "Upa Modifiers (U+02EF)",
    text = "˯"
  }, {
    item = "✁",
    subText = "Upper Blade Scissors (U+2701)",
    text = "✁"
  }, {
    item = "⨛",
    subText = "Upper Integral (U+2A1B)",
    text = "⨛"
  }, {
    item = "✐",
    subText = "Upper Right Pencil (U+2710)",
    text = "✐"
  }, {
    item = "A",
    subText = "Uppercase Alphabet, Latin (U+0041)",
    text = "A"
  }, {
    item = "Ʊ",
    subText = "Upsilon, Latin Capital Letter (U+01B1)",
    text = "Ʊ"
  }, {
    item = "ʊ",
    subText = "Upsilon, Latin Small Letter (U+028A)",
    text = "ʊ"
  }, {
    item = "⌈",
    subText = "Upstile, Apl (U+2308)",
    text = "⌈"
  }, {
    item = "⃤",
    subText = "Upward Pointing Triangle, Combining Enclosing (U+20E4)",
    text = "⃤"
  }, {
    item = "↑",
    subText = "Upwards Arrow (U+2191)",
    text = "↑"
  }, {
    item = "͎",
    subText = "Upwards Arrow Below, Combining (U+034E)",
    text = "͎"
  }, {
    item = "͐",
    subText = "Uralic Phonetic Alphabet, Diacritics For (U+0350)",
    text = "͐"
  }, {
    item = "♅",
    subText = "Uranus (U+2645)",
    text = "♅"
  }, {
    item = "⛢",
    subText = "Uranus (U+26E2)",
    text = "⛢"
  }, {
    item = "※",
    subText = "Urdu Paragraph Separator (U+203B)",
    text = "※"
  }, {
    item = "⚱",
    subText = "Urn, Funeral (U+26B1)",
    text = "⚱"
  }, {
    item = "🔠",
    subText = "User Interface Input Status Symbols (U+1F520)",
    text = "🔠"
  }, {
    item = "🔀",
    subText = "User Interface Symbols (U+1F500)",
    text = "🔀"
  }, {
    item = "🔺",
    subText = "User Interface Symbols (U+1F53A)",
    text = "🔺"
  }, {
    item = "🖿",
    subText = "User Interface Symbols (U+1F5BF)",
    text = "🖿"
  }, {
    item = "̌",
    subText = "V Above (U+030C)",
    text = "̌"
  }, {
    item = "ṿ",
    subText = "V With Dot Below, Latin Small Letter (U+1E7F)",
    text = "ṿ"
  }, {
    item = "Ʋ",
    subText = "V With Hook, Latin Capital Letter (U+01B2)",
    text = "Ʋ"
  }, {
    item = "ʋ",
    subText = "V With Hook, Latin Small Letter (U+028B)",
    text = "ʋ"
  }, {
    item = "ṽ",
    subText = "V With Tilde, Latin Small Letter (U+1E7D)",
    text = "ṽ"
  }, {
    item = "ͮ",
    subText = "V, Combining Latin Small Letter (U+036E)",
    text = "ͮ"
  }, {
    item = "Ʋ",
    subText = "V, Latin Capital Letter Script (U+01B2)",
    text = "Ʋ"
  }, {
    item = "Ʌ",
    subText = "V, Latin Capital Letter Turned (U+0245)",
    text = "Ʌ"
  }, {
    item = "ᴠ",
    subText = "V, Latin Letter Small Capital (U+1D20)",
    text = "ᴠ"
  }, {
    item = "ʋ",
    subText = "V, Latin Small Letter Script (U+028B)",
    text = "ʋ"
  }, {
    item = "ʌ",
    subText = "V, Latin Small Letter Turned (U+028C)",
    text = "ʌ"
  }, {
    item = "ᵥ",
    subText = "V, Latin Subscript Small Letter (U+1D65)",
    text = "ᵥ"
  }, {
    item = "ꔀ",
    subText = "Vai (U+A500)",
    text = "ꔀ"
  }, {
    item = "♥",
    subText = "Valentine (U+2665)",
    text = "♥"
  }, {
    item = "⊨",
    subText = "Valid (U+22A8)",
    text = "⊨"
  }, {
    item = "🧛",
    subText = "Vampire (U+1F9DB)",
    text = "🧛"
  }, {
    item = "௷",
    subText = "Varavu, Tamil (U+0BF7)",
    text = "௷"
  }, {
    item = "̀",
    subText = "Varia, Greek (U+0300)",
    text = "̀"
  }, {
    item = "〾",
    subText = "Variation Indicator, Ideographic (U+303E)",
    text = "〾"
  }, {
    item = "᠋",
    subText = "Variation Selector One, Mongolian Free (U+180B)",
    text = "᠋"
  }, {
    item = "᠍",
    subText = "Variation Selector Three, Mongolian Free (U+180D)",
    text = "᠍"
  }, {
    item = "᠌",
    subText = "Variation Selector Two, Mongolian Free (U+180C)",
    text = "᠌"
  }, {
    item = "︀",
    subText = "Variation Selector-1 (U+FE00)",
    text = "︀"
  }, {
    item = "︀",
    subText = "Variation Selectors (U+FE00)",
    text = "︀"
  }, {
    item = "󠄀",
    subText = "Variation Selectors Supplement (U+E0100)",
    text = "󠄀"
  }, {
    item = "∼",
    subText = "Varies With (U+223C)",
    text = "∼"
  }, {
    item = "௵",
    subText = "Varudam, Tamil (U+0BF5)",
    text = "௵"
  }, {
    item = "⃑",
    subText = "Vector (U+20D1)",
    text = "⃑"
  }, {
    item = "⃗",
    subText = "Vector (U+20D7)",
    text = "⃗"
  }, {
    item = "⨯",
    subText = "Vector Or Cross Product (U+2A2F)",
    text = "⨯"
  }, {
    item = "⊕",
    subText = "Vector Pointing Into Page (U+2295)",
    text = "⊕"
  }, {
    item = "⊗",
    subText = "Vector Pointing Into Page (U+2297)",
    text = "⊗"
  }, {
    item = "⊙",
    subText = "Vector Pointing Out Of Page (U+2299)",
    text = "⊙"
  }, {
    item = "᳐",
    subText = "Vedic Extensions (U+1CD0)",
    text = "᳐"
  }, {
    item = "ೱ",
    subText = "Vedic Signs (U+0CF1)",
    text = "ೱ"
  }, {
    item = "॑",
    subText = "Vedic Tone Marks (U+0951)",
    text = "॑"
  }, {
    item = "∨",
    subText = "Vee (U+2228)",
    text = "∨"
  }, {
    item = "🍅",
    subText = "Vegetable Symbols, Fruit And (U+1F345)",
    text = "🍅"
  }, {
    item = "🛥",
    subText = "Vehicle Symbols (U+1F6E5)",
    text = "🛥"
  }, {
    item = "🚀",
    subText = "Vehicles (U+1F680)",
    text = "🚀"
  }, {
    item = "♀",
    subText = "Venus (U+2640)",
    text = "♀"
  }, {
    item = "℣",
    subText = "Versicle (U+2123)",
    text = "℣"
  }, {
    item = "|",
    subText = "Vertical Bar (U+007C)",
    text = "|"
  }, {
    item = "⦀",
    subText = "Vertical Bar Delimiter, Triple (U+2980)",
    text = "⦀"
  }, {
    item = "❘",
    subText = "Vertical Bar Dingbats (U+2758)",
    text = "❘"
  }, {
    item = "¦",
    subText = "Vertical Bar, Broken (U+00A6)",
    text = "¦"
  }, {
    item = "⫿",
    subText = "Vertical Bar, N-Ary White (U+2AFF)",
    text = "⫿"
  }, {
    item = "⫾",
    subText = "Vertical Bar, White (U+2AFE)",
    text = "⫾"
  }, {
    item = "⧖",
    subText = "Vertical Bowtie (U+29D6)",
    text = "⧖"
  }, {
    item = "⋮",
    subText = "Vertical Ellipsis (U+22EE)",
    text = "⋮"
  }, {
    item = "︰",
    subText = "Vertical Form Variants (U+FE30)",
    text = "︰"
  }, {
    item = "⁞",
    subText = "Vertical Four Dots (U+205E)",
    text = "⁞"
  }, {
    item = "〻",
    subText = "Vertical Ideographic Iteration Mark (U+303B)",
    text = "〻"
  }, {
    item = "|",
    subText = "Vertical Line (U+007C)",
    text = "|"
  }, {
    item = "̍",
    subText = "Vertical Line Above, Combining (U+030D)",
    text = "̍"
  }, {
    item = "̎",
    subText = "Vertical Line Above, Combining Double (U+030E)",
    text = "̎"
  }, {
    item = "̩",
    subText = "Vertical Line Below, Combining (U+0329)",
    text = "̩"
  }, {
    item = "͈",
    subText = "Vertical Line Below, Combining Double (U+0348)",
    text = "͈"
  }, {
    item = "⫮",
    subText = "Vertical Line Operators (U+2AEE)",
    text = "⫮"
  }, {
    item = "⃒",
    subText = "Vertical Line Overlay, Combining Long (U+20D2)",
    text = "⃒"
  }, {
    item = "⃓",
    subText = "Vertical Line Overlay, Combining Short (U+20D3)",
    text = "⃓"
  }, {
    item = "⍿",
    subText = "Vertical Line With Middle Dot (U+237F)",
    text = "⍿"
  }, {
    item = "‖",
    subText = "Vertical Line, Double (U+2016)",
    text = "‖"
  }, {
    item = "ˈ",
    subText = "Vertical Line, Modifier Letter (U+02C8)",
    text = "ˈ"
  }, {
    item = "ˌ",
    subText = "Vertical Line, Modifier Letter Low (U+02CC)",
    text = "ˌ"
  }, {
    item = "∣",
    subText = "Vertical Lines (U+2223)",
    text = "∣"
  }, {
    item = "⃦",
    subText = "Vertical Stroke Overlay, Combining Double (U+20E6)",
    text = "⃦"
  }, {
    item = "\v",
    subText = "Vertical Tabulation (U+000B)",
    text = "\v"
  }, {
    item = "␋",
    subText = "Vertical Tabulation, Symbol For (U+240B)",
    text = "␋"
  }, {
    item = "⏜",
    subText = "Vertical Text, Bracket Variants For (U+23DC)",
    text = "⏜"
  }, {
    item = "⁇",
    subText = "Vertical Text, Double Punctuation For (U+2047)",
    text = "⁇"
  }, {
    item = "̾",
    subText = "Vertical Tilde, Combining (U+033E)",
    text = "̾"
  }, {
    item = "︐",
    subText = "Vertical Variants, Glyphs For (U+FE10)",
    text = "︐"
  }, {
    item = "︰",
    subText = "Vertical Variants, Glyphs For (U+FE30)",
    text = "︰"
  }, {
    item = "։",
    subText = "Vertsaket, Armenian (U+0589)",
    text = "։"
  }, {
    item = "⋙",
    subText = "Very Much Greater-Than (U+22D9)",
    text = "⋙"
  }, {
    item = "⋘",
    subText = "Very Much Less-Than (U+22D8)",
    text = "⋘"
  }, {
    item = "✌",
    subText = "Victory Hand (U+270C)",
    text = "✌"
  }, {
    item = "📷",
    subText = "Video Symbols, Audio And (U+1F4F7)",
    text = "📷"
  }, {
    item = "₫",
    subText = "Vietnamese Currency (U+20AB)",
    text = "₫"
  }, {
    item = "⌗",
    subText = "Viewdata Square (U+2317)",
    text = "⌗"
  }, {
    item = "̅",
    subText = "Vinculum (U+0305)",
    text = "̅"
  }, {
    item = "॥",
    subText = "Viram, Devanagari Deergh (U+0965)",
    text = "॥"
  }, {
    item = "।",
    subText = "Viram, Devanagari Purna (U+0964)",
    text = "।"
  }, {
    item = "्",
    subText = "Virama, Devanagari Sign (U+094D)",
    text = "्"
  }, {
    item = "്",
    subText = "Virama, Malayalam Sign (U+0D4D)",
    text = "്"
  }, {
    item = "္",
    subText = "Virama, Myanmar Sign (U+1039)",
    text = "္"
  }, {
    item = "්",
    subText = "Virama, Sinhala (U+0DCA)",
    text = "්"
  }, {
    item = "᜔",
    subText = "Virama, Tagalog Sign (U+1714)",
    text = "᜔"
  }, {
    item = "♍",
    subText = "Virgo (U+264D)",
    text = "♍"
  }, {
    item = "/",
    subText = "Virgule (U+002F)",
    text = "/"
  }, {
    item = "ः",
    subText = "Visarga, Devanagari Sign (U+0903)",
    text = "ः"
  }, {
    item = "ះ",
    subText = "Visarga, Khmer (U+17C7)",
    text = "ះ"
  }, {
    item = "ஃ",
    subText = "Visarga, Tamil Sign (U+0B83)",
    text = "ஃ"
  }, {
    item = "ཿ",
    subText = "Visarga, Tibetan (U+0F7F)",
    text = "ཿ"
  }, {
    item = "ʕ",
    subText = "Voiced Fricative, Latin Letter Pharyngeal (U+0295)",
    text = "ʕ"
  }, {
    item = "ゞ",
    subText = "Voiced Iteration Mark, Hiragana (U+309E)",
    text = "ゞ"
  }, {
    item = "ヾ",
    subText = "Voiced Iteration Mark, Katakana (U+30FE)",
    text = "ヾ"
  }, {
    item = "ˬ",
    subText = "Voicing, Modifier Letter (U+02EC)",
    text = "ˬ"
  }, {
    item = "🌋",
    subText = "Volcano (U+1F30B)",
    text = "🌋"
  }, {
    item = "⚡",
    subText = "Voltage Sign, High (U+26A1)",
    text = "⚡"
  }, {
    item = "∰",
    subText = "Volume Integral (U+2230)",
    text = "∰"
  }, {
    item = "̆",
    subText = "Vrachy, Greek (U+0306)",
    text = "̆"
  }, {
    item = "︀",
    subText = "Vs1 (U+FE00)",
    text = "︀"
  }, {
    item = "󠄀",
    subText = "Vs17 (U+E0100)",
    text = "󠄀"
  }, {
    item = "\v",
    subText = "Vt (U+000B)",
    text = "\v"
  }, {
    item = "½",
    subText = "Vulgar Fraction One Half (U+00BD)",
    text = "½"
  }, {
    item = "⅑",
    subText = "Vulgar Fraction One Ninth (U+2151)",
    text = "⅑"
  }, {
    item = "¼",
    subText = "Vulgar Fraction One Quarter (U+00BC)",
    text = "¼"
  }, {
    item = "⅐",
    subText = "Vulgar Fraction One Seventh (U+2150)",
    text = "⅐"
  }, {
    item = "⅒",
    subText = "Vulgar Fraction One Tenth (U+2152)",
    text = "⅒"
  }, {
    item = "¾",
    subText = "Vulgar Fraction Three Quarters (U+00BE)",
    text = "¾"
  }, {
    item = "⅓",
    subText = "Vulgar Fractions (U+2153)",
    text = "⅓"
  }, {
    item = "ẃ",
    subText = "W With Acute, Latin Small Letter (U+1E83)",
    text = "ẃ"
  }, {
    item = "ŵ",
    subText = "W With Circumflex, Latin Small Letter (U+0175)",
    text = "ŵ"
  }, {
    item = "ẅ",
    subText = "W With Diaeresis, Latin Small Letter (U+1E85)",
    text = "ẅ"
  }, {
    item = "ẇ",
    subText = "W With Dot Above, Latin Small Letter (U+1E87)",
    text = "ẇ"
  }, {
    item = "ẉ",
    subText = "W With Dot Below, Latin Small Letter (U+1E89)",
    text = "ẉ"
  }, {
    item = "ẁ",
    subText = "W With Grave, Latin Small Letter (U+1E81)",
    text = "ẁ"
  }, {
    item = "ẘ",
    subText = "W With Ring Above, Latin Small Letter (U+1E98)",
    text = "ẘ"
  }, {
    item = "ᴡ",
    subText = "W, Latin Letter Small Capital (U+1D21)",
    text = "ᴡ"
  }, {
    item = "ʍ",
    subText = "W, Latin Small Letter Turned (U+028D)",
    text = "ʍ"
  }, {
    item = "ʷ",
    subText = "W, Modifier Letter Small (U+02B7)",
    text = "ʷ"
  }, {
    item = "",
    subText = "Waiting, Message (U+0095)",
    text = ""
  }, {
    item = "𞋀",
    subText = "Wancho (U+1E2C0)",
    text = "𞋀"
  }, {
    item = "𑢠",
    subText = "Warang Citi (U+118A0)",
    text = "𑢠"
  }, {
    item = "⚠",
    subText = "Warning Sign (U+26A0)",
    text = "⚠"
  }, {
    item = "☠",
    subText = "Warning Signs (U+2620)",
    text = "☠"
  }, {
    item = "🗑",
    subText = "Wastebasket (U+1F5D1)",
    text = "🗑"
  }, {
    item = "⌚",
    subText = "Watch (U+231A)",
    text = "⌚"
  }, {
    item = "🐃",
    subText = "Water Buffalo (U+1F403)",
    text = "🐃"
  }, {
    item = "〜",
    subText = "Wave Dash (U+301C)",
    text = "〜"
  }, {
    item = "∿",
    subText = "Wave, Sine (U+223F)",
    text = "∿"
  }, {
    item = "🌊",
    subText = "Wave, Water (U+1F30A)",
    text = "🌊"
  }, {
    item = "👋",
    subText = "Waving Hand Sign (U+1F44B)",
    text = "👋"
  }, {
    item = "〰",
    subText = "Wavy Dash (U+3030)",
    text = "〰"
  }, {
    item = "⌇",
    subText = "Wavy Line (U+2307)",
    text = "⌇"
  }, {
    item = "﹏",
    subText = "Wavy Low Line (U+FE4F)",
    text = "﹏"
  }, {
    item = "﹋",
    subText = "Wavy Overline (U+FE4B)",
    text = "﹋"
  }, {
    item = "﹌",
    subText = "Wavy Overline, Double (U+FE4C)",
    text = "﹌"
  }, {
    item = "☀",
    subText = "Weather And Astrological Symbols (U+2600)",
    text = "☀"
  }, {
    item = "🌡",
    subText = "Weather Symbols (U+1F321)",
    text = "🌡"
  }, {
    item = "☀",
    subText = "Weather, Clear (U+2600)",
    text = "☀"
  }, {
    item = "☁",
    subText = "Weather, Cloudy (U+2601)",
    text = "☁"
  }, {
    item = "🌀",
    subText = "Weather, Landscape, And Sky Symbols (U+1F300)",
    text = "🌀"
  }, {
    item = "☂",
    subText = "Weather, Rainy (U+2602)",
    text = "☂"
  }, {
    item = "☔",
    subText = "Weather, Showery (U+2614)",
    text = "☔"
  }, {
    item = "☃",
    subText = "Weather, Snowy (U+2603)",
    text = "☃"
  }, {
    item = "ʌ",
    subText = "Wedge (U+028C)",
    text = "ʌ"
  }, {
    item = "∧",
    subText = "Wedge (U+2227)",
    text = "∧"
  }, {
    item = "℘",
    subText = "Weierstrass Elliptic Function (U+2118)",
    text = "℘"
  }, {
    item = "♰",
    subText = "West Syriac Cross (U+2670)",
    text = "♰"
  }, {
    item = "🐋",
    subText = "Whale (U+1F40B)",
    text = "🐋"
  }, {
    item = "🐳",
    subText = "Whale, Spouting (U+1F433)",
    text = "🐳"
  }, {
    item = "☸",
    subText = "Wheel Of Dharma (U+2638)",
    text = "☸"
  }, {
    item = "♿",
    subText = "Wheelchair Symbol (U+267F)",
    text = "♿"
  }, {
    item = "◦",
    subText = "White Bullet (U+25E6)",
    text = "◦"
  }, {
    item = "○",
    subText = "White Circle (U+25CB)",
    text = "○"
  }, {
    item = "⚪",
    subText = "White Circle, Medium (U+26AA)",
    text = "⚪"
  }, {
    item = "⚬",
    subText = "White Circle, Medium Small (U+26AC)",
    text = "⚬"
  }, {
    item = "❍",
    subText = "White Circle, Shadowed (U+274D)",
    text = "❍"
  }, {
    item = "『",
    subText = "White Corner Bracket, Left (U+300E)",
    text = "『"
  }, {
    item = "』",
    subText = "White Corner Bracket, Right (U+300F)",
    text = "』"
  }, {
    item = "⦃",
    subText = "White Curly Bracket, Left (U+2983)",
    text = "⦃"
  }, {
    item = "⦄",
    subText = "White Curly Bracket, Right (U+2984)",
    text = "⦄"
  }, {
    item = "☟",
    subText = "White Down Pointing Index (U+261F)",
    text = "☟"
  }, {
    item = "⚐",
    subText = "White Flag (U+2690)",
    text = "⚐"
  }, {
    item = "⧖",
    subText = "White Framus (U+29D6)",
    text = "⧖"
  }, {
    item = "☹",
    subText = "White Frowning Face (U+2639)",
    text = "☹"
  }, {
    item = "☜",
    subText = "White Left Pointing Index (U+261C)",
    text = "☜"
  }, {
    item = "〖",
    subText = "White Lenticular Bracket, Left (U+3016)",
    text = "〖"
  }, {
    item = "〗",
    subText = "White Lenticular Bracket, Right (U+3017)",
    text = "〗"
  }, {
    item = "✑",
    subText = "White Nib (U+2711)",
    text = "✑"
  }, {
    item = "⓫",
    subText = "White On Black Circled Numbers (U+24EB)",
    text = "⓫"
  }, {
    item = "⦅",
    subText = "White Parenthesis, Left (U+2985)",
    text = "⦅"
  }, {
    item = "⦆",
    subText = "White Parenthesis, Right (U+2986)",
    text = "⦆"
  }, {
    item = "☞",
    subText = "White Right Pointing Index (U+261E)",
    text = "☞"
  }, {
    item = "✄",
    subText = "White Scissors (U+2704)",
    text = "✄"
  }, {
    item = "﹆",
    subText = "White Sesame Dot (U+FE46)",
    text = "﹆"
  }, {
    item = "☖",
    subText = "White Shogi Piece (U+2616)",
    text = "☖"
  }, {
    item = "☺",
    subText = "White Smiling Face (U+263A)",
    text = "☺"
  }, {
    item = "〚",
    subText = "White Square Bracket, Left (U+301A)",
    text = "〚"
  }, {
    item = "〛",
    subText = "White Square Bracket, Right (U+301B)",
    text = "〛"
  }, {
    item = "☆",
    subText = "White Star (U+2606)",
    text = "☆"
  }, {
    item = "☼",
    subText = "White Sun With Rays (U+263C)",
    text = "☼"
  }, {
    item = "☏",
    subText = "White Telephone (U+260F)",
    text = "☏"
  }, {
    item = "〘",
    subText = "White Tortoise Shell Bracket, Left (U+3018)",
    text = "〘"
  }, {
    item = "〙",
    subText = "White Tortoise Shell Bracket, Right (U+3019)",
    text = "〙"
  }, {
    item = "⏢",
    subText = "White Trapezium (U+23E2)",
    text = "⏢"
  }, {
    item = "☝",
    subText = "White Up Pointing Index (U+261D)",
    text = "☝"
  }, {
    item = "⫾",
    subText = "White Vertical Bar (U+2AFE)",
    text = "⫾"
  }, {
    item = "⫿",
    subText = "White Vertical Bar, N-Ary (U+2AFF)",
    text = "⫿"
  }, {
    item = "⃩",
    subText = "Wide Bridge Above, Combining (U+20E9)",
    text = "⃩"
  }, {
    item = "⧘",
    subText = "Wiggly Fences (U+29D8)",
    text = "⧘"
  }, {
    item = "⸾",
    subText = "Wiggly Vertical Line (U+2E3E)",
    text = "⸾"
  }, {
    item = "⁠",
    subText = "Wj (U+2060)",
    text = "⁠"
  }, {
    item = "🐺",
    subText = "Wolf Face (U+1F43A)",
    text = "🐺"
  }, {
    item = "👩",
    subText = "Woman (U+1F469)",
    text = "👩"
  }, {
    item = "👯",
    subText = "Woman With Bunny Ears (U+1F46F)",
    text = "👯"
  }, {
    item = "👵",
    subText = "Woman, Older (U+1F475)",
    text = "👵"
  }, {
    item = "👭",
    subText = "Women Holding Hands, Two (U+1F46D)",
    text = "👭"
  }, {
    item = "₩",
    subText = "Won Sign (U+20A9)",
    text = "₩"
  }, {
    item = "⁠",
    subText = "Word Joiner (U+2060)",
    text = "⁠"
  }, {
    item = "⸱",
    subText = "Word Separator Middle Dot (U+2E31)",
    text = "⸱"
  }, {
    item = "𐄀",
    subText = "Word Separators, Aegean (U+10100)",
    text = "𐄀"
  }, {
    item = "㌀",
    subText = "Words, Squared Katakana (U+3300)",
    text = "㌀"
  }, {
    item = "፡",
    subText = "Wordspace, Ethiopic (U+1361)",
    text = "፡"
  }, {
    item = "⚒",
    subText = "Working Day Symbol (U+2692)",
    text = "⚒"
  }, {
    item = "≀",
    subText = "Wreath Product (U+2240)",
    text = "≀"
  }, {
    item = "✍",
    subText = "Writing Hand (U+270D)",
    text = "✍"
  }, {
    item = "🖎",
    subText = "Writing Hand, Left (U+1F58E)",
    text = "🖎"
  }, {
    item = "Ƿ",
    subText = "Wynn, Latin Capital Letter (U+01F7)",
    text = "Ƿ"
  }, {
    item = "ƿ",
    subText = "Wynn, Latin Letter (U+01BF)",
    text = "ƿ"
  }, {
    item = "̽",
    subText = "X Above, Combining (U+033D)",
    text = "̽"
  }, {
    item = "͓",
    subText = "X Below, Combining (U+0353)",
    text = "͓"
  }, {
    item = "⌧",
    subText = "X In A Rectangle Box (U+2327)",
    text = "⌧"
  }, {
    item = "ẍ",
    subText = "X With Diaeresis, Latin Small Letter (U+1E8D)",
    text = "ẍ"
  }, {
    item = "ẋ",
    subText = "X With Dot Above, Latin Small Letter (U+1E8B)",
    text = "ẋ"
  }, {
    item = "✗",
    subText = "X, Ballot (U+2717)",
    text = "✗"
  }, {
    item = "☒",
    subText = "X, Ballot Box With (U+2612)",
    text = "☒"
  }, {
    item = "🗙",
    subText = "X, Cancellation (U+1F5D9)",
    text = "🗙"
  }, {
    item = "ͯ",
    subText = "X, Combining Latin Small Letter (U+036F)",
    text = "ͯ"
  }, {
    item = "✘",
    subText = "X, Heavy Ballot (U+2718)",
    text = "✘"
  }, {
    item = "✖",
    subText = "X, Heavy Multiplication (U+2716)",
    text = "✖"
  }, {
    item = "ˣ",
    subText = "X, Modifier Letter Small (U+02E3)",
    text = "ˣ"
  }, {
    item = "✕",
    subText = "X, Multiplication (U+2715)",
    text = "✕"
  }, {
    item = "🩠",
    subText = "Xiangqi Chess Symbols, Chinese (U+1FA60)",
    text = "🩠"
  }, {
    item = "⊻",
    subText = "Xor (U+22BB)",
    text = "⊻"
  }, {
    item = "Ý",
    subText = "Y With Acute, Latin Capital Letter (U+00DD)",
    text = "Ý"
  }, {
    item = "ý",
    subText = "Y With Acute, Latin Small Letter (U+00FD)",
    text = "ý"
  }, {
    item = "ŷ",
    subText = "Y With Circumflex, Latin Small Letter (U+0177)",
    text = "ŷ"
  }, {
    item = "Ÿ",
    subText = "Y With Diaeresis, Latin Capital Letter (U+0178)",
    text = "Ÿ"
  }, {
    item = "ÿ",
    subText = "Y With Diaeresis, Latin Small Letter (U+00FF)",
    text = "ÿ"
  }, {
    item = "ẏ",
    subText = "Y With Dot Above, Latin Small Letter (U+1E8F)",
    text = "ẏ"
  }, {
    item = "ỵ",
    subText = "Y With Dot Below, Latin Small Letter (U+1EF5)",
    text = "ỵ"
  }, {
    item = "ỳ",
    subText = "Y With Grave, Latin Small Letter (U+1EF3)",
    text = "ỳ"
  }, {
    item = "ỷ",
    subText = "Y With Hook Above, Latin Small Letter (U+1EF7)",
    text = "ỷ"
  }, {
    item = "ƴ",
    subText = "Y With Hook, Latin Small Letter (U+01B4)",
    text = "ƴ"
  }, {
    item = "ȳ",
    subText = "Y With Macron, Latin Small Letter (U+0233)",
    text = "ȳ"
  }, {
    item = "ẙ",
    subText = "Y With Ring Above, Latin Small Letter (U+1E99)",
    text = "ẙ"
  }, {
    item = "Ɏ",
    subText = "Y With Stroke, Latin Capital Letter (U+024E)",
    text = "Ɏ"
  }, {
    item = "ɏ",
    subText = "Y With Stroke, Latin Small Letter (U+024F)",
    text = "ɏ"
  }, {
    item = "ỹ",
    subText = "Y With Tilde, Latin Small Letter (U+1EF9)",
    text = "ỹ"
  }, {
    item = "ʏ",
    subText = "Y, Latin Letter Small Capital (U+028F)",
    text = "ʏ"
  }, {
    item = "ʎ",
    subText = "Y, Latin Small Letter Turned (U+028E)",
    text = "ʎ"
  }, {
    item = "ʸ",
    subText = "Y, Modifier Letter Small (U+02B8)",
    text = "ʸ"
  }, {
    item = "⅄",
    subText = "Y, Turned Sans-Serif Capital (U+2144)",
    text = "⅄"
  }, {
    item = "๎",
    subText = "Yamakkan, Thai Character (U+0E4E)",
    text = "๎"
  }, {
    item = "௵",
    subText = "Year Sign, Tamil (U+0BF5)",
    text = "௵"
  }, {
    item = "¥",
    subText = "Yen Sign (U+00A5)",
    text = "¥"
  }, {
    item = "֊",
    subText = "Yentamna, Armenian (U+058A)",
    text = "֊"
  }, {
    item = "꒐",
    subText = "Yi Radicals (U+A490)",
    text = "꒐"
  }, {
    item = "ꀀ",
    subText = "Yi Syllables (U+A000)",
    text = "ꀀ"
  }, {
    item = "װ",
    subText = "Yiddish Digraphs (U+05F0)",
    text = "װ"
  }, {
    item = "⛛",
    subText = "Yield (U+26DB)",
    text = "⛛"
  }, {
    item = "⊣",
    subText = "Yield, Does Not (U+22A3)",
    text = "⊣"
  }, {
    item = "⊢",
    subText = "Yields (U+22A2)",
    text = "⊢"
  }, {
    item = "䷀",
    subText = "Yijing / I Ching Hexagram Symbols (U+4DC0)",
    text = "䷀"
  }, {
    item = "⚊",
    subText = "Yijing / I Ching Monogram And Digram Symbols (U+268A)",
    text = "⚊"
  }, {
    item = "☰",
    subText = "Yijing / I Ching Trigram Symbols (U+2630)",
    text = "☰"
  }, {
    item = "☯",
    subText = "Yin Yang (U+262F)",
    text = "☯"
  }, {
    item = "ȝ",
    subText = "Yogh, Latin Small Letter (U+021D)",
    text = "ȝ"
  }, {
    item = "ͅ",
    subText = "Ypogegrammeni, Combining Greek (U+0345)",
    text = "ͅ"
  }, {
    item = "Ʀ",
    subText = "Yr, Latin Letter (U+01A6)",
    text = "Ʀ"
  }, {
    item = "¥",
    subText = "Yuan Sign (U+00A5)",
    text = "¥"
  }, {
    item = "ƶ",
    subText = "Z Bar, Latin Small Letter (U+01B6)",
    text = "ƶ"
  }, {
    item = "⋿",
    subText = "Z Notation Bag Membership (U+22FF)",
    text = "⋿"
  }, {
    item = "⦁",
    subText = "Z Notation Spot (U+2981)",
    text = "⦁"
  }, {
    item = "⦂",
    subText = "Z Notation Type Colon (U+2982)",
    text = "⦂"
  }, {
    item = "ź",
    subText = "Z With Acute, Latin Small Letter (U+017A)",
    text = "ź"
  }, {
    item = "ž",
    subText = "Z With Caron, Latin Small Letter (U+017E)",
    text = "ž"
  }, {
    item = "ẑ",
    subText = "Z With Circumflex, Latin Small Letter (U+1E91)",
    text = "ẑ"
  }, {
    item = "ʑ",
    subText = "Z With Curl, Latin Small Letter (U+0291)",
    text = "ʑ"
  }, {
    item = "ż",
    subText = "Z With Dot Above, Latin Small Letter (U+017C)",
    text = "ż"
  }, {
    item = "ẓ",
    subText = "Z With Dot Below, Latin Small Letter (U+1E93)",
    text = "ẓ"
  }, {
    item = "ȥ",
    subText = "Z With Hook, Latin Small Letter (U+0225)",
    text = "ȥ"
  }, {
    item = "ẕ",
    subText = "Z With Line Below, Latin Small Letter (U+1E95)",
    text = "ẕ"
  }, {
    item = "ʐ",
    subText = "Z With Retroflex Hook, Latin Small Letter (U+0290)",
    text = "ʐ"
  }, {
    item = "ƶ",
    subText = "Z With Stroke, Latin Small Letter (U+01B6)",
    text = "ƶ"
  }, {
    item = "ɀ",
    subText = "Z With Swash Tail, Latin Small Letter (U+0240)",
    text = "ɀ"
  }, {
    item = "ℨ",
    subText = "Z, Black-Letter Capital (U+2128)",
    text = "ℨ"
  }, {
    item = "ℤ",
    subText = "Z, Double-Struck Capital (U+2124)",
    text = "ℤ"
  }, {
    item = "ᴢ",
    subText = "Z, Latin Letter Small Capital (U+1D22)",
    text = "ᴢ"
  }, {
    item = "𑨀",
    subText = "Zanabazar Square (U+11A00)",
    text = "𑨀"
  }, {
    item = "✀",
    subText = "Zapf Dingbats Series 100, Itc (U+2700)",
    text = "✀"
  }, {
    item = "‍",
    subText = "Zero Width Joiner (U+200D)",
    text = "‍"
  }, {
    item = "﻿",
    subText = "Zero Width No-Break Space (U+FEFF)",
    text = "﻿"
  }, {
    item = "‌",
    subText = "Zero Width Non-Joiner (U+200C)",
    text = "‌"
  }, {
    item = "​",
    subText = "Zero Width Space (U+200B)",
    text = "​"
  }, {
    item = "⓪",
    subText = "Zero, Circled Digit (U+24EA)",
    text = "⓪"
  }, {
    item = "〇",
    subText = "Zero, Ideographic Number (U+3007)",
    text = "〇"
  }, {
    item = "⁰",
    subText = "Zero, Superscript (U+2070)",
    text = "⁰"
  }, {
    item = "͛",
    subText = "Zigzag Above, Combining (U+035B)",
    text = "͛"
  }, {
    item = "🐀",
    subText = "Zodiac, Signs Of The Asian (U+1F400)",
    text = "🐀"
  }, {
    item = "♈",
    subText = "Zodiacal Symbols (U+2648)",
    text = "♈"
  }, {
    item = "🧟",
    subText = "Zombie (U+1F9DF)",
    text = "🧟"
  }, {
    item = "𝇩",
    subText = "Zorro (U+1D1E9)",
    text = "𝇩"
  }, {
    item = "‍",
    subText = "Zwj (U+200D)",
    text = "‍"
  }, {
    item = "﻿",
    subText = "Zwnbsp (U+FEFF)",
    text = "﻿"
  }, {
    item = "‌",
    subText = "Zwnj (U+200C)",
    text = "‌"
  }, {
    item = "​",
    subText = "Zwsp (U+200B)",
    text = "​"
  } }

return Picker:new(choices)
