import { ConsumerEntity } from './entity/ConsumerEntity';
import { QueueEntity } from './entity/QueueEntity';
export type * from './CloudflareQueuesTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { CloudflareQueuesEntityBase } from './CloudflareQueuesEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class CloudflareQueuesSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Consumer(entopts?: Record<string, any>): ConsumerEntity;
    Queue(entopts?: Record<string, any>): QueueEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): CloudflareQueuesSDK;
    tester(testopts?: any, sdkopts?: any): CloudflareQueuesSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof CloudflareQueuesSDK;
export { stdutil, config, BaseFeature, CloudflareQueuesEntityBase, CloudflareQueuesSDK, SDK, };
