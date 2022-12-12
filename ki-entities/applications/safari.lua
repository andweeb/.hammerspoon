local Ki = spoon.Ki
local Action = Ki.Action
local Website = Ki.Website
local Safari = Ki.defaultEntities.entity.Safari
local AsyncSearchMixin = require("ki-entities/async-search")
local COREDATA_EPOCH_OFFSET = 978307200

Safari.class:include(AsyncSearchMixin)
Safari.historySQLitePath = hs.fs.pathToAbsolute("~/Library/Safari/History.db")

-- Validate History.db location
local success, value = pcall(function()
    return hs.fs.attributes(Safari.historySQLitePath)
end)
if not success then
    Safari.notifyError("Safari History.db file not found", value or "")
end

function Safari.createSearchHistorySQL(query)
    local condition = query
        and "WHERE v.title LIKE '%"..query.."%' COLLATE nocase"
        or ""

    return [=[
        SELECT
            v.title,
            i.url,
            v.visit_time + ]=]..COREDATA_EPOCH_OFFSET..[=[
        FROM
            history_visits v
            INNER JOIN history_items i ON v.history_item = i.id
        ]=]..condition..[=[
        ORDER BY
            visit_time DESC
        LIMIT 50
    ]=]
end

local function searchBrowserHistory()
    local historyDB = hs.sqlite3.open(Safari.historySQLitePath)

    local choices = {}
    local function updateChoices()
        return choices
    end

    local time = -1

    -- Create search input handler
    local function onInput(query)
        local sql = Safari.createSearchHistorySQL(query)

        choices = {}
        time = os.time()

        -- Execute search query with current time
        historyDB:exec(sql, function (udata, _, values)
            -- Abort previous query
            if udata < time then
                return -1
            end

            local title, url, visitTime = table.unpack(values)
            local formattedVisitTime = os.date("%m/%d/%Y %I:%M %p", math.floor(tonumber(visitTime)))
            local choice = {
                url = url,
                text = title,
                subText = formattedVisitTime..": "..url,
                imageURL = Website:getFaviconURL(url),
            }

            table.insert(choices, choice)

            return 0
        end, time)

        Safari:loadChooserRowImages(choices, false)
        Safari.chooser:refreshChoicesCallback()
    end

    -- Create item selection handler
    local onSelection = function(choice)
        if choice then
            return Website.open(choice.url)
        end
    end

    -- Start API search interface
    Safari:asyncSearch(updateChoices, onInput, onSelection, {
        placeholderText = "Search Safari history"
    })

    onInput("")
end

local SearchBrowserHistory = Action {
    action = searchBrowserHistory,
    options = {
        openBefore = false,
    },
}

Safari:registerShortcuts({
    { nil, "s", SearchBrowserHistory, "Search Browser History" }
})
