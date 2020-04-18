----------------------------------------------------------------------------------------------------
-- Emoji Picker entity
--
local Picker = require("ki-entities/entity/picker")

-- Codegen functions used to initialize the hardcoded emoji tables below:
-- luacheck: push ignore 211
local function createTables()
    local choices = {}
    local categories = {}
    local categoryChoices = {}

    -- Emoji list from https://cdn.rawgit.com/github/gemoji/master/db/emoji.json
    local emojis = hs.json.read("ki-entities/entity/emoji.json")

    -- Initialize emoji choices and categories table
    for _, emoji in pairs(emojis) do
        local description = "("..emoji.description..") "

        -- Initialize category lists
        if categories[emoji.category] then
            table.insert(categories[emoji.category], emoji.emoji)
        else
            categories[emoji.category] = {}
        end

        -- Add emoji aliases and tags to the description
        for _, alias in pairs(emoji.aliases) do description = description.." :"..alias..":" end
        for _, tag in pairs(emoji.tags) do description = description.." #"..tag end

        table.insert(choices, {
            text = emoji.emoji,
            subText = description,
            item = emoji.emoji,
        })
    end

    -- Initialize item category lists
    for categoryName, list in pairs(categories) do
        local subText = ""
        local items = table.pack(table.unpack(list, 1, 10))

        for i, item in pairs(items) do
            if i == 1 then
                subText = item
            else
                subText = subText.." "..item
            end
        end

        table.insert(categoryChoices, {
            text = categoryName,
            subText = subText,
            categoryName = categoryName,
        })
    end

    return choices, categories, categoryChoices
end
local function codegen()
    local choices, categories, categoryChoices = createTables()
    print("local choices = "..hs.inspect(choices))
    print("local categories = "..hs.inspect(categories))
    print("local categoryChoices = "..hs.inspect(categoryChoices))
end
-- luacheck: pop

-- luacheck: push ignore 631
local categories = {
  Activities = { "🎄", "🎆", "🎇", "🧨", "✨", "🎈", "🎉", "🎊", "🎋", "🎍", "🎎", "🎏", "🎐", "🎑", "🧧", "🎀", "🎁", "🎗", "🎟", "🎫", "🎖", "🏆", "🏅", "🥇", "🥈", "🥉", "⚽", "⚾", "🥎", "🏀", "🏐", "🏈", "🏉", "🎾", "🥏", "🎳", "🏏", "🏑", "🏒", "🥍", "🏓", "🏸", "🥊", "🥋", "🥅", "⛳", "⛸", "🎣", "🤿", "🎽", "🎿", "🛷", "🥌", "🎯", "🪀", "🪁", "🎱", "🔮", "🧿", "🎮", "🕹", "🎰", "🎲", "🧩", "🧸", "♠️", "♥️", "♦️", "♣️", "♟", "🃏", "🀄", "🎴", "🎭", "🖼", "🎨", "🧵", "🧶" },
  ["Animals & Nature"] = { "🐒", "🦍", "🦧", "🐶", "🐕", "🦮", "🐕‍🦺", "🐩", "🐺", "🦊", "🦝", "🐱", "🐈", "🦁", "🐯", "🐅", "🐆", "🐴", "🐎", "🦄", "🦓", "🦌", "🐮", "🐂", "🐃", "🐄", "🐷", "🐖", "🐗", "🐽", "🐏", "🐑", "🐐", "🐪", "🐫", "🦙", "🦒", "🐘", "🦏", "🦛", "🐭", "🐁", "🐀", "🐹", "🐰", "🐇", "🐿", "🦔", "🦇", "🐻", "🐨", "🐼", "🦥", "🦦", "🦨", "🦘", "🦡", "🐾", "🦃", "🐔", "🐓", "🐣", "🐤", "🐥", "🐦", "🐧", "🕊", "🦅", "🦆", "🦢", "🦉", "🦩", "🦚", "🦜", "🐸", "🐊", "🐢", "🦎", "🐍", "🐲", "🐉", "🦕", "🦖", "🐳", "🐋", "🐬", "🐟", "🐠", "🐡", "🦈", "🐙", "🐚", "🐌", "🦋", "🐛", "🐜", "🐝", "🐞", "🦗", "🕷", "🕸", "🦂", "🦟", "🦠", "💐", "🌸", "💮", "🏵", "🌹", "🥀", "🌺", "🌻", "🌼", "🌷", "🌱", "🌲", "🌳", "🌴", "🌵", "🌾", "🌿", "☘", "🍀", "🍁", "🍂", "🍃" },
  Flags = { "🚩", "🎌", "🏴", "🏳", "🏳️‍🌈", "🏴‍☠", "🇦🇨", "🇦🇩", "🇦🇪", "🇦🇫", "🇦🇬", "🇦🇮", "🇦🇱", "🇦🇲", "🇦🇴", "🇦🇶", "🇦🇷", "🇦🇸", "🇦🇹", "🇦🇺", "🇦🇼", "🇦🇽", "🇦🇿", "🇧🇦", "🇧🇧", "🇧🇩", "🇧🇪", "🇧🇫", "🇧🇬", "🇧🇭", "🇧🇮", "🇧🇯", "🇧🇱", "🇧🇲", "🇧🇳", "🇧🇴", "🇧🇶", "🇧🇷", "🇧🇸", "🇧🇹", "🇧🇻", "🇧🇼", "🇧🇾", "🇧🇿", "🇨🇦", "🇨🇨", "🇨🇩", "🇨🇫", "🇨🇬", "🇨🇭", "🇨🇮", "🇨🇰", "🇨🇱", "🇨🇲", "🇨🇳", "🇨🇴", "🇨🇵", "🇨🇷", "🇨🇺", "🇨🇻", "🇨🇼", "🇨🇽", "🇨🇾", "🇨🇿", "🇩🇪", "🇩🇬", "🇩🇯", "🇩🇰", "🇩🇲", "🇩🇴", "🇩🇿", "🇪🇦", "🇪🇨", "🇪🇪", "🇪🇬", "🇪🇭", "🇪🇷", "🇪🇸", "🇪🇹", "🇪🇺", "🇫🇮", "🇫🇯", "🇫🇰", "🇫🇲", "🇫🇴", "🇫🇷", "🇬🇦", "🇬🇧", "🇬🇩", "🇬🇪", "🇬🇫", "🇬🇬", "🇬🇭", "🇬🇮", "🇬🇱", "🇬🇲", "🇬🇳", "🇬🇵", "🇬🇶", "🇬🇷", "🇬🇸", "🇬🇹", "🇬🇺", "🇬🇼", "🇬🇾", "🇭🇰", "🇭🇲", "🇭🇳", "🇭🇷", "🇭🇹", "🇭🇺", "🇮🇨", "🇮🇩", "🇮🇪", "🇮🇱", "🇮🇲", "🇮🇳", "🇮🇴", "🇮🇶", "🇮🇷", "🇮🇸", "🇮🇹", "🇯🇪", "🇯🇲", "🇯🇴", "🇯🇵", "🇰🇪", "🇰🇬", "🇰🇭", "🇰🇮", "🇰🇲", "🇰🇳", "🇰🇵", "🇰🇷", "🇰🇼", "🇰🇾", "🇰🇿", "🇱🇦", "🇱🇧", "🇱🇨", "🇱🇮", "🇱🇰", "🇱🇷", "🇱🇸", "🇱🇹", "🇱🇺", "🇱🇻", "🇱🇾", "🇲🇦", "🇲🇨", "🇲🇩", "🇲🇪", "🇲🇫", "🇲🇬", "🇲🇭", "🇲🇰", "🇲🇱", "🇲🇲", "🇲🇳", "🇲🇴", "🇲🇵", "🇲🇶", "🇲🇷", "🇲🇸", "🇲🇹", "🇲🇺", "🇲🇻", "🇲🇼", "🇲🇽", "🇲🇾", "🇲🇿", "🇳🇦", "🇳🇨", "🇳🇪", "🇳🇫", "🇳🇬", "🇳🇮", "🇳🇱", "🇳🇴", "🇳🇵", "🇳🇷", "🇳🇺", "🇳🇿", "🇴🇲", "🇵🇦", "🇵🇪", "🇵🇫", "🇵🇬", "🇵🇭", "🇵🇰", "🇵🇱", "🇵🇲", "🇵🇳", "🇵🇷", "🇵🇸", "🇵🇹", "🇵🇼", "🇵🇾", "🇶🇦", "🇷🇪", "🇷🇴", "🇷🇸", "🇷🇺", "🇷🇼", "🇸🇦", "🇸🇧", "🇸🇨", "🇸🇩", "🇸🇪", "🇸🇬", "🇸🇭", "🇸🇮", "🇸🇯", "🇸🇰", "🇸🇱", "🇸🇲", "🇸🇳", "🇸🇴", "🇸🇷", "🇸🇸", "🇸🇹", "🇸🇻", "🇸🇽", "🇸🇾", "🇸🇿", "🇹🇦", "🇹🇨", "🇹🇩", "🇹🇫", "🇹🇬", "🇹🇭", "🇹🇯", "🇹🇰", "🇹🇱", "🇹🇲", "🇹🇳", "🇹🇴", "🇹🇷", "🇹🇹", "🇹🇻", "🇹🇼", "🇹🇿", "🇺🇦", "🇺🇬", "🇺🇲", "🇺🇳", "🇺🇸", "🇺🇾", "🇺🇿", "🇻🇦", "🇻🇨", "🇻🇪", "🇻🇬", "🇻🇮", "🇻🇳", "🇻🇺", "🇼🇫", "🇼🇸", "🇽🇰", "🇾🇪", "🇾🇹", "🇿🇦", "🇿🇲", "🇿🇼", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁷󠁬󠁳󠁿" },
  ["Food & Drink"] = { "🍈", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍏", "🍐", "🍑", "🍒", "🍓", "🥝", "🍅", "🥥", "🥑", "🍆", "🥔", "🥕", "🌽", "🌶", "🥒", "🥬", "🥦", "🧄", "🧅", "🍄", "🥜", "🌰", "🍞", "🥐", "🥖", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🥣", "🥗", "🍿", "🧈", "🧂", "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟", "🥠", "🥡", "🦀", "🦞", "🦐", "🦑", "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧", "🍫", "🍬", "🍭", "🍮", "🍯", "🍼", "🥛", "☕", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺", "🍻", "🥂", "🥃", "🥤", "🧃", "🧉", "🧊", "🥢", "🍽", "🍴", "🥄", "🔪", "🏺" },
  Objects = { "🕶", "🥽", "🥼", "🦺", "👔", "👕", "👖", "🧣", "🧤", "🧥", "🧦", "👗", "👘", "🥻", "🩱", "🩲", "🩳", "👙", "👚", "👛", "👜", "👝", "🛍", "🎒", "👞", "👟", "🥾", "🥿", "👠", "👡", "🩰", "👢", "👑", "👒", "🎩", "🎓", "🧢", "⛑", "📿", "💄", "💍", "💎", "🔇", "🔈", "🔉", "🔊", "📢", "📣", "📯", "🔔", "🔕", "🎼", "🎵", "🎶", "🎙", "🎚", "🎛", "🎤", "🎧", "📻", "🎷", "🎸", "🎹", "🎺", "🎻", "🪕", "🥁", "📱", "📲", "☎️", "📞", "📟", "📠", "🔋", "🔌", "💻", "🖥", "🖨", "⌨", "🖱", "🖲", "💽", "💾", "💿", "📀", "🧮", "🎥", "🎞", "📽", "🎬", "📺", "📷", "📸", "📹", "📼", "🔍", "🔎", "🕯", "💡", "🔦", "🏮", "🪔", "📔", "📕", "📖", "📗", "📘", "📙", "📚", "📓", "📒", "📃", "📜", "📄", "📰", "🗞", "📑", "🔖", "🏷", "💰", "💴", "💵", "💶", "💷", "💸", "💳", "🧾", "💹", "💱", "💲", "✉️", "📧", "📨", "📩", "📤", "📥", "📦", "📫", "📪", "📬", "📭", "📮", "🗳", "✏️", "✒️", "🖋", "🖊", "🖌", "🖍", "📝", "💼", "📁", "📂", "🗂", "📅", "📆", "🗒", "🗓", "📇", "📈", "📉", "📊", "📋", "📌", "📍", "📎", "🖇", "📏", "📐", "✂️", "🗃", "🗄", "🗑", "🔒", "🔓", "🔏", "🔐", "🔑", "🗝", "🔨", "🪓", "⛏", "⚒", "🛠", "🗡", "⚔", "🔫", "🏹", "🛡", "🔧", "🔩", "⚙", "🗜", "⚖", "🦯", "🔗", "⛓", "🧰", "🧲", "⚗", "🧪", "🧫", "🧬", "🔬", "🔭", "📡", "💉", "🩸", "💊", "🩹", "🩺", "🚪", "🛏", "🛋", "🪑", "🚽", "🚿", "🛁", "🪒", "🧴", "🧷", "🧹", "🧺", "🧻", "🧼", "🧽", "🧯", "🛒", "🚬", "⚰", "⚱", "🗿" },
  ["People & Body"] = { "🤚", "🖐", "✋", "🖖", "👌", "🤏", "✌️", "🤞", "🤟", "🤘", "🤙", "👈", "👉", "👆", "🖕", "👇", "☝️", "👍", "👎", "✊", "👊", "🤛", "🤜", "👏", "🙌", "👐", "🤲", "🤝", "🙏", "✍️", "💅", "🤳", "💪", "🦾", "🦿", "🦵", "🦶", "👂", "🦻", "👃", "🧠", "🦷", "🦴", "👀", "👁", "👅", "👄", "👶", "🧒", "👦", "👧", "🧑", "👱", "👨", "🧔", "👱‍♂", "👨‍🦰", "👨‍🦱", "👨‍🦳", "👨‍🦲", "👩", "👱‍♀", "👩‍🦰", "👩‍🦱", "👩‍🦳", "👩‍🦲", "🧓", "👴", "👵", "🙍", "🙍‍♂", "🙍‍♀", "🙎", "🙎‍♂", "🙎‍♀", "🙅", "🙅‍♂", "🙅‍♀", "🙆", "🙆‍♂", "🙆‍♀", "💁", "💁‍♂", "💁‍♀", "🙋", "🙋‍♂", "🙋‍♀", "🧏", "🧏‍♂", "🧏‍♀", "🙇", "🙇‍♂", "🙇‍♀", "🤦", "🤦‍♂", "🤦‍♀", "🤷", "🤷‍♂", "🤷‍♀", "👨‍⚕", "👩‍⚕", "👨‍🎓", "👩‍🎓", "👨‍🏫", "👩‍🏫", "👨‍⚖", "👩‍⚖", "👨‍🌾", "👩‍🌾", "👨‍🍳", "👩‍🍳", "👨‍🔧", "👩‍🔧", "👨‍🏭", "👩‍🏭", "👨‍💼", "👩‍💼", "👨‍🔬", "👩‍🔬", "👨‍💻", "👩‍💻", "👨‍🎤", "👩‍🎤", "👨‍🎨", "👩‍🎨", "👨‍✈", "👩‍✈", "👨‍🚀", "👩‍🚀", "👨‍🚒", "👩‍🚒", "👮", "👮‍♂", "👮‍♀", "🕵", "🕵️‍♂️", "🕵️‍♀️", "💂", "💂‍♂", "💂‍♀", "👷", "👷‍♂", "👷‍♀", "🤴", "👸", "👳", "👳‍♂", "👳‍♀", "👲", "🧕", "🤵", "👰", "🤰", "🤱", "👼", "🎅", "🤶", "🦸", "🦸‍♂", "🦸‍♀", "🦹", "🦹‍♂", "🦹‍♀", "🧙", "🧙‍♂", "🧙‍♀", "🧚", "🧚‍♂", "🧚‍♀", "🧛", "🧛‍♂", "🧛‍♀", "🧜", "🧜‍♂", "🧜‍♀", "🧝", "🧝‍♂", "🧝‍♀", "🧞", "🧞‍♂", "🧞‍♀", "🧟", "🧟‍♂", "🧟‍♀", "💆", "💆‍♂", "💆‍♀", "💇", "💇‍♂", "💇‍♀", "🚶", "🚶‍♂", "🚶‍♀", "🧍", "🧍‍♂", "🧍‍♀", "🧎", "🧎‍♂", "🧎‍♀", "👨‍🦯", "👩‍🦯", "👨‍🦼", "👩‍🦼", "👨‍🦽", "👩‍🦽", "🏃", "🏃‍♂", "🏃‍♀", "💃", "🕺", "🕴", "👯", "👯‍♂", "👯‍♀", "🧖", "🧖‍♂", "🧖‍♀", "🧗", "🧗‍♂", "🧗‍♀", "🤺", "🏇", "⛷", "🏂", "🏌", "🏌️‍♂️", "🏌️‍♀️", "🏄", "🏄‍♂", "🏄‍♀", "🚣", "🚣‍♂", "🚣‍♀", "🏊", "🏊‍♂", "🏊‍♀", "⛹", "⛹️‍♂️", "⛹️‍♀️", "🏋", "🏋️‍♂️", "🏋️‍♀️", "🚴", "🚴‍♂", "🚴‍♀", "🚵", "🚵‍♂", "🚵‍♀", "🤸", "🤸‍♂", "🤸‍♀", "🤼", "🤼‍♂", "🤼‍♀", "🤽", "🤽‍♂", "🤽‍♀", "🤾", "🤾‍♂", "🤾‍♀", "🤹", "🤹‍♂", "🤹‍♀", "🧘", "🧘‍♂", "🧘‍♀", "🛀", "🛌", "🧑‍🤝‍🧑", "👭", "👫", "👬", "💏", "👩‍❤️‍💋‍👨", "👨‍❤️‍💋‍👨", "👩‍❤️‍💋‍👩", "💑", "👩‍❤️‍👨", "👨‍❤️‍👨", "👩‍❤️‍👩", "👪", "👨‍👩‍👦", "👨‍👩‍👧", "👨‍👩‍👧‍👦", "👨‍👩‍👦‍👦", "👨‍👩‍👧‍👧", "👨‍👨‍👦", "👨‍👨‍👧", "👨‍👨‍👧‍👦", "👨‍👨‍👦‍👦", "👨‍👨‍👧‍👧", "👩‍👩‍👦", "👩‍👩‍👧", "👩‍👩‍👧‍👦", "👩‍👩‍👦‍👦", "👩‍👩‍👧‍👧", "👨‍👦", "👨‍👦‍👦", "👨‍👧", "👨‍👧‍👦", "👨‍👧‍👧", "👩‍👦", "👩‍👦‍👦", "👩‍👧", "👩‍👧‍👦", "👩‍👧‍👧", "🗣", "👤", "👥", "👣" },
  ["Smileys & Emotion"] = { "😃", "😄", "😁", "😆", "😅", "🤣", "😂", "🙂", "🙃", "😉", "😊", "😇", "🥰", "😍", "🤩", "😘", "😗", "☺️", "😚", "😙", "😋", "😛", "😜", "🤪", "😝", "🤑", "🤗", "🤭", "🤫", "🤔", "🤐", "🤨", "😐", "😑", "😶", "😏", "😒", "🙄", "😬", "🤥", "😌", "😔", "😪", "🤤", "😴", "😷", "🤒", "🤕", "🤢", "🤮", "🤧", "🥵", "🥶", "🥴", "😵", "🤯", "🤠", "🥳", "😎", "🤓", "🧐", "😕", "😟", "🙁", "☹", "😮", "😯", "😲", "😳", "🥺", "😦", "😧", "😨", "😰", "😥", "😢", "😭", "😱", "😖", "😣", "😞", "😓", "😩", "😫", "🥱", "😤", "😡", "😠", "🤬", "😈", "👿", "💀", "☠", "💩", "🤡", "👹", "👺", "👻", "👽", "👾", "🤖", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾", "🙈", "🙉", "🙊", "💋", "💌", "💘", "💝", "💖", "💗", "💓", "💞", "💕", "💟", "❣️", "💔", "❤️", "🧡", "💛", "💚", "💙", "💜", "🤎", "🖤", "🤍", "💯", "💢", "💥", "💫", "💦", "💨", "🕳", "💣", "💬", "👁️‍🗨️", "🗨", "🗯", "💭", "💤" },
  Symbols = { "🚮", "🚰", "♿", "🚹", "🚺", "🚻", "🚼", "🚾", "🛂", "🛃", "🛄", "🛅", "⚠️", "🚸", "⛔", "🚫", "🚳", "🚭", "🚯", "🚱", "🚷", "📵", "🔞", "☢", "☣", "⬆️", "↗️", "➡️", "↘️", "⬇️", "↙️", "⬅️", "↖️", "↕️", "↔️", "↩️", "↪️", "⤴️", "⤵️", "🔃", "🔄", "🔙", "🔚", "🔛", "🔜", "🔝", "🛐", "⚛", "🕉", "✡️", "☸", "☯️", "✝️", "☦", "☪", "☮", "🕎", "🔯", "♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "⛎", "🔀", "🔁", "🔂", "▶️", "⏩", "⏭", "⏯", "◀️", "⏪", "⏮", "🔼", "⏫", "🔽", "⏬", "⏸", "⏹", "⏺", "⏏️", "🎦", "🔅", "🔆", "📶", "📳", "📴", "♀️", "♂️", "⚕", "♾", "♻️", "⚜", "🔱", "📛", "🔰", "⭕", "✅", "☑️", "✔️", "✖️", "❌", "❎", "➕", "➖", "➗", "➰", "➿", "〽️", "✳️", "✴️", "❇️", "‼️", "⁉️", "❓", "❔", "❕", "❗", "〰️", "©️", "®️", "™️", "#️⃣", "*️⃣", "0️⃣", "1️⃣", "2️⃣", "3️⃣", "4️⃣", "5️⃣", "6️⃣", "7️⃣", "8️⃣", "9️⃣", "🔟", "🔠", "🔡", "🔢", "🔣", "🔤", "🅰️", "🆎", "🅱️", "🆑", "🆒", "🆓", "ℹ️", "🆔", "Ⓜ️", "🆕", "🆖", "🅾️", "🆗", "🅿️", "🆘", "🆙", "🆚", "🈁", "🈂️", "🈷️", "🈶", "🈯", "🉐", "🈹", "🈚", "🈲", "🉑", "🈸", "🈴", "🈳", "㊗️", "㊙️", "🈺", "🈵", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "🟤", "⚫", "⚪", "🟥", "🟧", "🟨", "🟩", "🟦", "🟪", "🟫", "⬛", "⬜", "◼️", "◻️", "◾", "◽", "▪️", "▫️", "🔶", "🔷", "🔸", "🔹", "🔺", "🔻", "💠", "🔘", "🔳", "🔲" },
  ["Travel & Places"] = { "🌎", "🌏", "🌐", "🗺", "🗾", "🧭", "🏔", "⛰", "🌋", "🗻", "🏕", "🏖", "🏜", "🏝", "🏞", "🏟", "🏛", "🏗", "🧱", "🏘", "🏚", "🏠", "🏡", "🏢", "🏣", "🏤", "🏥", "🏦", "🏨", "🏩", "🏪", "🏫", "🏬", "🏭", "🏯", "🏰", "💒", "🗼", "🗽", "⛪", "🕌", "🛕", "🕍", "⛩", "🕋", "⛲", "⛺", "🌁", "🌃", "🏙", "🌄", "🌅", "🌆", "🌇", "🌉", "♨️", "🎠", "🎡", "🎢", "💈", "🎪", "🚂", "🚃", "🚄", "🚅", "🚆", "🚇", "🚈", "🚉", "🚊", "🚝", "🚞", "🚋", "🚌", "🚍", "🚎", "🚐", "🚑", "🚒", "🚓", "🚔", "🚕", "🚖", "🚗", "🚘", "🚙", "🚚", "🚛", "🚜", "🏎", "🏍", "🛵", "🦽", "🦼", "🛺", "🚲", "🛴", "🛹", "🚏", "🛣", "🛤", "🛢", "⛽", "🚨", "🚥", "🚦", "🛑", "🚧", "⚓", "⛵", "🛶", "🚤", "🛳", "⛴", "🛥", "🚢", "✈️", "🛩", "🛫", "🛬", "🪂", "💺", "🚁", "🚟", "🚠", "🚡", "🛰", "🚀", "🛸", "🛎", "🧳", "⌛", "⏳", "⌚", "⏰", "⏱", "⏲", "🕰", "🕛", "🕧", "🕐", "🕜", "🕑", "🕝", "🕒", "🕞", "🕓", "🕟", "🕔", "🕠", "🕕", "🕡", "🕖", "🕢", "🕗", "🕣", "🕘", "🕤", "🕙", "🕥", "🕚", "🕦", "🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘", "🌙", "🌚", "🌛", "🌜", "🌡", "☀️", "🌝", "🌞", "🪐", "⭐", "🌟", "🌠", "🌌", "☁️", "⛅", "⛈", "🌤", "🌥", "🌦", "🌧", "🌨", "🌩", "🌪", "🌫", "🌬", "🌀", "🌈", "🌂", "☂️", "☔", "⛱", "⚡", "❄️", "☃️", "⛄", "☄", "🔥", "💧", "🌊" }
}
local choices = { {
    item = "😀",
    subText = "(grinning face) :grinning: #smile #happy",
    text = "😀"
  }, {
    item = "😃",
    subText = "(grinning face with big eyes) :smiley: #happy #joy #haha",
    text = "😃"
  }, {
    item = "😄",
    subText = "(grinning face with smiling eyes) :smile: #happy #joy #laugh #pleased",
    text = "😄"
  }, {
    item = "😁",
    subText = "(beaming face with smiling eyes) :grin:",
    text = "😁"
  }, {
    item = "😆",
    subText = "(grinning squinting face) :laughing: :satisfied: #happy #haha",
    text = "😆"
  }, {
    item = "😅",
    subText = "(grinning face with sweat) :sweat_smile: #hot",
    text = "😅"
  }, {
    item = "🤣",
    subText = "(rolling on the floor laughing) :rofl: #lol #laughing",
    text = "🤣"
  }, {
    item = "😂",
    subText = "(face with tears of joy) :joy: #tears",
    text = "😂"
  }, {
    item = "🙂",
    subText = "(slightly smiling face) :slightly_smiling_face:",
    text = "🙂"
  }, {
    item = "🙃",
    subText = "(upside-down face) :upside_down_face:",
    text = "🙃"
  }, {
    item = "😉",
    subText = "(winking face) :wink: #flirt",
    text = "😉"
  }, {
    item = "😊",
    subText = "(smiling face with smiling eyes) :blush: #proud",
    text = "😊"
  }, {
    item = "😇",
    subText = "(smiling face with halo) :innocent: #angel",
    text = "😇"
  }, {
    item = "🥰",
    subText = "(smiling face with hearts) :smiling_face_with_three_hearts: #love",
    text = "🥰"
  }, {
    item = "😍",
    subText = "(smiling face with heart-eyes) :heart_eyes: #love #crush",
    text = "😍"
  }, {
    item = "🤩",
    subText = "(star-struck) :star_struck: #eyes",
    text = "🤩"
  }, {
    item = "😘",
    subText = "(face blowing a kiss) :kissing_heart: #flirt",
    text = "😘"
  }, {
    item = "😗",
    subText = "(kissing face) :kissing:",
    text = "😗"
  }, {
    item = "☺️",
    subText = "(smiling face) :relaxed: #blush #pleased",
    text = "☺️"
  }, {
    item = "😚",
    subText = "(kissing face with closed eyes) :kissing_closed_eyes:",
    text = "😚"
  }, {
    item = "😙",
    subText = "(kissing face with smiling eyes) :kissing_smiling_eyes:",
    text = "😙"
  }, {
    item = "😋",
    subText = "(face savoring food) :yum: #tongue #lick",
    text = "😋"
  }, {
    item = "😛",
    subText = "(face with tongue) :stuck_out_tongue:",
    text = "😛"
  }, {
    item = "😜",
    subText = "(winking face with tongue) :stuck_out_tongue_winking_eye: #prank #silly",
    text = "😜"
  }, {
    item = "🤪",
    subText = "(zany face) :zany_face: #goofy #wacky",
    text = "🤪"
  }, {
    item = "😝",
    subText = "(squinting face with tongue) :stuck_out_tongue_closed_eyes: #prank",
    text = "😝"
  }, {
    item = "🤑",
    subText = "(money-mouth face) :money_mouth_face: #rich",
    text = "🤑"
  }, {
    item = "🤗",
    subText = "(hugging face) :hugs:",
    text = "🤗"
  }, {
    item = "🤭",
    subText = "(face with hand over mouth) :hand_over_mouth: #quiet #whoops",
    text = "🤭"
  }, {
    item = "🤫",
    subText = "(shushing face) :shushing_face: #silence #quiet",
    text = "🤫"
  }, {
    item = "🤔",
    subText = "(thinking face) :thinking:",
    text = "🤔"
  }, {
    item = "🤐",
    subText = "(zipper-mouth face) :zipper_mouth_face: #silence #hush",
    text = "🤐"
  }, {
    item = "🤨",
    subText = "(face with raised eyebrow) :raised_eyebrow: #suspicious",
    text = "🤨"
  }, {
    item = "😐",
    subText = "(neutral face) :neutral_face: #meh",
    text = "😐"
  }, {
    item = "😑",
    subText = "(expressionless face) :expressionless:",
    text = "😑"
  }, {
    item = "😶",
    subText = "(face without mouth) :no_mouth: #mute #silence",
    text = "😶"
  }, {
    item = "😏",
    subText = "(smirking face) :smirk: #smug",
    text = "😏"
  }, {
    item = "😒",
    subText = "(unamused face) :unamused: #meh",
    text = "😒"
  }, {
    item = "🙄",
    subText = "(face with rolling eyes) :roll_eyes:",
    text = "🙄"
  }, {
    item = "😬",
    subText = "(grimacing face) :grimacing:",
    text = "😬"
  }, {
    item = "🤥",
    subText = "(lying face) :lying_face: #liar",
    text = "🤥"
  }, {
    item = "😌",
    subText = "(relieved face) :relieved: #whew",
    text = "😌"
  }, {
    item = "😔",
    subText = "(pensive face) :pensive:",
    text = "😔"
  }, {
    item = "😪",
    subText = "(sleepy face) :sleepy: #tired",
    text = "😪"
  }, {
    item = "🤤",
    subText = "(drooling face) :drooling_face:",
    text = "🤤"
  }, {
    item = "😴",
    subText = "(sleeping face) :sleeping: #zzz",
    text = "😴"
  }, {
    item = "😷",
    subText = "(face with medical mask) :mask: #sick #ill",
    text = "😷"
  }, {
    item = "🤒",
    subText = "(face with thermometer) :face_with_thermometer: #sick",
    text = "🤒"
  }, {
    item = "🤕",
    subText = "(face with head-bandage) :face_with_head_bandage: #hurt",
    text = "🤕"
  }, {
    item = "🤢",
    subText = "(nauseated face) :nauseated_face: #sick #barf #disgusted",
    text = "🤢"
  }, {
    item = "🤮",
    subText = "(face vomiting) :vomiting_face: #barf #sick",
    text = "🤮"
  }, {
    item = "🤧",
    subText = "(sneezing face) :sneezing_face: #achoo #sick",
    text = "🤧"
  }, {
    item = "🥵",
    subText = "(hot face) :hot_face: #heat #sweating",
    text = "🥵"
  }, {
    item = "🥶",
    subText = "(cold face) :cold_face: #freezing #ice",
    text = "🥶"
  }, {
    item = "🥴",
    subText = "(woozy face) :woozy_face: #groggy",
    text = "🥴"
  }, {
    item = "😵",
    subText = "(dizzy face) :dizzy_face:",
    text = "😵"
  }, {
    item = "🤯",
    subText = "(exploding head) :exploding_head: #mind #blown",
    text = "🤯"
  }, {
    item = "🤠",
    subText = "(cowboy hat face) :cowboy_hat_face:",
    text = "🤠"
  }, {
    item = "🥳",
    subText = "(partying face) :partying_face: #celebration #birthday",
    text = "🥳"
  }, {
    item = "😎",
    subText = "(smiling face with sunglasses) :sunglasses: #cool",
    text = "😎"
  }, {
    item = "🤓",
    subText = "(nerd face) :nerd_face: #geek #glasses",
    text = "🤓"
  }, {
    item = "🧐",
    subText = "(face with monocle) :monocle_face:",
    text = "🧐"
  }, {
    item = "😕",
    subText = "(confused face) :confused:",
    text = "😕"
  }, {
    item = "😟",
    subText = "(worried face) :worried: #nervous",
    text = "😟"
  }, {
    item = "🙁",
    subText = "(slightly frowning face) :slightly_frowning_face:",
    text = "🙁"
  }, {
    item = "☹",
    subText = "(frowning face) :frowning_face:",
    text = "☹"
  }, {
    item = "😮",
    subText = "(face with open mouth) :open_mouth: #surprise #impressed #wow",
    text = "😮"
  }, {
    item = "😯",
    subText = "(hushed face) :hushed: #silence #speechless",
    text = "😯"
  }, {
    item = "😲",
    subText = "(astonished face) :astonished: #amazed #gasp",
    text = "😲"
  }, {
    item = "😳",
    subText = "(flushed face) :flushed:",
    text = "😳"
  }, {
    item = "🥺",
    subText = "(pleading face) :pleading_face: #puppy #eyes",
    text = "🥺"
  }, {
    item = "😦",
    subText = "(frowning face with open mouth) :frowning:",
    text = "😦"
  }, {
    item = "😧",
    subText = "(anguished face) :anguished: #stunned",
    text = "😧"
  }, {
    item = "😨",
    subText = "(fearful face) :fearful: #scared #shocked #oops",
    text = "😨"
  }, {
    item = "😰",
    subText = "(anxious face with sweat) :cold_sweat: #nervous",
    text = "😰"
  }, {
    item = "😥",
    subText = "(sad but relieved face) :disappointed_relieved: #phew #sweat #nervous",
    text = "😥"
  }, {
    item = "😢",
    subText = "(crying face) :cry: #sad #tear",
    text = "😢"
  }, {
    item = "😭",
    subText = "(loudly crying face) :sob: #sad #cry #bawling",
    text = "😭"
  }, {
    item = "😱",
    subText = "(face screaming in fear) :scream: #horror #shocked",
    text = "😱"
  }, {
    item = "😖",
    subText = "(confounded face) :confounded:",
    text = "😖"
  }, {
    item = "😣",
    subText = "(persevering face) :persevere: #struggling",
    text = "😣"
  }, {
    item = "😞",
    subText = "(disappointed face) :disappointed: #sad",
    text = "😞"
  }, {
    item = "😓",
    subText = "(downcast face with sweat) :sweat:",
    text = "😓"
  }, {
    item = "😩",
    subText = "(weary face) :weary: #tired",
    text = "😩"
  }, {
    item = "😫",
    subText = "(tired face) :tired_face: #upset #whine",
    text = "😫"
  }, {
    item = "🥱",
    subText = "(yawning face) :yawning_face:",
    text = "🥱"
  }, {
    item = "😤",
    subText = "(face with steam from nose) :triumph: #smug",
    text = "😤"
  }, {
    item = "😡",
    subText = "(pouting face) :rage: :pout: #angry",
    text = "😡"
  }, {
    item = "😠",
    subText = "(angry face) :angry: #mad #annoyed",
    text = "😠"
  }, {
    item = "🤬",
    subText = "(face with symbols on mouth) :cursing_face: #foul",
    text = "🤬"
  }, {
    item = "😈",
    subText = "(smiling face with horns) :smiling_imp: #devil #evil #horns",
    text = "😈"
  }, {
    item = "👿",
    subText = "(angry face with horns) :imp: #angry #devil #evil #horns",
    text = "👿"
  }, {
    item = "💀",
    subText = "(skull) :skull: #dead #danger #poison",
    text = "💀"
  }, {
    item = "☠",
    subText = "(skull and crossbones) :skull_and_crossbones: #danger #pirate",
    text = "☠"
  }, {
    item = "💩",
    subText = "(pile of poo) :hankey: :poop: :shit: #crap",
    text = "💩"
  }, {
    item = "🤡",
    subText = "(clown face) :clown_face:",
    text = "🤡"
  }, {
    item = "👹",
    subText = "(ogre) :japanese_ogre: #monster",
    text = "👹"
  }, {
    item = "👺",
    subText = "(goblin) :japanese_goblin:",
    text = "👺"
  }, {
    item = "👻",
    subText = "(ghost) :ghost: #halloween",
    text = "👻"
  }, {
    item = "👽",
    subText = "(alien) :alien: #ufo",
    text = "👽"
  }, {
    item = "👾",
    subText = "(alien monster) :space_invader: #game #retro",
    text = "👾"
  }, {
    item = "🤖",
    subText = "(robot) :robot:",
    text = "🤖"
  }, {
    item = "😺",
    subText = "(grinning cat) :smiley_cat:",
    text = "😺"
  }, {
    item = "😸",
    subText = "(grinning cat with smiling eyes) :smile_cat:",
    text = "😸"
  }, {
    item = "😹",
    subText = "(cat with tears of joy) :joy_cat:",
    text = "😹"
  }, {
    item = "😻",
    subText = "(smiling cat with heart-eyes) :heart_eyes_cat:",
    text = "😻"
  }, {
    item = "😼",
    subText = "(cat with wry smile) :smirk_cat:",
    text = "😼"
  }, {
    item = "😽",
    subText = "(kissing cat) :kissing_cat:",
    text = "😽"
  }, {
    item = "🙀",
    subText = "(weary cat) :scream_cat: #horror",
    text = "🙀"
  }, {
    item = "😿",
    subText = "(crying cat) :crying_cat_face: #sad #tear",
    text = "😿"
  }, {
    item = "😾",
    subText = "(pouting cat) :pouting_cat:",
    text = "😾"
  }, {
    item = "🙈",
    subText = "(see-no-evil monkey) :see_no_evil: #monkey #blind #ignore",
    text = "🙈"
  }, {
    item = "🙉",
    subText = "(hear-no-evil monkey) :hear_no_evil: #monkey #deaf",
    text = "🙉"
  }, {
    item = "🙊",
    subText = "(speak-no-evil monkey) :speak_no_evil: #monkey #mute #hush",
    text = "🙊"
  }, {
    item = "💋",
    subText = "(kiss mark) :kiss: #lipstick",
    text = "💋"
  }, {
    item = "💌",
    subText = "(love letter) :love_letter: #email #envelope",
    text = "💌"
  }, {
    item = "💘",
    subText = "(heart with arrow) :cupid: #love #heart",
    text = "💘"
  }, {
    item = "💝",
    subText = "(heart with ribbon) :gift_heart: #chocolates",
    text = "💝"
  }, {
    item = "💖",
    subText = "(sparkling heart) :sparkling_heart:",
    text = "💖"
  }, {
    item = "💗",
    subText = "(growing heart) :heartpulse:",
    text = "💗"
  }, {
    item = "💓",
    subText = "(beating heart) :heartbeat:",
    text = "💓"
  }, {
    item = "💞",
    subText = "(revolving hearts) :revolving_hearts:",
    text = "💞"
  }, {
    item = "💕",
    subText = "(two hearts) :two_hearts:",
    text = "💕"
  }, {
    item = "💟",
    subText = "(heart decoration) :heart_decoration:",
    text = "💟"
  }, {
    item = "❣️",
    subText = "(heart exclamation) :heavy_heart_exclamation:",
    text = "❣️"
  }, {
    item = "💔",
    subText = "(broken heart) :broken_heart:",
    text = "💔"
  }, {
    item = "❤️",
    subText = "(red heart) :heart: #love",
    text = "❤️"
  }, {
    item = "🧡",
    subText = "(orange heart) :orange_heart:",
    text = "🧡"
  }, {
    item = "💛",
    subText = "(yellow heart) :yellow_heart:",
    text = "💛"
  }, {
    item = "💚",
    subText = "(green heart) :green_heart:",
    text = "💚"
  }, {
    item = "💙",
    subText = "(blue heart) :blue_heart:",
    text = "💙"
  }, {
    item = "💜",
    subText = "(purple heart) :purple_heart:",
    text = "💜"
  }, {
    item = "🤎",
    subText = "(brown heart) :brown_heart:",
    text = "🤎"
  }, {
    item = "🖤",
    subText = "(black heart) :black_heart:",
    text = "🖤"
  }, {
    item = "🤍",
    subText = "(white heart) :white_heart:",
    text = "🤍"
  }, {
    item = "💯",
    subText = "(hundred points) :100: #score #perfect",
    text = "💯"
  }, {
    item = "💢",
    subText = "(anger symbol) :anger: #angry",
    text = "💢"
  }, {
    item = "💥",
    subText = "(collision) :boom: :collision: #explode",
    text = "💥"
  }, {
    item = "💫",
    subText = "(dizzy) :dizzy: #star",
    text = "💫"
  }, {
    item = "💦",
    subText = "(sweat droplets) :sweat_drops: #water #workout",
    text = "💦"
  }, {
    item = "💨",
    subText = "(dashing away) :dash: #wind #blow #fast",
    text = "💨"
  }, {
    item = "🕳",
    subText = "(hole) :hole:",
    text = "🕳"
  }, {
    item = "💣",
    subText = "(bomb) :bomb: #boom",
    text = "💣"
  }, {
    item = "💬",
    subText = "(speech balloon) :speech_balloon: #comment",
    text = "💬"
  }, {
    item = "👁️‍🗨️",
    subText = "(eye in speech bubble) :eye_speech_bubble:",
    text = "👁️‍🗨️"
  }, {
    item = "🗨",
    subText = "(left speech bubble) :left_speech_bubble:",
    text = "🗨"
  }, {
    item = "🗯",
    subText = "(right anger bubble) :right_anger_bubble:",
    text = "🗯"
  }, {
    item = "💭",
    subText = "(thought balloon) :thought_balloon: #thinking",
    text = "💭"
  }, {
    item = "💤",
    subText = "(zzz) :zzz: #sleeping",
    text = "💤"
  }, {
    item = "👋",
    subText = "(waving hand) :wave: #goodbye",
    text = "👋"
  }, {
    item = "🤚",
    subText = "(raised back of hand) :raised_back_of_hand:",
    text = "🤚"
  }, {
    item = "🖐",
    subText = "(hand with fingers splayed) :raised_hand_with_fingers_splayed:",
    text = "🖐"
  }, {
    item = "✋",
    subText = "(raised hand) :hand: :raised_hand: #highfive #stop",
    text = "✋"
  }, {
    item = "🖖",
    subText = "(vulcan salute) :vulcan_salute: #prosper #spock",
    text = "🖖"
  }, {
    item = "👌",
    subText = "(OK hand) :ok_hand:",
    text = "👌"
  }, {
    item = "🤏",
    subText = "(pinching hand) :pinching_hand:",
    text = "🤏"
  }, {
    item = "✌️",
    subText = "(victory hand) :v: #victory #peace",
    text = "✌️"
  }, {
    item = "🤞",
    subText = "(crossed fingers) :crossed_fingers: #luck #hopeful",
    text = "🤞"
  }, {
    item = "🤟",
    subText = "(love-you gesture) :love_you_gesture:",
    text = "🤟"
  }, {
    item = "🤘",
    subText = "(sign of the horns) :metal:",
    text = "🤘"
  }, {
    item = "🤙",
    subText = "(call me hand) :call_me_hand:",
    text = "🤙"
  }, {
    item = "👈",
    subText = "(backhand index pointing left) :point_left:",
    text = "👈"
  }, {
    item = "👉",
    subText = "(backhand index pointing right) :point_right:",
    text = "👉"
  }, {
    item = "👆",
    subText = "(backhand index pointing up) :point_up_2:",
    text = "👆"
  }, {
    item = "🖕",
    subText = "(middle finger) :middle_finger: :fu:",
    text = "🖕"
  }, {
    item = "👇",
    subText = "(backhand index pointing down) :point_down:",
    text = "👇"
  }, {
    item = "☝️",
    subText = "(index pointing up) :point_up:",
    text = "☝️"
  }, {
    item = "👍",
    subText = "(thumbs up) :+1: :thumbsup: #approve #ok",
    text = "👍"
  }, {
    item = "👎",
    subText = "(thumbs down) :-1: :thumbsdown: #disapprove #bury",
    text = "👎"
  }, {
    item = "✊",
    subText = "(raised fist) :fist_raised: :fist: #power",
    text = "✊"
  }, {
    item = "👊",
    subText = "(oncoming fist) :fist_oncoming: :facepunch: :punch: #attack",
    text = "👊"
  }, {
    item = "🤛",
    subText = "(left-facing fist) :fist_left:",
    text = "🤛"
  }, {
    item = "🤜",
    subText = "(right-facing fist) :fist_right:",
    text = "🤜"
  }, {
    item = "👏",
    subText = "(clapping hands) :clap: #praise #applause",
    text = "👏"
  }, {
    item = "🙌",
    subText = "(raising hands) :raised_hands: #hooray",
    text = "🙌"
  }, {
    item = "👐",
    subText = "(open hands) :open_hands:",
    text = "👐"
  }, {
    item = "🤲",
    subText = "(palms up together) :palms_up_together:",
    text = "🤲"
  }, {
    item = "🤝",
    subText = "(handshake) :handshake: #deal",
    text = "🤝"
  }, {
    item = "🙏",
    subText = "(folded hands) :pray: #please #hope #wish",
    text = "🙏"
  }, {
    item = "✍️",
    subText = "(writing hand) :writing_hand:",
    text = "✍️"
  }, {
    item = "💅",
    subText = "(nail polish) :nail_care: #beauty #manicure",
    text = "💅"
  }, {
    item = "🤳",
    subText = "(selfie) :selfie:",
    text = "🤳"
  }, {
    item = "💪",
    subText = "(flexed biceps) :muscle: #flex #bicep #strong #workout",
    text = "💪"
  }, {
    item = "🦾",
    subText = "(mechanical arm) :mechanical_arm:",
    text = "🦾"
  }, {
    item = "🦿",
    subText = "(mechanical leg) :mechanical_leg:",
    text = "🦿"
  }, {
    item = "🦵",
    subText = "(leg) :leg:",
    text = "🦵"
  }, {
    item = "🦶",
    subText = "(foot) :foot:",
    text = "🦶"
  }, {
    item = "👂",
    subText = "(ear) :ear: #hear #sound #listen",
    text = "👂"
  }, {
    item = "🦻",
    subText = "(ear with hearing aid) :ear_with_hearing_aid:",
    text = "🦻"
  }, {
    item = "👃",
    subText = "(nose) :nose: #smell",
    text = "👃"
  }, {
    item = "🧠",
    subText = "(brain) :brain:",
    text = "🧠"
  }, {
    item = "🦷",
    subText = "(tooth) :tooth:",
    text = "🦷"
  }, {
    item = "🦴",
    subText = "(bone) :bone:",
    text = "🦴"
  }, {
    item = "👀",
    subText = "(eyes) :eyes: #look #see #watch",
    text = "👀"
  }, {
    item = "👁",
    subText = "(eye) :eye:",
    text = "👁"
  }, {
    item = "👅",
    subText = "(tongue) :tongue: #taste",
    text = "👅"
  }, {
    item = "👄",
    subText = "(mouth) :lips: #kiss",
    text = "👄"
  }, {
    item = "👶",
    subText = "(baby) :baby: #child #newborn",
    text = "👶"
  }, {
    item = "🧒",
    subText = "(child) :child:",
    text = "🧒"
  }, {
    item = "👦",
    subText = "(boy) :boy: #child",
    text = "👦"
  }, {
    item = "👧",
    subText = "(girl) :girl: #child",
    text = "👧"
  }, {
    item = "🧑",
    subText = "(person) :adult:",
    text = "🧑"
  }, {
    item = "👱",
    subText = "(person: blond hair) :blond_haired_person:",
    text = "👱"
  }, {
    item = "👨",
    subText = "(man) :man: #mustache #father #dad",
    text = "👨"
  }, {
    item = "🧔",
    subText = "(man: beard) :bearded_person:",
    text = "🧔"
  }, {
    item = "👱‍♂",
    subText = "(man: blond hair) :blond_haired_man:",
    text = "👱‍♂"
  }, {
    item = "👨‍🦰",
    subText = "(man: red hair) :red_haired_man:",
    text = "👨‍🦰"
  }, {
    item = "👨‍🦱",
    subText = "(man: curly hair) :curly_haired_man:",
    text = "👨‍🦱"
  }, {
    item = "👨‍🦳",
    subText = "(man: white hair) :white_haired_man:",
    text = "👨‍🦳"
  }, {
    item = "👨‍🦲",
    subText = "(man: bald) :bald_man:",
    text = "👨‍🦲"
  }, {
    item = "👩",
    subText = "(woman) :woman: #girls",
    text = "👩"
  }, {
    item = "👱‍♀",
    subText = "(woman: blond hair) :blond_haired_woman: :blonde_woman:",
    text = "👱‍♀"
  }, {
    item = "👩‍🦰",
    subText = "(woman: red hair) :red_haired_woman:",
    text = "👩‍🦰"
  }, {
    item = "👩‍🦱",
    subText = "(woman: curly hair) :curly_haired_woman:",
    text = "👩‍🦱"
  }, {
    item = "👩‍🦳",
    subText = "(woman: white hair) :white_haired_woman:",
    text = "👩‍🦳"
  }, {
    item = "👩‍🦲",
    subText = "(woman: bald) :bald_woman:",
    text = "👩‍🦲"
  }, {
    item = "🧓",
    subText = "(older person) :older_adult:",
    text = "🧓"
  }, {
    item = "👴",
    subText = "(old man) :older_man:",
    text = "👴"
  }, {
    item = "👵",
    subText = "(old woman) :older_woman:",
    text = "👵"
  }, {
    item = "🙍",
    subText = "(person frowning) :frowning_person:",
    text = "🙍"
  }, {
    item = "🙍‍♂",
    subText = "(man frowning) :frowning_man:",
    text = "🙍‍♂"
  }, {
    item = "🙍‍♀",
    subText = "(woman frowning) :frowning_woman:",
    text = "🙍‍♀"
  }, {
    item = "🙎",
    subText = "(person pouting) :pouting_face:",
    text = "🙎"
  }, {
    item = "🙎‍♂",
    subText = "(man pouting) :pouting_man:",
    text = "🙎‍♂"
  }, {
    item = "🙎‍♀",
    subText = "(woman pouting) :pouting_woman:",
    text = "🙎‍♀"
  }, {
    item = "🙅",
    subText = "(person gesturing NO) :no_good: #stop #halt #denied",
    text = "🙅"
  }, {
    item = "🙅‍♂",
    subText = "(man gesturing NO) :no_good_man: :ng_man: #stop #halt #denied",
    text = "🙅‍♂"
  }, {
    item = "🙅‍♀",
    subText = "(woman gesturing NO) :no_good_woman: :ng_woman: #stop #halt #denied",
    text = "🙅‍♀"
  }, {
    item = "🙆",
    subText = "(person gesturing OK) :ok_person:",
    text = "🙆"
  }, {
    item = "🙆‍♂",
    subText = "(man gesturing OK) :ok_man:",
    text = "🙆‍♂"
  }, {
    item = "🙆‍♀",
    subText = "(woman gesturing OK) :ok_woman:",
    text = "🙆‍♀"
  }, {
    item = "💁",
    subText = "(person tipping hand) :tipping_hand_person: :information_desk_person:",
    text = "💁"
  }, {
    item = "💁‍♂",
    subText = "(man tipping hand) :tipping_hand_man: :sassy_man: #information",
    text = "💁‍♂"
  }, {
    item = "💁‍♀",
    subText = "(woman tipping hand) :tipping_hand_woman: :sassy_woman: #information",
    text = "💁‍♀"
  }, {
    item = "🙋",
    subText = "(person raising hand) :raising_hand:",
    text = "🙋"
  }, {
    item = "🙋‍♂",
    subText = "(man raising hand) :raising_hand_man:",
    text = "🙋‍♂"
  }, {
    item = "🙋‍♀",
    subText = "(woman raising hand) :raising_hand_woman:",
    text = "🙋‍♀"
  }, {
    item = "🧏",
    subText = "(deaf person) :deaf_person:",
    text = "🧏"
  }, {
    item = "🧏‍♂",
    subText = "(deaf man) :deaf_man:",
    text = "🧏‍♂"
  }, {
    item = "🧏‍♀",
    subText = "(deaf woman) :deaf_woman:",
    text = "🧏‍♀"
  }, {
    item = "🙇",
    subText = "(person bowing) :bow: #respect #thanks",
    text = "🙇"
  }, {
    item = "🙇‍♂",
    subText = "(man bowing) :bowing_man: #respect #thanks",
    text = "🙇‍♂"
  }, {
    item = "🙇‍♀",
    subText = "(woman bowing) :bowing_woman: #respect #thanks",
    text = "🙇‍♀"
  }, {
    item = "🤦",
    subText = "(person facepalming) :facepalm:",
    text = "🤦"
  }, {
    item = "🤦‍♂",
    subText = "(man facepalming) :man_facepalming:",
    text = "🤦‍♂"
  }, {
    item = "🤦‍♀",
    subText = "(woman facepalming) :woman_facepalming:",
    text = "🤦‍♀"
  }, {
    item = "🤷",
    subText = "(person shrugging) :shrug:",
    text = "🤷"
  }, {
    item = "🤷‍♂",
    subText = "(man shrugging) :man_shrugging:",
    text = "🤷‍♂"
  }, {
    item = "🤷‍♀",
    subText = "(woman shrugging) :woman_shrugging:",
    text = "🤷‍♀"
  }, {
    item = "👨‍⚕",
    subText = "(man health worker) :man_health_worker: #doctor #nurse",
    text = "👨‍⚕"
  }, {
    item = "👩‍⚕",
    subText = "(woman health worker) :woman_health_worker: #doctor #nurse",
    text = "👩‍⚕"
  }, {
    item = "👨‍🎓",
    subText = "(man student) :man_student: #graduation",
    text = "👨‍🎓"
  }, {
    item = "👩‍🎓",
    subText = "(woman student) :woman_student: #graduation",
    text = "👩‍🎓"
  }, {
    item = "👨‍🏫",
    subText = "(man teacher) :man_teacher: #school #professor",
    text = "👨‍🏫"
  }, {
    item = "👩‍🏫",
    subText = "(woman teacher) :woman_teacher: #school #professor",
    text = "👩‍🏫"
  }, {
    item = "👨‍⚖",
    subText = "(man judge) :man_judge: #justice",
    text = "👨‍⚖"
  }, {
    item = "👩‍⚖",
    subText = "(woman judge) :woman_judge: #justice",
    text = "👩‍⚖"
  }, {
    item = "👨‍🌾",
    subText = "(man farmer) :man_farmer:",
    text = "👨‍🌾"
  }, {
    item = "👩‍🌾",
    subText = "(woman farmer) :woman_farmer:",
    text = "👩‍🌾"
  }, {
    item = "👨‍🍳",
    subText = "(man cook) :man_cook: #chef",
    text = "👨‍🍳"
  }, {
    item = "👩‍🍳",
    subText = "(woman cook) :woman_cook: #chef",
    text = "👩‍🍳"
  }, {
    item = "👨‍🔧",
    subText = "(man mechanic) :man_mechanic:",
    text = "👨‍🔧"
  }, {
    item = "👩‍🔧",
    subText = "(woman mechanic) :woman_mechanic:",
    text = "👩‍🔧"
  }, {
    item = "👨‍🏭",
    subText = "(man factory worker) :man_factory_worker:",
    text = "👨‍🏭"
  }, {
    item = "👩‍🏭",
    subText = "(woman factory worker) :woman_factory_worker:",
    text = "👩‍🏭"
  }, {
    item = "👨‍💼",
    subText = "(man office worker) :man_office_worker: #business",
    text = "👨‍💼"
  }, {
    item = "👩‍💼",
    subText = "(woman office worker) :woman_office_worker: #business",
    text = "👩‍💼"
  }, {
    item = "👨‍🔬",
    subText = "(man scientist) :man_scientist: #research",
    text = "👨‍🔬"
  }, {
    item = "👩‍🔬",
    subText = "(woman scientist) :woman_scientist: #research",
    text = "👩‍🔬"
  }, {
    item = "👨‍💻",
    subText = "(man technologist) :man_technologist: #coder",
    text = "👨‍💻"
  }, {
    item = "👩‍💻",
    subText = "(woman technologist) :woman_technologist: #coder",
    text = "👩‍💻"
  }, {
    item = "👨‍🎤",
    subText = "(man singer) :man_singer: #rockstar",
    text = "👨‍🎤"
  }, {
    item = "👩‍🎤",
    subText = "(woman singer) :woman_singer: #rockstar",
    text = "👩‍🎤"
  }, {
    item = "👨‍🎨",
    subText = "(man artist) :man_artist: #painter",
    text = "👨‍🎨"
  }, {
    item = "👩‍🎨",
    subText = "(woman artist) :woman_artist: #painter",
    text = "👩‍🎨"
  }, {
    item = "👨‍✈",
    subText = "(man pilot) :man_pilot:",
    text = "👨‍✈"
  }, {
    item = "👩‍✈",
    subText = "(woman pilot) :woman_pilot:",
    text = "👩‍✈"
  }, {
    item = "👨‍🚀",
    subText = "(man astronaut) :man_astronaut: #space",
    text = "👨‍🚀"
  }, {
    item = "👩‍🚀",
    subText = "(woman astronaut) :woman_astronaut: #space",
    text = "👩‍🚀"
  }, {
    item = "👨‍🚒",
    subText = "(man firefighter) :man_firefighter:",
    text = "👨‍🚒"
  }, {
    item = "👩‍🚒",
    subText = "(woman firefighter) :woman_firefighter:",
    text = "👩‍🚒"
  }, {
    item = "👮",
    subText = "(police officer) :police_officer: :cop: #law",
    text = "👮"
  }, {
    item = "👮‍♂",
    subText = "(man police officer) :policeman: #law #cop",
    text = "👮‍♂"
  }, {
    item = "👮‍♀",
    subText = "(woman police officer) :policewoman: #law #cop",
    text = "👮‍♀"
  }, {
    item = "🕵",
    subText = "(detective) :detective: #sleuth",
    text = "🕵"
  }, {
    item = "🕵️‍♂️",
    subText = "(man detective) :male_detective: #sleuth",
    text = "🕵️‍♂️"
  }, {
    item = "🕵️‍♀️",
    subText = "(woman detective) :female_detective: #sleuth",
    text = "🕵️‍♀️"
  }, {
    item = "💂",
    subText = "(guard) :guard:",
    text = "💂"
  }, {
    item = "💂‍♂",
    subText = "(man guard) :guardsman:",
    text = "💂‍♂"
  }, {
    item = "💂‍♀",
    subText = "(woman guard) :guardswoman:",
    text = "💂‍♀"
  }, {
    item = "👷",
    subText = "(construction worker) :construction_worker: #helmet",
    text = "👷"
  }, {
    item = "👷‍♂",
    subText = "(man construction worker) :construction_worker_man: #helmet",
    text = "👷‍♂"
  }, {
    item = "👷‍♀",
    subText = "(woman construction worker) :construction_worker_woman: #helmet",
    text = "👷‍♀"
  }, {
    item = "🤴",
    subText = "(prince) :prince: #crown #royal",
    text = "🤴"
  }, {
    item = "👸",
    subText = "(princess) :princess: #crown #royal",
    text = "👸"
  }, {
    item = "👳",
    subText = "(person wearing turban) :person_with_turban:",
    text = "👳"
  }, {
    item = "👳‍♂",
    subText = "(man wearing turban) :man_with_turban:",
    text = "👳‍♂"
  }, {
    item = "👳‍♀",
    subText = "(woman wearing turban) :woman_with_turban:",
    text = "👳‍♀"
  }, {
    item = "👲",
    subText = "(man with Chinese cap) :man_with_gua_pi_mao:",
    text = "👲"
  }, {
    item = "🧕",
    subText = "(woman with headscarf) :woman_with_headscarf: #hijab",
    text = "🧕"
  }, {
    item = "🤵",
    subText = "(man in tuxedo) :man_in_tuxedo: #groom #marriage #wedding",
    text = "🤵"
  }, {
    item = "👰",
    subText = "(bride with veil) :bride_with_veil: #marriage #wedding",
    text = "👰"
  }, {
    item = "🤰",
    subText = "(pregnant woman) :pregnant_woman:",
    text = "🤰"
  }, {
    item = "🤱",
    subText = "(breast-feeding) :breast_feeding: #nursing",
    text = "🤱"
  }, {
    item = "👼",
    subText = "(baby angel) :angel:",
    text = "👼"
  }, {
    item = "🎅",
    subText = "(Santa Claus) :santa: #christmas",
    text = "🎅"
  }, {
    item = "🤶",
    subText = "(Mrs. Claus) :mrs_claus: #santa",
    text = "🤶"
  }, {
    item = "🦸",
    subText = "(superhero) :superhero:",
    text = "🦸"
  }, {
    item = "🦸‍♂",
    subText = "(man superhero) :superhero_man:",
    text = "🦸‍♂"
  }, {
    item = "🦸‍♀",
    subText = "(woman superhero) :superhero_woman:",
    text = "🦸‍♀"
  }, {
    item = "🦹",
    subText = "(supervillain) :supervillain:",
    text = "🦹"
  }, {
    item = "🦹‍♂",
    subText = "(man supervillain) :supervillain_man:",
    text = "🦹‍♂"
  }, {
    item = "🦹‍♀",
    subText = "(woman supervillain) :supervillain_woman:",
    text = "🦹‍♀"
  }, {
    item = "🧙",
    subText = "(mage) :mage: #wizard",
    text = "🧙"
  }, {
    item = "🧙‍♂",
    subText = "(man mage) :mage_man: #wizard",
    text = "🧙‍♂"
  }, {
    item = "🧙‍♀",
    subText = "(woman mage) :mage_woman: #wizard",
    text = "🧙‍♀"
  }, {
    item = "🧚",
    subText = "(fairy) :fairy:",
    text = "🧚"
  }, {
    item = "🧚‍♂",
    subText = "(man fairy) :fairy_man:",
    text = "🧚‍♂"
  }, {
    item = "🧚‍♀",
    subText = "(woman fairy) :fairy_woman:",
    text = "🧚‍♀"
  }, {
    item = "🧛",
    subText = "(vampire) :vampire:",
    text = "🧛"
  }, {
    item = "🧛‍♂",
    subText = "(man vampire) :vampire_man:",
    text = "🧛‍♂"
  }, {
    item = "🧛‍♀",
    subText = "(woman vampire) :vampire_woman:",
    text = "🧛‍♀"
  }, {
    item = "🧜",
    subText = "(merperson) :merperson:",
    text = "🧜"
  }, {
    item = "🧜‍♂",
    subText = "(merman) :merman:",
    text = "🧜‍♂"
  }, {
    item = "🧜‍♀",
    subText = "(mermaid) :mermaid:",
    text = "🧜‍♀"
  }, {
    item = "🧝",
    subText = "(elf) :elf:",
    text = "🧝"
  }, {
    item = "🧝‍♂",
    subText = "(man elf) :elf_man:",
    text = "🧝‍♂"
  }, {
    item = "🧝‍♀",
    subText = "(woman elf) :elf_woman:",
    text = "🧝‍♀"
  }, {
    item = "🧞",
    subText = "(genie) :genie:",
    text = "🧞"
  }, {
    item = "🧞‍♂",
    subText = "(man genie) :genie_man:",
    text = "🧞‍♂"
  }, {
    item = "🧞‍♀",
    subText = "(woman genie) :genie_woman:",
    text = "🧞‍♀"
  }, {
    item = "🧟",
    subText = "(zombie) :zombie:",
    text = "🧟"
  }, {
    item = "🧟‍♂",
    subText = "(man zombie) :zombie_man:",
    text = "🧟‍♂"
  }, {
    item = "🧟‍♀",
    subText = "(woman zombie) :zombie_woman:",
    text = "🧟‍♀"
  }, {
    item = "💆",
    subText = "(person getting massage) :massage: #spa",
    text = "💆"
  }, {
    item = "💆‍♂",
    subText = "(man getting massage) :massage_man: #spa",
    text = "💆‍♂"
  }, {
    item = "💆‍♀",
    subText = "(woman getting massage) :massage_woman: #spa",
    text = "💆‍♀"
  }, {
    item = "💇",
    subText = "(person getting haircut) :haircut: #beauty",
    text = "💇"
  }, {
    item = "💇‍♂",
    subText = "(man getting haircut) :haircut_man:",
    text = "💇‍♂"
  }, {
    item = "💇‍♀",
    subText = "(woman getting haircut) :haircut_woman:",
    text = "💇‍♀"
  }, {
    item = "🚶",
    subText = "(person walking) :walking:",
    text = "🚶"
  }, {
    item = "🚶‍♂",
    subText = "(man walking) :walking_man:",
    text = "🚶‍♂"
  }, {
    item = "🚶‍♀",
    subText = "(woman walking) :walking_woman:",
    text = "🚶‍♀"
  }, {
    item = "🧍",
    subText = "(person standing) :standing_person:",
    text = "🧍"
  }, {
    item = "🧍‍♂",
    subText = "(man standing) :standing_man:",
    text = "🧍‍♂"
  }, {
    item = "🧍‍♀",
    subText = "(woman standing) :standing_woman:",
    text = "🧍‍♀"
  }, {
    item = "🧎",
    subText = "(person kneeling) :kneeling_person:",
    text = "🧎"
  }, {
    item = "🧎‍♂",
    subText = "(man kneeling) :kneeling_man:",
    text = "🧎‍♂"
  }, {
    item = "🧎‍♀",
    subText = "(woman kneeling) :kneeling_woman:",
    text = "🧎‍♀"
  }, {
    item = "👨‍🦯",
    subText = "(man with probing cane) :man_with_probing_cane:",
    text = "👨‍🦯"
  }, {
    item = "👩‍🦯",
    subText = "(woman with probing cane) :woman_with_probing_cane:",
    text = "👩‍🦯"
  }, {
    item = "👨‍🦼",
    subText = "(man in motorized wheelchair) :man_in_motorized_wheelchair:",
    text = "👨‍🦼"
  }, {
    item = "👩‍🦼",
    subText = "(woman in motorized wheelchair) :woman_in_motorized_wheelchair:",
    text = "👩‍🦼"
  }, {
    item = "👨‍🦽",
    subText = "(man in manual wheelchair) :man_in_manual_wheelchair:",
    text = "👨‍🦽"
  }, {
    item = "👩‍🦽",
    subText = "(woman in manual wheelchair) :woman_in_manual_wheelchair:",
    text = "👩‍🦽"
  }, {
    item = "🏃",
    subText = "(person running) :runner: :running: #exercise #workout #marathon",
    text = "🏃"
  }, {
    item = "🏃‍♂",
    subText = "(man running) :running_man: #exercise #workout #marathon",
    text = "🏃‍♂"
  }, {
    item = "🏃‍♀",
    subText = "(woman running) :running_woman: #exercise #workout #marathon",
    text = "🏃‍♀"
  }, {
    item = "💃",
    subText = "(woman dancing) :woman_dancing: :dancer: #dress",
    text = "💃"
  }, {
    item = "🕺",
    subText = "(man dancing) :man_dancing: #dancer",
    text = "🕺"
  }, {
    item = "🕴",
    subText = "(man in suit levitating) :business_suit_levitating:",
    text = "🕴"
  }, {
    item = "👯",
    subText = "(people with bunny ears) :dancers: #bunny",
    text = "👯"
  }, {
    item = "👯‍♂",
    subText = "(men with bunny ears) :dancing_men: #bunny",
    text = "👯‍♂"
  }, {
    item = "👯‍♀",
    subText = "(women with bunny ears) :dancing_women: #bunny",
    text = "👯‍♀"
  }, {
    item = "🧖",
    subText = "(person in steamy room) :sauna_person: #steamy",
    text = "🧖"
  }, {
    item = "🧖‍♂",
    subText = "(man in steamy room) :sauna_man: #steamy",
    text = "🧖‍♂"
  }, {
    item = "🧖‍♀",
    subText = "(woman in steamy room) :sauna_woman: #steamy",
    text = "🧖‍♀"
  }, {
    item = "🧗",
    subText = "(person climbing) :climbing: #bouldering",
    text = "🧗"
  }, {
    item = "🧗‍♂",
    subText = "(man climbing) :climbing_man: #bouldering",
    text = "🧗‍♂"
  }, {
    item = "🧗‍♀",
    subText = "(woman climbing) :climbing_woman: #bouldering",
    text = "🧗‍♀"
  }, {
    item = "🤺",
    subText = "(person fencing) :person_fencing:",
    text = "🤺"
  }, {
    item = "🏇",
    subText = "(horse racing) :horse_racing:",
    text = "🏇"
  }, {
    item = "⛷",
    subText = "(skier) :skier:",
    text = "⛷"
  }, {
    item = "🏂",
    subText = "(snowboarder) :snowboarder:",
    text = "🏂"
  }, {
    item = "🏌",
    subText = "(person golfing) :golfing:",
    text = "🏌"
  }, {
    item = "🏌️‍♂️",
    subText = "(man golfing) :golfing_man:",
    text = "🏌️‍♂️"
  }, {
    item = "🏌️‍♀️",
    subText = "(woman golfing) :golfing_woman:",
    text = "🏌️‍♀️"
  }, {
    item = "🏄",
    subText = "(person surfing) :surfer:",
    text = "🏄"
  }, {
    item = "🏄‍♂",
    subText = "(man surfing) :surfing_man:",
    text = "🏄‍♂"
  }, {
    item = "🏄‍♀",
    subText = "(woman surfing) :surfing_woman:",
    text = "🏄‍♀"
  }, {
    item = "🚣",
    subText = "(person rowing boat) :rowboat:",
    text = "🚣"
  }, {
    item = "🚣‍♂",
    subText = "(man rowing boat) :rowing_man:",
    text = "🚣‍♂"
  }, {
    item = "🚣‍♀",
    subText = "(woman rowing boat) :rowing_woman:",
    text = "🚣‍♀"
  }, {
    item = "🏊",
    subText = "(person swimming) :swimmer:",
    text = "🏊"
  }, {
    item = "🏊‍♂",
    subText = "(man swimming) :swimming_man:",
    text = "🏊‍♂"
  }, {
    item = "🏊‍♀",
    subText = "(woman swimming) :swimming_woman:",
    text = "🏊‍♀"
  }, {
    item = "⛹",
    subText = "(person bouncing ball) :bouncing_ball_person: #basketball",
    text = "⛹"
  }, {
    item = "⛹️‍♂️",
    subText = "(man bouncing ball) :bouncing_ball_man: :basketball_man:",
    text = "⛹️‍♂️"
  }, {
    item = "⛹️‍♀️",
    subText = "(woman bouncing ball) :bouncing_ball_woman: :basketball_woman:",
    text = "⛹️‍♀️"
  }, {
    item = "🏋",
    subText = "(person lifting weights) :weight_lifting: #gym #workout",
    text = "🏋"
  }, {
    item = "🏋️‍♂️",
    subText = "(man lifting weights) :weight_lifting_man: #gym #workout",
    text = "🏋️‍♂️"
  }, {
    item = "🏋️‍♀️",
    subText = "(woman lifting weights) :weight_lifting_woman: #gym #workout",
    text = "🏋️‍♀️"
  }, {
    item = "🚴",
    subText = "(person biking) :bicyclist:",
    text = "🚴"
  }, {
    item = "🚴‍♂",
    subText = "(man biking) :biking_man:",
    text = "🚴‍♂"
  }, {
    item = "🚴‍♀",
    subText = "(woman biking) :biking_woman:",
    text = "🚴‍♀"
  }, {
    item = "🚵",
    subText = "(person mountain biking) :mountain_bicyclist:",
    text = "🚵"
  }, {
    item = "🚵‍♂",
    subText = "(man mountain biking) :mountain_biking_man:",
    text = "🚵‍♂"
  }, {
    item = "🚵‍♀",
    subText = "(woman mountain biking) :mountain_biking_woman:",
    text = "🚵‍♀"
  }, {
    item = "🤸",
    subText = "(person cartwheeling) :cartwheeling:",
    text = "🤸"
  }, {
    item = "🤸‍♂",
    subText = "(man cartwheeling) :man_cartwheeling:",
    text = "🤸‍♂"
  }, {
    item = "🤸‍♀",
    subText = "(woman cartwheeling) :woman_cartwheeling:",
    text = "🤸‍♀"
  }, {
    item = "🤼",
    subText = "(people wrestling) :wrestling:",
    text = "🤼"
  }, {
    item = "🤼‍♂",
    subText = "(men wrestling) :men_wrestling:",
    text = "🤼‍♂"
  }, {
    item = "🤼‍♀",
    subText = "(women wrestling) :women_wrestling:",
    text = "🤼‍♀"
  }, {
    item = "🤽",
    subText = "(person playing water polo) :water_polo:",
    text = "🤽"
  }, {
    item = "🤽‍♂",
    subText = "(man playing water polo) :man_playing_water_polo:",
    text = "🤽‍♂"
  }, {
    item = "🤽‍♀",
    subText = "(woman playing water polo) :woman_playing_water_polo:",
    text = "🤽‍♀"
  }, {
    item = "🤾",
    subText = "(person playing handball) :handball_person:",
    text = "🤾"
  }, {
    item = "🤾‍♂",
    subText = "(man playing handball) :man_playing_handball:",
    text = "🤾‍♂"
  }, {
    item = "🤾‍♀",
    subText = "(woman playing handball) :woman_playing_handball:",
    text = "🤾‍♀"
  }, {
    item = "🤹",
    subText = "(person juggling) :juggling_person:",
    text = "🤹"
  }, {
    item = "🤹‍♂",
    subText = "(man juggling) :man_juggling:",
    text = "🤹‍♂"
  }, {
    item = "🤹‍♀",
    subText = "(woman juggling) :woman_juggling:",
    text = "🤹‍♀"
  }, {
    item = "🧘",
    subText = "(person in lotus position) :lotus_position: #meditation",
    text = "🧘"
  }, {
    item = "🧘‍♂",
    subText = "(man in lotus position) :lotus_position_man: #meditation",
    text = "🧘‍♂"
  }, {
    item = "🧘‍♀",
    subText = "(woman in lotus position) :lotus_position_woman: #meditation",
    text = "🧘‍♀"
  }, {
    item = "🛀",
    subText = "(person taking bath) :bath: #shower",
    text = "🛀"
  }, {
    item = "🛌",
    subText = "(person in bed) :sleeping_bed:",
    text = "🛌"
  }, {
    item = "🧑‍🤝‍🧑",
    subText = "(people holding hands) :people_holding_hands: #couple #date",
    text = "🧑‍🤝‍🧑"
  }, {
    item = "👭",
    subText = "(women holding hands) :two_women_holding_hands: #couple #date",
    text = "👭"
  }, {
    item = "👫",
    subText = "(woman and man holding hands) :couple: #date",
    text = "👫"
  }, {
    item = "👬",
    subText = "(men holding hands) :two_men_holding_hands: #couple #date",
    text = "👬"
  }, {
    item = "💏",
    subText = "(kiss) :couplekiss:",
    text = "💏"
  }, {
    item = "👩‍❤️‍💋‍👨",
    subText = "(kiss: woman, man) :couplekiss_man_woman:",
    text = "👩‍❤️‍💋‍👨"
  }, {
    item = "👨‍❤️‍💋‍👨",
    subText = "(kiss: man, man) :couplekiss_man_man:",
    text = "👨‍❤️‍💋‍👨"
  }, {
    item = "👩‍❤️‍💋‍👩",
    subText = "(kiss: woman, woman) :couplekiss_woman_woman:",
    text = "👩‍❤️‍💋‍👩"
  }, {
    item = "💑",
    subText = "(couple with heart) :couple_with_heart:",
    text = "💑"
  }, {
    item = "👩‍❤️‍👨",
    subText = "(couple with heart: woman, man) :couple_with_heart_woman_man:",
    text = "👩‍❤️‍👨"
  }, {
    item = "👨‍❤️‍👨",
    subText = "(couple with heart: man, man) :couple_with_heart_man_man:",
    text = "👨‍❤️‍👨"
  }, {
    item = "👩‍❤️‍👩",
    subText = "(couple with heart: woman, woman) :couple_with_heart_woman_woman:",
    text = "👩‍❤️‍👩"
  }, {
    item = "👪",
    subText = "(family) :family: #home #parents #child",
    text = "👪"
  }, {
    item = "👨‍👩‍👦",
    subText = "(family: man, woman, boy) :family_man_woman_boy:",
    text = "👨‍👩‍👦"
  }, {
    item = "👨‍👩‍👧",
    subText = "(family: man, woman, girl) :family_man_woman_girl:",
    text = "👨‍👩‍👧"
  }, {
    item = "👨‍👩‍👧‍👦",
    subText = "(family: man, woman, girl, boy) :family_man_woman_girl_boy:",
    text = "👨‍👩‍👧‍👦"
  }, {
    item = "👨‍👩‍👦‍👦",
    subText = "(family: man, woman, boy, boy) :family_man_woman_boy_boy:",
    text = "👨‍👩‍👦‍👦"
  }, {
    item = "👨‍👩‍👧‍👧",
    subText = "(family: man, woman, girl, girl) :family_man_woman_girl_girl:",
    text = "👨‍👩‍👧‍👧"
  }, {
    item = "👨‍👨‍👦",
    subText = "(family: man, man, boy) :family_man_man_boy:",
    text = "👨‍👨‍👦"
  }, {
    item = "👨‍👨‍👧",
    subText = "(family: man, man, girl) :family_man_man_girl:",
    text = "👨‍👨‍👧"
  }, {
    item = "👨‍👨‍👧‍👦",
    subText = "(family: man, man, girl, boy) :family_man_man_girl_boy:",
    text = "👨‍👨‍👧‍👦"
  }, {
    item = "👨‍👨‍👦‍👦",
    subText = "(family: man, man, boy, boy) :family_man_man_boy_boy:",
    text = "👨‍👨‍👦‍👦"
  }, {
    item = "👨‍👨‍👧‍👧",
    subText = "(family: man, man, girl, girl) :family_man_man_girl_girl:",
    text = "👨‍👨‍👧‍👧"
  }, {
    item = "👩‍👩‍👦",
    subText = "(family: woman, woman, boy) :family_woman_woman_boy:",
    text = "👩‍👩‍👦"
  }, {
    item = "👩‍👩‍👧",
    subText = "(family: woman, woman, girl) :family_woman_woman_girl:",
    text = "👩‍👩‍👧"
  }, {
    item = "👩‍👩‍👧‍👦",
    subText = "(family: woman, woman, girl, boy) :family_woman_woman_girl_boy:",
    text = "👩‍👩‍👧‍👦"
  }, {
    item = "👩‍👩‍👦‍👦",
    subText = "(family: woman, woman, boy, boy) :family_woman_woman_boy_boy:",
    text = "👩‍👩‍👦‍👦"
  }, {
    item = "👩‍👩‍👧‍👧",
    subText = "(family: woman, woman, girl, girl) :family_woman_woman_girl_girl:",
    text = "👩‍👩‍👧‍👧"
  }, {
    item = "👨‍👦",
    subText = "(family: man, boy) :family_man_boy:",
    text = "👨‍👦"
  }, {
    item = "👨‍👦‍👦",
    subText = "(family: man, boy, boy) :family_man_boy_boy:",
    text = "👨‍👦‍👦"
  }, {
    item = "👨‍👧",
    subText = "(family: man, girl) :family_man_girl:",
    text = "👨‍👧"
  }, {
    item = "👨‍👧‍👦",
    subText = "(family: man, girl, boy) :family_man_girl_boy:",
    text = "👨‍👧‍👦"
  }, {
    item = "👨‍👧‍👧",
    subText = "(family: man, girl, girl) :family_man_girl_girl:",
    text = "👨‍👧‍👧"
  }, {
    item = "👩‍👦",
    subText = "(family: woman, boy) :family_woman_boy:",
    text = "👩‍👦"
  }, {
    item = "👩‍👦‍👦",
    subText = "(family: woman, boy, boy) :family_woman_boy_boy:",
    text = "👩‍👦‍👦"
  }, {
    item = "👩‍👧",
    subText = "(family: woman, girl) :family_woman_girl:",
    text = "👩‍👧"
  }, {
    item = "👩‍👧‍👦",
    subText = "(family: woman, girl, boy) :family_woman_girl_boy:",
    text = "👩‍👧‍👦"
  }, {
    item = "👩‍👧‍👧",
    subText = "(family: woman, girl, girl) :family_woman_girl_girl:",
    text = "👩‍👧‍👧"
  }, {
    item = "🗣",
    subText = "(speaking head) :speaking_head:",
    text = "🗣"
  }, {
    item = "👤",
    subText = "(bust in silhouette) :bust_in_silhouette: #user",
    text = "👤"
  }, {
    item = "👥",
    subText = "(busts in silhouette) :busts_in_silhouette: #users #group #team",
    text = "👥"
  }, {
    item = "👣",
    subText = "(footprints) :footprints: #feet #tracks",
    text = "👣"
  }, {
    item = "🐵",
    subText = "(monkey face) :monkey_face:",
    text = "🐵"
  }, {
    item = "🐒",
    subText = "(monkey) :monkey:",
    text = "🐒"
  }, {
    item = "🦍",
    subText = "(gorilla) :gorilla:",
    text = "🦍"
  }, {
    item = "🦧",
    subText = "(orangutan) :orangutan:",
    text = "🦧"
  }, {
    item = "🐶",
    subText = "(dog face) :dog: #pet",
    text = "🐶"
  }, {
    item = "🐕",
    subText = "(dog) :dog2:",
    text = "🐕"
  }, {
    item = "🦮",
    subText = "(guide dog) :guide_dog:",
    text = "🦮"
  }, {
    item = "🐕‍🦺",
    subText = "(service dog) :service_dog:",
    text = "🐕‍🦺"
  }, {
    item = "🐩",
    subText = "(poodle) :poodle: #dog",
    text = "🐩"
  }, {
    item = "🐺",
    subText = "(wolf) :wolf:",
    text = "🐺"
  }, {
    item = "🦊",
    subText = "(fox) :fox_face:",
    text = "🦊"
  }, {
    item = "🦝",
    subText = "(raccoon) :raccoon:",
    text = "🦝"
  }, {
    item = "🐱",
    subText = "(cat face) :cat: #pet",
    text = "🐱"
  }, {
    item = "🐈",
    subText = "(cat) :cat2:",
    text = "🐈"
  }, {
    item = "🦁",
    subText = "(lion) :lion:",
    text = "🦁"
  }, {
    item = "🐯",
    subText = "(tiger face) :tiger:",
    text = "🐯"
  }, {
    item = "🐅",
    subText = "(tiger) :tiger2:",
    text = "🐅"
  }, {
    item = "🐆",
    subText = "(leopard) :leopard:",
    text = "🐆"
  }, {
    item = "🐴",
    subText = "(horse face) :horse:",
    text = "🐴"
  }, {
    item = "🐎",
    subText = "(horse) :racehorse: #speed",
    text = "🐎"
  }, {
    item = "🦄",
    subText = "(unicorn) :unicorn:",
    text = "🦄"
  }, {
    item = "🦓",
    subText = "(zebra) :zebra:",
    text = "🦓"
  }, {
    item = "🦌",
    subText = "(deer) :deer:",
    text = "🦌"
  }, {
    item = "🐮",
    subText = "(cow face) :cow:",
    text = "🐮"
  }, {
    item = "🐂",
    subText = "(ox) :ox:",
    text = "🐂"
  }, {
    item = "🐃",
    subText = "(water buffalo) :water_buffalo:",
    text = "🐃"
  }, {
    item = "🐄",
    subText = "(cow) :cow2:",
    text = "🐄"
  }, {
    item = "🐷",
    subText = "(pig face) :pig:",
    text = "🐷"
  }, {
    item = "🐖",
    subText = "(pig) :pig2:",
    text = "🐖"
  }, {
    item = "🐗",
    subText = "(boar) :boar:",
    text = "🐗"
  }, {
    item = "🐽",
    subText = "(pig nose) :pig_nose:",
    text = "🐽"
  }, {
    item = "🐏",
    subText = "(ram) :ram:",
    text = "🐏"
  }, {
    item = "🐑",
    subText = "(ewe) :sheep:",
    text = "🐑"
  }, {
    item = "🐐",
    subText = "(goat) :goat:",
    text = "🐐"
  }, {
    item = "🐪",
    subText = "(camel) :dromedary_camel: #desert",
    text = "🐪"
  }, {
    item = "🐫",
    subText = "(two-hump camel) :camel:",
    text = "🐫"
  }, {
    item = "🦙",
    subText = "(llama) :llama:",
    text = "🦙"
  }, {
    item = "🦒",
    subText = "(giraffe) :giraffe:",
    text = "🦒"
  }, {
    item = "🐘",
    subText = "(elephant) :elephant:",
    text = "🐘"
  }, {
    item = "🦏",
    subText = "(rhinoceros) :rhinoceros:",
    text = "🦏"
  }, {
    item = "🦛",
    subText = "(hippopotamus) :hippopotamus:",
    text = "🦛"
  }, {
    item = "🐭",
    subText = "(mouse face) :mouse:",
    text = "🐭"
  }, {
    item = "🐁",
    subText = "(mouse) :mouse2:",
    text = "🐁"
  }, {
    item = "🐀",
    subText = "(rat) :rat:",
    text = "🐀"
  }, {
    item = "🐹",
    subText = "(hamster) :hamster: #pet",
    text = "🐹"
  }, {
    item = "🐰",
    subText = "(rabbit face) :rabbit: #bunny",
    text = "🐰"
  }, {
    item = "🐇",
    subText = "(rabbit) :rabbit2:",
    text = "🐇"
  }, {
    item = "🐿",
    subText = "(chipmunk) :chipmunk:",
    text = "🐿"
  }, {
    item = "🦔",
    subText = "(hedgehog) :hedgehog:",
    text = "🦔"
  }, {
    item = "🦇",
    subText = "(bat) :bat:",
    text = "🦇"
  }, {
    item = "🐻",
    subText = "(bear) :bear:",
    text = "🐻"
  }, {
    item = "🐨",
    subText = "(koala) :koala:",
    text = "🐨"
  }, {
    item = "🐼",
    subText = "(panda) :panda_face:",
    text = "🐼"
  }, {
    item = "🦥",
    subText = "(sloth) :sloth:",
    text = "🦥"
  }, {
    item = "🦦",
    subText = "(otter) :otter:",
    text = "🦦"
  }, {
    item = "🦨",
    subText = "(skunk) :skunk:",
    text = "🦨"
  }, {
    item = "🦘",
    subText = "(kangaroo) :kangaroo:",
    text = "🦘"
  }, {
    item = "🦡",
    subText = "(badger) :badger:",
    text = "🦡"
  }, {
    item = "🐾",
    subText = "(paw prints) :feet: :paw_prints:",
    text = "🐾"
  }, {
    item = "🦃",
    subText = "(turkey) :turkey: #thanksgiving",
    text = "🦃"
  }, {
    item = "🐔",
    subText = "(chicken) :chicken:",
    text = "🐔"
  }, {
    item = "🐓",
    subText = "(rooster) :rooster:",
    text = "🐓"
  }, {
    item = "🐣",
    subText = "(hatching chick) :hatching_chick:",
    text = "🐣"
  }, {
    item = "🐤",
    subText = "(baby chick) :baby_chick:",
    text = "🐤"
  }, {
    item = "🐥",
    subText = "(front-facing baby chick) :hatched_chick:",
    text = "🐥"
  }, {
    item = "🐦",
    subText = "(bird) :bird:",
    text = "🐦"
  }, {
    item = "🐧",
    subText = "(penguin) :penguin:",
    text = "🐧"
  }, {
    item = "🕊",
    subText = "(dove) :dove: #peace",
    text = "🕊"
  }, {
    item = "🦅",
    subText = "(eagle) :eagle:",
    text = "🦅"
  }, {
    item = "🦆",
    subText = "(duck) :duck:",
    text = "🦆"
  }, {
    item = "🦢",
    subText = "(swan) :swan:",
    text = "🦢"
  }, {
    item = "🦉",
    subText = "(owl) :owl:",
    text = "🦉"
  }, {
    item = "🦩",
    subText = "(flamingo) :flamingo:",
    text = "🦩"
  }, {
    item = "🦚",
    subText = "(peacock) :peacock:",
    text = "🦚"
  }, {
    item = "🦜",
    subText = "(parrot) :parrot:",
    text = "🦜"
  }, {
    item = "🐸",
    subText = "(frog) :frog:",
    text = "🐸"
  }, {
    item = "🐊",
    subText = "(crocodile) :crocodile:",
    text = "🐊"
  }, {
    item = "🐢",
    subText = "(turtle) :turtle: #slow",
    text = "🐢"
  }, {
    item = "🦎",
    subText = "(lizard) :lizard:",
    text = "🦎"
  }, {
    item = "🐍",
    subText = "(snake) :snake:",
    text = "🐍"
  }, {
    item = "🐲",
    subText = "(dragon face) :dragon_face:",
    text = "🐲"
  }, {
    item = "🐉",
    subText = "(dragon) :dragon:",
    text = "🐉"
  }, {
    item = "🦕",
    subText = "(sauropod) :sauropod: #dinosaur",
    text = "🦕"
  }, {
    item = "🦖",
    subText = "(T-Rex) :t-rex: #dinosaur",
    text = "🦖"
  }, {
    item = "🐳",
    subText = "(spouting whale) :whale: #sea",
    text = "🐳"
  }, {
    item = "🐋",
    subText = "(whale) :whale2:",
    text = "🐋"
  }, {
    item = "🐬",
    subText = "(dolphin) :dolphin: :flipper:",
    text = "🐬"
  }, {
    item = "🐟",
    subText = "(fish) :fish:",
    text = "🐟"
  }, {
    item = "🐠",
    subText = "(tropical fish) :tropical_fish:",
    text = "🐠"
  }, {
    item = "🐡",
    subText = "(blowfish) :blowfish:",
    text = "🐡"
  }, {
    item = "🦈",
    subText = "(shark) :shark:",
    text = "🦈"
  }, {
    item = "🐙",
    subText = "(octopus) :octopus:",
    text = "🐙"
  }, {
    item = "🐚",
    subText = "(spiral shell) :shell: #sea #beach",
    text = "🐚"
  }, {
    item = "🐌",
    subText = "(snail) :snail: #slow",
    text = "🐌"
  }, {
    item = "🦋",
    subText = "(butterfly) :butterfly:",
    text = "🦋"
  }, {
    item = "🐛",
    subText = "(bug) :bug:",
    text = "🐛"
  }, {
    item = "🐜",
    subText = "(ant) :ant:",
    text = "🐜"
  }, {
    item = "🐝",
    subText = "(honeybee) :bee: :honeybee:",
    text = "🐝"
  }, {
    item = "🐞",
    subText = "(lady beetle) :beetle: #bug",
    text = "🐞"
  }, {
    item = "🦗",
    subText = "(cricket) :cricket:",
    text = "🦗"
  }, {
    item = "🕷",
    subText = "(spider) :spider:",
    text = "🕷"
  }, {
    item = "🕸",
    subText = "(spider web) :spider_web:",
    text = "🕸"
  }, {
    item = "🦂",
    subText = "(scorpion) :scorpion:",
    text = "🦂"
  }, {
    item = "🦟",
    subText = "(mosquito) :mosquito:",
    text = "🦟"
  }, {
    item = "🦠",
    subText = "(microbe) :microbe: #germ",
    text = "🦠"
  }, {
    item = "💐",
    subText = "(bouquet) :bouquet: #flowers",
    text = "💐"
  }, {
    item = "🌸",
    subText = "(cherry blossom) :cherry_blossom: #flower #spring",
    text = "🌸"
  }, {
    item = "💮",
    subText = "(white flower) :white_flower:",
    text = "💮"
  }, {
    item = "🏵",
    subText = "(rosette) :rosette:",
    text = "🏵"
  }, {
    item = "🌹",
    subText = "(rose) :rose: #flower",
    text = "🌹"
  }, {
    item = "🥀",
    subText = "(wilted flower) :wilted_flower:",
    text = "🥀"
  }, {
    item = "🌺",
    subText = "(hibiscus) :hibiscus:",
    text = "🌺"
  }, {
    item = "🌻",
    subText = "(sunflower) :sunflower:",
    text = "🌻"
  }, {
    item = "🌼",
    subText = "(blossom) :blossom:",
    text = "🌼"
  }, {
    item = "🌷",
    subText = "(tulip) :tulip: #flower",
    text = "🌷"
  }, {
    item = "🌱",
    subText = "(seedling) :seedling: #plant",
    text = "🌱"
  }, {
    item = "🌲",
    subText = "(evergreen tree) :evergreen_tree: #wood",
    text = "🌲"
  }, {
    item = "🌳",
    subText = "(deciduous tree) :deciduous_tree: #wood",
    text = "🌳"
  }, {
    item = "🌴",
    subText = "(palm tree) :palm_tree:",
    text = "🌴"
  }, {
    item = "🌵",
    subText = "(cactus) :cactus:",
    text = "🌵"
  }, {
    item = "🌾",
    subText = "(sheaf of rice) :ear_of_rice:",
    text = "🌾"
  }, {
    item = "🌿",
    subText = "(herb) :herb:",
    text = "🌿"
  }, {
    item = "☘",
    subText = "(shamrock) :shamrock:",
    text = "☘"
  }, {
    item = "🍀",
    subText = "(four leaf clover) :four_leaf_clover: #luck",
    text = "🍀"
  }, {
    item = "🍁",
    subText = "(maple leaf) :maple_leaf: #canada",
    text = "🍁"
  }, {
    item = "🍂",
    subText = "(fallen leaf) :fallen_leaf: #autumn",
    text = "🍂"
  }, {
    item = "🍃",
    subText = "(leaf fluttering in wind) :leaves: #leaf",
    text = "🍃"
  }, {
    item = "🍇",
    subText = "(grapes) :grapes:",
    text = "🍇"
  }, {
    item = "🍈",
    subText = "(melon) :melon:",
    text = "🍈"
  }, {
    item = "🍉",
    subText = "(watermelon) :watermelon:",
    text = "🍉"
  }, {
    item = "🍊",
    subText = "(tangerine) :tangerine: :orange: :mandarin:",
    text = "🍊"
  }, {
    item = "🍋",
    subText = "(lemon) :lemon:",
    text = "🍋"
  }, {
    item = "🍌",
    subText = "(banana) :banana: #fruit",
    text = "🍌"
  }, {
    item = "🍍",
    subText = "(pineapple) :pineapple:",
    text = "🍍"
  }, {
    item = "🥭",
    subText = "(mango) :mango:",
    text = "🥭"
  }, {
    item = "🍎",
    subText = "(red apple) :apple:",
    text = "🍎"
  }, {
    item = "🍏",
    subText = "(green apple) :green_apple: #fruit",
    text = "🍏"
  }, {
    item = "🍐",
    subText = "(pear) :pear:",
    text = "🍐"
  }, {
    item = "🍑",
    subText = "(peach) :peach:",
    text = "🍑"
  }, {
    item = "🍒",
    subText = "(cherries) :cherries: #fruit",
    text = "🍒"
  }, {
    item = "🍓",
    subText = "(strawberry) :strawberry: #fruit",
    text = "🍓"
  }, {
    item = "🥝",
    subText = "(kiwi fruit) :kiwi_fruit:",
    text = "🥝"
  }, {
    item = "🍅",
    subText = "(tomato) :tomato:",
    text = "🍅"
  }, {
    item = "🥥",
    subText = "(coconut) :coconut:",
    text = "🥥"
  }, {
    item = "🥑",
    subText = "(avocado) :avocado:",
    text = "🥑"
  }, {
    item = "🍆",
    subText = "(eggplant) :eggplant: #aubergine",
    text = "🍆"
  }, {
    item = "🥔",
    subText = "(potato) :potato:",
    text = "🥔"
  }, {
    item = "🥕",
    subText = "(carrot) :carrot:",
    text = "🥕"
  }, {
    item = "🌽",
    subText = "(ear of corn) :corn:",
    text = "🌽"
  }, {
    item = "🌶",
    subText = "(hot pepper) :hot_pepper: #spicy",
    text = "🌶"
  }, {
    item = "🥒",
    subText = "(cucumber) :cucumber:",
    text = "🥒"
  }, {
    item = "🥬",
    subText = "(leafy green) :leafy_green:",
    text = "🥬"
  }, {
    item = "🥦",
    subText = "(broccoli) :broccoli:",
    text = "🥦"
  }, {
    item = "🧄",
    subText = "(garlic) :garlic:",
    text = "🧄"
  }, {
    item = "🧅",
    subText = "(onion) :onion:",
    text = "🧅"
  }, {
    item = "🍄",
    subText = "(mushroom) :mushroom:",
    text = "🍄"
  }, {
    item = "🥜",
    subText = "(peanuts) :peanuts:",
    text = "🥜"
  }, {
    item = "🌰",
    subText = "(chestnut) :chestnut:",
    text = "🌰"
  }, {
    item = "🍞",
    subText = "(bread) :bread: #toast",
    text = "🍞"
  }, {
    item = "🥐",
    subText = "(croissant) :croissant:",
    text = "🥐"
  }, {
    item = "🥖",
    subText = "(baguette bread) :baguette_bread:",
    text = "🥖"
  }, {
    item = "🥨",
    subText = "(pretzel) :pretzel:",
    text = "🥨"
  }, {
    item = "🥯",
    subText = "(bagel) :bagel:",
    text = "🥯"
  }, {
    item = "🥞",
    subText = "(pancakes) :pancakes:",
    text = "🥞"
  }, {
    item = "🧇",
    subText = "(waffle) :waffle:",
    text = "🧇"
  }, {
    item = "🧀",
    subText = "(cheese wedge) :cheese:",
    text = "🧀"
  }, {
    item = "🍖",
    subText = "(meat on bone) :meat_on_bone:",
    text = "🍖"
  }, {
    item = "🍗",
    subText = "(poultry leg) :poultry_leg: #meat #chicken",
    text = "🍗"
  }, {
    item = "🥩",
    subText = "(cut of meat) :cut_of_meat:",
    text = "🥩"
  }, {
    item = "🥓",
    subText = "(bacon) :bacon:",
    text = "🥓"
  }, {
    item = "🍔",
    subText = "(hamburger) :hamburger: #burger",
    text = "🍔"
  }, {
    item = "🍟",
    subText = "(french fries) :fries:",
    text = "🍟"
  }, {
    item = "🍕",
    subText = "(pizza) :pizza:",
    text = "🍕"
  }, {
    item = "🌭",
    subText = "(hot dog) :hotdog:",
    text = "🌭"
  }, {
    item = "🥪",
    subText = "(sandwich) :sandwich:",
    text = "🥪"
  }, {
    item = "🌮",
    subText = "(taco) :taco:",
    text = "🌮"
  }, {
    item = "🌯",
    subText = "(burrito) :burrito:",
    text = "🌯"
  }, {
    item = "🥙",
    subText = "(stuffed flatbread) :stuffed_flatbread:",
    text = "🥙"
  }, {
    item = "🧆",
    subText = "(falafel) :falafel:",
    text = "🧆"
  }, {
    item = "🥚",
    subText = "(egg) :egg:",
    text = "🥚"
  }, {
    item = "🍳",
    subText = "(cooking) :fried_egg: #breakfast",
    text = "🍳"
  }, {
    item = "🥘",
    subText = "(shallow pan of food) :shallow_pan_of_food: #paella #curry",
    text = "🥘"
  }, {
    item = "🍲",
    subText = "(pot of food) :stew:",
    text = "🍲"
  }, {
    item = "🥣",
    subText = "(bowl with spoon) :bowl_with_spoon:",
    text = "🥣"
  }, {
    item = "🥗",
    subText = "(green salad) :green_salad:",
    text = "🥗"
  }, {
    item = "🍿",
    subText = "(popcorn) :popcorn:",
    text = "🍿"
  }, {
    item = "🧈",
    subText = "(butter) :butter:",
    text = "🧈"
  }, {
    item = "🧂",
    subText = "(salt) :salt:",
    text = "🧂"
  }, {
    item = "🥫",
    subText = "(canned food) :canned_food:",
    text = "🥫"
  }, {
    item = "🍱",
    subText = "(bento box) :bento:",
    text = "🍱"
  }, {
    item = "🍘",
    subText = "(rice cracker) :rice_cracker:",
    text = "🍘"
  }, {
    item = "🍙",
    subText = "(rice ball) :rice_ball:",
    text = "🍙"
  }, {
    item = "🍚",
    subText = "(cooked rice) :rice:",
    text = "🍚"
  }, {
    item = "🍛",
    subText = "(curry rice) :curry:",
    text = "🍛"
  }, {
    item = "🍜",
    subText = "(steaming bowl) :ramen: #noodle",
    text = "🍜"
  }, {
    item = "🍝",
    subText = "(spaghetti) :spaghetti: #pasta",
    text = "🍝"
  }, {
    item = "🍠",
    subText = "(roasted sweet potato) :sweet_potato:",
    text = "🍠"
  }, {
    item = "🍢",
    subText = "(oden) :oden:",
    text = "🍢"
  }, {
    item = "🍣",
    subText = "(sushi) :sushi:",
    text = "🍣"
  }, {
    item = "🍤",
    subText = "(fried shrimp) :fried_shrimp: #tempura",
    text = "🍤"
  }, {
    item = "🍥",
    subText = "(fish cake with swirl) :fish_cake:",
    text = "🍥"
  }, {
    item = "🥮",
    subText = "(moon cake) :moon_cake:",
    text = "🥮"
  }, {
    item = "🍡",
    subText = "(dango) :dango:",
    text = "🍡"
  }, {
    item = "🥟",
    subText = "(dumpling) :dumpling:",
    text = "🥟"
  }, {
    item = "🥠",
    subText = "(fortune cookie) :fortune_cookie:",
    text = "🥠"
  }, {
    item = "🥡",
    subText = "(takeout box) :takeout_box:",
    text = "🥡"
  }, {
    item = "🦀",
    subText = "(crab) :crab:",
    text = "🦀"
  }, {
    item = "🦞",
    subText = "(lobster) :lobster:",
    text = "🦞"
  }, {
    item = "🦐",
    subText = "(shrimp) :shrimp:",
    text = "🦐"
  }, {
    item = "🦑",
    subText = "(squid) :squid:",
    text = "🦑"
  }, {
    item = "🦪",
    subText = "(oyster) :oyster:",
    text = "🦪"
  }, {
    item = "🍦",
    subText = "(soft ice cream) :icecream:",
    text = "🍦"
  }, {
    item = "🍧",
    subText = "(shaved ice) :shaved_ice:",
    text = "🍧"
  }, {
    item = "🍨",
    subText = "(ice cream) :ice_cream:",
    text = "🍨"
  }, {
    item = "🍩",
    subText = "(doughnut) :doughnut:",
    text = "🍩"
  }, {
    item = "🍪",
    subText = "(cookie) :cookie:",
    text = "🍪"
  }, {
    item = "🎂",
    subText = "(birthday cake) :birthday: #party",
    text = "🎂"
  }, {
    item = "🍰",
    subText = "(shortcake) :cake: #dessert",
    text = "🍰"
  }, {
    item = "🧁",
    subText = "(cupcake) :cupcake:",
    text = "🧁"
  }, {
    item = "🥧",
    subText = "(pie) :pie:",
    text = "🥧"
  }, {
    item = "🍫",
    subText = "(chocolate bar) :chocolate_bar:",
    text = "🍫"
  }, {
    item = "🍬",
    subText = "(candy) :candy: #sweet",
    text = "🍬"
  }, {
    item = "🍭",
    subText = "(lollipop) :lollipop:",
    text = "🍭"
  }, {
    item = "🍮",
    subText = "(custard) :custard:",
    text = "🍮"
  }, {
    item = "🍯",
    subText = "(honey pot) :honey_pot:",
    text = "🍯"
  }, {
    item = "🍼",
    subText = "(baby bottle) :baby_bottle: #milk",
    text = "🍼"
  }, {
    item = "🥛",
    subText = "(glass of milk) :milk_glass:",
    text = "🥛"
  }, {
    item = "☕",
    subText = "(hot beverage) :coffee: #cafe #espresso",
    text = "☕"
  }, {
    item = "🍵",
    subText = "(teacup without handle) :tea: #green #breakfast",
    text = "🍵"
  }, {
    item = "🍶",
    subText = "(sake) :sake:",
    text = "🍶"
  }, {
    item = "🍾",
    subText = "(bottle with popping cork) :champagne: #bottle #bubbly #celebration",
    text = "🍾"
  }, {
    item = "🍷",
    subText = "(wine glass) :wine_glass:",
    text = "🍷"
  }, {
    item = "🍸",
    subText = "(cocktail glass) :cocktail: #drink",
    text = "🍸"
  }, {
    item = "🍹",
    subText = "(tropical drink) :tropical_drink: #summer #vacation",
    text = "🍹"
  }, {
    item = "🍺",
    subText = "(beer mug) :beer: #drink",
    text = "🍺"
  }, {
    item = "🍻",
    subText = "(clinking beer mugs) :beers: #drinks",
    text = "🍻"
  }, {
    item = "🥂",
    subText = "(clinking glasses) :clinking_glasses: #cheers #toast",
    text = "🥂"
  }, {
    item = "🥃",
    subText = "(tumbler glass) :tumbler_glass: #whisky",
    text = "🥃"
  }, {
    item = "🥤",
    subText = "(cup with straw) :cup_with_straw:",
    text = "🥤"
  }, {
    item = "🧃",
    subText = "(beverage box) :beverage_box:",
    text = "🧃"
  }, {
    item = "🧉",
    subText = "(mate) :mate:",
    text = "🧉"
  }, {
    item = "🧊",
    subText = "(ice cube) :ice_cube:",
    text = "🧊"
  }, {
    item = "🥢",
    subText = "(chopsticks) :chopsticks:",
    text = "🥢"
  }, {
    item = "🍽",
    subText = "(fork and knife with plate) :plate_with_cutlery: #dining #dinner",
    text = "🍽"
  }, {
    item = "🍴",
    subText = "(fork and knife) :fork_and_knife: #cutlery",
    text = "🍴"
  }, {
    item = "🥄",
    subText = "(spoon) :spoon:",
    text = "🥄"
  }, {
    item = "🔪",
    subText = "(kitchen knife) :hocho: :knife: #cut #chop",
    text = "🔪"
  }, {
    item = "🏺",
    subText = "(amphora) :amphora:",
    text = "🏺"
  }, {
    item = "🌍",
    subText = "(globe showing Europe-Africa) :earth_africa: #globe #world #international",
    text = "🌍"
  }, {
    item = "🌎",
    subText = "(globe showing Americas) :earth_americas: #globe #world #international",
    text = "🌎"
  }, {
    item = "🌏",
    subText = "(globe showing Asia-Australia) :earth_asia: #globe #world #international",
    text = "🌏"
  }, {
    item = "🌐",
    subText = "(globe with meridians) :globe_with_meridians: #world #global #international",
    text = "🌐"
  }, {
    item = "🗺",
    subText = "(world map) :world_map: #travel",
    text = "🗺"
  }, {
    item = "🗾",
    subText = "(map of Japan) :japan:",
    text = "🗾"
  }, {
    item = "🧭",
    subText = "(compass) :compass:",
    text = "🧭"
  }, {
    item = "🏔",
    subText = "(snow-capped mountain) :mountain_snow:",
    text = "🏔"
  }, {
    item = "⛰",
    subText = "(mountain) :mountain:",
    text = "⛰"
  }, {
    item = "🌋",
    subText = "(volcano) :volcano:",
    text = "🌋"
  }, {
    item = "🗻",
    subText = "(mount fuji) :mount_fuji:",
    text = "🗻"
  }, {
    item = "🏕",
    subText = "(camping) :camping:",
    text = "🏕"
  }, {
    item = "🏖",
    subText = "(beach with umbrella) :beach_umbrella:",
    text = "🏖"
  }, {
    item = "🏜",
    subText = "(desert) :desert:",
    text = "🏜"
  }, {
    item = "🏝",
    subText = "(desert island) :desert_island:",
    text = "🏝"
  }, {
    item = "🏞",
    subText = "(national park) :national_park:",
    text = "🏞"
  }, {
    item = "🏟",
    subText = "(stadium) :stadium:",
    text = "🏟"
  }, {
    item = "🏛",
    subText = "(classical building) :classical_building:",
    text = "🏛"
  }, {
    item = "🏗",
    subText = "(building construction) :building_construction:",
    text = "🏗"
  }, {
    item = "🧱",
    subText = "(brick) :bricks:",
    text = "🧱"
  }, {
    item = "🏘",
    subText = "(houses) :houses:",
    text = "🏘"
  }, {
    item = "🏚",
    subText = "(derelict house) :derelict_house:",
    text = "🏚"
  }, {
    item = "🏠",
    subText = "(house) :house:",
    text = "🏠"
  }, {
    item = "🏡",
    subText = "(house with garden) :house_with_garden:",
    text = "🏡"
  }, {
    item = "🏢",
    subText = "(office building) :office:",
    text = "🏢"
  }, {
    item = "🏣",
    subText = "(Japanese post office) :post_office:",
    text = "🏣"
  }, {
    item = "🏤",
    subText = "(post office) :european_post_office:",
    text = "🏤"
  }, {
    item = "🏥",
    subText = "(hospital) :hospital:",
    text = "🏥"
  }, {
    item = "🏦",
    subText = "(bank) :bank:",
    text = "🏦"
  }, {
    item = "🏨",
    subText = "(hotel) :hotel:",
    text = "🏨"
  }, {
    item = "🏩",
    subText = "(love hotel) :love_hotel:",
    text = "🏩"
  }, {
    item = "🏪",
    subText = "(convenience store) :convenience_store:",
    text = "🏪"
  }, {
    item = "🏫",
    subText = "(school) :school:",
    text = "🏫"
  }, {
    item = "🏬",
    subText = "(department store) :department_store:",
    text = "🏬"
  }, {
    item = "🏭",
    subText = "(factory) :factory:",
    text = "🏭"
  }, {
    item = "🏯",
    subText = "(Japanese castle) :japanese_castle:",
    text = "🏯"
  }, {
    item = "🏰",
    subText = "(castle) :european_castle:",
    text = "🏰"
  }, {
    item = "💒",
    subText = "(wedding) :wedding: #marriage",
    text = "💒"
  }, {
    item = "🗼",
    subText = "(Tokyo tower) :tokyo_tower:",
    text = "🗼"
  }, {
    item = "🗽",
    subText = "(Statue of Liberty) :statue_of_liberty:",
    text = "🗽"
  }, {
    item = "⛪",
    subText = "(church) :church:",
    text = "⛪"
  }, {
    item = "🕌",
    subText = "(mosque) :mosque:",
    text = "🕌"
  }, {
    item = "🛕",
    subText = "(hindu temple) :hindu_temple:",
    text = "🛕"
  }, {
    item = "🕍",
    subText = "(synagogue) :synagogue:",
    text = "🕍"
  }, {
    item = "⛩",
    subText = "(shinto shrine) :shinto_shrine:",
    text = "⛩"
  }, {
    item = "🕋",
    subText = "(kaaba) :kaaba:",
    text = "🕋"
  }, {
    item = "⛲",
    subText = "(fountain) :fountain:",
    text = "⛲"
  }, {
    item = "⛺",
    subText = "(tent) :tent: #camping",
    text = "⛺"
  }, {
    item = "🌁",
    subText = "(foggy) :foggy: #karl",
    text = "🌁"
  }, {
    item = "🌃",
    subText = "(night with stars) :night_with_stars:",
    text = "🌃"
  }, {
    item = "🏙",
    subText = "(cityscape) :cityscape: #skyline",
    text = "🏙"
  }, {
    item = "🌄",
    subText = "(sunrise over mountains) :sunrise_over_mountains:",
    text = "🌄"
  }, {
    item = "🌅",
    subText = "(sunrise) :sunrise:",
    text = "🌅"
  }, {
    item = "🌆",
    subText = "(cityscape at dusk) :city_sunset:",
    text = "🌆"
  }, {
    item = "🌇",
    subText = "(sunset) :city_sunrise:",
    text = "🌇"
  }, {
    item = "🌉",
    subText = "(bridge at night) :bridge_at_night:",
    text = "🌉"
  }, {
    item = "♨️",
    subText = "(hot springs) :hotsprings:",
    text = "♨️"
  }, {
    item = "🎠",
    subText = "(carousel horse) :carousel_horse:",
    text = "🎠"
  }, {
    item = "🎡",
    subText = "(ferris wheel) :ferris_wheel:",
    text = "🎡"
  }, {
    item = "🎢",
    subText = "(roller coaster) :roller_coaster:",
    text = "🎢"
  }, {
    item = "💈",
    subText = "(barber pole) :barber:",
    text = "💈"
  }, {
    item = "🎪",
    subText = "(circus tent) :circus_tent:",
    text = "🎪"
  }, {
    item = "🚂",
    subText = "(locomotive) :steam_locomotive: #train",
    text = "🚂"
  }, {
    item = "🚃",
    subText = "(railway car) :railway_car:",
    text = "🚃"
  }, {
    item = "🚄",
    subText = "(high-speed train) :bullettrain_side: #train",
    text = "🚄"
  }, {
    item = "🚅",
    subText = "(bullet train) :bullettrain_front: #train",
    text = "🚅"
  }, {
    item = "🚆",
    subText = "(train) :train2:",
    text = "🚆"
  }, {
    item = "🚇",
    subText = "(metro) :metro:",
    text = "🚇"
  }, {
    item = "🚈",
    subText = "(light rail) :light_rail:",
    text = "🚈"
  }, {
    item = "🚉",
    subText = "(station) :station:",
    text = "🚉"
  }, {
    item = "🚊",
    subText = "(tram) :tram:",
    text = "🚊"
  }, {
    item = "🚝",
    subText = "(monorail) :monorail:",
    text = "🚝"
  }, {
    item = "🚞",
    subText = "(mountain railway) :mountain_railway:",
    text = "🚞"
  }, {
    item = "🚋",
    subText = "(tram car) :train:",
    text = "🚋"
  }, {
    item = "🚌",
    subText = "(bus) :bus:",
    text = "🚌"
  }, {
    item = "🚍",
    subText = "(oncoming bus) :oncoming_bus:",
    text = "🚍"
  }, {
    item = "🚎",
    subText = "(trolleybus) :trolleybus:",
    text = "🚎"
  }, {
    item = "🚐",
    subText = "(minibus) :minibus:",
    text = "🚐"
  }, {
    item = "🚑",
    subText = "(ambulance) :ambulance:",
    text = "🚑"
  }, {
    item = "🚒",
    subText = "(fire engine) :fire_engine:",
    text = "🚒"
  }, {
    item = "🚓",
    subText = "(police car) :police_car:",
    text = "🚓"
  }, {
    item = "🚔",
    subText = "(oncoming police car) :oncoming_police_car:",
    text = "🚔"
  }, {
    item = "🚕",
    subText = "(taxi) :taxi:",
    text = "🚕"
  }, {
    item = "🚖",
    subText = "(oncoming taxi) :oncoming_taxi:",
    text = "🚖"
  }, {
    item = "🚗",
    subText = "(automobile) :car: :red_car:",
    text = "🚗"
  }, {
    item = "🚘",
    subText = "(oncoming automobile) :oncoming_automobile:",
    text = "🚘"
  }, {
    item = "🚙",
    subText = "(sport utility vehicle) :blue_car:",
    text = "🚙"
  }, {
    item = "🚚",
    subText = "(delivery truck) :truck:",
    text = "🚚"
  }, {
    item = "🚛",
    subText = "(articulated lorry) :articulated_lorry:",
    text = "🚛"
  }, {
    item = "🚜",
    subText = "(tractor) :tractor:",
    text = "🚜"
  }, {
    item = "🏎",
    subText = "(racing car) :racing_car:",
    text = "🏎"
  }, {
    item = "🏍",
    subText = "(motorcycle) :motorcycle:",
    text = "🏍"
  }, {
    item = "🛵",
    subText = "(motor scooter) :motor_scooter:",
    text = "🛵"
  }, {
    item = "🦽",
    subText = "(manual wheelchair) :manual_wheelchair:",
    text = "🦽"
  }, {
    item = "🦼",
    subText = "(motorized wheelchair) :motorized_wheelchair:",
    text = "🦼"
  }, {
    item = "🛺",
    subText = "(auto rickshaw) :auto_rickshaw:",
    text = "🛺"
  }, {
    item = "🚲",
    subText = "(bicycle) :bike: #bicycle",
    text = "🚲"
  }, {
    item = "🛴",
    subText = "(kick scooter) :kick_scooter:",
    text = "🛴"
  }, {
    item = "🛹",
    subText = "(skateboard) :skateboard:",
    text = "🛹"
  }, {
    item = "🚏",
    subText = "(bus stop) :busstop:",
    text = "🚏"
  }, {
    item = "🛣",
    subText = "(motorway) :motorway:",
    text = "🛣"
  }, {
    item = "🛤",
    subText = "(railway track) :railway_track:",
    text = "🛤"
  }, {
    item = "🛢",
    subText = "(oil drum) :oil_drum:",
    text = "🛢"
  }, {
    item = "⛽",
    subText = "(fuel pump) :fuelpump:",
    text = "⛽"
  }, {
    item = "🚨",
    subText = "(police car light) :rotating_light: #911 #emergency",
    text = "🚨"
  }, {
    item = "🚥",
    subText = "(horizontal traffic light) :traffic_light:",
    text = "🚥"
  }, {
    item = "🚦",
    subText = "(vertical traffic light) :vertical_traffic_light: #semaphore",
    text = "🚦"
  }, {
    item = "🛑",
    subText = "(stop sign) :stop_sign:",
    text = "🛑"
  }, {
    item = "🚧",
    subText = "(construction) :construction: #wip",
    text = "🚧"
  }, {
    item = "⚓",
    subText = "(anchor) :anchor: #ship",
    text = "⚓"
  }, {
    item = "⛵",
    subText = "(sailboat) :boat: :sailboat:",
    text = "⛵"
  }, {
    item = "🛶",
    subText = "(canoe) :canoe:",
    text = "🛶"
  }, {
    item = "🚤",
    subText = "(speedboat) :speedboat: #ship",
    text = "🚤"
  }, {
    item = "🛳",
    subText = "(passenger ship) :passenger_ship: #cruise",
    text = "🛳"
  }, {
    item = "⛴",
    subText = "(ferry) :ferry:",
    text = "⛴"
  }, {
    item = "🛥",
    subText = "(motor boat) :motor_boat:",
    text = "🛥"
  }, {
    item = "🚢",
    subText = "(ship) :ship:",
    text = "🚢"
  }, {
    item = "✈️",
    subText = "(airplane) :airplane: #flight",
    text = "✈️"
  }, {
    item = "🛩",
    subText = "(small airplane) :small_airplane: #flight",
    text = "🛩"
  }, {
    item = "🛫",
    subText = "(airplane departure) :flight_departure:",
    text = "🛫"
  }, {
    item = "🛬",
    subText = "(airplane arrival) :flight_arrival:",
    text = "🛬"
  }, {
    item = "🪂",
    subText = "(parachute) :parachute:",
    text = "🪂"
  }, {
    item = "💺",
    subText = "(seat) :seat:",
    text = "💺"
  }, {
    item = "🚁",
    subText = "(helicopter) :helicopter:",
    text = "🚁"
  }, {
    item = "🚟",
    subText = "(suspension railway) :suspension_railway:",
    text = "🚟"
  }, {
    item = "🚠",
    subText = "(mountain cableway) :mountain_cableway:",
    text = "🚠"
  }, {
    item = "🚡",
    subText = "(aerial tramway) :aerial_tramway:",
    text = "🚡"
  }, {
    item = "🛰",
    subText = "(satellite) :artificial_satellite: #orbit #space",
    text = "🛰"
  }, {
    item = "🚀",
    subText = "(rocket) :rocket: #ship #launch",
    text = "🚀"
  }, {
    item = "🛸",
    subText = "(flying saucer) :flying_saucer: #ufo",
    text = "🛸"
  }, {
    item = "🛎",
    subText = "(bellhop bell) :bellhop_bell:",
    text = "🛎"
  }, {
    item = "🧳",
    subText = "(luggage) :luggage:",
    text = "🧳"
  }, {
    item = "⌛",
    subText = "(hourglass done) :hourglass: #time",
    text = "⌛"
  }, {
    item = "⏳",
    subText = "(hourglass not done) :hourglass_flowing_sand: #time",
    text = "⏳"
  }, {
    item = "⌚",
    subText = "(watch) :watch: #time",
    text = "⌚"
  }, {
    item = "⏰",
    subText = "(alarm clock) :alarm_clock: #morning",
    text = "⏰"
  }, {
    item = "⏱",
    subText = "(stopwatch) :stopwatch:",
    text = "⏱"
  }, {
    item = "⏲",
    subText = "(timer clock) :timer_clock:",
    text = "⏲"
  }, {
    item = "🕰",
    subText = "(mantelpiece clock) :mantelpiece_clock:",
    text = "🕰"
  }, {
    item = "🕛",
    subText = "(twelve o’clock) :clock12:",
    text = "🕛"
  }, {
    item = "🕧",
    subText = "(twelve-thirty) :clock1230:",
    text = "🕧"
  }, {
    item = "🕐",
    subText = "(one o’clock) :clock1:",
    text = "🕐"
  }, {
    item = "🕜",
    subText = "(one-thirty) :clock130:",
    text = "🕜"
  }, {
    item = "🕑",
    subText = "(two o’clock) :clock2:",
    text = "🕑"
  }, {
    item = "🕝",
    subText = "(two-thirty) :clock230:",
    text = "🕝"
  }, {
    item = "🕒",
    subText = "(three o’clock) :clock3:",
    text = "🕒"
  }, {
    item = "🕞",
    subText = "(three-thirty) :clock330:",
    text = "🕞"
  }, {
    item = "🕓",
    subText = "(four o’clock) :clock4:",
    text = "🕓"
  }, {
    item = "🕟",
    subText = "(four-thirty) :clock430:",
    text = "🕟"
  }, {
    item = "🕔",
    subText = "(five o’clock) :clock5:",
    text = "🕔"
  }, {
    item = "🕠",
    subText = "(five-thirty) :clock530:",
    text = "🕠"
  }, {
    item = "🕕",
    subText = "(six o’clock) :clock6:",
    text = "🕕"
  }, {
    item = "🕡",
    subText = "(six-thirty) :clock630:",
    text = "🕡"
  }, {
    item = "🕖",
    subText = "(seven o’clock) :clock7:",
    text = "🕖"
  }, {
    item = "🕢",
    subText = "(seven-thirty) :clock730:",
    text = "🕢"
  }, {
    item = "🕗",
    subText = "(eight o’clock) :clock8:",
    text = "🕗"
  }, {
    item = "🕣",
    subText = "(eight-thirty) :clock830:",
    text = "🕣"
  }, {
    item = "🕘",
    subText = "(nine o’clock) :clock9:",
    text = "🕘"
  }, {
    item = "🕤",
    subText = "(nine-thirty) :clock930:",
    text = "🕤"
  }, {
    item = "🕙",
    subText = "(ten o’clock) :clock10:",
    text = "🕙"
  }, {
    item = "🕥",
    subText = "(ten-thirty) :clock1030:",
    text = "🕥"
  }, {
    item = "🕚",
    subText = "(eleven o’clock) :clock11:",
    text = "🕚"
  }, {
    item = "🕦",
    subText = "(eleven-thirty) :clock1130:",
    text = "🕦"
  }, {
    item = "🌑",
    subText = "(new moon) :new_moon:",
    text = "🌑"
  }, {
    item = "🌒",
    subText = "(waxing crescent moon) :waxing_crescent_moon:",
    text = "🌒"
  }, {
    item = "🌓",
    subText = "(first quarter moon) :first_quarter_moon:",
    text = "🌓"
  }, {
    item = "🌔",
    subText = "(waxing gibbous moon) :moon: :waxing_gibbous_moon:",
    text = "🌔"
  }, {
    item = "🌕",
    subText = "(full moon) :full_moon:",
    text = "🌕"
  }, {
    item = "🌖",
    subText = "(waning gibbous moon) :waning_gibbous_moon:",
    text = "🌖"
  }, {
    item = "🌗",
    subText = "(last quarter moon) :last_quarter_moon:",
    text = "🌗"
  }, {
    item = "🌘",
    subText = "(waning crescent moon) :waning_crescent_moon:",
    text = "🌘"
  }, {
    item = "🌙",
    subText = "(crescent moon) :crescent_moon: #night",
    text = "🌙"
  }, {
    item = "🌚",
    subText = "(new moon face) :new_moon_with_face:",
    text = "🌚"
  }, {
    item = "🌛",
    subText = "(first quarter moon face) :first_quarter_moon_with_face:",
    text = "🌛"
  }, {
    item = "🌜",
    subText = "(last quarter moon face) :last_quarter_moon_with_face:",
    text = "🌜"
  }, {
    item = "🌡",
    subText = "(thermometer) :thermometer:",
    text = "🌡"
  }, {
    item = "☀️",
    subText = "(sun) :sunny: #weather",
    text = "☀️"
  }, {
    item = "🌝",
    subText = "(full moon face) :full_moon_with_face:",
    text = "🌝"
  }, {
    item = "🌞",
    subText = "(sun with face) :sun_with_face: #summer",
    text = "🌞"
  }, {
    item = "🪐",
    subText = "(ringed planet) :ringed_planet:",
    text = "🪐"
  }, {
    item = "⭐",
    subText = "(star) :star:",
    text = "⭐"
  }, {
    item = "🌟",
    subText = "(glowing star) :star2:",
    text = "🌟"
  }, {
    item = "🌠",
    subText = "(shooting star) :stars:",
    text = "🌠"
  }, {
    item = "🌌",
    subText = "(milky way) :milky_way:",
    text = "🌌"
  }, {
    item = "☁️",
    subText = "(cloud) :cloud:",
    text = "☁️"
  }, {
    item = "⛅",
    subText = "(sun behind cloud) :partly_sunny: #weather #cloud",
    text = "⛅"
  }, {
    item = "⛈",
    subText = "(cloud with lightning and rain) :cloud_with_lightning_and_rain:",
    text = "⛈"
  }, {
    item = "🌤",
    subText = "(sun behind small cloud) :sun_behind_small_cloud:",
    text = "🌤"
  }, {
    item = "🌥",
    subText = "(sun behind large cloud) :sun_behind_large_cloud:",
    text = "🌥"
  }, {
    item = "🌦",
    subText = "(sun behind rain cloud) :sun_behind_rain_cloud:",
    text = "🌦"
  }, {
    item = "🌧",
    subText = "(cloud with rain) :cloud_with_rain:",
    text = "🌧"
  }, {
    item = "🌨",
    subText = "(cloud with snow) :cloud_with_snow:",
    text = "🌨"
  }, {
    item = "🌩",
    subText = "(cloud with lightning) :cloud_with_lightning:",
    text = "🌩"
  }, {
    item = "🌪",
    subText = "(tornado) :tornado:",
    text = "🌪"
  }, {
    item = "🌫",
    subText = "(fog) :fog:",
    text = "🌫"
  }, {
    item = "🌬",
    subText = "(wind face) :wind_face:",
    text = "🌬"
  }, {
    item = "🌀",
    subText = "(cyclone) :cyclone: #swirl",
    text = "🌀"
  }, {
    item = "🌈",
    subText = "(rainbow) :rainbow:",
    text = "🌈"
  }, {
    item = "🌂",
    subText = "(closed umbrella) :closed_umbrella: #weather #rain",
    text = "🌂"
  }, {
    item = "☂️",
    subText = "(umbrella) :open_umbrella:",
    text = "☂️"
  }, {
    item = "☔",
    subText = "(umbrella with rain drops) :umbrella: #rain #weather",
    text = "☔"
  }, {
    item = "⛱",
    subText = "(umbrella on ground) :parasol_on_ground: #beach_umbrella",
    text = "⛱"
  }, {
    item = "⚡",
    subText = "(high voltage) :zap: #lightning #thunder",
    text = "⚡"
  }, {
    item = "❄️",
    subText = "(snowflake) :snowflake: #winter #cold #weather",
    text = "❄️"
  }, {
    item = "☃️",
    subText = "(snowman) :snowman_with_snow: #winter #christmas",
    text = "☃️"
  }, {
    item = "⛄",
    subText = "(snowman without snow) :snowman: #winter",
    text = "⛄"
  }, {
    item = "☄",
    subText = "(comet) :comet:",
    text = "☄"
  }, {
    item = "🔥",
    subText = "(fire) :fire: #burn",
    text = "🔥"
  }, {
    item = "💧",
    subText = "(droplet) :droplet: #water",
    text = "💧"
  }, {
    item = "🌊",
    subText = "(water wave) :ocean: #sea",
    text = "🌊"
  }, {
    item = "🎃",
    subText = "(jack-o-lantern) :jack_o_lantern: #halloween",
    text = "🎃"
  }, {
    item = "🎄",
    subText = "(Christmas tree) :christmas_tree:",
    text = "🎄"
  }, {
    item = "🎆",
    subText = "(fireworks) :fireworks: #festival #celebration",
    text = "🎆"
  }, {
    item = "🎇",
    subText = "(sparkler) :sparkler:",
    text = "🎇"
  }, {
    item = "🧨",
    subText = "(firecracker) :firecracker:",
    text = "🧨"
  }, {
    item = "✨",
    subText = "(sparkles) :sparkles: #shiny",
    text = "✨"
  }, {
    item = "🎈",
    subText = "(balloon) :balloon: #party #birthday",
    text = "🎈"
  }, {
    item = "🎉",
    subText = "(party popper) :tada: #hooray #party",
    text = "🎉"
  }, {
    item = "🎊",
    subText = "(confetti ball) :confetti_ball:",
    text = "🎊"
  }, {
    item = "🎋",
    subText = "(tanabata tree) :tanabata_tree:",
    text = "🎋"
  }, {
    item = "🎍",
    subText = "(pine decoration) :bamboo:",
    text = "🎍"
  }, {
    item = "🎎",
    subText = "(Japanese dolls) :dolls:",
    text = "🎎"
  }, {
    item = "🎏",
    subText = "(carp streamer) :flags:",
    text = "🎏"
  }, {
    item = "🎐",
    subText = "(wind chime) :wind_chime:",
    text = "🎐"
  }, {
    item = "🎑",
    subText = "(moon viewing ceremony) :rice_scene:",
    text = "🎑"
  }, {
    item = "🧧",
    subText = "(red envelope) :red_envelope:",
    text = "🧧"
  }, {
    item = "🎀",
    subText = "(ribbon) :ribbon:",
    text = "🎀"
  }, {
    item = "🎁",
    subText = "(wrapped gift) :gift: #present #birthday #christmas",
    text = "🎁"
  }, {
    item = "🎗",
    subText = "(reminder ribbon) :reminder_ribbon:",
    text = "🎗"
  }, {
    item = "🎟",
    subText = "(admission tickets) :tickets:",
    text = "🎟"
  }, {
    item = "🎫",
    subText = "(ticket) :ticket:",
    text = "🎫"
  }, {
    item = "🎖",
    subText = "(military medal) :medal_military:",
    text = "🎖"
  }, {
    item = "🏆",
    subText = "(trophy) :trophy: #award #contest #winner",
    text = "🏆"
  }, {
    item = "🏅",
    subText = "(sports medal) :medal_sports: #gold #winner",
    text = "🏅"
  }, {
    item = "🥇",
    subText = "(1st place medal) :1st_place_medal: #gold",
    text = "🥇"
  }, {
    item = "🥈",
    subText = "(2nd place medal) :2nd_place_medal: #silver",
    text = "🥈"
  }, {
    item = "🥉",
    subText = "(3rd place medal) :3rd_place_medal: #bronze",
    text = "🥉"
  }, {
    item = "⚽",
    subText = "(soccer ball) :soccer: #sports",
    text = "⚽"
  }, {
    item = "⚾",
    subText = "(baseball) :baseball: #sports",
    text = "⚾"
  }, {
    item = "🥎",
    subText = "(softball) :softball:",
    text = "🥎"
  }, {
    item = "🏀",
    subText = "(basketball) :basketball: #sports",
    text = "🏀"
  }, {
    item = "🏐",
    subText = "(volleyball) :volleyball:",
    text = "🏐"
  }, {
    item = "🏈",
    subText = "(american football) :football: #sports",
    text = "🏈"
  }, {
    item = "🏉",
    subText = "(rugby football) :rugby_football:",
    text = "🏉"
  }, {
    item = "🎾",
    subText = "(tennis) :tennis: #sports",
    text = "🎾"
  }, {
    item = "🥏",
    subText = "(flying disc) :flying_disc:",
    text = "🥏"
  }, {
    item = "🎳",
    subText = "(bowling) :bowling:",
    text = "🎳"
  }, {
    item = "🏏",
    subText = "(cricket game) :cricket_game:",
    text = "🏏"
  }, {
    item = "🏑",
    subText = "(field hockey) :field_hockey:",
    text = "🏑"
  }, {
    item = "🏒",
    subText = "(ice hockey) :ice_hockey:",
    text = "🏒"
  }, {
    item = "🥍",
    subText = "(lacrosse) :lacrosse:",
    text = "🥍"
  }, {
    item = "🏓",
    subText = "(ping pong) :ping_pong:",
    text = "🏓"
  }, {
    item = "🏸",
    subText = "(badminton) :badminton:",
    text = "🏸"
  }, {
    item = "🥊",
    subText = "(boxing glove) :boxing_glove:",
    text = "🥊"
  }, {
    item = "🥋",
    subText = "(martial arts uniform) :martial_arts_uniform:",
    text = "🥋"
  }, {
    item = "🥅",
    subText = "(goal net) :goal_net:",
    text = "🥅"
  }, {
    item = "⛳",
    subText = "(flag in hole) :golf:",
    text = "⛳"
  }, {
    item = "⛸",
    subText = "(ice skate) :ice_skate: #skating",
    text = "⛸"
  }, {
    item = "🎣",
    subText = "(fishing pole) :fishing_pole_and_fish:",
    text = "🎣"
  }, {
    item = "🤿",
    subText = "(diving mask) :diving_mask:",
    text = "🤿"
  }, {
    item = "🎽",
    subText = "(running shirt) :running_shirt_with_sash: #marathon",
    text = "🎽"
  }, {
    item = "🎿",
    subText = "(skis) :ski:",
    text = "🎿"
  }, {
    item = "🛷",
    subText = "(sled) :sled:",
    text = "🛷"
  }, {
    item = "🥌",
    subText = "(curling stone) :curling_stone:",
    text = "🥌"
  }, {
    item = "🎯",
    subText = "(direct hit) :dart: #target",
    text = "🎯"
  }, {
    item = "🪀",
    subText = "(yo-yo) :yo_yo:",
    text = "🪀"
  }, {
    item = "🪁",
    subText = "(kite) :kite:",
    text = "🪁"
  }, {
    item = "🎱",
    subText = "(pool 8 ball) :8ball: #pool #billiards",
    text = "🎱"
  }, {
    item = "🔮",
    subText = "(crystal ball) :crystal_ball: #fortune",
    text = "🔮"
  }, {
    item = "🧿",
    subText = "(nazar amulet) :nazar_amulet:",
    text = "🧿"
  }, {
    item = "🎮",
    subText = "(video game) :video_game: #play #controller #console",
    text = "🎮"
  }, {
    item = "🕹",
    subText = "(joystick) :joystick:",
    text = "🕹"
  }, {
    item = "🎰",
    subText = "(slot machine) :slot_machine:",
    text = "🎰"
  }, {
    item = "🎲",
    subText = "(game die) :game_die: #dice #gambling",
    text = "🎲"
  }, {
    item = "🧩",
    subText = "(puzzle piece) :jigsaw:",
    text = "🧩"
  }, {
    item = "🧸",
    subText = "(teddy bear) :teddy_bear:",
    text = "🧸"
  }, {
    item = "♠️",
    subText = "(spade suit) :spades:",
    text = "♠️"
  }, {
    item = "♥️",
    subText = "(heart suit) :hearts:",
    text = "♥️"
  }, {
    item = "♦️",
    subText = "(diamond suit) :diamonds:",
    text = "♦️"
  }, {
    item = "♣️",
    subText = "(club suit) :clubs:",
    text = "♣️"
  }, {
    item = "♟",
    subText = "(chess pawn) :chess_pawn:",
    text = "♟"
  }, {
    item = "🃏",
    subText = "(joker) :black_joker:",
    text = "🃏"
  }, {
    item = "🀄",
    subText = "(mahjong red dragon) :mahjong:",
    text = "🀄"
  }, {
    item = "🎴",
    subText = "(flower playing cards) :flower_playing_cards:",
    text = "🎴"
  }, {
    item = "🎭",
    subText = "(performing arts) :performing_arts: #theater #drama",
    text = "🎭"
  }, {
    item = "🖼",
    subText = "(framed picture) :framed_picture:",
    text = "🖼"
  }, {
    item = "🎨",
    subText = "(artist palette) :art: #design #paint",
    text = "🎨"
  }, {
    item = "🧵",
    subText = "(thread) :thread:",
    text = "🧵"
  }, {
    item = "🧶",
    subText = "(yarn) :yarn:",
    text = "🧶"
  }, {
    item = "👓",
    subText = "(glasses) :eyeglasses: #glasses",
    text = "👓"
  }, {
    item = "🕶",
    subText = "(sunglasses) :dark_sunglasses:",
    text = "🕶"
  }, {
    item = "🥽",
    subText = "(goggles) :goggles:",
    text = "🥽"
  }, {
    item = "🥼",
    subText = "(lab coat) :lab_coat:",
    text = "🥼"
  }, {
    item = "🦺",
    subText = "(safety vest) :safety_vest:",
    text = "🦺"
  }, {
    item = "👔",
    subText = "(necktie) :necktie: #shirt #formal",
    text = "👔"
  }, {
    item = "👕",
    subText = "(t-shirt) :shirt: :tshirt:",
    text = "👕"
  }, {
    item = "👖",
    subText = "(jeans) :jeans: #pants",
    text = "👖"
  }, {
    item = "🧣",
    subText = "(scarf) :scarf:",
    text = "🧣"
  }, {
    item = "🧤",
    subText = "(gloves) :gloves:",
    text = "🧤"
  }, {
    item = "🧥",
    subText = "(coat) :coat:",
    text = "🧥"
  }, {
    item = "🧦",
    subText = "(socks) :socks:",
    text = "🧦"
  }, {
    item = "👗",
    subText = "(dress) :dress:",
    text = "👗"
  }, {
    item = "👘",
    subText = "(kimono) :kimono:",
    text = "👘"
  }, {
    item = "🥻",
    subText = "(sari) :sari:",
    text = "🥻"
  }, {
    item = "🩱",
    subText = "(one-piece swimsuit) :one_piece_swimsuit:",
    text = "🩱"
  }, {
    item = "🩲",
    subText = "(swim brief) :swim_brief:",
    text = "🩲"
  }, {
    item = "🩳",
    subText = "(shorts) :shorts:",
    text = "🩳"
  }, {
    item = "👙",
    subText = "(bikini) :bikini: #beach",
    text = "👙"
  }, {
    item = "👚",
    subText = "(woman’s clothes) :womans_clothes:",
    text = "👚"
  }, {
    item = "👛",
    subText = "(purse) :purse:",
    text = "👛"
  }, {
    item = "👜",
    subText = "(handbag) :handbag: #bag",
    text = "👜"
  }, {
    item = "👝",
    subText = "(clutch bag) :pouch: #bag",
    text = "👝"
  }, {
    item = "🛍",
    subText = "(shopping bags) :shopping: #bags",
    text = "🛍"
  }, {
    item = "🎒",
    subText = "(backpack) :school_satchel:",
    text = "🎒"
  }, {
    item = "👞",
    subText = "(man’s shoe) :mans_shoe: :shoe:",
    text = "👞"
  }, {
    item = "👟",
    subText = "(running shoe) :athletic_shoe: #sneaker #sport #running",
    text = "👟"
  }, {
    item = "🥾",
    subText = "(hiking boot) :hiking_boot:",
    text = "🥾"
  }, {
    item = "🥿",
    subText = "(flat shoe) :flat_shoe:",
    text = "🥿"
  }, {
    item = "👠",
    subText = "(high-heeled shoe) :high_heel: #shoe",
    text = "👠"
  }, {
    item = "👡",
    subText = "(woman’s sandal) :sandal: #shoe",
    text = "👡"
  }, {
    item = "🩰",
    subText = "(ballet shoes) :ballet_shoes:",
    text = "🩰"
  }, {
    item = "👢",
    subText = "(woman’s boot) :boot:",
    text = "👢"
  }, {
    item = "👑",
    subText = "(crown) :crown: #king #queen #royal",
    text = "👑"
  }, {
    item = "👒",
    subText = "(woman’s hat) :womans_hat:",
    text = "👒"
  }, {
    item = "🎩",
    subText = "(top hat) :tophat: #hat #classy",
    text = "🎩"
  }, {
    item = "🎓",
    subText = "(graduation cap) :mortar_board: #education #college #university #graduation",
    text = "🎓"
  }, {
    item = "🧢",
    subText = "(billed cap) :billed_cap:",
    text = "🧢"
  }, {
    item = "⛑",
    subText = "(rescue worker’s helmet) :rescue_worker_helmet:",
    text = "⛑"
  }, {
    item = "📿",
    subText = "(prayer beads) :prayer_beads:",
    text = "📿"
  }, {
    item = "💄",
    subText = "(lipstick) :lipstick: #makeup",
    text = "💄"
  }, {
    item = "💍",
    subText = "(ring) :ring: #wedding #marriage #engaged",
    text = "💍"
  }, {
    item = "💎",
    subText = "(gem stone) :gem: #diamond",
    text = "💎"
  }, {
    item = "🔇",
    subText = "(muted speaker) :mute: #sound #volume",
    text = "🔇"
  }, {
    item = "🔈",
    subText = "(speaker low volume) :speaker:",
    text = "🔈"
  }, {
    item = "🔉",
    subText = "(speaker medium volume) :sound: #volume",
    text = "🔉"
  }, {
    item = "🔊",
    subText = "(speaker high volume) :loud_sound: #volume",
    text = "🔊"
  }, {
    item = "📢",
    subText = "(loudspeaker) :loudspeaker: #announcement",
    text = "📢"
  }, {
    item = "📣",
    subText = "(megaphone) :mega:",
    text = "📣"
  }, {
    item = "📯",
    subText = "(postal horn) :postal_horn:",
    text = "📯"
  }, {
    item = "🔔",
    subText = "(bell) :bell: #sound #notification",
    text = "🔔"
  }, {
    item = "🔕",
    subText = "(bell with slash) :no_bell: #volume #off",
    text = "🔕"
  }, {
    item = "🎼",
    subText = "(musical score) :musical_score:",
    text = "🎼"
  }, {
    item = "🎵",
    subText = "(musical note) :musical_note:",
    text = "🎵"
  }, {
    item = "🎶",
    subText = "(musical notes) :notes: #music",
    text = "🎶"
  }, {
    item = "🎙",
    subText = "(studio microphone) :studio_microphone: #podcast",
    text = "🎙"
  }, {
    item = "🎚",
    subText = "(level slider) :level_slider:",
    text = "🎚"
  }, {
    item = "🎛",
    subText = "(control knobs) :control_knobs:",
    text = "🎛"
  }, {
    item = "🎤",
    subText = "(microphone) :microphone: #sing",
    text = "🎤"
  }, {
    item = "🎧",
    subText = "(headphone) :headphones: #music #earphones",
    text = "🎧"
  }, {
    item = "📻",
    subText = "(radio) :radio: #podcast",
    text = "📻"
  }, {
    item = "🎷",
    subText = "(saxophone) :saxophone:",
    text = "🎷"
  }, {
    item = "🎸",
    subText = "(guitar) :guitar: #rock",
    text = "🎸"
  }, {
    item = "🎹",
    subText = "(musical keyboard) :musical_keyboard: #piano",
    text = "🎹"
  }, {
    item = "🎺",
    subText = "(trumpet) :trumpet:",
    text = "🎺"
  }, {
    item = "🎻",
    subText = "(violin) :violin:",
    text = "🎻"
  }, {
    item = "🪕",
    subText = "(banjo) :banjo:",
    text = "🪕"
  }, {
    item = "🥁",
    subText = "(drum) :drum:",
    text = "🥁"
  }, {
    item = "📱",
    subText = "(mobile phone) :iphone: #smartphone #mobile",
    text = "📱"
  }, {
    item = "📲",
    subText = "(mobile phone with arrow) :calling: #call #incoming",
    text = "📲"
  }, {
    item = "☎️",
    subText = "(telephone) :phone: :telephone:",
    text = "☎️"
  }, {
    item = "📞",
    subText = "(telephone receiver) :telephone_receiver: #phone #call",
    text = "📞"
  }, {
    item = "📟",
    subText = "(pager) :pager:",
    text = "📟"
  }, {
    item = "📠",
    subText = "(fax machine) :fax:",
    text = "📠"
  }, {
    item = "🔋",
    subText = "(battery) :battery: #power",
    text = "🔋"
  }, {
    item = "🔌",
    subText = "(electric plug) :electric_plug:",
    text = "🔌"
  }, {
    item = "💻",
    subText = "(laptop computer) :computer: #desktop #screen",
    text = "💻"
  }, {
    item = "🖥",
    subText = "(desktop computer) :desktop_computer:",
    text = "🖥"
  }, {
    item = "🖨",
    subText = "(printer) :printer:",
    text = "🖨"
  }, {
    item = "⌨",
    subText = "(keyboard) :keyboard:",
    text = "⌨"
  }, {
    item = "🖱",
    subText = "(computer mouse) :computer_mouse:",
    text = "🖱"
  }, {
    item = "🖲",
    subText = "(trackball) :trackball:",
    text = "🖲"
  }, {
    item = "💽",
    subText = "(computer disk) :minidisc:",
    text = "💽"
  }, {
    item = "💾",
    subText = "(floppy disk) :floppy_disk: #save",
    text = "💾"
  }, {
    item = "💿",
    subText = "(optical disk) :cd:",
    text = "💿"
  }, {
    item = "📀",
    subText = "(dvd) :dvd:",
    text = "📀"
  }, {
    item = "🧮",
    subText = "(abacus) :abacus:",
    text = "🧮"
  }, {
    item = "🎥",
    subText = "(movie camera) :movie_camera: #film #video",
    text = "🎥"
  }, {
    item = "🎞",
    subText = "(film frames) :film_strip:",
    text = "🎞"
  }, {
    item = "📽",
    subText = "(film projector) :film_projector:",
    text = "📽"
  }, {
    item = "🎬",
    subText = "(clapper board) :clapper: #film",
    text = "🎬"
  }, {
    item = "📺",
    subText = "(television) :tv:",
    text = "📺"
  }, {
    item = "📷",
    subText = "(camera) :camera: #photo",
    text = "📷"
  }, {
    item = "📸",
    subText = "(camera with flash) :camera_flash: #photo",
    text = "📸"
  }, {
    item = "📹",
    subText = "(video camera) :video_camera:",
    text = "📹"
  }, {
    item = "📼",
    subText = "(videocassette) :vhs:",
    text = "📼"
  }, {
    item = "🔍",
    subText = "(magnifying glass tilted left) :mag: #search #zoom",
    text = "🔍"
  }, {
    item = "🔎",
    subText = "(magnifying glass tilted right) :mag_right:",
    text = "🔎"
  }, {
    item = "🕯",
    subText = "(candle) :candle:",
    text = "🕯"
  }, {
    item = "💡",
    subText = "(light bulb) :bulb: #idea #light",
    text = "💡"
  }, {
    item = "🔦",
    subText = "(flashlight) :flashlight:",
    text = "🔦"
  }, {
    item = "🏮",
    subText = "(red paper lantern) :izakaya_lantern: :lantern:",
    text = "🏮"
  }, {
    item = "🪔",
    subText = "(diya lamp) :diya_lamp:",
    text = "🪔"
  }, {
    item = "📔",
    subText = "(notebook with decorative cover) :notebook_with_decorative_cover:",
    text = "📔"
  }, {
    item = "📕",
    subText = "(closed book) :closed_book:",
    text = "📕"
  }, {
    item = "📖",
    subText = "(open book) :book: :open_book:",
    text = "📖"
  }, {
    item = "📗",
    subText = "(green book) :green_book:",
    text = "📗"
  }, {
    item = "📘",
    subText = "(blue book) :blue_book:",
    text = "📘"
  }, {
    item = "📙",
    subText = "(orange book) :orange_book:",
    text = "📙"
  }, {
    item = "📚",
    subText = "(books) :books: #library",
    text = "📚"
  }, {
    item = "📓",
    subText = "(notebook) :notebook:",
    text = "📓"
  }, {
    item = "📒",
    subText = "(ledger) :ledger:",
    text = "📒"
  }, {
    item = "📃",
    subText = "(page with curl) :page_with_curl:",
    text = "📃"
  }, {
    item = "📜",
    subText = "(scroll) :scroll: #document",
    text = "📜"
  }, {
    item = "📄",
    subText = "(page facing up) :page_facing_up: #document",
    text = "📄"
  }, {
    item = "📰",
    subText = "(newspaper) :newspaper: #press",
    text = "📰"
  }, {
    item = "🗞",
    subText = "(rolled-up newspaper) :newspaper_roll: #press",
    text = "🗞"
  }, {
    item = "📑",
    subText = "(bookmark tabs) :bookmark_tabs:",
    text = "📑"
  }, {
    item = "🔖",
    subText = "(bookmark) :bookmark:",
    text = "🔖"
  }, {
    item = "🏷",
    subText = "(label) :label: #tag",
    text = "🏷"
  }, {
    item = "💰",
    subText = "(money bag) :moneybag: #dollar #cream",
    text = "💰"
  }, {
    item = "💴",
    subText = "(yen banknote) :yen:",
    text = "💴"
  }, {
    item = "💵",
    subText = "(dollar banknote) :dollar: #money",
    text = "💵"
  }, {
    item = "💶",
    subText = "(euro banknote) :euro:",
    text = "💶"
  }, {
    item = "💷",
    subText = "(pound banknote) :pound:",
    text = "💷"
  }, {
    item = "💸",
    subText = "(money with wings) :money_with_wings: #dollar",
    text = "💸"
  }, {
    item = "💳",
    subText = "(credit card) :credit_card: #subscription",
    text = "💳"
  }, {
    item = "🧾",
    subText = "(receipt) :receipt:",
    text = "🧾"
  }, {
    item = "💹",
    subText = "(chart increasing with yen) :chart:",
    text = "💹"
  }, {
    item = "💱",
    subText = "(currency exchange) :currency_exchange:",
    text = "💱"
  }, {
    item = "💲",
    subText = "(heavy dollar sign) :heavy_dollar_sign:",
    text = "💲"
  }, {
    item = "✉️",
    subText = "(envelope) :email: :envelope: #letter",
    text = "✉️"
  }, {
    item = "📧",
    subText = "(e-mail) :e-mail:",
    text = "📧"
  }, {
    item = "📨",
    subText = "(incoming envelope) :incoming_envelope:",
    text = "📨"
  }, {
    item = "📩",
    subText = "(envelope with arrow) :envelope_with_arrow:",
    text = "📩"
  }, {
    item = "📤",
    subText = "(outbox tray) :outbox_tray:",
    text = "📤"
  }, {
    item = "📥",
    subText = "(inbox tray) :inbox_tray:",
    text = "📥"
  }, {
    item = "📦",
    subText = "(package) :package: #shipping",
    text = "📦"
  }, {
    item = "📫",
    subText = "(closed mailbox with raised flag) :mailbox:",
    text = "📫"
  }, {
    item = "📪",
    subText = "(closed mailbox with lowered flag) :mailbox_closed:",
    text = "📪"
  }, {
    item = "📬",
    subText = "(open mailbox with raised flag) :mailbox_with_mail:",
    text = "📬"
  }, {
    item = "📭",
    subText = "(open mailbox with lowered flag) :mailbox_with_no_mail:",
    text = "📭"
  }, {
    item = "📮",
    subText = "(postbox) :postbox:",
    text = "📮"
  }, {
    item = "🗳",
    subText = "(ballot box with ballot) :ballot_box:",
    text = "🗳"
  }, {
    item = "✏️",
    subText = "(pencil) :pencil2:",
    text = "✏️"
  }, {
    item = "✒️",
    subText = "(black nib) :black_nib:",
    text = "✒️"
  }, {
    item = "🖋",
    subText = "(fountain pen) :fountain_pen:",
    text = "🖋"
  }, {
    item = "🖊",
    subText = "(pen) :pen:",
    text = "🖊"
  }, {
    item = "🖌",
    subText = "(paintbrush) :paintbrush:",
    text = "🖌"
  }, {
    item = "🖍",
    subText = "(crayon) :crayon:",
    text = "🖍"
  }, {
    item = "📝",
    subText = "(memo) :memo: :pencil: #document #note",
    text = "📝"
  }, {
    item = "💼",
    subText = "(briefcase) :briefcase: #business",
    text = "💼"
  }, {
    item = "📁",
    subText = "(file folder) :file_folder: #directory",
    text = "📁"
  }, {
    item = "📂",
    subText = "(open file folder) :open_file_folder:",
    text = "📂"
  }, {
    item = "🗂",
    subText = "(card index dividers) :card_index_dividers:",
    text = "🗂"
  }, {
    item = "📅",
    subText = "(calendar) :date: #calendar #schedule",
    text = "📅"
  }, {
    item = "📆",
    subText = "(tear-off calendar) :calendar: #schedule",
    text = "📆"
  }, {
    item = "🗒",
    subText = "(spiral notepad) :spiral_notepad:",
    text = "🗒"
  }, {
    item = "🗓",
    subText = "(spiral calendar) :spiral_calendar:",
    text = "🗓"
  }, {
    item = "📇",
    subText = "(card index) :card_index:",
    text = "📇"
  }, {
    item = "📈",
    subText = "(chart increasing) :chart_with_upwards_trend: #graph #metrics",
    text = "📈"
  }, {
    item = "📉",
    subText = "(chart decreasing) :chart_with_downwards_trend: #graph #metrics",
    text = "📉"
  }, {
    item = "📊",
    subText = "(bar chart) :bar_chart: #stats #metrics",
    text = "📊"
  }, {
    item = "📋",
    subText = "(clipboard) :clipboard:",
    text = "📋"
  }, {
    item = "📌",
    subText = "(pushpin) :pushpin: #location",
    text = "📌"
  }, {
    item = "📍",
    subText = "(round pushpin) :round_pushpin: #location",
    text = "📍"
  }, {
    item = "📎",
    subText = "(paperclip) :paperclip:",
    text = "📎"
  }, {
    item = "🖇",
    subText = "(linked paperclips) :paperclips:",
    text = "🖇"
  }, {
    item = "📏",
    subText = "(straight ruler) :straight_ruler:",
    text = "📏"
  }, {
    item = "📐",
    subText = "(triangular ruler) :triangular_ruler:",
    text = "📐"
  }, {
    item = "✂️",
    subText = "(scissors) :scissors: #cut",
    text = "✂️"
  }, {
    item = "🗃",
    subText = "(card file box) :card_file_box:",
    text = "🗃"
  }, {
    item = "🗄",
    subText = "(file cabinet) :file_cabinet:",
    text = "🗄"
  }, {
    item = "🗑",
    subText = "(wastebasket) :wastebasket: #trash",
    text = "🗑"
  }, {
    item = "🔒",
    subText = "(locked) :lock: #security #private",
    text = "🔒"
  }, {
    item = "🔓",
    subText = "(unlocked) :unlock: #security",
    text = "🔓"
  }, {
    item = "🔏",
    subText = "(locked with pen) :lock_with_ink_pen:",
    text = "🔏"
  }, {
    item = "🔐",
    subText = "(locked with key) :closed_lock_with_key: #security",
    text = "🔐"
  }, {
    item = "🔑",
    subText = "(key) :key: #lock #password",
    text = "🔑"
  }, {
    item = "🗝",
    subText = "(old key) :old_key:",
    text = "🗝"
  }, {
    item = "🔨",
    subText = "(hammer) :hammer: #tool",
    text = "🔨"
  }, {
    item = "🪓",
    subText = "(axe) :axe:",
    text = "🪓"
  }, {
    item = "⛏",
    subText = "(pick) :pick:",
    text = "⛏"
  }, {
    item = "⚒",
    subText = "(hammer and pick) :hammer_and_pick:",
    text = "⚒"
  }, {
    item = "🛠",
    subText = "(hammer and wrench) :hammer_and_wrench:",
    text = "🛠"
  }, {
    item = "🗡",
    subText = "(dagger) :dagger:",
    text = "🗡"
  }, {
    item = "⚔",
    subText = "(crossed swords) :crossed_swords:",
    text = "⚔"
  }, {
    item = "🔫",
    subText = "(pistol) :gun: #shoot #weapon",
    text = "🔫"
  }, {
    item = "🏹",
    subText = "(bow and arrow) :bow_and_arrow: #archery",
    text = "🏹"
  }, {
    item = "🛡",
    subText = "(shield) :shield:",
    text = "🛡"
  }, {
    item = "🔧",
    subText = "(wrench) :wrench: #tool",
    text = "🔧"
  }, {
    item = "🔩",
    subText = "(nut and bolt) :nut_and_bolt:",
    text = "🔩"
  }, {
    item = "⚙",
    subText = "(gear) :gear:",
    text = "⚙"
  }, {
    item = "🗜",
    subText = "(clamp) :clamp:",
    text = "🗜"
  }, {
    item = "⚖",
    subText = "(balance scale) :balance_scale:",
    text = "⚖"
  }, {
    item = "🦯",
    subText = "(probing cane) :probing_cane:",
    text = "🦯"
  }, {
    item = "🔗",
    subText = "(link) :link:",
    text = "🔗"
  }, {
    item = "⛓",
    subText = "(chains) :chains:",
    text = "⛓"
  }, {
    item = "🧰",
    subText = "(toolbox) :toolbox:",
    text = "🧰"
  }, {
    item = "🧲",
    subText = "(magnet) :magnet:",
    text = "🧲"
  }, {
    item = "⚗",
    subText = "(alembic) :alembic:",
    text = "⚗"
  }, {
    item = "🧪",
    subText = "(test tube) :test_tube:",
    text = "🧪"
  }, {
    item = "🧫",
    subText = "(petri dish) :petri_dish:",
    text = "🧫"
  }, {
    item = "🧬",
    subText = "(dna) :dna:",
    text = "🧬"
  }, {
    item = "🔬",
    subText = "(microscope) :microscope: #science #laboratory #investigate",
    text = "🔬"
  }, {
    item = "🔭",
    subText = "(telescope) :telescope:",
    text = "🔭"
  }, {
    item = "📡",
    subText = "(satellite antenna) :satellite: #signal",
    text = "📡"
  }, {
    item = "💉",
    subText = "(syringe) :syringe: #health #hospital #needle",
    text = "💉"
  }, {
    item = "🩸",
    subText = "(drop of blood) :drop_of_blood:",
    text = "🩸"
  }, {
    item = "💊",
    subText = "(pill) :pill: #health #medicine",
    text = "💊"
  }, {
    item = "🩹",
    subText = "(adhesive bandage) :adhesive_bandage:",
    text = "🩹"
  }, {
    item = "🩺",
    subText = "(stethoscope) :stethoscope:",
    text = "🩺"
  }, {
    item = "🚪",
    subText = "(door) :door:",
    text = "🚪"
  }, {
    item = "🛏",
    subText = "(bed) :bed:",
    text = "🛏"
  }, {
    item = "🛋",
    subText = "(couch and lamp) :couch_and_lamp:",
    text = "🛋"
  }, {
    item = "🪑",
    subText = "(chair) :chair:",
    text = "🪑"
  }, {
    item = "🚽",
    subText = "(toilet) :toilet: #wc",
    text = "🚽"
  }, {
    item = "🚿",
    subText = "(shower) :shower: #bath",
    text = "🚿"
  }, {
    item = "🛁",
    subText = "(bathtub) :bathtub:",
    text = "🛁"
  }, {
    item = "🪒",
    subText = "(razor) :razor:",
    text = "🪒"
  }, {
    item = "🧴",
    subText = "(lotion bottle) :lotion_bottle:",
    text = "🧴"
  }, {
    item = "🧷",
    subText = "(safety pin) :safety_pin:",
    text = "🧷"
  }, {
    item = "🧹",
    subText = "(broom) :broom:",
    text = "🧹"
  }, {
    item = "🧺",
    subText = "(basket) :basket:",
    text = "🧺"
  }, {
    item = "🧻",
    subText = "(roll of paper) :roll_of_paper: #toilet",
    text = "🧻"
  }, {
    item = "🧼",
    subText = "(soap) :soap:",
    text = "🧼"
  }, {
    item = "🧽",
    subText = "(sponge) :sponge:",
    text = "🧽"
  }, {
    item = "🧯",
    subText = "(fire extinguisher) :fire_extinguisher:",
    text = "🧯"
  }, {
    item = "🛒",
    subText = "(shopping cart) :shopping_cart:",
    text = "🛒"
  }, {
    item = "🚬",
    subText = "(cigarette) :smoking: #cigarette",
    text = "🚬"
  }, {
    item = "⚰",
    subText = "(coffin) :coffin: #funeral",
    text = "⚰"
  }, {
    item = "⚱",
    subText = "(funeral urn) :funeral_urn:",
    text = "⚱"
  }, {
    item = "🗿",
    subText = "(moai) :moyai: #stone",
    text = "🗿"
  }, {
    item = "🏧",
    subText = "(ATM sign) :atm:",
    text = "🏧"
  }, {
    item = "🚮",
    subText = "(litter in bin sign) :put_litter_in_its_place:",
    text = "🚮"
  }, {
    item = "🚰",
    subText = "(potable water) :potable_water:",
    text = "🚰"
  }, {
    item = "♿",
    subText = "(wheelchair symbol) :wheelchair: #accessibility",
    text = "♿"
  }, {
    item = "🚹",
    subText = "(men’s room) :mens:",
    text = "🚹"
  }, {
    item = "🚺",
    subText = "(women’s room) :womens:",
    text = "🚺"
  }, {
    item = "🚻",
    subText = "(restroom) :restroom: #toilet",
    text = "🚻"
  }, {
    item = "🚼",
    subText = "(baby symbol) :baby_symbol:",
    text = "🚼"
  }, {
    item = "🚾",
    subText = "(water closet) :wc: #toilet #restroom",
    text = "🚾"
  }, {
    item = "🛂",
    subText = "(passport control) :passport_control:",
    text = "🛂"
  }, {
    item = "🛃",
    subText = "(customs) :customs:",
    text = "🛃"
  }, {
    item = "🛄",
    subText = "(baggage claim) :baggage_claim: #airport",
    text = "🛄"
  }, {
    item = "🛅",
    subText = "(left luggage) :left_luggage:",
    text = "🛅"
  }, {
    item = "⚠️",
    subText = "(warning) :warning: #wip",
    text = "⚠️"
  }, {
    item = "🚸",
    subText = "(children crossing) :children_crossing:",
    text = "🚸"
  }, {
    item = "⛔",
    subText = "(no entry) :no_entry: #limit",
    text = "⛔"
  }, {
    item = "🚫",
    subText = "(prohibited) :no_entry_sign: #block #forbidden",
    text = "🚫"
  }, {
    item = "🚳",
    subText = "(no bicycles) :no_bicycles:",
    text = "🚳"
  }, {
    item = "🚭",
    subText = "(no smoking) :no_smoking:",
    text = "🚭"
  }, {
    item = "🚯",
    subText = "(no littering) :do_not_litter:",
    text = "🚯"
  }, {
    item = "🚱",
    subText = "(non-potable water) :non-potable_water:",
    text = "🚱"
  }, {
    item = "🚷",
    subText = "(no pedestrians) :no_pedestrians:",
    text = "🚷"
  }, {
    item = "📵",
    subText = "(no mobile phones) :no_mobile_phones:",
    text = "📵"
  }, {
    item = "🔞",
    subText = "(no one under eighteen) :underage:",
    text = "🔞"
  }, {
    item = "☢",
    subText = "(radioactive) :radioactive:",
    text = "☢"
  }, {
    item = "☣",
    subText = "(biohazard) :biohazard:",
    text = "☣"
  }, {
    item = "⬆️",
    subText = "(up arrow) :arrow_up:",
    text = "⬆️"
  }, {
    item = "↗️",
    subText = "(up-right arrow) :arrow_upper_right:",
    text = "↗️"
  }, {
    item = "➡️",
    subText = "(right arrow) :arrow_right:",
    text = "➡️"
  }, {
    item = "↘️",
    subText = "(down-right arrow) :arrow_lower_right:",
    text = "↘️"
  }, {
    item = "⬇️",
    subText = "(down arrow) :arrow_down:",
    text = "⬇️"
  }, {
    item = "↙️",
    subText = "(down-left arrow) :arrow_lower_left:",
    text = "↙️"
  }, {
    item = "⬅️",
    subText = "(left arrow) :arrow_left:",
    text = "⬅️"
  }, {
    item = "↖️",
    subText = "(up-left arrow) :arrow_upper_left:",
    text = "↖️"
  }, {
    item = "↕️",
    subText = "(up-down arrow) :arrow_up_down:",
    text = "↕️"
  }, {
    item = "↔️",
    subText = "(left-right arrow) :left_right_arrow:",
    text = "↔️"
  }, {
    item = "↩️",
    subText = "(right arrow curving left) :leftwards_arrow_with_hook: #return",
    text = "↩️"
  }, {
    item = "↪️",
    subText = "(left arrow curving right) :arrow_right_hook:",
    text = "↪️"
  }, {
    item = "⤴️",
    subText = "(right arrow curving up) :arrow_heading_up:",
    text = "⤴️"
  }, {
    item = "⤵️",
    subText = "(right arrow curving down) :arrow_heading_down:",
    text = "⤵️"
  }, {
    item = "🔃",
    subText = "(clockwise vertical arrows) :arrows_clockwise:",
    text = "🔃"
  }, {
    item = "🔄",
    subText = "(counterclockwise arrows button) :arrows_counterclockwise: #sync",
    text = "🔄"
  }, {
    item = "🔙",
    subText = "(BACK arrow) :back:",
    text = "🔙"
  }, {
    item = "🔚",
    subText = "(END arrow) :end:",
    text = "🔚"
  }, {
    item = "🔛",
    subText = "(ON! arrow) :on:",
    text = "🔛"
  }, {
    item = "🔜",
    subText = "(SOON arrow) :soon:",
    text = "🔜"
  }, {
    item = "🔝",
    subText = "(TOP arrow) :top:",
    text = "🔝"
  }, {
    item = "🛐",
    subText = "(place of worship) :place_of_worship:",
    text = "🛐"
  }, {
    item = "⚛",
    subText = "(atom symbol) :atom_symbol:",
    text = "⚛"
  }, {
    item = "🕉",
    subText = "(om) :om:",
    text = "🕉"
  }, {
    item = "✡️",
    subText = "(star of David) :star_of_david:",
    text = "✡️"
  }, {
    item = "☸",
    subText = "(wheel of dharma) :wheel_of_dharma:",
    text = "☸"
  }, {
    item = "☯️",
    subText = "(yin yang) :yin_yang:",
    text = "☯️"
  }, {
    item = "✝️",
    subText = "(latin cross) :latin_cross:",
    text = "✝️"
  }, {
    item = "☦",
    subText = "(orthodox cross) :orthodox_cross:",
    text = "☦"
  }, {
    item = "☪",
    subText = "(star and crescent) :star_and_crescent:",
    text = "☪"
  }, {
    item = "☮",
    subText = "(peace symbol) :peace_symbol:",
    text = "☮"
  }, {
    item = "🕎",
    subText = "(menorah) :menorah:",
    text = "🕎"
  }, {
    item = "🔯",
    subText = "(dotted six-pointed star) :six_pointed_star:",
    text = "🔯"
  }, {
    item = "♈",
    subText = "(Aries) :aries:",
    text = "♈"
  }, {
    item = "♉",
    subText = "(Taurus) :taurus:",
    text = "♉"
  }, {
    item = "♊",
    subText = "(Gemini) :gemini:",
    text = "♊"
  }, {
    item = "♋",
    subText = "(Cancer) :cancer:",
    text = "♋"
  }, {
    item = "♌",
    subText = "(Leo) :leo:",
    text = "♌"
  }, {
    item = "♍",
    subText = "(Virgo) :virgo:",
    text = "♍"
  }, {
    item = "♎",
    subText = "(Libra) :libra:",
    text = "♎"
  }, {
    item = "♏",
    subText = "(Scorpio) :scorpius:",
    text = "♏"
  }, {
    item = "♐",
    subText = "(Sagittarius) :sagittarius:",
    text = "♐"
  }, {
    item = "♑",
    subText = "(Capricorn) :capricorn:",
    text = "♑"
  }, {
    item = "♒",
    subText = "(Aquarius) :aquarius:",
    text = "♒"
  }, {
    item = "♓",
    subText = "(Pisces) :pisces:",
    text = "♓"
  }, {
    item = "⛎",
    subText = "(Ophiuchus) :ophiuchus:",
    text = "⛎"
  }, {
    item = "🔀",
    subText = "(shuffle tracks button) :twisted_rightwards_arrows: #shuffle",
    text = "🔀"
  }, {
    item = "🔁",
    subText = "(repeat button) :repeat: #loop",
    text = "🔁"
  }, {
    item = "🔂",
    subText = "(repeat single button) :repeat_one:",
    text = "🔂"
  }, {
    item = "▶️",
    subText = "(play button) :arrow_forward:",
    text = "▶️"
  }, {
    item = "⏩",
    subText = "(fast-forward button) :fast_forward:",
    text = "⏩"
  }, {
    item = "⏭",
    subText = "(next track button) :next_track_button:",
    text = "⏭"
  }, {
    item = "⏯",
    subText = "(play or pause button) :play_or_pause_button:",
    text = "⏯"
  }, {
    item = "◀️",
    subText = "(reverse button) :arrow_backward:",
    text = "◀️"
  }, {
    item = "⏪",
    subText = "(fast reverse button) :rewind:",
    text = "⏪"
  }, {
    item = "⏮",
    subText = "(last track button) :previous_track_button:",
    text = "⏮"
  }, {
    item = "🔼",
    subText = "(upwards button) :arrow_up_small:",
    text = "🔼"
  }, {
    item = "⏫",
    subText = "(fast up button) :arrow_double_up:",
    text = "⏫"
  }, {
    item = "🔽",
    subText = "(downwards button) :arrow_down_small:",
    text = "🔽"
  }, {
    item = "⏬",
    subText = "(fast down button) :arrow_double_down:",
    text = "⏬"
  }, {
    item = "⏸",
    subText = "(pause button) :pause_button:",
    text = "⏸"
  }, {
    item = "⏹",
    subText = "(stop button) :stop_button:",
    text = "⏹"
  }, {
    item = "⏺",
    subText = "(record button) :record_button:",
    text = "⏺"
  }, {
    item = "⏏️",
    subText = "(eject button) :eject_button:",
    text = "⏏️"
  }, {
    item = "🎦",
    subText = "(cinema) :cinema: #film #movie",
    text = "🎦"
  }, {
    item = "🔅",
    subText = "(dim button) :low_brightness:",
    text = "🔅"
  }, {
    item = "🔆",
    subText = "(bright button) :high_brightness:",
    text = "🔆"
  }, {
    item = "📶",
    subText = "(antenna bars) :signal_strength: #wifi",
    text = "📶"
  }, {
    item = "📳",
    subText = "(vibration mode) :vibration_mode:",
    text = "📳"
  }, {
    item = "📴",
    subText = "(mobile phone off) :mobile_phone_off: #mute #off",
    text = "📴"
  }, {
    item = "♀️",
    subText = "(female sign) :female_sign:",
    text = "♀️"
  }, {
    item = "♂️",
    subText = "(male sign) :male_sign:",
    text = "♂️"
  }, {
    item = "⚕",
    subText = "(medical symbol) :medical_symbol:",
    text = "⚕"
  }, {
    item = "♾",
    subText = "(infinity) :infinity:",
    text = "♾"
  }, {
    item = "♻️",
    subText = "(recycling symbol) :recycle: #environment #green",
    text = "♻️"
  }, {
    item = "⚜",
    subText = "(fleur-de-lis) :fleur_de_lis:",
    text = "⚜"
  }, {
    item = "🔱",
    subText = "(trident emblem) :trident:",
    text = "🔱"
  }, {
    item = "📛",
    subText = "(name badge) :name_badge:",
    text = "📛"
  }, {
    item = "🔰",
    subText = "(Japanese symbol for beginner) :beginner:",
    text = "🔰"
  }, {
    item = "⭕",
    subText = "(hollow red circle) :o:",
    text = "⭕"
  }, {
    item = "✅",
    subText = "(check mark button) :white_check_mark:",
    text = "✅"
  }, {
    item = "☑️",
    subText = "(check box with check) :ballot_box_with_check:",
    text = "☑️"
  }, {
    item = "✔️",
    subText = "(check mark) :heavy_check_mark:",
    text = "✔️"
  }, {
    item = "✖️",
    subText = "(multiplication sign) :heavy_multiplication_x:",
    text = "✖️"
  }, {
    item = "❌",
    subText = "(cross mark) :x:",
    text = "❌"
  }, {
    item = "❎",
    subText = "(cross mark button) :negative_squared_cross_mark:",
    text = "❎"
  }, {
    item = "➕",
    subText = "(plus sign) :heavy_plus_sign:",
    text = "➕"
  }, {
    item = "➖",
    subText = "(minus sign) :heavy_minus_sign:",
    text = "➖"
  }, {
    item = "➗",
    subText = "(division sign) :heavy_division_sign:",
    text = "➗"
  }, {
    item = "➰",
    subText = "(curly loop) :curly_loop:",
    text = "➰"
  }, {
    item = "➿",
    subText = "(double curly loop) :loop:",
    text = "➿"
  }, {
    item = "〽️",
    subText = "(part alternation mark) :part_alternation_mark:",
    text = "〽️"
  }, {
    item = "✳️",
    subText = "(eight-spoked asterisk) :eight_spoked_asterisk:",
    text = "✳️"
  }, {
    item = "✴️",
    subText = "(eight-pointed star) :eight_pointed_black_star:",
    text = "✴️"
  }, {
    item = "❇️",
    subText = "(sparkle) :sparkle:",
    text = "❇️"
  }, {
    item = "‼️",
    subText = "(double exclamation mark) :bangbang:",
    text = "‼️"
  }, {
    item = "⁉️",
    subText = "(exclamation question mark) :interrobang:",
    text = "⁉️"
  }, {
    item = "❓",
    subText = "(question mark) :question: #confused",
    text = "❓"
  }, {
    item = "❔",
    subText = "(white question mark) :grey_question:",
    text = "❔"
  }, {
    item = "❕",
    subText = "(white exclamation mark) :grey_exclamation:",
    text = "❕"
  }, {
    item = "❗",
    subText = "(exclamation mark) :exclamation: :heavy_exclamation_mark: #bang",
    text = "❗"
  }, {
    item = "〰️",
    subText = "(wavy dash) :wavy_dash:",
    text = "〰️"
  }, {
    item = "©️",
    subText = "(copyright) :copyright:",
    text = "©️"
  }, {
    item = "®️",
    subText = "(registered) :registered:",
    text = "®️"
  }, {
    item = "™️",
    subText = "(trade mark) :tm: #trademark",
    text = "™️"
  }, {
    item = "#️⃣",
    subText = "(keycap: #) :hash: #number",
    text = "#️⃣"
  }, {
    item = "*️⃣",
    subText = "(keycap: *) :asterisk:",
    text = "*️⃣"
  }, {
    item = "0️⃣",
    subText = "(keycap: 0) :zero:",
    text = "0️⃣"
  }, {
    item = "1️⃣",
    subText = "(keycap: 1) :one:",
    text = "1️⃣"
  }, {
    item = "2️⃣",
    subText = "(keycap: 2) :two:",
    text = "2️⃣"
  }, {
    item = "3️⃣",
    subText = "(keycap: 3) :three:",
    text = "3️⃣"
  }, {
    item = "4️⃣",
    subText = "(keycap: 4) :four:",
    text = "4️⃣"
  }, {
    item = "5️⃣",
    subText = "(keycap: 5) :five:",
    text = "5️⃣"
  }, {
    item = "6️⃣",
    subText = "(keycap: 6) :six:",
    text = "6️⃣"
  }, {
    item = "7️⃣",
    subText = "(keycap: 7) :seven:",
    text = "7️⃣"
  }, {
    item = "8️⃣",
    subText = "(keycap: 8) :eight:",
    text = "8️⃣"
  }, {
    item = "9️⃣",
    subText = "(keycap: 9) :nine:",
    text = "9️⃣"
  }, {
    item = "🔟",
    subText = "(keycap: 10) :keycap_ten:",
    text = "🔟"
  }, {
    item = "🔠",
    subText = "(input latin uppercase) :capital_abcd: #letters",
    text = "🔠"
  }, {
    item = "🔡",
    subText = "(input latin lowercase) :abcd:",
    text = "🔡"
  }, {
    item = "🔢",
    subText = "(input numbers) :1234: #numbers",
    text = "🔢"
  }, {
    item = "🔣",
    subText = "(input symbols) :symbols:",
    text = "🔣"
  }, {
    item = "🔤",
    subText = "(input latin letters) :abc: #alphabet",
    text = "🔤"
  }, {
    item = "🅰️",
    subText = "(A button (blood type)) :a:",
    text = "🅰️"
  }, {
    item = "🆎",
    subText = "(AB button (blood type)) :ab:",
    text = "🆎"
  }, {
    item = "🅱️",
    subText = "(B button (blood type)) :b:",
    text = "🅱️"
  }, {
    item = "🆑",
    subText = "(CL button) :cl:",
    text = "🆑"
  }, {
    item = "🆒",
    subText = "(COOL button) :cool:",
    text = "🆒"
  }, {
    item = "🆓",
    subText = "(FREE button) :free:",
    text = "🆓"
  }, {
    item = "ℹ️",
    subText = "(information) :information_source:",
    text = "ℹ️"
  }, {
    item = "🆔",
    subText = "(ID button) :id:",
    text = "🆔"
  }, {
    item = "Ⓜ️",
    subText = "(circled M) :m:",
    text = "Ⓜ️"
  }, {
    item = "🆕",
    subText = "(NEW button) :new: #fresh",
    text = "🆕"
  }, {
    item = "🆖",
    subText = "(NG button) :ng:",
    text = "🆖"
  }, {
    item = "🅾️",
    subText = "(O button (blood type)) :o2:",
    text = "🅾️"
  }, {
    item = "🆗",
    subText = "(OK button) :ok: #yes",
    text = "🆗"
  }, {
    item = "🅿️",
    subText = "(P button) :parking:",
    text = "🅿️"
  }, {
    item = "🆘",
    subText = "(SOS button) :sos: #help #emergency",
    text = "🆘"
  }, {
    item = "🆙",
    subText = "(UP! button) :up:",
    text = "🆙"
  }, {
    item = "🆚",
    subText = "(VS button) :vs:",
    text = "🆚"
  }, {
    item = "🈁",
    subText = "(Japanese “here” button) :koko:",
    text = "🈁"
  }, {
    item = "🈂️",
    subText = "(Japanese “service charge” button) :sa:",
    text = "🈂️"
  }, {
    item = "🈷️",
    subText = "(Japanese “monthly amount” button) :u6708:",
    text = "🈷️"
  }, {
    item = "🈶",
    subText = "(Japanese “not free of charge” button) :u6709:",
    text = "🈶"
  }, {
    item = "🈯",
    subText = "(Japanese “reserved” button) :u6307:",
    text = "🈯"
  }, {
    item = "🉐",
    subText = "(Japanese “bargain” button) :ideograph_advantage:",
    text = "🉐"
  }, {
    item = "🈹",
    subText = "(Japanese “discount” button) :u5272:",
    text = "🈹"
  }, {
    item = "🈚",
    subText = "(Japanese “free of charge” button) :u7121:",
    text = "🈚"
  }, {
    item = "🈲",
    subText = "(Japanese “prohibited” button) :u7981:",
    text = "🈲"
  }, {
    item = "🉑",
    subText = "(Japanese “acceptable” button) :accept:",
    text = "🉑"
  }, {
    item = "🈸",
    subText = "(Japanese “application” button) :u7533:",
    text = "🈸"
  }, {
    item = "🈴",
    subText = "(Japanese “passing grade” button) :u5408:",
    text = "🈴"
  }, {
    item = "🈳",
    subText = "(Japanese “vacancy” button) :u7a7a:",
    text = "🈳"
  }, {
    item = "㊗️",
    subText = "(Japanese “congratulations” button) :congratulations:",
    text = "㊗️"
  }, {
    item = "㊙️",
    subText = "(Japanese “secret” button) :secret:",
    text = "㊙️"
  }, {
    item = "🈺",
    subText = "(Japanese “open for business” button) :u55b6:",
    text = "🈺"
  }, {
    item = "🈵",
    subText = "(Japanese “no vacancy” button) :u6e80:",
    text = "🈵"
  }, {
    item = "🔴",
    subText = "(red circle) :red_circle:",
    text = "🔴"
  }, {
    item = "🟠",
    subText = "(orange circle) :orange_circle:",
    text = "🟠"
  }, {
    item = "🟡",
    subText = "(yellow circle) :yellow_circle:",
    text = "🟡"
  }, {
    item = "🟢",
    subText = "(green circle) :green_circle:",
    text = "🟢"
  }, {
    item = "🔵",
    subText = "(blue circle) :large_blue_circle:",
    text = "🔵"
  }, {
    item = "🟣",
    subText = "(purple circle) :purple_circle:",
    text = "🟣"
  }, {
    item = "🟤",
    subText = "(brown circle) :brown_circle:",
    text = "🟤"
  }, {
    item = "⚫",
    subText = "(black circle) :black_circle:",
    text = "⚫"
  }, {
    item = "⚪",
    subText = "(white circle) :white_circle:",
    text = "⚪"
  }, {
    item = "🟥",
    subText = "(red square) :red_square:",
    text = "🟥"
  }, {
    item = "🟧",
    subText = "(orange square) :orange_square:",
    text = "🟧"
  }, {
    item = "🟨",
    subText = "(yellow square) :yellow_square:",
    text = "🟨"
  }, {
    item = "🟩",
    subText = "(green square) :green_square:",
    text = "🟩"
  }, {
    item = "🟦",
    subText = "(blue square) :blue_square:",
    text = "🟦"
  }, {
    item = "🟪",
    subText = "(purple square) :purple_square:",
    text = "🟪"
  }, {
    item = "🟫",
    subText = "(brown square) :brown_square:",
    text = "🟫"
  }, {
    item = "⬛",
    subText = "(black large square) :black_large_square:",
    text = "⬛"
  }, {
    item = "⬜",
    subText = "(white large square) :white_large_square:",
    text = "⬜"
  }, {
    item = "◼️",
    subText = "(black medium square) :black_medium_square:",
    text = "◼️"
  }, {
    item = "◻️",
    subText = "(white medium square) :white_medium_square:",
    text = "◻️"
  }, {
    item = "◾",
    subText = "(black medium-small square) :black_medium_small_square:",
    text = "◾"
  }, {
    item = "◽",
    subText = "(white medium-small square) :white_medium_small_square:",
    text = "◽"
  }, {
    item = "▪️",
    subText = "(black small square) :black_small_square:",
    text = "▪️"
  }, {
    item = "▫️",
    subText = "(white small square) :white_small_square:",
    text = "▫️"
  }, {
    item = "🔶",
    subText = "(large orange diamond) :large_orange_diamond:",
    text = "🔶"
  }, {
    item = "🔷",
    subText = "(large blue diamond) :large_blue_diamond:",
    text = "🔷"
  }, {
    item = "🔸",
    subText = "(small orange diamond) :small_orange_diamond:",
    text = "🔸"
  }, {
    item = "🔹",
    subText = "(small blue diamond) :small_blue_diamond:",
    text = "🔹"
  }, {
    item = "🔺",
    subText = "(red triangle pointed up) :small_red_triangle:",
    text = "🔺"
  }, {
    item = "🔻",
    subText = "(red triangle pointed down) :small_red_triangle_down:",
    text = "🔻"
  }, {
    item = "💠",
    subText = "(diamond with a dot) :diamond_shape_with_a_dot_inside:",
    text = "💠"
  }, {
    item = "🔘",
    subText = "(radio button) :radio_button:",
    text = "🔘"
  }, {
    item = "🔳",
    subText = "(white square button) :white_square_button:",
    text = "🔳"
  }, {
    item = "🔲",
    subText = "(black square button) :black_square_button:",
    text = "🔲"
  }, {
    item = "🏁",
    subText = "(chequered flag) :checkered_flag: #milestone #finish",
    text = "🏁"
  }, {
    item = "🚩",
    subText = "(triangular flag) :triangular_flag_on_post:",
    text = "🚩"
  }, {
    item = "🎌",
    subText = "(crossed flags) :crossed_flags:",
    text = "🎌"
  }, {
    item = "🏴",
    subText = "(black flag) :black_flag:",
    text = "🏴"
  }, {
    item = "🏳",
    subText = "(white flag) :white_flag:",
    text = "🏳"
  }, {
    item = "🏳️‍🌈",
    subText = "(rainbow flag) :rainbow_flag: #pride",
    text = "🏳️‍🌈"
  }, {
    item = "🏴‍☠",
    subText = "(pirate flag) :pirate_flag:",
    text = "🏴‍☠"
  }, {
    item = "🇦🇨",
    subText = "(flag: Ascension Island) :ascension_island:",
    text = "🇦🇨"
  }, {
    item = "🇦🇩",
    subText = "(flag: Andorra) :andorra:",
    text = "🇦🇩"
  }, {
    item = "🇦🇪",
    subText = "(flag: United Arab Emirates) :united_arab_emirates:",
    text = "🇦🇪"
  }, {
    item = "🇦🇫",
    subText = "(flag: Afghanistan) :afghanistan:",
    text = "🇦🇫"
  }, {
    item = "🇦🇬",
    subText = "(flag: Antigua & Barbuda) :antigua_barbuda:",
    text = "🇦🇬"
  }, {
    item = "🇦🇮",
    subText = "(flag: Anguilla) :anguilla:",
    text = "🇦🇮"
  }, {
    item = "🇦🇱",
    subText = "(flag: Albania) :albania:",
    text = "🇦🇱"
  }, {
    item = "🇦🇲",
    subText = "(flag: Armenia) :armenia:",
    text = "🇦🇲"
  }, {
    item = "🇦🇴",
    subText = "(flag: Angola) :angola:",
    text = "🇦🇴"
  }, {
    item = "🇦🇶",
    subText = "(flag: Antarctica) :antarctica:",
    text = "🇦🇶"
  }, {
    item = "🇦🇷",
    subText = "(flag: Argentina) :argentina:",
    text = "🇦🇷"
  }, {
    item = "🇦🇸",
    subText = "(flag: American Samoa) :american_samoa:",
    text = "🇦🇸"
  }, {
    item = "🇦🇹",
    subText = "(flag: Austria) :austria:",
    text = "🇦🇹"
  }, {
    item = "🇦🇺",
    subText = "(flag: Australia) :australia:",
    text = "🇦🇺"
  }, {
    item = "🇦🇼",
    subText = "(flag: Aruba) :aruba:",
    text = "🇦🇼"
  }, {
    item = "🇦🇽",
    subText = "(flag: Åland Islands) :aland_islands:",
    text = "🇦🇽"
  }, {
    item = "🇦🇿",
    subText = "(flag: Azerbaijan) :azerbaijan:",
    text = "🇦🇿"
  }, {
    item = "🇧🇦",
    subText = "(flag: Bosnia & Herzegovina) :bosnia_herzegovina:",
    text = "🇧🇦"
  }, {
    item = "🇧🇧",
    subText = "(flag: Barbados) :barbados:",
    text = "🇧🇧"
  }, {
    item = "🇧🇩",
    subText = "(flag: Bangladesh) :bangladesh:",
    text = "🇧🇩"
  }, {
    item = "🇧🇪",
    subText = "(flag: Belgium) :belgium:",
    text = "🇧🇪"
  }, {
    item = "🇧🇫",
    subText = "(flag: Burkina Faso) :burkina_faso:",
    text = "🇧🇫"
  }, {
    item = "🇧🇬",
    subText = "(flag: Bulgaria) :bulgaria:",
    text = "🇧🇬"
  }, {
    item = "🇧🇭",
    subText = "(flag: Bahrain) :bahrain:",
    text = "🇧🇭"
  }, {
    item = "🇧🇮",
    subText = "(flag: Burundi) :burundi:",
    text = "🇧🇮"
  }, {
    item = "🇧🇯",
    subText = "(flag: Benin) :benin:",
    text = "🇧🇯"
  }, {
    item = "🇧🇱",
    subText = "(flag: St. Barthélemy) :st_barthelemy:",
    text = "🇧🇱"
  }, {
    item = "🇧🇲",
    subText = "(flag: Bermuda) :bermuda:",
    text = "🇧🇲"
  }, {
    item = "🇧🇳",
    subText = "(flag: Brunei) :brunei:",
    text = "🇧🇳"
  }, {
    item = "🇧🇴",
    subText = "(flag: Bolivia) :bolivia:",
    text = "🇧🇴"
  }, {
    item = "🇧🇶",
    subText = "(flag: Caribbean Netherlands) :caribbean_netherlands:",
    text = "🇧🇶"
  }, {
    item = "🇧🇷",
    subText = "(flag: Brazil) :brazil:",
    text = "🇧🇷"
  }, {
    item = "🇧🇸",
    subText = "(flag: Bahamas) :bahamas:",
    text = "🇧🇸"
  }, {
    item = "🇧🇹",
    subText = "(flag: Bhutan) :bhutan:",
    text = "🇧🇹"
  }, {
    item = "🇧🇻",
    subText = "(flag: Bouvet Island) :bouvet_island:",
    text = "🇧🇻"
  }, {
    item = "🇧🇼",
    subText = "(flag: Botswana) :botswana:",
    text = "🇧🇼"
  }, {
    item = "🇧🇾",
    subText = "(flag: Belarus) :belarus:",
    text = "🇧🇾"
  }, {
    item = "🇧🇿",
    subText = "(flag: Belize) :belize:",
    text = "🇧🇿"
  }, {
    item = "🇨🇦",
    subText = "(flag: Canada) :canada:",
    text = "🇨🇦"
  }, {
    item = "🇨🇨",
    subText = "(flag: Cocos (Keeling) Islands) :cocos_islands: #keeling",
    text = "🇨🇨"
  }, {
    item = "🇨🇩",
    subText = "(flag: Congo - Kinshasa) :congo_kinshasa:",
    text = "🇨🇩"
  }, {
    item = "🇨🇫",
    subText = "(flag: Central African Republic) :central_african_republic:",
    text = "🇨🇫"
  }, {
    item = "🇨🇬",
    subText = "(flag: Congo - Brazzaville) :congo_brazzaville:",
    text = "🇨🇬"
  }, {
    item = "🇨🇭",
    subText = "(flag: Switzerland) :switzerland:",
    text = "🇨🇭"
  }, {
    item = "🇨🇮",
    subText = "(flag: Côte d’Ivoire) :cote_divoire: #ivory",
    text = "🇨🇮"
  }, {
    item = "🇨🇰",
    subText = "(flag: Cook Islands) :cook_islands:",
    text = "🇨🇰"
  }, {
    item = "🇨🇱",
    subText = "(flag: Chile) :chile:",
    text = "🇨🇱"
  }, {
    item = "🇨🇲",
    subText = "(flag: Cameroon) :cameroon:",
    text = "🇨🇲"
  }, {
    item = "🇨🇳",
    subText = "(flag: China) :cn: #china",
    text = "🇨🇳"
  }, {
    item = "🇨🇴",
    subText = "(flag: Colombia) :colombia:",
    text = "🇨🇴"
  }, {
    item = "🇨🇵",
    subText = "(flag: Clipperton Island) :clipperton_island:",
    text = "🇨🇵"
  }, {
    item = "🇨🇷",
    subText = "(flag: Costa Rica) :costa_rica:",
    text = "🇨🇷"
  }, {
    item = "🇨🇺",
    subText = "(flag: Cuba) :cuba:",
    text = "🇨🇺"
  }, {
    item = "🇨🇻",
    subText = "(flag: Cape Verde) :cape_verde:",
    text = "🇨🇻"
  }, {
    item = "🇨🇼",
    subText = "(flag: Curaçao) :curacao:",
    text = "🇨🇼"
  }, {
    item = "🇨🇽",
    subText = "(flag: Christmas Island) :christmas_island:",
    text = "🇨🇽"
  }, {
    item = "🇨🇾",
    subText = "(flag: Cyprus) :cyprus:",
    text = "🇨🇾"
  }, {
    item = "🇨🇿",
    subText = "(flag: Czechia) :czech_republic:",
    text = "🇨🇿"
  }, {
    item = "🇩🇪",
    subText = "(flag: Germany) :de: #flag #germany",
    text = "🇩🇪"
  }, {
    item = "🇩🇬",
    subText = "(flag: Diego Garcia) :diego_garcia:",
    text = "🇩🇬"
  }, {
    item = "🇩🇯",
    subText = "(flag: Djibouti) :djibouti:",
    text = "🇩🇯"
  }, {
    item = "🇩🇰",
    subText = "(flag: Denmark) :denmark:",
    text = "🇩🇰"
  }, {
    item = "🇩🇲",
    subText = "(flag: Dominica) :dominica:",
    text = "🇩🇲"
  }, {
    item = "🇩🇴",
    subText = "(flag: Dominican Republic) :dominican_republic:",
    text = "🇩🇴"
  }, {
    item = "🇩🇿",
    subText = "(flag: Algeria) :algeria:",
    text = "🇩🇿"
  }, {
    item = "🇪🇦",
    subText = "(flag: Ceuta & Melilla) :ceuta_melilla:",
    text = "🇪🇦"
  }, {
    item = "🇪🇨",
    subText = "(flag: Ecuador) :ecuador:",
    text = "🇪🇨"
  }, {
    item = "🇪🇪",
    subText = "(flag: Estonia) :estonia:",
    text = "🇪🇪"
  }, {
    item = "🇪🇬",
    subText = "(flag: Egypt) :egypt:",
    text = "🇪🇬"
  }, {
    item = "🇪🇭",
    subText = "(flag: Western Sahara) :western_sahara:",
    text = "🇪🇭"
  }, {
    item = "🇪🇷",
    subText = "(flag: Eritrea) :eritrea:",
    text = "🇪🇷"
  }, {
    item = "🇪🇸",
    subText = "(flag: Spain) :es: #spain",
    text = "🇪🇸"
  }, {
    item = "🇪🇹",
    subText = "(flag: Ethiopia) :ethiopia:",
    text = "🇪🇹"
  }, {
    item = "🇪🇺",
    subText = "(flag: European Union) :eu: :european_union:",
    text = "🇪🇺"
  }, {
    item = "🇫🇮",
    subText = "(flag: Finland) :finland:",
    text = "🇫🇮"
  }, {
    item = "🇫🇯",
    subText = "(flag: Fiji) :fiji:",
    text = "🇫🇯"
  }, {
    item = "🇫🇰",
    subText = "(flag: Falkland Islands) :falkland_islands:",
    text = "🇫🇰"
  }, {
    item = "🇫🇲",
    subText = "(flag: Micronesia) :micronesia:",
    text = "🇫🇲"
  }, {
    item = "🇫🇴",
    subText = "(flag: Faroe Islands) :faroe_islands:",
    text = "🇫🇴"
  }, {
    item = "🇫🇷",
    subText = "(flag: France) :fr: #france #french",
    text = "🇫🇷"
  }, {
    item = "🇬🇦",
    subText = "(flag: Gabon) :gabon:",
    text = "🇬🇦"
  }, {
    item = "🇬🇧",
    subText = "(flag: United Kingdom) :gb: :uk: #flag #british",
    text = "🇬🇧"
  }, {
    item = "🇬🇩",
    subText = "(flag: Grenada) :grenada:",
    text = "🇬🇩"
  }, {
    item = "🇬🇪",
    subText = "(flag: Georgia) :georgia:",
    text = "🇬🇪"
  }, {
    item = "🇬🇫",
    subText = "(flag: French Guiana) :french_guiana:",
    text = "🇬🇫"
  }, {
    item = "🇬🇬",
    subText = "(flag: Guernsey) :guernsey:",
    text = "🇬🇬"
  }, {
    item = "🇬🇭",
    subText = "(flag: Ghana) :ghana:",
    text = "🇬🇭"
  }, {
    item = "🇬🇮",
    subText = "(flag: Gibraltar) :gibraltar:",
    text = "🇬🇮"
  }, {
    item = "🇬🇱",
    subText = "(flag: Greenland) :greenland:",
    text = "🇬🇱"
  }, {
    item = "🇬🇲",
    subText = "(flag: Gambia) :gambia:",
    text = "🇬🇲"
  }, {
    item = "🇬🇳",
    subText = "(flag: Guinea) :guinea:",
    text = "🇬🇳"
  }, {
    item = "🇬🇵",
    subText = "(flag: Guadeloupe) :guadeloupe:",
    text = "🇬🇵"
  }, {
    item = "🇬🇶",
    subText = "(flag: Equatorial Guinea) :equatorial_guinea:",
    text = "🇬🇶"
  }, {
    item = "🇬🇷",
    subText = "(flag: Greece) :greece:",
    text = "🇬🇷"
  }, {
    item = "🇬🇸",
    subText = "(flag: South Georgia & South Sandwich Islands) :south_georgia_south_sandwich_islands:",
    text = "🇬🇸"
  }, {
    item = "🇬🇹",
    subText = "(flag: Guatemala) :guatemala:",
    text = "🇬🇹"
  }, {
    item = "🇬🇺",
    subText = "(flag: Guam) :guam:",
    text = "🇬🇺"
  }, {
    item = "🇬🇼",
    subText = "(flag: Guinea-Bissau) :guinea_bissau:",
    text = "🇬🇼"
  }, {
    item = "🇬🇾",
    subText = "(flag: Guyana) :guyana:",
    text = "🇬🇾"
  }, {
    item = "🇭🇰",
    subText = "(flag: Hong Kong SAR China) :hong_kong:",
    text = "🇭🇰"
  }, {
    item = "🇭🇲",
    subText = "(flag: Heard & McDonald Islands) :heard_mcdonald_islands:",
    text = "🇭🇲"
  }, {
    item = "🇭🇳",
    subText = "(flag: Honduras) :honduras:",
    text = "🇭🇳"
  }, {
    item = "🇭🇷",
    subText = "(flag: Croatia) :croatia:",
    text = "🇭🇷"
  }, {
    item = "🇭🇹",
    subText = "(flag: Haiti) :haiti:",
    text = "🇭🇹"
  }, {
    item = "🇭🇺",
    subText = "(flag: Hungary) :hungary:",
    text = "🇭🇺"
  }, {
    item = "🇮🇨",
    subText = "(flag: Canary Islands) :canary_islands:",
    text = "🇮🇨"
  }, {
    item = "🇮🇩",
    subText = "(flag: Indonesia) :indonesia:",
    text = "🇮🇩"
  }, {
    item = "🇮🇪",
    subText = "(flag: Ireland) :ireland:",
    text = "🇮🇪"
  }, {
    item = "🇮🇱",
    subText = "(flag: Israel) :israel:",
    text = "🇮🇱"
  }, {
    item = "🇮🇲",
    subText = "(flag: Isle of Man) :isle_of_man:",
    text = "🇮🇲"
  }, {
    item = "🇮🇳",
    subText = "(flag: India) :india:",
    text = "🇮🇳"
  }, {
    item = "🇮🇴",
    subText = "(flag: British Indian Ocean Territory) :british_indian_ocean_territory:",
    text = "🇮🇴"
  }, {
    item = "🇮🇶",
    subText = "(flag: Iraq) :iraq:",
    text = "🇮🇶"
  }, {
    item = "🇮🇷",
    subText = "(flag: Iran) :iran:",
    text = "🇮🇷"
  }, {
    item = "🇮🇸",
    subText = "(flag: Iceland) :iceland:",
    text = "🇮🇸"
  }, {
    item = "🇮🇹",
    subText = "(flag: Italy) :it: #italy",
    text = "🇮🇹"
  }, {
    item = "🇯🇪",
    subText = "(flag: Jersey) :jersey:",
    text = "🇯🇪"
  }, {
    item = "🇯🇲",
    subText = "(flag: Jamaica) :jamaica:",
    text = "🇯🇲"
  }, {
    item = "🇯🇴",
    subText = "(flag: Jordan) :jordan:",
    text = "🇯🇴"
  }, {
    item = "🇯🇵",
    subText = "(flag: Japan) :jp: #japan",
    text = "🇯🇵"
  }, {
    item = "🇰🇪",
    subText = "(flag: Kenya) :kenya:",
    text = "🇰🇪"
  }, {
    item = "🇰🇬",
    subText = "(flag: Kyrgyzstan) :kyrgyzstan:",
    text = "🇰🇬"
  }, {
    item = "🇰🇭",
    subText = "(flag: Cambodia) :cambodia:",
    text = "🇰🇭"
  }, {
    item = "🇰🇮",
    subText = "(flag: Kiribati) :kiribati:",
    text = "🇰🇮"
  }, {
    item = "🇰🇲",
    subText = "(flag: Comoros) :comoros:",
    text = "🇰🇲"
  }, {
    item = "🇰🇳",
    subText = "(flag: St. Kitts & Nevis) :st_kitts_nevis:",
    text = "🇰🇳"
  }, {
    item = "🇰🇵",
    subText = "(flag: North Korea) :north_korea:",
    text = "🇰🇵"
  }, {
    item = "🇰🇷",
    subText = "(flag: South Korea) :kr: #korea",
    text = "🇰🇷"
  }, {
    item = "🇰🇼",
    subText = "(flag: Kuwait) :kuwait:",
    text = "🇰🇼"
  }, {
    item = "🇰🇾",
    subText = "(flag: Cayman Islands) :cayman_islands:",
    text = "🇰🇾"
  }, {
    item = "🇰🇿",
    subText = "(flag: Kazakhstan) :kazakhstan:",
    text = "🇰🇿"
  }, {
    item = "🇱🇦",
    subText = "(flag: Laos) :laos:",
    text = "🇱🇦"
  }, {
    item = "🇱🇧",
    subText = "(flag: Lebanon) :lebanon:",
    text = "🇱🇧"
  }, {
    item = "🇱🇨",
    subText = "(flag: St. Lucia) :st_lucia:",
    text = "🇱🇨"
  }, {
    item = "🇱🇮",
    subText = "(flag: Liechtenstein) :liechtenstein:",
    text = "🇱🇮"
  }, {
    item = "🇱🇰",
    subText = "(flag: Sri Lanka) :sri_lanka:",
    text = "🇱🇰"
  }, {
    item = "🇱🇷",
    subText = "(flag: Liberia) :liberia:",
    text = "🇱🇷"
  }, {
    item = "🇱🇸",
    subText = "(flag: Lesotho) :lesotho:",
    text = "🇱🇸"
  }, {
    item = "🇱🇹",
    subText = "(flag: Lithuania) :lithuania:",
    text = "🇱🇹"
  }, {
    item = "🇱🇺",
    subText = "(flag: Luxembourg) :luxembourg:",
    text = "🇱🇺"
  }, {
    item = "🇱🇻",
    subText = "(flag: Latvia) :latvia:",
    text = "🇱🇻"
  }, {
    item = "🇱🇾",
    subText = "(flag: Libya) :libya:",
    text = "🇱🇾"
  }, {
    item = "🇲🇦",
    subText = "(flag: Morocco) :morocco:",
    text = "🇲🇦"
  }, {
    item = "🇲🇨",
    subText = "(flag: Monaco) :monaco:",
    text = "🇲🇨"
  }, {
    item = "🇲🇩",
    subText = "(flag: Moldova) :moldova:",
    text = "🇲🇩"
  }, {
    item = "🇲🇪",
    subText = "(flag: Montenegro) :montenegro:",
    text = "🇲🇪"
  }, {
    item = "🇲🇫",
    subText = "(flag: St. Martin) :st_martin:",
    text = "🇲🇫"
  }, {
    item = "🇲🇬",
    subText = "(flag: Madagascar) :madagascar:",
    text = "🇲🇬"
  }, {
    item = "🇲🇭",
    subText = "(flag: Marshall Islands) :marshall_islands:",
    text = "🇲🇭"
  }, {
    item = "🇲🇰",
    subText = "(flag: Macedonia) :macedonia:",
    text = "🇲🇰"
  }, {
    item = "🇲🇱",
    subText = "(flag: Mali) :mali:",
    text = "🇲🇱"
  }, {
    item = "🇲🇲",
    subText = "(flag: Myanmar (Burma)) :myanmar: #burma",
    text = "🇲🇲"
  }, {
    item = "🇲🇳",
    subText = "(flag: Mongolia) :mongolia:",
    text = "🇲🇳"
  }, {
    item = "🇲🇴",
    subText = "(flag: Macao SAR China) :macau:",
    text = "🇲🇴"
  }, {
    item = "🇲🇵",
    subText = "(flag: Northern Mariana Islands) :northern_mariana_islands:",
    text = "🇲🇵"
  }, {
    item = "🇲🇶",
    subText = "(flag: Martinique) :martinique:",
    text = "🇲🇶"
  }, {
    item = "🇲🇷",
    subText = "(flag: Mauritania) :mauritania:",
    text = "🇲🇷"
  }, {
    item = "🇲🇸",
    subText = "(flag: Montserrat) :montserrat:",
    text = "🇲🇸"
  }, {
    item = "🇲🇹",
    subText = "(flag: Malta) :malta:",
    text = "🇲🇹"
  }, {
    item = "🇲🇺",
    subText = "(flag: Mauritius) :mauritius:",
    text = "🇲🇺"
  }, {
    item = "🇲🇻",
    subText = "(flag: Maldives) :maldives:",
    text = "🇲🇻"
  }, {
    item = "🇲🇼",
    subText = "(flag: Malawi) :malawi:",
    text = "🇲🇼"
  }, {
    item = "🇲🇽",
    subText = "(flag: Mexico) :mexico:",
    text = "🇲🇽"
  }, {
    item = "🇲🇾",
    subText = "(flag: Malaysia) :malaysia:",
    text = "🇲🇾"
  }, {
    item = "🇲🇿",
    subText = "(flag: Mozambique) :mozambique:",
    text = "🇲🇿"
  }, {
    item = "🇳🇦",
    subText = "(flag: Namibia) :namibia:",
    text = "🇳🇦"
  }, {
    item = "🇳🇨",
    subText = "(flag: New Caledonia) :new_caledonia:",
    text = "🇳🇨"
  }, {
    item = "🇳🇪",
    subText = "(flag: Niger) :niger:",
    text = "🇳🇪"
  }, {
    item = "🇳🇫",
    subText = "(flag: Norfolk Island) :norfolk_island:",
    text = "🇳🇫"
  }, {
    item = "🇳🇬",
    subText = "(flag: Nigeria) :nigeria:",
    text = "🇳🇬"
  }, {
    item = "🇳🇮",
    subText = "(flag: Nicaragua) :nicaragua:",
    text = "🇳🇮"
  }, {
    item = "🇳🇱",
    subText = "(flag: Netherlands) :netherlands:",
    text = "🇳🇱"
  }, {
    item = "🇳🇴",
    subText = "(flag: Norway) :norway:",
    text = "🇳🇴"
  }, {
    item = "🇳🇵",
    subText = "(flag: Nepal) :nepal:",
    text = "🇳🇵"
  }, {
    item = "🇳🇷",
    subText = "(flag: Nauru) :nauru:",
    text = "🇳🇷"
  }, {
    item = "🇳🇺",
    subText = "(flag: Niue) :niue:",
    text = "🇳🇺"
  }, {
    item = "🇳🇿",
    subText = "(flag: New Zealand) :new_zealand:",
    text = "🇳🇿"
  }, {
    item = "🇴🇲",
    subText = "(flag: Oman) :oman:",
    text = "🇴🇲"
  }, {
    item = "🇵🇦",
    subText = "(flag: Panama) :panama:",
    text = "🇵🇦"
  }, {
    item = "🇵🇪",
    subText = "(flag: Peru) :peru:",
    text = "🇵🇪"
  }, {
    item = "🇵🇫",
    subText = "(flag: French Polynesia) :french_polynesia:",
    text = "🇵🇫"
  }, {
    item = "🇵🇬",
    subText = "(flag: Papua New Guinea) :papua_new_guinea:",
    text = "🇵🇬"
  }, {
    item = "🇵🇭",
    subText = "(flag: Philippines) :philippines:",
    text = "🇵🇭"
  }, {
    item = "🇵🇰",
    subText = "(flag: Pakistan) :pakistan:",
    text = "🇵🇰"
  }, {
    item = "🇵🇱",
    subText = "(flag: Poland) :poland:",
    text = "🇵🇱"
  }, {
    item = "🇵🇲",
    subText = "(flag: St. Pierre & Miquelon) :st_pierre_miquelon:",
    text = "🇵🇲"
  }, {
    item = "🇵🇳",
    subText = "(flag: Pitcairn Islands) :pitcairn_islands:",
    text = "🇵🇳"
  }, {
    item = "🇵🇷",
    subText = "(flag: Puerto Rico) :puerto_rico:",
    text = "🇵🇷"
  }, {
    item = "🇵🇸",
    subText = "(flag: Palestinian Territories) :palestinian_territories:",
    text = "🇵🇸"
  }, {
    item = "🇵🇹",
    subText = "(flag: Portugal) :portugal:",
    text = "🇵🇹"
  }, {
    item = "🇵🇼",
    subText = "(flag: Palau) :palau:",
    text = "🇵🇼"
  }, {
    item = "🇵🇾",
    subText = "(flag: Paraguay) :paraguay:",
    text = "🇵🇾"
  }, {
    item = "🇶🇦",
    subText = "(flag: Qatar) :qatar:",
    text = "🇶🇦"
  }, {
    item = "🇷🇪",
    subText = "(flag: Réunion) :reunion:",
    text = "🇷🇪"
  }, {
    item = "🇷🇴",
    subText = "(flag: Romania) :romania:",
    text = "🇷🇴"
  }, {
    item = "🇷🇸",
    subText = "(flag: Serbia) :serbia:",
    text = "🇷🇸"
  }, {
    item = "🇷🇺",
    subText = "(flag: Russia) :ru: #russia",
    text = "🇷🇺"
  }, {
    item = "🇷🇼",
    subText = "(flag: Rwanda) :rwanda:",
    text = "🇷🇼"
  }, {
    item = "🇸🇦",
    subText = "(flag: Saudi Arabia) :saudi_arabia:",
    text = "🇸🇦"
  }, {
    item = "🇸🇧",
    subText = "(flag: Solomon Islands) :solomon_islands:",
    text = "🇸🇧"
  }, {
    item = "🇸🇨",
    subText = "(flag: Seychelles) :seychelles:",
    text = "🇸🇨"
  }, {
    item = "🇸🇩",
    subText = "(flag: Sudan) :sudan:",
    text = "🇸🇩"
  }, {
    item = "🇸🇪",
    subText = "(flag: Sweden) :sweden:",
    text = "🇸🇪"
  }, {
    item = "🇸🇬",
    subText = "(flag: Singapore) :singapore:",
    text = "🇸🇬"
  }, {
    item = "🇸🇭",
    subText = "(flag: St. Helena) :st_helena:",
    text = "🇸🇭"
  }, {
    item = "🇸🇮",
    subText = "(flag: Slovenia) :slovenia:",
    text = "🇸🇮"
  }, {
    item = "🇸🇯",
    subText = "(flag: Svalbard & Jan Mayen) :svalbard_jan_mayen:",
    text = "🇸🇯"
  }, {
    item = "🇸🇰",
    subText = "(flag: Slovakia) :slovakia:",
    text = "🇸🇰"
  }, {
    item = "🇸🇱",
    subText = "(flag: Sierra Leone) :sierra_leone:",
    text = "🇸🇱"
  }, {
    item = "🇸🇲",
    subText = "(flag: San Marino) :san_marino:",
    text = "🇸🇲"
  }, {
    item = "🇸🇳",
    subText = "(flag: Senegal) :senegal:",
    text = "🇸🇳"
  }, {
    item = "🇸🇴",
    subText = "(flag: Somalia) :somalia:",
    text = "🇸🇴"
  }, {
    item = "🇸🇷",
    subText = "(flag: Suriname) :suriname:",
    text = "🇸🇷"
  }, {
    item = "🇸🇸",
    subText = "(flag: South Sudan) :south_sudan:",
    text = "🇸🇸"
  }, {
    item = "🇸🇹",
    subText = "(flag: São Tomé & Príncipe) :sao_tome_principe:",
    text = "🇸🇹"
  }, {
    item = "🇸🇻",
    subText = "(flag: El Salvador) :el_salvador:",
    text = "🇸🇻"
  }, {
    item = "🇸🇽",
    subText = "(flag: Sint Maarten) :sint_maarten:",
    text = "🇸🇽"
  }, {
    item = "🇸🇾",
    subText = "(flag: Syria) :syria:",
    text = "🇸🇾"
  }, {
    item = "🇸🇿",
    subText = "(flag: Eswatini) :swaziland:",
    text = "🇸🇿"
  }, {
    item = "🇹🇦",
    subText = "(flag: Tristan da Cunha) :tristan_da_cunha:",
    text = "🇹🇦"
  }, {
    item = "🇹🇨",
    subText = "(flag: Turks & Caicos Islands) :turks_caicos_islands:",
    text = "🇹🇨"
  }, {
    item = "🇹🇩",
    subText = "(flag: Chad) :chad:",
    text = "🇹🇩"
  }, {
    item = "🇹🇫",
    subText = "(flag: French Southern Territories) :french_southern_territories:",
    text = "🇹🇫"
  }, {
    item = "🇹🇬",
    subText = "(flag: Togo) :togo:",
    text = "🇹🇬"
  }, {
    item = "🇹🇭",
    subText = "(flag: Thailand) :thailand:",
    text = "🇹🇭"
  }, {
    item = "🇹🇯",
    subText = "(flag: Tajikistan) :tajikistan:",
    text = "🇹🇯"
  }, {
    item = "🇹🇰",
    subText = "(flag: Tokelau) :tokelau:",
    text = "🇹🇰"
  }, {
    item = "🇹🇱",
    subText = "(flag: Timor-Leste) :timor_leste:",
    text = "🇹🇱"
  }, {
    item = "🇹🇲",
    subText = "(flag: Turkmenistan) :turkmenistan:",
    text = "🇹🇲"
  }, {
    item = "🇹🇳",
    subText = "(flag: Tunisia) :tunisia:",
    text = "🇹🇳"
  }, {
    item = "🇹🇴",
    subText = "(flag: Tonga) :tonga:",
    text = "🇹🇴"
  }, {
    item = "🇹🇷",
    subText = "(flag: Turkey) :tr: #turkey",
    text = "🇹🇷"
  }, {
    item = "🇹🇹",
    subText = "(flag: Trinidad & Tobago) :trinidad_tobago:",
    text = "🇹🇹"
  }, {
    item = "🇹🇻",
    subText = "(flag: Tuvalu) :tuvalu:",
    text = "🇹🇻"
  }, {
    item = "🇹🇼",
    subText = "(flag: Taiwan) :taiwan:",
    text = "🇹🇼"
  }, {
    item = "🇹🇿",
    subText = "(flag: Tanzania) :tanzania:",
    text = "🇹🇿"
  }, {
    item = "🇺🇦",
    subText = "(flag: Ukraine) :ukraine:",
    text = "🇺🇦"
  }, {
    item = "🇺🇬",
    subText = "(flag: Uganda) :uganda:",
    text = "🇺🇬"
  }, {
    item = "🇺🇲",
    subText = "(flag: U.S. Outlying Islands) :us_outlying_islands:",
    text = "🇺🇲"
  }, {
    item = "🇺🇳",
    subText = "(flag: United Nations) :united_nations:",
    text = "🇺🇳"
  }, {
    item = "🇺🇸",
    subText = "(flag: United States) :us: #flag #united #america",
    text = "🇺🇸"
  }, {
    item = "🇺🇾",
    subText = "(flag: Uruguay) :uruguay:",
    text = "🇺🇾"
  }, {
    item = "🇺🇿",
    subText = "(flag: Uzbekistan) :uzbekistan:",
    text = "🇺🇿"
  }, {
    item = "🇻🇦",
    subText = "(flag: Vatican City) :vatican_city:",
    text = "🇻🇦"
  }, {
    item = "🇻🇨",
    subText = "(flag: St. Vincent & Grenadines) :st_vincent_grenadines:",
    text = "🇻🇨"
  }, {
    item = "🇻🇪",
    subText = "(flag: Venezuela) :venezuela:",
    text = "🇻🇪"
  }, {
    item = "🇻🇬",
    subText = "(flag: British Virgin Islands) :british_virgin_islands:",
    text = "🇻🇬"
  }, {
    item = "🇻🇮",
    subText = "(flag: U.S. Virgin Islands) :us_virgin_islands:",
    text = "🇻🇮"
  }, {
    item = "🇻🇳",
    subText = "(flag: Vietnam) :vietnam:",
    text = "🇻🇳"
  }, {
    item = "🇻🇺",
    subText = "(flag: Vanuatu) :vanuatu:",
    text = "🇻🇺"
  }, {
    item = "🇼🇫",
    subText = "(flag: Wallis & Futuna) :wallis_futuna:",
    text = "🇼🇫"
  }, {
    item = "🇼🇸",
    subText = "(flag: Samoa) :samoa:",
    text = "🇼🇸"
  }, {
    item = "🇽🇰",
    subText = "(flag: Kosovo) :kosovo:",
    text = "🇽🇰"
  }, {
    item = "🇾🇪",
    subText = "(flag: Yemen) :yemen:",
    text = "🇾🇪"
  }, {
    item = "🇾🇹",
    subText = "(flag: Mayotte) :mayotte:",
    text = "🇾🇹"
  }, {
    item = "🇿🇦",
    subText = "(flag: South Africa) :south_africa:",
    text = "🇿🇦"
  }, {
    item = "🇿🇲",
    subText = "(flag: Zambia) :zambia:",
    text = "🇿🇲"
  }, {
    item = "🇿🇼",
    subText = "(flag: Zimbabwe) :zimbabwe:",
    text = "🇿🇼"
  }, {
    item = "🏴󠁧󠁢󠁥󠁮󠁧󠁿",
    subText = "(flag: England) :england:",
    text = "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
  }, {
    item = "🏴󠁧󠁢󠁳󠁣󠁴󠁿",
    subText = "(flag: Scotland) :scotland:",
    text = "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
  }, {
    item = "🏴󠁧󠁢󠁷󠁬󠁳󠁿",
    subText = "(flag: Wales) :wales:",
    text = "🏴󠁧󠁢󠁷󠁬󠁳󠁿"
  } }
local categoryChoices = { {
    categoryName = "Activities",
    subText = "🎄 🎆 🎇 🧨 ✨ 🎈 🎉 🎊 🎋 🎍 10",
    text = "Activities"
  }, {
    categoryName = "Symbols",
    subText = "🚮 🚰 ♿ 🚹 🚺 🚻 🚼 🚾 🛂 🛃 10",
    text = "Symbols"
  }, {
    categoryName = "Travel & Places",
    subText = "🌎 🌏 🌐 🗺 🗾 🧭 🏔 ⛰ 🌋 🗻 10",
    text = "Travel & Places"
  }, {
    categoryName = "Smileys & Emotion",
    subText = "😃 😄 😁 😆 😅 🤣 😂 🙂 🙃 😉 10",
    text = "Smileys & Emotion"
  }, {
    categoryName = "Food & Drink",
    subText = "🍈 🍉 🍊 🍋 🍌 🍍 🥭 🍎 🍏 🍐 10",
    text = "Food & Drink"
  }, {
    categoryName = "People & Body",
    subText = "🤚 🖐 ✋ 🖖 👌 🤏 ✌️ 🤞 🤟 🤘 10",
    text = "People & Body"
  }, {
    categoryName = "Objects",
    subText = "🕶 🥽 🥼 🦺 👔 👕 👖 🧣 🧤 🧥 10",
    text = "Objects"
  }, {
    categoryName = "Flags",
    subText = "🚩 🎌 🏴 🏳 🏳️‍🌈 🏴‍☠ 🇦🇨 🇦🇩 🇦🇪 🇦🇫 10",
    text = "Flags"
  }, {
    categoryName = "Animals & Nature",
    subText = "🐒 🦍 🦧 🐶 🐕 🦮 🐕‍🦺 🐩 🐺 🦊 10",
    text = "Animals & Nature"
  } }
-- luacheck: pop

return Picker:new(choices, categories, categoryChoices)
