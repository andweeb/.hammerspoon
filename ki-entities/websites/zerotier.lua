----------------------------------------------------------------------------------------------------
-- ZeroTier website config
--
local Ki = spoon.Ki
local Website = Ki.Website

return Website {
    name = "ZeroTier",
    url = "https://my.zerotier.com",
    links = {
        { name = "Networks", link = "/network" },
        { name = "Knowledge Base", link = "https://zerotier.atlassian.net/wiki/spaces/SD/overview" },
        { name = "Downloads", link = "https://www.zerotier.com/download/" },
        { name = "System", link = "/system" },
        { name = "API", link = "/help/api" },
        { name = "Community", link = "https://discuss.zerotier.com" },
    },
}
