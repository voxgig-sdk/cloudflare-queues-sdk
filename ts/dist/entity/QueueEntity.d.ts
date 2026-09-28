import { CloudflareQueuesEntityBase } from '../CloudflareQueuesEntityBase';
import type { CloudflareQueuesSDK } from '../CloudflareQueuesSDK';
import type { Control } from '../types';
import type { Queue, QueueLoadMatch, QueueListMatch, QueueCreateData, QueueUpdateData, QueueRemoveMatch } from '../CloudflareQueuesTypes';
declare class QueueEntity extends CloudflareQueuesEntityBase<Queue> {
    constructor(client: CloudflareQueuesSDK, entopts: any);
    make(this: QueueEntity): QueueEntity;
    load(this: any, reqmatch?: QueueLoadMatch, ctrl?: Control): Promise<QueueEntity>;
    list(this: any, reqmatch?: QueueListMatch, ctrl?: Control): Promise<QueueEntity[]>;
    create(this: any, reqdata?: QueueCreateData, ctrl?: Control): Promise<QueueEntity>;
    update(this: any, reqdata?: QueueUpdateData, ctrl?: Control): Promise<QueueEntity>;
    remove(this: any, reqmatch?: QueueRemoveMatch, ctrl?: Control): Promise<QueueEntity>;
}
export { QueueEntity };
