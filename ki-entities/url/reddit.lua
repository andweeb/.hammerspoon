----------------------------------------------------------------------------------------------------
-- Local Reddit URL entity
--
local URL = spoon.Ki.URL

local baseURL = "https://www.reddit.com"
local Reddit = URL:new(baseURL)

-- Default subreddit list: https://www.reddit.com/r/ListOfSubreddits/wiki/defaults#wiki_defaults
local defaultSubreddits = {
    "/r/AskReddit",
    "/r/announcements",
    "/r/funny",
    "/r/pics",
    "/r/todayilearned",
    "/r/science",
    "/r/IAmA",
    "/r/blog",
    "/r/videos",
    "/r/worldnews",
    "/r/gaming",
    "/r/movies",
    "/r/Music",
    "/r/aww",
    "/r/news",
    "/r/gifs",
    "/r/askscience",
    "/r/explainlikeimfive",
    "/r/EarthPorn",
    "/r/books",
    "/r/television",
    "/r/LifeProTips",
    "/r/sports",
    "/r/DIY",
    "/r/Showerthoughts",
    "/r/space",
    "/r/Jokes",
    "/r/tifu",
    "/r/food",
    "/r/photoshopbattles",
    "/r/Art",
    "/r/InternetIsBeautiful",
    "/r/mildlyinteresting",
    "/r/GetMotivated",
    "/r/history",
    "/r/nottheonion",
    "/r/gadgets",
    "/r/dataisbeautiful",
    "/r/Futurology",
    "/r/Documentaries",
    "/r/listentothis",
    "/r/personalfinance",
    "/r/philosophy",
    "/r/nosleep",
    "/r/creepy",
    "/r/OldSchoolCool",
    "/r/UpliftingNews",
    "/r/WritingPrompts",
    "/r/TwoXChromosomes",
    "/r/Fitness",
    "/r/technology",
    "/r/WTF",
    "/r/bestof",
    "/r/AdviceAnimals",
    "/r/politics",
    "/r/atheism",
    "/r/programming",
    "/r/entertainment",
}

function Reddit:search()
    spoon.Ki.state:exitMode()

    hs.timer.doAfter(0, function()
        hs.focus()

        local choice, searchQuery =
            hs.dialog.textPrompt("Ki - Reddit", "Enter Reddit search query:", "", "Search", "Cancel")

        if choice == "Search" then
            local success, encodedQuery, descriptor =
                hs.osascript.javascript("encodeURIComponent(`"..searchQuery.."`)")

            if success then
                self.open(baseURL.."/search?q="..encodedQuery)
            else
                self.notifyError("Ki - Reddit", descriptor.NSLocalizedDescription)
            end
        end
    end)
end

function Reddit:removeDuplicatePaths()
    local hash = {}
    local deduped = {}

    for _, path in ipairs(self.paths) do
        if not hash[path] then
            deduped[#deduped + 1] = path
            hash[path] = true
        end
    end

    self.paths = deduped
end

function Reddit:registerSubreddits(subredditList)
    for _, subreddit in pairs(subredditList) do
        table.insert(self.paths, baseURL..subreddit)
    end
    self:removeDuplicatePaths()
end

Reddit:registerSubreddits(defaultSubreddits)

return Reddit
