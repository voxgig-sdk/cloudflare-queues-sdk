# CloudflareQueues SDK exists test

import pytest
from cloudflarequeues_sdk import CloudflareQueuesSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = CloudflareQueuesSDK.test(None, None)
        assert testsdk is not None
