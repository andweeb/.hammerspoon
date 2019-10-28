----------------------------------------------------------------------------------------------------
-- Picker class that subclasses Entity to represent some categorized item picker
--
local Entity = spoon.Ki.Entity
local Picker = Entity:subclass("Picker")

function Picker:pick(list)
    -- Defer execution to avoid conflicts with any prior selection modal that just previously closed
    hs.timer.doAfter(0, function()
        self.showSelectionModal(list or self.choices, function(choice)
            if choice then
                hs.pasteboard.setContents(choice.item)
            end
        end)
    end)
end

function Picker:pickCategory()
    self.showSelectionModal(self.categoryChoices, function(choice)
        if choice then
            local list = {}
            local items = self.categories[choice.categoryName]

            for _, item in pairs(items) do
                table.insert(list, { text = item })
            end

            self:pick(list)
        end
    end)
end

function Picker:initialize(categories, choices, categoryChoices)
    self.choices = choices
    self.categories = categories
    self.categoryChoices = categoryChoices

    local actions = {
        pick = function() self:pick() end,
        pickCategory = function() self:pickCategory() end,
    }

    local shortcuts = {
        { nil, nil, actions.pick, { "Picker", "Pick Item" } },
        { { "cmd" }, "c", actions.pickCategory, { "Picker", "Pick Item Category" } },
    }

    Entity.initialize(self, "Picker", shortcuts, true)
end

return Picker
