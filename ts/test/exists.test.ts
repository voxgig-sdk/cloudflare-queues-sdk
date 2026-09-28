
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { CloudflareQueuesSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = CloudflareQueuesSDK.test()
    equal(testsdk instanceof CloudflareQueuesSDK, true,
      'CloudflareQueuesSDK.test() must return a client synchronously')
  })

})
