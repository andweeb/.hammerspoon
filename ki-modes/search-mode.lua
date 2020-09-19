----------------------------------------------------------------------------------------------------
-- Search Mode
--
local Ki = spoon.Ki
local Website = Ki.Website

-- Add Website entity behavior for search mode to invoke
-- a `search` method implemented on searchable Website entities
Website.behaviors.search = function(self) self:search() end

-- Register search mode
Ki:Mode {
    name = "search",
    shortcut = { { "shift", "cmd" }, "s" },
}
