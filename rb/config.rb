# CloudflareQueues SDK configuration

module CloudflareQueuesConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "CloudflareQueues",
        "slug" => "cloudflare-queues",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://api.cloudflare.com/client/v4",
        "auth" => {
          "prefix" => "",
          "name" => "X-Auth-Email",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "consumer" => {},
          "queue" => {},
        },
      },
      "entity" => {
        "consumer" => {
          "fields" => [
            {
              "name" => "id",
              "title" => "Id",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "consumer",
          "op" => {
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "queue_id",
                    },
                    {
                      "lit" => "consumers",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{queue_id}",
                    "consumers",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "consumer_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "consumer_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "queue_id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                      "queue_id",
                    ],
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "$.main.kit.entity.queue",
              ],
            ],
          },
        },
        "queue" => {
          "fields" => [
            {
              "name" => "acks",
              "title" => "Acks",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "consumers",
              "title" => "Consumers",
              "type" => "`$ARRAY`",
              "readOnly" => true,
            },
            {
              "name" => "consumers_total_count",
              "title" => "Consumers Total Count",
              "type" => "`$NUMBER`",
              "readOnly" => true,
            },
            {
              "name" => "created_on",
              "title" => "Created On",
              "type" => "`$STRING`",
              "readOnly" => true,
            },
            {
              "name" => "destination",
              "title" => "Destination",
              "type" => "`$OBJECT`",
              "short" => "Destination configuration for the subscription",
            },
            {
              "name" => "enabled",
              "title" => "Enabled",
              "type" => "`$BOOLEAN`",
              "short" => "Whether the subscription is active",
            },
            {
              "name" => "errors",
              "title" => "Errors",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "events",
              "title" => "Events",
              "type" => "`$ARRAY`",
              "short" => "List of event types this subscription handles",
            },
            {
              "name" => "id",
              "title" => "Id",
              "type" => "`$STRING`",
            },
            {
              "name" => "jurisdiction",
              "title" => "Jurisdiction",
              "type" => "`$STRING`",
            },
            {
              "name" => "messages",
              "title" => "Messages",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "modified_on",
              "title" => "Modified On",
              "type" => "`$STRING`",
              "readOnly" => true,
            },
            {
              "name" => "name",
              "title" => "Name",
              "type" => "`$STRING`",
              "short" => "Name of the subscription",
            },
            {
              "name" => "producers",
              "title" => "Producers",
              "type" => "`$ARRAY`",
              "readOnly" => true,
            },
            {
              "name" => "producers_total_count",
              "title" => "Producers Total Count",
              "type" => "`$NUMBER`",
              "readOnly" => true,
            },
            {
              "name" => "queue_id",
              "title" => "Queue Id",
              "type" => "`$STRING`",
              "readOnly" => true,
            },
            {
              "name" => "queue_name",
              "title" => "Queue Name",
              "type" => "`$STRING`",
              "req" => true,
              "op" => {
                "patch" => {
                  "type" => "`$STRING`",
                },
                "update" => {
                  "type" => "`$STRING`",
                },
              },
            },
            {
              "name" => "result",
              "title" => "Result",
              "type" => "`$OBJECT`",
              "op" => {
                "load" => {
                  "req" => true,
                  "type" => "`$OBJECT`",
                },
              },
              "short" => "Response body representing a consumer",
            },
            {
              "name" => "result_info",
              "title" => "Result Info",
              "type" => "`$OBJECT`",
              "req" => true,
              "op" => {
                "list" => {
                  "type" => "`$OBJECT`",
                },
              },
            },
            {
              "name" => "retries",
              "title" => "Retries",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "settings",
              "title" => "Settings",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "source",
              "title" => "Source",
              "type" => "`$OBJECT`",
              "short" => "Source configuration for the subscription",
            },
            {
              "name" => "success",
              "title" => "Success",
              "type" => "`$BOOLEAN`",
              "short" => "Indicates if the API call was successful or not.",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "queue",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/consumers",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "consumers",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "consumers",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "consumer",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/ack",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "ack",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "ack",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_ack",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/batch",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "batch",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "batch",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_batch",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/extend",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "extend",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "extend",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_extend",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/peek",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "peek",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "peek",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_peek",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/preview",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "preview",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "preview",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_preview",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/preview/ack",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "preview",
                    },
                    {
                      "lit" => "ack",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "preview",
                    "ack",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/pull",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "pull",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "pull",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_pull",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/messages/purge",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "messages",
                    },
                    {
                      "lit" => "purge",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "messages",
                    "purge",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "message_purge",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/purge",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "purge",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "purge",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "purge",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/event_subscriptions/subscriptions",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "event_subscriptions",
                    },
                    {
                      "lit" => "subscriptions",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "event_subscriptions",
                    "subscriptions",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/accounts/{account_id}/queues",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                },
              ],
            },
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/event_subscriptions/subscriptions",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "event_subscriptions",
                    },
                    {
                      "lit" => "subscriptions",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "event_subscriptions",
                    "subscriptions",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                    "query" => [
                      {
                        "name" => "direction",
                        "orig" => "direction",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "asc",
                      },
                      {
                        "name" => "order",
                        "orig" => "order",
                        "type" => "`$STRING`",
                        "kind" => "query",
                        "example" => "name",
                      },
                      {
                        "name" => "page",
                        "orig" => "page",
                        "type" => "`$INTEGER`",
                        "kind" => "query",
                        "example" => 1,
                      },
                      {
                        "name" => "per_page",
                        "orig" => "per_page",
                        "type" => "`$INTEGER`",
                        "kind" => "query",
                        "example" => 20,
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "direction",
                      "order",
                      "page",
                      "per_page",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/consumers",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "consumers",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "consumers",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "consumer",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/metrics",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "metrics",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "metrics",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "metric",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/purge",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "purge",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "purge",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "$action" => "purge",
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                    ],
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "consumers",
                    },
                    {
                      "var" => "consumer_id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "consumers",
                    "{consumer_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "consumer_id",
                        "orig" => "consumer_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "consumer_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "event_subscriptions",
                    },
                    {
                      "lit" => "subscriptions",
                    },
                    {
                      "var" => "subscription_id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "event_subscriptions",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                },
              ],
            },
            "patch" => {
              "input" => "data",
              "name" => "patch",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "PATCH",
                  "orig" => "/accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "event_subscriptions",
                    },
                    {
                      "lit" => "subscriptions",
                    },
                    {
                      "var" => "subscription_id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "event_subscriptions",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/accounts/{account_id}/event_subscriptions/subscriptions/{subscription_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "event_subscriptions",
                    },
                    {
                      "lit" => "subscriptions",
                    },
                    {
                      "var" => "subscription_id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "event_subscriptions",
                    "subscriptions",
                    "{subscription_id}",
                  ],
                  "rename" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "subscription_id",
                        "orig" => "subscription_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "subscription_id",
                    ],
                  },
                },
              ],
            },
            "update" => {
              "input" => "data",
              "name" => "update",
              "points" => [
                {
                  "kind" => "http",
                  "method" => "PUT",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                    {
                      "lit" => "consumers",
                    },
                    {
                      "var" => "consumer_id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                    "consumers",
                    "{consumer_id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "consumer_id",
                        "orig" => "consumer_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "consumer_id",
                      "id",
                    ],
                  },
                },
                {
                  "kind" => "http",
                  "method" => "PUT",
                  "orig" => "/accounts/{account_id}/queues/{queue_id}",
                  "segments" => [
                    {
                      "lit" => "accounts",
                    },
                    {
                      "var" => "account_id",
                    },
                    {
                      "lit" => "queues",
                    },
                    {
                      "var" => "id",
                    },
                  ],
                  "parts" => [
                    "accounts",
                    "{account_id}",
                    "queues",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "queue_id" => "id",
                    },
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "args" => {
                    "params" => [
                      {
                        "name" => "account_id",
                        "orig" => "account_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                      {
                        "name" => "id",
                        "orig" => "queue_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true,
                        "example" => "023e105f4ecef8ad9ca31a8372d0c353",
                      },
                    ],
                  },
                  "select" => {
                    "exist" => [
                      "account_id",
                      "id",
                    ],
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [
              [
                "$.main.kit.entity.consumer",
              ],
            ],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    CloudflareQueuesFeatures.make_feature(name)
  end
end
