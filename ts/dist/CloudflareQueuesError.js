"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CloudflareQueuesError = void 0;
class CloudflareQueuesError extends Error {
    isCloudflareQueuesError = true;
    sdk = 'CloudflareQueues';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.CloudflareQueuesError = CloudflareQueuesError;
//# sourceMappingURL=CloudflareQueuesError.js.map