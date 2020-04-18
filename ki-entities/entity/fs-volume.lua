----------------------------------------------------------------------------------------------------
-- macOS filesystem volume entity
--
local File = spoon.Ki.File
local Entity = spoon.Ki.Entity
local FSVolume = Entity:new("FSVolume", {})
FSVolume.txtWriteLocation = "~/Documents"

function FSVolume.selectFSVolumeEvent(eventHandler)
    return function()
        local choices = FSVolume:getSelectionItems()

        if choices and #choices > 0 then
            local function onSelection(choice)
                if choice then
                    eventHandler(choice)
                end
            end

            FSVolume:showSelectionModal(choices, onSelection)
        end
    end
end

FSVolume.behaviors = FSVolume.behaviors + {
    select = function(_, eventHandler)
        FSVolume.selectFSVolumeEvent(eventHandler)()
        return true
    end
}

local function round(num, precision)
    return tonumber(string.format("%." .. (precision or 0) .. "f", num))
end

function FSVolume.bytesToSize(bytes)
    local precision = 2
    local kilobyte = 1024;
    local megabyte = kilobyte * 1024;
    local gigabyte = megabyte * 1024;
    local terabyte = gigabyte * 1024;

    if bytes >= 0 and bytes < kilobyte then
        return bytes.." Bytes";
    elseif bytes >= kilobyte and bytes < megabyte then
        return round(bytes / kilobyte, precision)..' KB';
    elseif bytes >= megabyte and bytes < gigabyte then
        return round(bytes / megabyte, precision)..' MB';
    elseif bytes >= gigabyte and bytes < terabyte then
        return round(bytes / gigabyte, precision)..' GB';
    elseif bytes >= terabyte then
        return round(bytes / terabyte, precision)..' TB';
    else
        return bytes..' B';
    end
end

function FSVolume.writeContentsToFile(volumeName, volumePath)
    local tree = "/usr/local/bin/tree"
    local contents = ""

    -- Write to txt file
    local function done(exitCode, _, stderr)
        if exitCode ~= 0 or stderr ~= "" then
            local message = "Unable to write "..volumeName.." contents to file"
            return hs.notify.show("Ki", message, stderr)
        end

        local txtPath = FSVolume.txtWriteLocation.."/"..volumeName:lower()..".txt"
        local absoluteTxtPath = hs.fs.pathToAbsolute(txtPath)

        if not absoluteTxtPath then
            hs.execute("touch "..txtPath)
            absoluteTxtPath = hs.fs.pathToAbsolute(txtPath)
        end

        local txtFile = io.open(absoluteTxtPath, "w+")
        txtFile:write(os.date("Last updated %m/%d/%Y %I:%M %p\n\n"))
        txtFile:write(contents)
        txtFile:close()

        hs.notify.show("Ki", volumeName.." contents written to file.", txtPath)
    end

    -- Stream contents to variable
    local function stream(_, stdout, stderr)
        if stderr ~= "" then
            local message = "Unable to write "..volumeName.." contents to file"
            hs.notify.show("Ki", message, stderr)
            return false
        end

        contents = contents..stdout
        return true
    end

    -- Begin task after ensuring the volume is mounted
    if hs.fs.attributes(volumePath) then
        local writeTask = hs.task.new(tree, done, stream, { "-h", "--charset=ascii", volumePath })
        writeTask:start()
    end
end

function FSVolume:getSelectionItems()
    local choices = {}
    local volumes = hs.fs.volume.allVolumes()

    for path, volume in pairs(volumes) do
        local text = volume.NSURLVolumeNameKey
        local name = volume.NSURLVolumeLocalizedNameKey
        local totalSize = self.bytesToSize(volume.NSURLVolumeTotalCapacityKey)
        local availableSize = self.bytesToSize(volume.NSURLVolumeAvailableCapacityKey)
        local subText = totalSize..", "..availableSize.." available"

        table.insert(choices, {
            name = name,
            path = path,
            text = text,
            subText = subText,
        })
    end

    return choices
end

FSVolume.openSelectedVolume = FSVolume.selectFSVolumeEvent(function(choice)
    File.open(choice.path)
end)

function FSVolume.open(choice)
    if choice then
        File.open(choice.path)
    else
        FSVolume.openSelectedFSVolume()
    end
end

FSVolume.ejectSelectedVolume = FSVolume.selectFSVolumeEvent(function(choice)
    local path = choice.path
    local hasEjected, err = hs.fs.volume.eject(path)

    if not hasEjected then
        local message = "Unable to eject volume "..choice.name
        print(message..": "..err)

        return hs.notify.show("Ki", message, err)
    end

    hs.notify.show("Ki", "Successfully ejected "..choice.name, "")
end)

FSVolume.writeSelectedVolumeContentsToFile = FSVolume.selectFSVolumeEvent(function(choice)
    if choice.path ~= "/" then
        FSVolume.writeContentsToFile(choice.name, choice.path)
    end
end)

FSVolume:registerShortcuts({
    { nil, nil, FSVolume.open, { "macOS Volume", "Open Selected Volume" } },
    { nil, "e", FSVolume.ejectSelectedVolume, { "macOS Volume", "Eject Selected Volume" } },
    { nil, "o", FSVolume.openSelectedVolume, { "macOS Volume", "Open Selected Volume" } },
    {
        nil, "w",
        FSVolume.writeSelectedVolumeContentsToFile,
        { "macOS Volume", "Write Selected Volume's Contents to File" },
    },
})

return FSVolume
