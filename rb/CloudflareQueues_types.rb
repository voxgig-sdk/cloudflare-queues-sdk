# frozen_string_literal: true

# Typed models for the CloudflareQueues SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# Consumer entity data model.
#
# @!attribute [rw] id
#   @return [String, nil]
Consumer = Struct.new(
  :id,
  keyword_init: true
)

# Request payload for Consumer#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] queue_id
#   @return [String]
ConsumerRemoveMatch = Struct.new(
  :account_id,
  :id,
  :queue_id,
  keyword_init: true
)

# Queue entity data model.
#
# @!attribute [rw] acks
#   @return [Array, nil]
#
# @!attribute [rw] consumers
#   @return [Array, nil]
#
# @!attribute [rw] consumers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] created_on
#   @return [String, nil]
#
# @!attribute [rw] destination
#   @return [Hash, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] errors
#   @return [Array, nil]
#
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] jurisdiction
#   @return [String, nil]
#
# @!attribute [rw] messages
#   @return [Array, nil]
#
# @!attribute [rw] modified_on
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] producers
#   @return [Array, nil]
#
# @!attribute [rw] producers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] queue_id
#   @return [String, nil]
#
# @!attribute [rw] queue_name
#   @return [String]
#
# @!attribute [rw] result
#   @return [Hash, nil]
#
# @!attribute [rw] result_info
#   @return [Hash]
#
# @!attribute [rw] retries
#   @return [Array, nil]
#
# @!attribute [rw] settings
#   @return [Hash, nil]
#
# @!attribute [rw] source
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
QueueType = Struct.new(
  :acks,
  :consumers,
  :consumers_total_count,
  :created_on,
  :destination,
  :enabled,
  :errors,
  :events,
  :id,
  :jurisdiction,
  :messages,
  :modified_on,
  :name,
  :producers,
  :producers_total_count,
  :queue_id,
  :queue_name,
  :result,
  :result_info,
  :retries,
  :settings,
  :source,
  :success,
  keyword_init: true
)

# Request payload for Queue#load.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] consumer_id
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] subscription_id
#   @return [String, nil]
QueueLoadMatch = Struct.new(
  :account_id,
  :consumer_id,
  :id,
  :subscription_id,
  keyword_init: true
)

# Request payload for Queue#list.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] direction
#   @return [String, nil]
#
# @!attribute [rw] order
#   @return [String, nil]
#
# @!attribute [rw] page
#   @return [Integer, nil]
#
# @!attribute [rw] per_page
#   @return [Integer, nil]
QueueListMatch = Struct.new(
  :account_id,
  :direction,
  :order,
  :page,
  :per_page,
  keyword_init: true
)

# Request payload for Queue#create.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] acks
#   @return [Array, nil]
#
# @!attribute [rw] consumers
#   @return [Array, nil]
#
# @!attribute [rw] consumers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] created_on
#   @return [String, nil]
#
# @!attribute [rw] destination
#   @return [Hash, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] errors
#   @return [Array, nil]
#
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] jurisdiction
#   @return [String, nil]
#
# @!attribute [rw] messages
#   @return [Array, nil]
#
# @!attribute [rw] modified_on
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] producers
#   @return [Array, nil]
#
# @!attribute [rw] producers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] queue_id
#   @return [String, nil]
#
# @!attribute [rw] queue_name
#   @return [String]
#
# @!attribute [rw] result
#   @return [Hash, nil]
#
# @!attribute [rw] result_info
#   @return [Hash]
#
# @!attribute [rw] retries
#   @return [Array, nil]
#
# @!attribute [rw] settings
#   @return [Hash, nil]
#
# @!attribute [rw] source
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
QueueCreateData = Struct.new(
  :account_id,
  :id,
  :acks,
  :consumers,
  :consumers_total_count,
  :created_on,
  :destination,
  :enabled,
  :errors,
  :events,
  :jurisdiction,
  :messages,
  :modified_on,
  :name,
  :producers,
  :producers_total_count,
  :queue_id,
  :queue_name,
  :result,
  :result_info,
  :retries,
  :settings,
  :source,
  :success,
  keyword_init: true
)

# Request payload for Queue#update.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] consumer_id
#   @return [String, nil]
#
# @!attribute [rw] id
#   @return [String]
#
# @!attribute [rw] acks
#   @return [Array, nil]
#
# @!attribute [rw] consumers
#   @return [Array, nil]
#
# @!attribute [rw] consumers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] created_on
#   @return [String, nil]
#
# @!attribute [rw] destination
#   @return [Hash, nil]
#
# @!attribute [rw] enabled
#   @return [Boolean, nil]
#
# @!attribute [rw] errors
#   @return [Array, nil]
#
# @!attribute [rw] events
#   @return [Array, nil]
#
# @!attribute [rw] jurisdiction
#   @return [String, nil]
#
# @!attribute [rw] messages
#   @return [Array, nil]
#
# @!attribute [rw] modified_on
#   @return [String, nil]
#
# @!attribute [rw] name
#   @return [String, nil]
#
# @!attribute [rw] producers
#   @return [Array, nil]
#
# @!attribute [rw] producers_total_count
#   @return [Float, nil]
#
# @!attribute [rw] queue_id
#   @return [String, nil]
#
# @!attribute [rw] queue_name
#   @return [String, nil]
#
# @!attribute [rw] result
#   @return [Hash, nil]
#
# @!attribute [rw] result_info
#   @return [Hash, nil]
#
# @!attribute [rw] retries
#   @return [Array, nil]
#
# @!attribute [rw] settings
#   @return [Hash, nil]
#
# @!attribute [rw] source
#   @return [Hash, nil]
#
# @!attribute [rw] success
#   @return [Boolean, nil]
QueueUpdateData = Struct.new(
  :account_id,
  :consumer_id,
  :id,
  :acks,
  :consumers,
  :consumers_total_count,
  :created_on,
  :destination,
  :enabled,
  :errors,
  :events,
  :jurisdiction,
  :messages,
  :modified_on,
  :name,
  :producers,
  :producers_total_count,
  :queue_id,
  :queue_name,
  :result,
  :result_info,
  :retries,
  :settings,
  :source,
  :success,
  keyword_init: true
)

# Request payload for Queue#remove.
#
# @!attribute [rw] account_id
#   @return [String]
#
# @!attribute [rw] id
#   @return [String, nil]
#
# @!attribute [rw] subscription_id
#   @return [String, nil]
QueueRemoveMatch = Struct.new(
  :account_id,
  :id,
  :subscription_id,
  keyword_init: true
)

