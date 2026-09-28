<?php
declare(strict_types=1);

// CloudflareQueues SDK utility: result_body

class CloudflareQueuesResultBody
{
    public static function call(CloudflareQueuesContext $ctx): ?CloudflareQueuesResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result && $response && $response->json_func && $response->body) {
            $result->body = ($response->json_func)();
        }
        return $result;
    }
}
