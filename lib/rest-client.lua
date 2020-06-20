local RESTClient = {}
RESTClient.__index = RESTClient

-- Add call metamethod to allow RESTClient to be invoked
setmetatable(RESTClient, {
    __call = function (self, ...)
        return self.new(...)
    end,
})

function RESTClient.new(baseEndpoint, headers)
  local self = setmetatable({}, RESTClient)
  self.baseEndpoint = baseEndpoint
  self.headers = headers
  return self
end

-- Merge a set of headers into another set
function RESTClient.mergeHeaders(from, to)
    local headers = {}
    if to then
        for name, value in pairs(to) do
            headers[name] = value
        end
    end
    if from then
        for name, value in pairs(from) do
            headers[name] = value
        end
    end
    return headers
end

-- Read an environment variable
function RESTClient.getEnvironmentVariable(name)
    local variable = hs.execute("printenv "..name, true)
    return variable:gsub("\n", "")
end

-- Query the API using a GET method
function RESTClient:get(endpoint, customHeaders, callback)
    local headers = self.mergeHeaders(customHeaders, self.headers)
    hs.http.asyncGet(self.baseEndpoint..endpoint, headers, callback)
end

-- Query the API using a POST method
function RESTClient:post(resource, requestBody, customHeaders, callback)
    local headers = self.mergeHeaders(customHeaders, self.headers)
    hs.http.asyncPost(self.baseEndpoint..resource, requestBody, headers, callback)
end

-- Query the API using a PUT method
function RESTClient:put(resource, requestBody, customHeaders, callback)
    local headers = self.mergeHeaders(customHeaders, self.headers)
    hs.http.doAsyncRequest(self.baseEndpoint..resource, "PUT", requestBody, headers, callback)
end

return RESTClient
