# CloudflareQueues Ruby SDK Reference

Complete API reference for the CloudflareQueues Ruby SDK.


## CloudflareQueuesSDK

### Constructor

```ruby
require_relative 'CloudflareQueues_sdk'

client = CloudflareQueuesSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CloudflareQueuesSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = CloudflareQueuesSDK.test
```


### Instance Methods

#### `Consumer(data = nil)`

Create a new `Consumer` entity instance. Pass `nil` for no initial data.

#### `Queue(data = nil)`

Create a new `Queue` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## ConsumerEntity

```ruby
consumer = client.Consumer
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `String` | No |  |

### Operations

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Consumer.remove({ "account_id" => "account_id", "id" => "id", "queue_id" => "queue_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ConsumerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## QueueEntity

```ruby
queue = client.Queue
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acks` | `Array` | No |  |
| `consumers` | `Array` | No |  |
| `consumers_total_count` | `Float` | No |  |
| `created_on` | `String` | No |  |
| `destination` | `Hash` | No | Destination configuration for the subscription |
| `enabled` | `Boolean` | No | Whether the subscription is active |
| `errors` | `Array` | No |  |
| `events` | `Array` | No | List of event types this subscription handles |
| `id` | `String` | No |  |
| `jurisdiction` | `String` | No |  |
| `messages` | `Array` | No |  |
| `modified_on` | `String` | No |  |
| `name` | `String` | No | Name of the subscription |
| `producers` | `Array` | No |  |
| `producers_total_count` | `Float` | No |  |
| `queue_id` | `String` | No |  |
| `queue_name` | `String` | Yes |  |
| `result` | `Hash` | No | Response body representing a consumer |
| `result_info` | `Hash` | Yes |  |
| `retries` | `Array` | No |  |
| `settings` | `Hash` | No |  |
| `source` | `Hash` | No | Source configuration for the subscription |
| `success` | `Boolean` | No | Indicates if the API call was successful or not. |

### Field Usage by Operation

| Field | load | list | create | update | remove |
| --- | --- | --- | --- | --- | --- |
| `acks` | - | - | - | - | - |
| `consumers` | - | - | - | - | - |
| `consumers_total_count` | - | - | - | - | - |
| `created_on` | - | - | - | - | - |
| `destination` | - | - | - | - | - |
| `enabled` | - | - | - | - | - |
| `errors` | - | - | - | - | - |
| `events` | - | - | - | - | - |
| `id` | - | - | - | - | - |
| `jurisdiction` | - | - | - | - | - |
| `messages` | - | - | - | - | - |
| `modified_on` | - | - | - | - | - |
| `name` | - | - | - | - | - |
| `producers` | - | - | - | - | - |
| `producers_total_count` | - | - | - | - | - |
| `queue_id` | - | - | - | - | - |
| `queue_name` | - | - | - | Yes | - |
| `result` | Yes | - | - | - | - |
| `result_info` | - | Yes | - | - | - |
| `retries` | - | - | - | - | - |
| `settings` | - | - | - | - | - |
| `source` | - | - | - | - | - |
| `success` | - | - | - | - | - |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Raises on error.

```ruby
result = client.Queue.create({
  "account_id" => "example_account_id", # String
  "queue_name" => "example_queue_name", # String
  "result_info" => {}, # Hash
})
```

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Queue.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Queue.load({ "id" => "queue_id", "account_id" => "account_id" })
```

#### `remove(reqmatch, ctrl = nil) -> result`

Remove the entity matching the given criteria. Raises on error.

```ruby
result = client.Queue.remove({ "id" => "queue_id", "account_id" => "account_id" })
```

#### `update(reqdata, ctrl = nil) -> result`

Update an existing entity. The data must include the entity `id`. Raises on error.

```ruby
result = client.Queue.update({
  "id" => "queue_id",
  "account_id" => "account_id",
  # Fields to update
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `QueueEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```ruby
client = CloudflareQueuesSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

