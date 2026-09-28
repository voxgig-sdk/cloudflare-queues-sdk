<?php
declare(strict_types=1);

// CloudflareQueues SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class CloudflareQueuesMakeContext
{
    public static function call(array $ctxmap, ?CloudflareQueuesContext $basectx): CloudflareQueuesContext
    {
        return new CloudflareQueuesContext($ctxmap, $basectx);
    }
}
