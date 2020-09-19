----------------------------------------------------------------------------------------------------
-- Soundboard entity
--
local Entity = spoon.Ki.Entity
local Soundboard = Entity:subclass("Soundboard")

function Soundboard:selectSound()
    local choices = {}
    local iterator, directory = hs.fs.dir(self.audioFileLocation)

    if iterator then
        for file in iterator, directory do
            if file ~= "." and file ~= ".." then
                table.insert(choices, {
                    name = file,
                    text = file,
                })
            end
        end
    end

    self:showChooser(choices, function(choice)
        if choice then
            return self:play(choice.name)
        end
    end)
end

function Soundboard:playEvent(name)
    return function()
        self:play(name)
    end
end

function Soundboard:play(name)
    local sound = hs.sound.getByFile(self.audioFileLocation.."/"..name)
    if sound then
        sound:play()
    end
end

function Soundboard:initialize(audioFileLocation, shortcuts)
    self.audioFileLocation = hs.fs.pathToAbsolute(audioFileLocation)

    local mergedShortcuts = self:mergeShortcuts(shortcuts or {}, {
        { nil, "space", function() self:selectSound() end, { "Soundboard", "Select Sound" } },
    })

    Entity.initialize(self, { "Soundboard", mergedShortcuts })
end

return Soundboard
