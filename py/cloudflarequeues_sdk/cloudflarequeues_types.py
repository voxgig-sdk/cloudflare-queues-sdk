# Typed models for the CloudflareQueues SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Consumer(TypedDict, total=False):
    id: str


class ConsumerRemoveMatch(TypedDict):
    account_id: str
    id: str
    queue_id: str


class QueueRequired(TypedDict):
    queue_name: str
    result_info: dict


class Queue(QueueRequired, total=False):
    acks: list
    consumers: list
    consumers_total_count: float
    created_on: str
    destination: dict
    enabled: bool
    errors: list
    events: list
    id: str
    jurisdiction: str
    messages: list
    modified_on: str
    name: str
    producers: list
    producers_total_count: float
    queue_id: str
    result: dict
    retries: list
    settings: dict
    source: dict
    success: bool


class QueueLoadMatchRequired(TypedDict):
    account_id: str


class QueueLoadMatch(QueueLoadMatchRequired, total=False):
    consumer_id: str
    id: str
    subscription_id: str


class QueueListMatchRequired(TypedDict):
    account_id: str


class QueueListMatch(QueueListMatchRequired, total=False):
    direction: str
    order: str
    page: int
    per_page: int


class QueueCreateDataRequired(TypedDict):
    account_id: str
    queue_name: str
    result_info: dict


class QueueCreateData(QueueCreateDataRequired, total=False):
    id: str
    acks: list
    consumers: list
    consumers_total_count: float
    created_on: str
    destination: dict
    enabled: bool
    errors: list
    events: list
    jurisdiction: str
    messages: list
    modified_on: str
    name: str
    producers: list
    producers_total_count: float
    queue_id: str
    result: dict
    retries: list
    settings: dict
    source: dict
    success: bool


class QueueUpdateDataRequired(TypedDict):
    account_id: str
    id: str


class QueueUpdateData(QueueUpdateDataRequired, total=False):
    consumer_id: str
    acks: list
    consumers: list
    consumers_total_count: float
    created_on: str
    destination: dict
    enabled: bool
    errors: list
    events: list
    jurisdiction: str
    messages: list
    modified_on: str
    name: str
    producers: list
    producers_total_count: float
    queue_id: str
    queue_name: str
    result: dict
    result_info: dict
    retries: list
    settings: dict
    source: dict
    success: bool


class QueueRemoveMatchRequired(TypedDict):
    account_id: str


class QueueRemoveMatch(QueueRemoveMatchRequired, total=False):
    id: str
    subscription_id: str
