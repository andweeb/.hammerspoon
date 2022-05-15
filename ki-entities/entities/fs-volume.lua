----------------------------------------------------------------------------------------------------
-- MacOS filesystem volume entity
--
local Ki = spoon.Ki
local File = Ki.File
local Entity = Ki.Entity
local txtWriteLocation = "~/Dropbox/Notes/Personal/Movies"

local function round(num, precision)
    return tonumber(string.format("%." .. (precision or 0) .. "f", num))
end

local function bytesToSize(bytes)
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

local function getVolumes()
    local choices = {}
    local volumes = hs.fs.volume.allVolumes()

    for path, volume in pairs(volumes) do
        local text = volume.NSURLVolumeNameKey
        local name = volume.NSURLVolumeLocalizedNameKey
        local totalSize = bytesToSize(volume.NSURLVolumeTotalCapacityKey)
        local availableSize = bytesToSize(volume.NSURLVolumeAvailableCapacityKey)
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

local function selectFSVolumeEvent(eventHandler)
    return function()
        local choices = getVolumes()

        if choices and #choices > 0 then
            local function onSelection(choice)
                if choice then
                    eventHandler(choice)
                end
            end

            Entity:showChooser(choices, onSelection)
        end
    end
end

local function writeContentsToFile(volumeName, volumePath)
    local tree = "/opt/homebrew/bin/tree"
    local contents = ""

    -- Write to txt file
    local function done(exitCode, _, stderr)
        if exitCode ~= 0 or stderr ~= "" then
            local message = "Unable to write "..volumeName.." contents to file"
            return hs.notify.show("Ki", message, stderr)
        end

        local txtPath = txtWriteLocation.."/"..volumeName:lower()..".txt"
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

local openSelectedVolume = selectFSVolumeEvent(function(choice)
    File.open(choice.path)
end)

local function open(choice)
    if choice then
        File.open(choice.path)
    else
        openSelectedVolume()
    end
end

local ejectSelectedVolume = selectFSVolumeEvent(function(choice)
    local path = choice.path
    local hasEjected, err = hs.fs.volume.eject(path)

    if not hasEjected then
        local message = "Unable to eject volume "..choice.name
        print(message..": "..err)

        return hs.notify.show("Ki", message, err)
    end

    hs.notify.show("Ki", "Successfully ejected "..choice.name, "")
end)

local writeSelectedVolumeContentsToFile = selectFSVolumeEvent(function(choice)
    if choice.path ~= "/" then
        writeContentsToFile(choice.name, choice.path)
    end
end)

local FSVolume = Entity {
    name = "FS Volume",
    shortcuts = {
        { nil, nil, open, "Open Selected Volume" },
        { nil, "e", ejectSelectedVolume, "Eject Selected Volume" },
        { nil, "o", openSelectedVolume, "Open Selected Volume" },
        { nil, "w", writeSelectedVolumeContentsToFile, "Write Selected Volume's Contents to File" },
    },
}

FSVolume.behaviors = FSVolume.behaviors + {
    select = function(_, eventHandler)
        selectFSVolumeEvent(eventHandler)()
        return true
    end
}

return FSVolume
