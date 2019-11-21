----------------------------------------------------------------------------------------------------
--- Ki menubar status display
--
local StatusDisplay = {
    menubar = hs.menubar.new(),
    timer = nil,
}

-- Text styles
local smallMenlo = { name = "Menlo", size = 9 }
local fadedColor = { red = 0.2, blue = 0.2, green = 0.2 }
local fadedTextStyle = { color = fadedColor, font = smallMenlo }
local defaultColor = { red = 0.8, blue = 0.8, green = 0.8 }
local defaultTextStyle = { color = defaultColor, font = smallMenlo }

function StatusDisplay:show(status, _, textStyle)
    textStyle = textStyle or defaultTextStyle

    -- Interrupt fade-out timer if running
    if self.timer and self.timer:running() then
        self.timer:stop()
    end

    -- Stylize text and update in menu bar
    local text = "-- "..status:upper().." --"
    local textElement = hs.styledtext.new(text, textStyle)
    self.menubar:setTitle(textElement)

    -- Fade out desktop mode status display in menu bar
    if status == "desktop" then
        self.timer = hs.timer.doAfter(0.5, function()
            self.menubar:setTitle(hs.styledtext.new(text, fadedTextStyle))
        end)
    end
end

-- Initialize status display on start with desktop mode
StatusDisplay:show("desktop", nil, fadedTextStyle)

return StatusDisplay
