<?php
declare(strict_types=1);

// Typed models for the CloudflareQueues SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** Consumer entity data model. */
class Consumer
{
    public ?string $id = null;
}

/** Request payload for Consumer#remove. */
class ConsumerRemoveMatch
{
    public string $account_id;
    public string $id;
    public string $queue_id;
}

/** Queue entity data model. */
class Queue
{
    public ?array $acks = null;
    public ?array $consumers = null;
    public ?float $consumers_total_count = null;
    public ?string $created_on = null;
    public ?array $destination = null;
    public ?bool $enabled = null;
    public ?array $errors = null;
    public ?array $events = null;
    public ?string $id = null;
    public ?string $jurisdiction = null;
    public ?array $messages = null;
    public ?string $modified_on = null;
    public ?string $name = null;
    public ?array $producers = null;
    public ?float $producers_total_count = null;
    public ?string $queue_id = null;
    public string $queue_name;
    public ?array $result = null;
    public array $result_info;
    public ?array $retries = null;
    public ?array $settings = null;
    public ?array $source = null;
    public ?bool $success = null;
}

/** Request payload for Queue#load. */
class QueueLoadMatch
{
    public string $account_id;
    public ?string $consumer_id = null;
    public ?string $id = null;
    public ?string $subscription_id = null;
}

/** Request payload for Queue#list. */
class QueueListMatch
{
    public string $account_id;
    public ?string $direction = null;
    public ?string $order = null;
    public ?int $page = null;
    public ?int $per_page = null;
}

/** Request payload for Queue#create. */
class QueueCreateData
{
    public string $account_id;
    public ?string $id = null;
    public ?array $acks = null;
    public ?array $consumers = null;
    public ?float $consumers_total_count = null;
    public ?string $created_on = null;
    public ?array $destination = null;
    public ?bool $enabled = null;
    public ?array $errors = null;
    public ?array $events = null;
    public ?string $jurisdiction = null;
    public ?array $messages = null;
    public ?string $modified_on = null;
    public ?string $name = null;
    public ?array $producers = null;
    public ?float $producers_total_count = null;
    public ?string $queue_id = null;
    public string $queue_name;
    public ?array $result = null;
    public array $result_info;
    public ?array $retries = null;
    public ?array $settings = null;
    public ?array $source = null;
    public ?bool $success = null;
}

/** Request payload for Queue#update. */
class QueueUpdateData
{
    public string $account_id;
    public ?string $consumer_id = null;
    public string $id;
    public ?array $acks = null;
    public ?array $consumers = null;
    public ?float $consumers_total_count = null;
    public ?string $created_on = null;
    public ?array $destination = null;
    public ?bool $enabled = null;
    public ?array $errors = null;
    public ?array $events = null;
    public ?string $jurisdiction = null;
    public ?array $messages = null;
    public ?string $modified_on = null;
    public ?string $name = null;
    public ?array $producers = null;
    public ?float $producers_total_count = null;
    public ?string $queue_id = null;
    public ?string $queue_name = null;
    public ?array $result = null;
    public ?array $result_info = null;
    public ?array $retries = null;
    public ?array $settings = null;
    public ?array $source = null;
    public ?bool $success = null;
}

/** Request payload for Queue#remove. */
class QueueRemoveMatch
{
    public string $account_id;
    public ?string $id = null;
    public ?string $subscription_id = null;
}

