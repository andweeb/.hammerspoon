----------------------------------------------------------------------------------------------------
-- Picker class that subclasses Entity to represent some categorized item picker
--
local Entity = spoon.Ki.Entity
local Picker = Entity:subclass("Picker")

function Picker:pick(list)
    -- Defer execution to avoid conflicts with any prior selection modal that just previously closed
    hs.timer.doAfter(0, function()
        self:showSelectionModal(list or self.choices, function(choice)
            if choice then
                hs.pasteboard.setContents(choice.item)
            end
        end)
    end)
end

function Picker:pickCategory()
    self:showSelectionModal(self.categoryChoices, function(choice)
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

function Picker:initialize(choices, categories, categoryChoices)
    self.choices = choices
    self.categories = categories
    self.categoryChoices = categoryChoices

    local shortcuts = {
        { nil, nil, function() self:pick() end, { "Picker", "Pick Item" } },
    }

    -- Add category selection functionality if provided
    if categories and categoryChoices then
        local pickCategory = function()
            self:pickCategory()
        end

        table.insert(shortcuts, { { "cmd" }, "c", pickCategory, { "Picker", "Pick Item Category" } } )
    end

    Entity.initialize(self, "Picker", shortcuts, true)
end

return Picker
