// Typed models for the CloudflareQueues SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import (
	"encoding/json"

	"github.com/voxgig-sdk/cloudflare-queues-sdk/go/core"
)

// Consumer is the typed data model for the consumer entity.
type Consumer struct {
}

// ConsumerRemoveMatch is the typed request payload for Consumer.RemoveTyped.
type ConsumerRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id string `json:"id"`
	QueueId string `json:"queue_id"`
}

// Queue is the typed data model for the queue entity.
type Queue struct {
}

// QueueLoadMatch is the typed request payload for Queue.LoadTyped.
type QueueLoadMatch struct {
	AccountId string `json:"account_id"`
	ConsumerId *string `json:"consumer_id,omitempty"`
	Id *string `json:"id,omitempty"`
	SubscriptionId *string `json:"subscription_id,omitempty"`
}

// QueueListMatch is the typed request payload for Queue.ListTyped.
type QueueListMatch struct {
	AccountId string `json:"account_id"`
	Direction *string `json:"direction,omitempty"`
	Order *string `json:"order,omitempty"`
	Page *int `json:"page,omitempty"`
	PerPage *int `json:"per_page,omitempty"`
}

// QueueCreateData is the typed request payload for Queue.CreateTyped.
type QueueCreateData struct {
	AccountId string `json:"account_id"`
	Id *string `json:"id,omitempty"`
	Acks *[]any `json:"acks,omitempty"`
	Consumers *[]any `json:"consumers,omitempty"`
	ConsumersTotalCount *float64 `json:"consumers_total_count,omitempty"`
	CreatedOn *string `json:"created_on,omitempty"`
	Destination *map[string]any `json:"destination,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Errors *[]any `json:"errors,omitempty"`
	Events *[]any `json:"events,omitempty"`
	Jurisdiction *string `json:"jurisdiction,omitempty"`
	Messages *[]any `json:"messages,omitempty"`
	ModifiedOn *string `json:"modified_on,omitempty"`
	Name *string `json:"name,omitempty"`
	Producers *[]any `json:"producers,omitempty"`
	ProducersTotalCount *float64 `json:"producers_total_count,omitempty"`
	QueueId *string `json:"queue_id,omitempty"`
	QueueName string `json:"queue_name"`
	Result *map[string]any `json:"result,omitempty"`
	ResultInfo map[string]any `json:"result_info"`
	Retries *[]any `json:"retries,omitempty"`
	Settings *map[string]any `json:"settings,omitempty"`
	Source *map[string]any `json:"source,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// QueueUpdateData is the typed request payload for Queue.UpdateTyped.
type QueueUpdateData struct {
	AccountId string `json:"account_id"`
	ConsumerId *string `json:"consumer_id,omitempty"`
	Id string `json:"id"`
	Acks *[]any `json:"acks,omitempty"`
	Consumers *[]any `json:"consumers,omitempty"`
	ConsumersTotalCount *float64 `json:"consumers_total_count,omitempty"`
	CreatedOn *string `json:"created_on,omitempty"`
	Destination *map[string]any `json:"destination,omitempty"`
	Enabled *bool `json:"enabled,omitempty"`
	Errors *[]any `json:"errors,omitempty"`
	Events *[]any `json:"events,omitempty"`
	Jurisdiction *string `json:"jurisdiction,omitempty"`
	Messages *[]any `json:"messages,omitempty"`
	ModifiedOn *string `json:"modified_on,omitempty"`
	Name *string `json:"name,omitempty"`
	Producers *[]any `json:"producers,omitempty"`
	ProducersTotalCount *float64 `json:"producers_total_count,omitempty"`
	QueueId *string `json:"queue_id,omitempty"`
	QueueName *string `json:"queue_name,omitempty"`
	Result *map[string]any `json:"result,omitempty"`
	ResultInfo *map[string]any `json:"result_info,omitempty"`
	Retries *[]any `json:"retries,omitempty"`
	Settings *map[string]any `json:"settings,omitempty"`
	Source *map[string]any `json:"source,omitempty"`
	Success *bool `json:"success,omitempty"`
}

// QueueRemoveMatch is the typed request payload for Queue.RemoveTyped.
type QueueRemoveMatch struct {
	AccountId string `json:"account_id"`
	Id *string `json:"id,omitempty"`
	SubscriptionId *string `json:"subscription_id,omitempty"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// entityData unwraps an entity to its data map.
//
// Operations resolve to the ENTITY, not the raw data (see AGENTS.md), and an
// entity's fields are UNEXPORTED — marshalling one directly yields `{}`, so
// every typed accessor would silently hand back a zero-valued struct. The
// typed boundary therefore takes the data hop first.
func entityData(v any) any {
	if ent, ok := v.(core.Entity); ok {
		return ent.Data()
	}
	return v
}

// typedFrom decodes a runtime value (an entity, or the map[string]any the op
// pipeline produced) into a typed model T via a JSON round-trip. On any error
// it returns the zero value of T; the op's own (value, error) tuple carries
// the real error.
func typedFrom[T any](v any) T {
	var out T
	v = entityData(v)
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value into a typed slice []T via a
// JSON round-trip, for list ops. `list` resolves to a slice of ENTITY
// instances, so each element takes the data hop.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	if list, ok := v.([]any); ok {
		unwrapped := make([]any, 0, len(list))
		for _, item := range list {
			unwrapped = append(unwrapped, entityData(item))
		}
		v = unwrapped
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}
