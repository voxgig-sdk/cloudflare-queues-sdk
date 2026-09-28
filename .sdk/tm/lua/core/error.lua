-- CloudflareQueues SDK error

local CloudflareQueuesError = {}
CloudflareQueuesError.__index = CloudflareQueuesError


function CloudflareQueuesError.new(code, msg, ctx)
  local self = setmetatable({}, CloudflareQueuesError)
  self.is_sdk_error = true
  self.sdk = "CloudflareQueues"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function CloudflareQueuesError:error()
  return self.msg
end


function CloudflareQueuesError:__tostring()
  return self.msg
end


return CloudflareQueuesError
