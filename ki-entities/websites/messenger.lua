----------------------------------------------------------------------------------------------------
-- Facebook Messenger website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local messengerURL = "https://www.messenger.com"
local htmlParserLocation = hs.fs.pathToAbsolute("~/.hammerspoon/scripts")
local applescriptLocation = hs.fs.pathToAbsolute("~/.hammerspoon/scripts/messenger-conversations.applescript")

local function getDefaultBrowser()
    local defaultBrowser = hs.execute([[
        export VERSIONER_PERL_PREFER_32_BIT=yes && perl -MMac::InternetConfig -le 'print + (GetICHelper "http")[1]'
    ]])

    return defaultBrowser:gsub("\n", "")
end

local function findMessengerTab()
    local defaultBrowser = getDefaultBrowser()
    local viewModel = {
        application = defaultBrowser,
    }

    local script = Website.renderScriptTemplate("application-tab-titles", viewModel)
    if not script then
        Website.notifyError("Error fetching application tab titles", "Unable to render script template")
    end

    local isOk, tabList, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Website.notifyError("Error fetching "..defaultBrowser.." tab information", rawTable.NSLocalizedFailureReason)
        return
    end

    local messengerWindowIndex = 0
    local messengerTabIndex = nil

    for _, titleList in pairs(tabList) do
        messengerWindowIndex = messengerWindowIndex + 1
        for tabIndex, tabTitle in pairs(titleList) do
            -- Save window info when the parenthesized url string in the title matches messenger.com
            if tabTitle:match(".*%((.-)%)$"):match("messenger.com") then
                messengerTabIndex = tabIndex
            end
        end
    end

    return messengerWindowIndex, messengerTabIndex
end

local function openConversation(_, choice)
    if choice then
        local viewModel = {
            operation = "select-conversation",
            targetWindowIndex = choice.windowIndex,
            targetTabIndex = choice.tabIndex,
            conversationLink = choice.link,
        }

        local script = Website.renderScriptTemplate(applescriptLocation, viewModel)
        if not script then
            Website.notifyError("Error selecting messenger conversation", "Unable to render script template")
        end

        local isOk, _, rawTable = hs.osascript.applescript(script)
        if not isOk then
            Website.notifyError("Error selecting messenger conversation", rawTable.NSLocalizedFailureReason)
            return
        end
    else
        Website.open(messengerURL)
    end
end

local function openConversationInfoPane(_, choice)
    if choice then
        openConversation(_, choice)
    end

    local targetWindowIndex, targetTabIndex = findMessengerTab()
    local viewModel = {
        operation = "open-conversation-info-pane",
        targetWindowIndex = targetWindowIndex,
        targetTabIndex = targetTabIndex,
    }

    local script = Website.renderScriptTemplate(applescriptLocation, viewModel)
    if not script then
        Website.notifyError("Error opening messenger conversation info pane", "Unable to render script template")
    end

    local isOk, _, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Website.notifyError("Error opening messenger conversation info pane", rawTable.NSLocalizedFailureReason)
    end

    return true
end

local Messenger = Website {
    name = "Facebook Messenger",
    url = messengerURL,
    shortcuts = {
        { nil, nil, openConversation, "Open Messenger or Messenger Conversation" },
        { nil, "i", openConversationInfoPane, "Open Conversation Info Pane" },
    },
}

function Messenger.getChooserItems()
    local choices = {}

    local viewModel = {
        operation = "get-conversations",
        targetURL = "https://www.messenger.com",
        scriptPath = htmlParserLocation,
    }
    local script = Website.renderScriptTemplate(applescriptLocation, viewModel)
    if not script then
        Website.notifyError("Unable to render script template", "")
    end

    local isOk, result, rawTable = hs.osascript.applescript(script)
    if not isOk then
        Website.notifyError("Error fetching messenger conversation items", rawTable.NSLocalizedFailureReason)
        return
    end

    local windowIndex = result[1]
    local tabIndex = result[2]
    local json = result[3]

    local conversations = hs.json.decode(json)

    for _, conversation in pairs(conversations) do
        local subText = conversation.message

        if conversation.datetime ~= "" then
            subText = subText.." ("..conversation.datetime..")"
        end

        table.insert(choices, {
            text = conversation.name,
            subText = subText,
            link = conversation.link,
            image = conversation.imagelink and hs.image.imageFromURL(conversation.imagelink) or nil,
            windowIndex = windowIndex,
            tabIndex = tabIndex,
        })
    end

    return choices
end

return Messenger
