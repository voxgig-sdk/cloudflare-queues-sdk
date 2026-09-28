<?php
declare(strict_types=1);

// CloudflareQueues SDK base feature

class CloudflareQueuesBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(CloudflareQueuesContext $ctx, array $options): void {}
    public function PostConstruct(CloudflareQueuesContext $ctx): void {}
    public function PostConstructEntity(CloudflareQueuesContext $ctx): void {}
    public function SetData(CloudflareQueuesContext $ctx): void {}
    public function GetData(CloudflareQueuesContext $ctx): void {}
    public function GetMatch(CloudflareQueuesContext $ctx): void {}
    public function SetMatch(CloudflareQueuesContext $ctx): void {}
    public function PrePoint(CloudflareQueuesContext $ctx): void {}
    public function PreSpec(CloudflareQueuesContext $ctx): void {}
    public function PreRequest(CloudflareQueuesContext $ctx): void {}
    public function PreResponse(CloudflareQueuesContext $ctx): void {}
    public function PreResult(CloudflareQueuesContext $ctx): void {}
    public function PreDone(CloudflareQueuesContext $ctx): void {}
    public function PreUnexpected(CloudflareQueuesContext $ctx): void {}
}
