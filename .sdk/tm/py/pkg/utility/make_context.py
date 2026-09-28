# CloudflareQueues SDK utility: make_context

from projectname_sdk.core.context import CloudflareQueuesContext


def make_context_util(ctxmap, basectx):
    return CloudflareQueuesContext(ctxmap, basectx)
