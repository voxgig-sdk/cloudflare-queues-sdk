# CloudflareQueues TypeScript SDK Reference

Complete API reference for the CloudflareQueues TypeScript SDK.


## CloudflareQueuesSDK

### Constructor

```ts
new CloudflareQueuesSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `CloudflareQueuesSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = CloudflareQueuesSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `CloudflareQueuesSDK` instance in test mode.


### Instance Methods

#### `Consumer(data?: object)`

Create a new `Consumer` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ConsumerEntity` instance.

#### `Queue(data?: object)`

Create a new `Queue` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `QueueEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `CloudflareQueuesSDK.test()`.

**Returns:** `CloudflareQueuesSDK` instance in test mode.


---

## ConsumerEntity

```ts
const consumer = client.Consumer()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `id` | `string` | No |  |

### Operations

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Consumer().remove({ account_id: 'account_id', id: 'id', queue_id: 'queue_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ConsumerEntity` instance with the same client and
options.

#### `client()`

Return the parent `CloudflareQueuesSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## QueueEntity

```ts
const queue = client.Queue()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `acks` | `any[]` | No |  |
| `consumers` | `any[]` | No |  |
| `consumers_total_count` | `number` | No |  |
| `created_on` | `string` | No |  |
| `destination` | `Record<string, any>` | No | Destination configuration for the subscription |
| `enabled` | `boolean` | No | Whether the subscription is active |
| `errors` | `any[]` | No |  |
| `events` | `any[]` | No | List of event types this subscription handles |
| `id` | `string` | No |  |
| `jurisdiction` | `string` | No |  |
| `messages` | `any[]` | No |  |
| `modified_on` | `string` | No |  |
| `name` | `string` | No | Name of the subscription |
| `producers` | `any[]` | No |  |
| `producers_total_count` | `number` | No |  |
| `queue_id` | `string` | No |  |
| `queue_name` | `string` | Yes |  |
| `result` | `Record<string, any>` | No | Response body representing a consumer |
| `result_info` | `Record<string, any>` | Yes |  |
| `retries` | `any[]` | No |  |
| `settings` | `Record<string, any>` | No |  |
| `source` | `Record<string, any>` | No | Source configuration for the subscription |
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

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `consumer` | `/accounts/{account_id}/queues/{queue_id}/consumers` | `client.Queue().create({ $action: 'consumer', ... })` |
| `message` | `/accounts/{account_id}/queues/{queue_id}/messages` | `client.Queue().create({ $action: 'message', ... })` |
| `message_ack` | `/accounts/{account_id}/queues/{queue_id}/messages/ack` | `client.Queue().create({ $action: 'message_ack', ... })` |
| `message_batch` | `/accounts/{account_id}/queues/{queue_id}/messages/batch` | `client.Queue().create({ $action: 'message_batch', ... })` |
| `message_extend` | `/accounts/{account_id}/queues/{queue_id}/messages/extend` | `client.Queue().create({ $action: 'message_extend', ... })` |
| `message_peek` | `/accounts/{account_id}/queues/{queue_id}/messages/peek` | `client.Queue().create({ $action: 'message_peek', ... })` |
| `message_preview` | `/accounts/{account_id}/queues/{queue_id}/messages/preview` | `client.Queue().create({ $action: 'message_preview', ... })` |
| `message_pull` | `/accounts/{account_id}/queues/{queue_id}/messages/pull` | `client.Queue().create({ $action: 'message_pull', ... })` |
| `message_purge` | `/accounts/{account_id}/queues/{queue_id}/messages/purge` | `client.Queue().create({ $action: 'message_purge', ... })` |
| `purge` | `/accounts/{account_id}/queues/{queue_id}/purge` | `client.Queue().create({ $action: 'purge', ... })` |
| `consumer` | `/accounts/{account_id}/queues/{queue_id}/consumers` | `client.Queue().list({ $action: 'consumer', ... })` |
| `metric` | `/accounts/{account_id}/queues/{queue_id}/metrics` | `client.Queue().list({ $action: 'metric', ... })` |
| `purge` | `/accounts/{account_id}/queues/{queue_id}/purge` | `client.Queue().list({ $action: 'purge', ... })` |

An action returns that action's OWN response, which is not necessarily a
Queue record — check the API definition for its shape.

```ts
const result = await client.Queue().create({
  $action: 'consumer',
  /* ...the action's own arguments */
})
```

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.Queue().create({
  account_id: 'example_account_id',
  queue_name: 'example_queue_name',
  result_info: {},
})
```

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Queue().list({ account_id: "example" })
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Queue().load({ id: 'queue_id', account_id: 'account_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.Queue().remove({ id: 'queue_id', account_id: 'account_id' })
```

#### `update(data: object, ctrl?: object)`

Update an existing entity. The data must include the entity `id`.

```ts
const result = await client.Queue().update({
  id: 'queue_id',
  account_id: 'account_id',
  // Fields to update
})
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `QueueEntity` instance with the same client and
options.

#### `client()`

Return the parent `CloudflareQueuesSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```ts
const client = new CloudflareQueuesSDK({
  feature: {
    test: { active: true },
  }
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

