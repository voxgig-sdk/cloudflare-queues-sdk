# CloudflareQueues SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

CloudflareQueuesUtility.registrar = ->(u) {
  u.clean = CloudflareQueuesUtilities::Clean
  u.done = CloudflareQueuesUtilities::Done
  u.make_error = CloudflareQueuesUtilities::MakeError
  u.feature_add = CloudflareQueuesUtilities::FeatureAdd
  u.feature_hook = CloudflareQueuesUtilities::FeatureHook
  u.feature_init = CloudflareQueuesUtilities::FeatureInit
  u.fetcher = CloudflareQueuesUtilities::Fetcher
  u.make_fetch_def = CloudflareQueuesUtilities::MakeFetchDef
  u.make_context = CloudflareQueuesUtilities::MakeContext
  u.make_options = CloudflareQueuesUtilities::MakeOptions
  u.make_request = CloudflareQueuesUtilities::MakeRequest
  u.make_response = CloudflareQueuesUtilities::MakeResponse
  u.make_result = CloudflareQueuesUtilities::MakeResult
  u.make_point = CloudflareQueuesUtilities::MakePoint
  u.make_spec = CloudflareQueuesUtilities::MakeSpec
  u.make_url = CloudflareQueuesUtilities::MakeUrl
  u.param = CloudflareQueuesUtilities::Param
  u.prepare_auth = CloudflareQueuesUtilities::PrepareAuth
  u.prepare_body = CloudflareQueuesUtilities::PrepareBody
  u.prepare_headers = CloudflareQueuesUtilities::PrepareHeaders
  u.prepare_method = CloudflareQueuesUtilities::PrepareMethod
  u.prepare_params = CloudflareQueuesUtilities::PrepareParams
  u.prepare_path = CloudflareQueuesUtilities::PreparePath
  u.prepare_query = CloudflareQueuesUtilities::PrepareQuery
  u.graphql_body = CloudflareQueuesUtilities::GraphqlBody
  u.graphql_errors = CloudflareQueuesUtilities::GraphqlErrors
  u.result_basic = CloudflareQueuesUtilities::ResultBasic
  u.result_body = CloudflareQueuesUtilities::ResultBody
  u.result_headers = CloudflareQueuesUtilities::ResultHeaders
  u.transform_request = CloudflareQueuesUtilities::TransformRequest
  u.transform_response = CloudflareQueuesUtilities::TransformResponse
}
