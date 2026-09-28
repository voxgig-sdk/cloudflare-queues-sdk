-- Typed models for the CloudflareQueues SDK (LuaLS annotations).
--
-- GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
-- params (op.<name>.points[].g.params[]). Field/param types come from the
-- canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
-- @voxgig/apidef VALID_CANON). Annotations only — no runtime effect. Do not
-- edit by hand.

---@class Consumer
---@field id? string

---@class ConsumerRemoveMatch
---@field account_id string
---@field id string
---@field queue_id string

---@class Queue
---@field acks? table
---@field consumers? table
---@field consumers_total_count? number
---@field created_on? string
---@field destination? table
---@field enabled? boolean
---@field errors? table
---@field events? table
---@field id? string
---@field jurisdiction? string
---@field messages? table
---@field modified_on? string
---@field name? string
---@field producers? table
---@field producers_total_count? number
---@field queue_id? string
---@field queue_name string
---@field result? table
---@field result_info table
---@field retries? table
---@field settings? table
---@field source? table
---@field success? boolean

---@class QueueLoadMatch
---@field account_id string
---@field consumer_id? string
---@field id? string
---@field subscription_id? string

---@class QueueListMatch
---@field account_id string
---@field direction? string
---@field order? string
---@field page? number
---@field per_page? number

---@class QueueCreateData
---@field account_id string
---@field id? string
---@field acks? table
---@field consumers? table
---@field consumers_total_count? number
---@field created_on? string
---@field destination? table
---@field enabled? boolean
---@field errors? table
---@field events? table
---@field jurisdiction? string
---@field messages? table
---@field modified_on? string
---@field name? string
---@field producers? table
---@field producers_total_count? number
---@field queue_id? string
---@field queue_name string
---@field result? table
---@field result_info table
---@field retries? table
---@field settings? table
---@field source? table
---@field success? boolean

---@class QueueUpdateData
---@field account_id string
---@field consumer_id? string
---@field id string
---@field acks? table
---@field consumers? table
---@field consumers_total_count? number
---@field created_on? string
---@field destination? table
---@field enabled? boolean
---@field errors? table
---@field events? table
---@field jurisdiction? string
---@field messages? table
---@field modified_on? string
---@field name? string
---@field producers? table
---@field producers_total_count? number
---@field queue_id? string
---@field queue_name? string
---@field result? table
---@field result_info? table
---@field retries? table
---@field settings? table
---@field source? table
---@field success? boolean

---@class QueueRemoveMatch
---@field account_id string
---@field id? string
---@field subscription_id? string

local M = {}

return M
