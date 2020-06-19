----------------------------------------------------------------------------------------------------
-- Search Mode
--
local Ki = spoon.Ki
local Website = spoon.Ki.Website

-- Add Website entity behavior for search mode to invoke
-- a `search` method implemented on searchable Website entities
Website.behaviors.search = function(self) self:search() end

-- Register search mode
Ki:registerMode("search", {
    { "shift", "cmd" }, "s", nil, { "Normal Mode", "Enter Search Mode" },
})
