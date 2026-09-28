-- CloudflareQueues SDK exists test

local sdk = require("cloudflare-queues_sdk")

describe("CloudflareQueuesSDK", function()
  it("should create test SDK", function()
    local testsdk = sdk.test(nil, nil)
    assert.is_not_nil(testsdk)
  end)
end)
