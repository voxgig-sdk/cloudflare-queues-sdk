package voxgigcloudflarequeuessdk

import (
	"github.com/voxgig-sdk/cloudflare-queues-sdk/go/core"
	"github.com/voxgig-sdk/cloudflare-queues-sdk/go/entity"
	"github.com/voxgig-sdk/cloudflare-queues-sdk/go/feature"
	_ "github.com/voxgig-sdk/cloudflare-queues-sdk/go/utility"
)

// Type aliases preserve external API.
type CloudflareQueuesSDK = core.CloudflareQueuesSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type CloudflareQueuesEntity = core.CloudflareQueuesEntity
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type CloudflareQueuesError = core.CloudflareQueuesError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewConsumerEntityFunc = func(client *core.CloudflareQueuesSDK, entopts map[string]any) core.CloudflareQueuesEntity {
		return entity.NewConsumerEntity(client, entopts)
	}
	core.NewQueueEntityFunc = func(client *core.CloudflareQueuesSDK, entopts map[string]any) core.CloudflareQueuesEntity {
		return entity.NewQueueEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewCloudflareQueuesSDK = core.NewCloudflareQueuesSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewCloudflareQueuesSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *CloudflareQueuesSDK  { return NewCloudflareQueuesSDK(nil) }
func Test() *CloudflareQueuesSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewTestFeature = feature.NewTestFeature
