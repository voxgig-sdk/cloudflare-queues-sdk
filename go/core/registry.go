package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewConsumerEntityFunc func(client *CloudflareQueuesSDK, entopts map[string]any) CloudflareQueuesEntity

var NewQueueEntityFunc func(client *CloudflareQueuesSDK, entopts map[string]any) CloudflareQueuesEntity

