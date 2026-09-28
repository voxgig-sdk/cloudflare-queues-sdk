import { Context } from './Context';
declare class CloudflareQueuesError extends Error {
    isCloudflareQueuesError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { CloudflareQueuesError };
