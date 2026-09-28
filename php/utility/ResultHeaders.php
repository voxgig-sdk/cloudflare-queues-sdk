<?php
declare(strict_types=1);

// CloudflareQueues SDK utility: result_headers

class CloudflareQueuesResultHeaders
{
    public static function call(CloudflareQueuesContext $ctx): ?CloudflareQueuesResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
