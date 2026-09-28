import { CloudflareQueuesEntityBase } from '../CloudflareQueuesEntityBase';
import type { CloudflareQueuesSDK } from '../CloudflareQueuesSDK';
import type { Control } from '../types';
import type { Consumer, ConsumerRemoveMatch } from '../CloudflareQueuesTypes';
declare class ConsumerEntity extends CloudflareQueuesEntityBase<Consumer> {
    constructor(client: CloudflareQueuesSDK, entopts: any);
    make(this: ConsumerEntity): ConsumerEntity;
    remove(this: any, reqmatch?: ConsumerRemoveMatch, ctrl?: Control): Promise<ConsumerEntity>;
}
export { ConsumerEntity };
