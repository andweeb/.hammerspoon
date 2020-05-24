----------------------------------------------------------------------------------------------------
-- Reddit website config
--
local SearchMixin = require("ki-entities/search-mixin")
local Reddit = spoon.Ki.defaultEntities.website.Reddit

Reddit.class:include(SearchMixin)

-- Default subreddit list: https://www.reddit.com/r/ListOfSubreddits/wiki/defaults#wiki_defaults
Reddit.links = {
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

function Reddit:advancedSearch(query, subreddit)
    self.open(self.url.."/r/"..subreddit.."/search/?q="..query.."&restrict_sr=1")
end

return Reddit
