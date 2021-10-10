----------------------------------------------------------------------------------------------------
-- MapleLegends website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local MapleLegends = Website {
    name = "MapleLegends",
    url = "https://maplelegends.com",
    links = {
        { name = "Library" , link = "/lib/all"                                 },
        { name = "Ranking" , link = "/ranking/all"                             },
        { name = "Vote"    , link = "/vote"                                    },
        { name = "Forum"   , link = "https://forum.maplelegends.com/index.php" },
        {
            name = "Good Quests",
            link = "https://forum.maplelegends.com/index.php?threads/good-quests.2947/",
        },
        {
            name = "Comprehensive Training Guide",
            link = "https://forum.maplelegends.com/index.php?threads/comprehensive-training-guide.2124/",
        },
        {
            name = "Monster Book Efficient Farming Guide",
            link = "https://docs.google.com/spreadsheets/d/1ohipSCqwiyyOdqNTWrTzDNGUtYJOojfk9qbVHSl70l0/edit#gid=0",
        },
        {
            name = "ML Collection",
            link = "https://docs.google.com/spreadsheets/d/1XzSdZWyYpenNZEazeQU7Iby-AnUa6YdHhk6Ssp9vAg4/edit?usp=sharing",
        },
    },
}

local URLSearchMixin = require("ki-entities/url-search")
MapleLegends.class:include(URLSearchMixin)
MapleLegends:initURLSearch("lib/all", "search")

return MapleLegends
