local GraphQLClient = {}
GraphQLClient.__index = GraphQLClient
GraphQLClient.documentPath = hs.fs.pathToAbsolute("~/.hammerspoon/lib/graphql/documents")

-- Add call metamethod to allow GraphQLClient to be invoked
setmetatable(GraphQLClient, {
    __call = function (self, ...)
        return self.new(...)
    end,
})

function GraphQLClient.new(endpoint, headers)
  local self = setmetatable({}, GraphQLClient)
  self.endpoint = endpoint
  self.headers = headers
  return self
end

-- Read an environment variable
function GraphQLClient.getEnvironmentVariable(name)
    local variable = hs.execute("printenv "..name, true)
    return variable:gsub("\n", "")
end

-- Read the GraphQL document file
function GraphQLClient:readGraphQLDocument(name)
    local filename = self.documentPath.."/"..name..".graphql"
    local file = io.open(filename, "rb")
    local graphql = file:read("*all")

    file:close()

    return graphql
end

-- Query a GraphQL API
function GraphQLClient:query(graphql, variables, customHeaders, callback)
    -- Create request body
    local requestBody = { query = graphql }
    if variables then
        requestBody.variables = variables
    end

    -- Create headers
    local headers = {}
    if self.headers then
        for name, value in pairs(self.headers) do
            headers[name] = value
        end
    end
    if customHeaders then
        for name, value in pairs(customHeaders) do
            headers[name] = value
        end
    end

    hs.http.asyncPost(self.endpoint, hs.json.encode(requestBody), headers, callback)
end

return GraphQLClient
