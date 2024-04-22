----------------------------------------------------------------------------------------------------
-- Monarch Money website config
--
local Ki = spoon.Ki
local Website = Ki.Website
local url = "https://app.monarchmoney.com/dashboard"

return Website {
    name = "Monarch Money",
    url = url,
    links = {
        { name = "Dashboard", link = "/dashboard" },
        { name = "Accounts", link = "/accounts" },
        { name = "Transactions", link = "/transactions" },
        { name = "Cash Flow", link = "/cash-flow" },
        { name = "Reports", link = "/reports" },
        { name = "Plan", link = "/plan" },
        { name = "Recurring", link = "/recurring" },
        { name = "Objectives", link = "/objectives" },
        { name = "Investments", link = "/investments" },
        { name = "Advice", link = "/advice" },
        { name = "Settings", link = "/settings/referrals" }
    },
}
