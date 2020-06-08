----------------------------------------------------------------------------------------------------
-- API search mixin
-- Enables `apiSearch` methods that can also be overridden
--
-- Usage:
-- local Example = Website:new("Example", "https://www.example.com")
-- Example.graphqlClient = GraphQLClient("https://api.github.com/graphql", { --[[headers]] })
-- Example.graphqlClient:query(Example.graphqlClient:readGraphQLDocument(...), ...)
--
local APISearchMixin = {}

-- Query an API and render results in a chooser with debounce logic
function APISearchMixin:apiSearch(onInput, onSelection, placeholderOptions)
    local lastMs = 0
    local elapsedMs = 0
    local debounceMs = 500
    local debounceSeconds = debounceMs / 1000
    local debounceTimer = hs.timer.doEvery(0.001, function() elapsedMs = elapsedMs + 1 end)
    local lagTimer = nil

    local function onChoice(choice)
        if choice then
            debounceTimer:stop()
            debounceTimer = nil
            return onSelection(choice)
        end
    end

    self:showSelectionModal({}, onChoice, placeholderOptions)

    self.selectionModal:queryChangedCallback(function(query)
        if lagTimer then lagTimer:stop() end

        if lastMs ~= 0 and elapsedMs - lastMs >= debounceMs then
            onInput(query)
        elseif #query:gsub("%s+", "") > 0 then
            lagTimer = hs.timer.doAfter(debounceSeconds, function()
                lastMs = 0
                onInput(query)
            end)
        end

        lastMs = elapsedMs
    end)
end

return APISearchMixin
