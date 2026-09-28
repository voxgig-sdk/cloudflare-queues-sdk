# CloudflareQueues PHP SDK Reference

Complete API reference for the CloudflareQueues PHP SDK.


## CloudflareQueuesSDK

### Constructor

```php
require_once __DIR__ . '/cloudflarequeues_sdk.php';

$client = new CloudflareQueuesSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CloudflareQueuesSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = CloudflareQueuesSDK::test();
```


### Instance Methods

#### `Consumer($data = null)`

Create a new `ConsumerEntity` instance. Pass `null` for no initial data.

#### `Queue($data = null)`

Create a new `QueueEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): CloudflareQueuesUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## ConsumerEntity

```php
$consumer = $client->Consumer();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Consumer()->remove(["account_id" => "account_id", "id" => "id", "queue_id" => "queue_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ConsumerEntity`

Create a new `ConsumerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## QueueEntity

```php
$queue = $client->Queue();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acks` | `array` | No |  |
| `consumers` | `array` | No |  |
| `consumers_total_count` | `float` | No |  |
| `created_on` | `string` | No |  |
| `destination` | `array` | No | Destination configuration for the subscription |
| `enabled` | `bool` | No | Whether the subscription is active |
| `errors` | `array` | No |  |
| `events` | `array` | No | List of event types this subscription handles |
| `id` | `string` | No |  |
| `jurisdiction` | `string` | No |  |
| `messages` | `array` | No |  |
| `modified_on` | `string` | No |  |
| `name` | `string` | No | Name of the subscription |
| `producers` | `array` | No |  |
| `producers_total_count` | `float` | No |  |
| `queue_id` | `string` | No |  |
| `queue_name` | `string` | Yes |  |
| `result` | `array` | No | Response body representing a consumer |
| `result_info` | `array` | Yes |  |
| `retries` | `array` | No |  |
| `settings` | `array` | No |  |
| `source` | `array` | No | Source configuration for the subscription |
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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Throws on error.

```php
$result = $client->Queue()->create([
  "account_id" => null, // string
  "queue_name" => null, // string
  "result_info" => null, // array
]);
```

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Queue()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Queue()->load(["id" => "queue_id", "account_id" => "account_id"]);
```

#### `remove(array $reqmatch, ?array $ctrl = null): mixed`

Remove the entity matching the given criteria. Throws on error.

```php
$result = $client->Queue()->remove(["id" => "queue_id", "account_id" => "account_id"]);
```

#### `update(array $reqdata, ?array $ctrl = null): mixed`

Update an existing entity. The data must include the entity `id`. Throws on error.

```php
$result = $client->Queue()->update([
  "id" => "queue_id",
  "account_id" => "account_id",
  // Fields to update
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): QueueEntity`

Create a new `QueueEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```php
$client = new CloudflareQueuesSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
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

