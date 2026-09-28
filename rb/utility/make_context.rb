# CloudflareQueues SDK utility: make_context
require_relative '../core/context'
module CloudflareQueuesUtilities
  MakeContext = ->(ctxmap, basectx) {
    CloudflareQueuesContext.new(ctxmap, basectx)
  }
end
