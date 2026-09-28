# Cloudflare Queues

Cloudflare Queues: message queues, consumers, and producers.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 2 entities and 28 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### [Consumer](docs/api/consumer.html)

Results: Successful consumer delete.

SDK operations: `remove`.

### [Queue](docs/api/queue.html)

Results: Create Queue Consumer response.; Successful message ingestion.; Details of ACKs and retries; Successful batch ingestion.; New lease IDs; A batch of peeked messages from the Queue; A batch of previewed messages from the Queue; Result of acknowledging previewed messages; A batch of messages in the Queue; Result of purging peeked messages; Updated Queue; Successfully created event subscription; Created Queue; List of event subscriptions; All consumers attached to this Queue; Queue metrics.; Details of the requested Queue; List of all Queues that belong to this account; Get Queue Consumer response.; Details about an event subscription; Successful delete; Update Queue Consumer response.

SDK operations: `create`, `list`, `load`, `patch`, `remove`, `update`.

Key fields to recognise:

- `destination`: Destination configuration for the subscription
- `enabled`: Whether the subscription is active
- `errors`: Errors encountered while purging messages.
- `events`: List of event types this subscription handles
- `id`: Unique identifier for the subscription

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| [Consumer](docs/api/consumer.html) | `remove` | `DELETE /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/consumers` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/ack` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/batch` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/extend` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/peek` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/preview` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/preview/ack` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/pull` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/messages/purge` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues/{queue_id}/purge` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/event_subscriptions/subscriptions` | Required |
| [Queue](docs/api/queue.html) | `create` | `POST /accounts/{account_id}/queues` | Required |
| [Queue](docs/api/queue.html) | `list` | `GET /accounts/{account_id}/event_subscriptions/subscriptions` | Required |
| [Queue](docs/api/queue.html) | `list` | `GET /accounts/{account_id}/queues/{queue_id}/consumers` | Required |
| [Queue](docs/api/queue.html) | `list` | `GET /accounts/{account_id}/queues/{queue_id}/metrics` | Required |
| [Queue](docs/api/queue.html) | `list` | `GET /accounts/{account_id}/queues/{queue_id}/purge` | Required |
| [Queue](docs/api/queue.html) | `list` | `GET /accounts/{account_id}/queues` | Required |
| [Queue](docs/api/queue.html) | `load` | `GET /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}` | Required |
| [Queue](docs/api/queue.html) | `load` | `GET /accounts/{account_id}/queues/{queue_id}` | Required |
| [Queue](docs/api/queue.html) | `load` | `GET /accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}` | Required |
| [Queue](docs/api/queue.html) | `patch` | `PATCH /accounts/{account_id}/queues/{queue_id}` | Required |
| [Queue](docs/api/queue.html) | `patch` | `PATCH /accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}` | Required |
| [Queue](docs/api/queue.html) | `remove` | `DELETE /accounts/{account_id}/queues/{queue_id}` | Required |
| [Queue](docs/api/queue.html) | `remove` | `DELETE /accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}` | Required |
| [Queue](docs/api/queue.html) | `update` | `PUT /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}` | Required |
| [Queue](docs/api/queue.html) | `update` | `PUT /accounts/{account_id}/queues/{queue_id}` | Required |

## Connect to the API

- Client API: `https://api.cloudflare.com/client/v4`

The default credential is sent in the `X-Auth-Email` header.

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| [Golang](docs/sdks/go.html) | `go/` | Build from source |
| [Lua](docs/sdks/lua.html) | `lua/` | Build from source |
| [PHP](docs/sdks/php.html) | `php/` | Build from source |
| [Python](docs/sdks/py.html) | `py/` | Build from source |
| [Ruby](docs/sdks/rb.html) | `rb/` | Build from source |
| [TypeScript](docs/sdks/ts.html) | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### [Go CLI](docs/tools/go-cli.html)

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### [Go MCP server](docs/tools/go-mcp.html)

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `cloudflare-queues_list`: List records for an entity. Supported entities: `queue`.
- `cloudflare-queues_load`: Load one record for an entity. Supported entities: `queue`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- [`test`](docs/features/test.html): In-memory mock transport for testing without a live server

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the [first-call guide](docs/guides/first-call.html) for the setup sequence.
- Read the [authentication guide](docs/guides/authentication.html) before using protected routes.
- Use the [API reference](docs/api/index.html) for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

