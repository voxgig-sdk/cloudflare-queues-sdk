export interface Consumer {
    id?: string;
}
export interface ConsumerRemoveMatch {
    account_id: string;
    id: string;
    queue_id: string;
}
export interface Queue {
    acks?: any[];
    consumers?: any[];
    consumers_total_count?: number;
    created_on?: string;
    destination?: Record<string, any>;
    enabled?: boolean;
    errors?: any[];
    events?: any[];
    id?: string;
    jurisdiction?: string;
    messages?: any[];
    modified_on?: string;
    name?: string;
    producers?: any[];
    producers_total_count?: number;
    queue_id?: string;
    queue_name: string;
    result?: Record<string, any>;
    result_info: Record<string, any>;
    retries?: any[];
    settings?: Record<string, any>;
    source?: Record<string, any>;
    success?: boolean;
}
export interface QueueLoadMatch {
    account_id: string;
    consumer_id?: string;
    id?: string;
    subscription_id?: string;
}
export interface QueueListMatch {
    account_id: string;
    direction?: string;
    order?: string;
    page?: number;
    per_page?: number;
    $action?: string;
    [action: string]: any;
}
export interface QueueCreateData {
    account_id: string;
    id?: string;
    acks?: any[];
    consumers?: any[];
    consumers_total_count?: number;
    created_on?: string;
    destination?: Record<string, any>;
    enabled?: boolean;
    errors?: any[];
    events?: any[];
    jurisdiction?: string;
    messages?: any[];
    modified_on?: string;
    name?: string;
    producers?: any[];
    producers_total_count?: number;
    queue_id?: string;
    queue_name: string;
    result?: Record<string, any>;
    result_info: Record<string, any>;
    retries?: any[];
    settings?: Record<string, any>;
    source?: Record<string, any>;
    success?: boolean;
    $action?: string;
    [action: string]: any;
}
export interface QueueUpdateData {
    account_id: string;
    consumer_id?: string;
    id: string;
    acks?: any[];
    consumers?: any[];
    consumers_total_count?: number;
    created_on?: string;
    destination?: Record<string, any>;
    enabled?: boolean;
    errors?: any[];
    events?: any[];
    jurisdiction?: string;
    messages?: any[];
    modified_on?: string;
    name?: string;
    producers?: any[];
    producers_total_count?: number;
    queue_id?: string;
    queue_name?: string;
    result?: Record<string, any>;
    result_info?: Record<string, any>;
    retries?: any[];
    settings?: Record<string, any>;
    source?: Record<string, any>;
    success?: boolean;
}
export interface QueueRemoveMatch {
    account_id: string;
    id?: string;
    subscription_id?: string;
}
