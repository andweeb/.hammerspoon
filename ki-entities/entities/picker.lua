----------------------------------------------------------------------------------------------------
-- Picker class that subclasses Entity to represent some categorized item picker
--
local Entity = spoon.Ki.Entity
local Picker = Entity:subclass("Picker")

function Picker:pick(list)
    -- Defer execution to avoid conflicts with any prior chooser that just previously closed
    hs.timer.doAfter(0, function()
        self:showChooser(list or self.choices, function(choice)
            if choice then
                hs.pasteboard.setContents(choice.item)
            end
        end)
    end)
end

function Picker:pickCategory()
    self:showChooser(self.categoryChoices, function(choice)
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
        { nil, nil, function() self:pick() end, "Pick Item" },
    }

    -- Add category chooser functionality if provided
    if categories and categoryChoices then
        local pickCategory = function()
            self:pickCategory()
        end

        table.insert(shortcuts, { { "cmd" }, "c", pickCategory, "Pick Item Category" } )
    end

    Entity.initialize(self, { "Picker", shortcuts })
end

return Picker
