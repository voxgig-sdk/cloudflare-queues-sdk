# CloudflareQueues SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/test_feature'


module CloudflareQueuesFeatures
  def self.make_feature(name)
    case name
    when "base"
      CloudflareQueuesBaseFeature.new
    when "test"
      CloudflareQueuesTestFeature.new
    else
      CloudflareQueuesBaseFeature.new
    end
  end
end
