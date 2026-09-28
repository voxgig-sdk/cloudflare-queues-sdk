# CloudflareQueues Python SDK Reference

Complete API reference for the CloudflareQueues Python SDK.


## CloudflareQueuesSDK

### Constructor

```python
from cloudflarequeues_sdk import CloudflareQueuesSDK

client = CloudflareQueuesSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CloudflareQueuesSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = CloudflareQueuesSDK.test()
```


### Instance Methods

#### `Consumer(data=None)`

Create a new `ConsumerEntity` instance. Pass `None` for no initial data.

#### `Queue(data=None)`

Create a new `QueueEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## ConsumerEntity

```python
consumer = client.Consumer()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `str` | No |  |

### Operations

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Consumer().remove({"account_id": "account_id", "id": "id", "queue_id": "queue_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ConsumerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## QueueEntity

```python
queue = client.Queue()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acks` | `list` | No |  |
| `consumers` | `list` | No |  |
| `consumers_total_count` | `float` | No |  |
| `created_on` | `str` | No |  |
| `destination` | `dict` | No | Destination configuration for the subscription |
| `enabled` | `bool` | No | Whether the subscription is active |
| `errors` | `list` | No |  |
| `events` | `list` | No | List of event types this subscription handles |
| `id` | `str` | No |  |
| `jurisdiction` | `str` | No |  |
| `messages` | `list` | No |  |
| `modified_on` | `str` | No |  |
| `name` | `str` | No | Name of the subscription |
| `producers` | `list` | No |  |
| `producers_total_count` | `float` | No |  |
| `queue_id` | `str` | No |  |
| `queue_name` | `str` | Yes |  |
| `result` | `dict` | No | Response body representing a consumer |
| `result_info` | `dict` | Yes |  |
| `retries` | `list` | No |  |
| `settings` | `dict` | No |  |
| `source` | `dict` | No | Source configuration for the subscription |
| `success` | `bool` | No | Indicates if the API call was successful or not. |

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

#### `create(reqdata, ctrl=None) -> dict`

Create a new entity with the given data. Returns the created entity data and raises on error.

```python
result = client.Queue().create({
    "account_id": "example_account_id",  # str
    "queue_name": "example_queue_name",  # str
    "result_info": {},  # dict
})
```

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Queue().list({"account_id": "example"})
for queue in results:
    print(queue)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Queue().load({"id": "queue_id", "account_id": "account_id"})
```

#### `remove(reqmatch, ctrl=None) -> dict`

Remove the entity matching the given criteria. Raises on error.

```python
result = client.Queue().remove({"id": "queue_id", "account_id": "account_id"})
```

#### `update(reqdata, ctrl=None) -> dict`

Update an existing entity. The data must include the entity `id`. Returns the updated entity data and raises on error.

```python
result = client.Queue().update({
    "id": "queue_id",
    "account_id": "account_id",
    # Fields to update
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `QueueEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```python
client = CloudflareQueuesSDK({
    "feature": {
        "test": {"active": True},
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

