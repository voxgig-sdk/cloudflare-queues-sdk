# CloudflareQueues Lua SDK Reference

Complete API reference for the CloudflareQueues Lua SDK.


## CloudflareQueuesSDK

### Constructor

```lua
local sdk = require("cloudflare-queues_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Consumer(data)`

Create a new `Consumer` entity instance. Pass `nil` for no initial data.

#### `Queue(data)`

Create a new `Queue` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## ConsumerEntity

```lua
local consumer = client:Consumer(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Consumer():remove({ account_id = "account_id", id = "id", queue_id = "queue_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ConsumerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## QueueEntity

```lua
local queue = client:Queue(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acks` | `table` | No |  |
| `consumers` | `table` | No |  |
| `consumers_total_count` | `number` | No |  |
| `created_on` | `string` | No |  |
| `destination` | `table` | No | Destination configuration for the subscription |
| `enabled` | `boolean` | No | Whether the subscription is active |
| `errors` | `table` | No |  |
| `events` | `table` | No | List of event types this subscription handles |
| `id` | `string` | No |  |
| `jurisdiction` | `string` | No |  |
| `messages` | `table` | No |  |
| `modified_on` | `string` | No |  |
| `name` | `string` | No | Name of the subscription |
| `producers` | `table` | No |  |
| `producers_total_count` | `number` | No |  |
| `queue_id` | `string` | No |  |
| `queue_name` | `string` | Yes |  |
| `result` | `table` | No | Response body representing a consumer |
| `result_info` | `table` | Yes |  |
| `retries` | `table` | No |  |
| `settings` | `table` | No |  |
| `source` | `table` | No | Source configuration for the subscription |
| `success` | `boolean` | No | Indicates if the API call was successful or not. |

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

#### `create(reqdata, ctrl) -> any, err`

Create a new entity with the given data.

```lua
local result, err = client:Queue():create({
  account_id = --[[ string ]],
  queue_name = --[[ string ]],
  result_info = --[[ table ]],
})
```

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Queue():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Queue():load({ id = "queue_id", account_id = "account_id" })
```

#### `remove(reqmatch, ctrl) -> any, err`

Remove the entity matching the given criteria.

```lua
local result, err = client:Queue():remove({ id = "queue_id", account_id = "account_id" })
```

#### `update(reqdata, ctrl) -> any, err`

Update an existing entity. The data must include the entity `id`.

```lua
local result, err = client:Queue():update({
  id = "queue_id",
  account_id = "account_id",
  -- Fields to update
})
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `QueueEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
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

