package core

type CloudflareQueuesError struct {
	IsCloudflareQueuesError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewCloudflareQueuesError(code string, msg string, ctx *Context) *CloudflareQueuesError {
	return &CloudflareQueuesError{
		IsCloudflareQueuesError: true,
		Sdk:              "CloudflareQueues",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *CloudflareQueuesError) Error() string {
	return e.Msg
}
