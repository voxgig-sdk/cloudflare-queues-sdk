

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { CloudflareQueuesSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


loadEnvLocal(__dirname + '/../../../.env.local')


describe('ConsumerEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when CLOUDFLARE_QUEUES_TEST_LIVE=TRUE.
  afterEach(liveDelay('CLOUDFLARE_QUEUES_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = CloudflareQueuesSDK.test()
    const ent = testsdk.Consumer()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.CLOUDFLARE_QUEUES_TEST_LIVE
    for (const op of []) {
      if (!live && maybeSkipControl(t, 'entityOp', 'consumer.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":{"id":{"a":true,"h":"Id","n":"id","r":false,"t":"`$STRING`","key$":"id","index$":0}},"id":{"field":"id","name":"id"},"name":"consumer","op":{"remove":{"input":"data","name":"remove","points":[{"a":true,"co":{"id":"DELETE /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}","source":"openapi3","version":2},"g":{"params":[{"a":true,"ex":"023e105f4ecef8ad9ca31a8372d0c353","k":"param","n":"account_id","or":"account_id","r":true,"t":"`$STRING`","index$":0},{"a":true,"ex":"023e105f4ecef8ad9ca31a8372d0c353","k":"param","n":"id","or":"consumer_id","r":true,"t":"`$STRING`","index$":1},{"a":true,"ex":"023e105f4ecef8ad9ca31a8372d0c353","k":"param","n":"queue_id","or":"queue_id","r":true,"t":"`$STRING`","index$":2}]},"k":"http","m":"DELETE","o":"/accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}","q":{"exist":["account_id","id","queue_id"]},"r":{"param":{"consumer_id":"id"}},"s":[{"lit":"accounts"},{"var":"account_id"},{"lit":"queues"},{"var":"queue_id"},{"lit":"consumers"},{"var":"id"}],"t":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"remove"}},"relations":{"ancestors":[["$.main.kit.entity.queue"]]},"key$":"consumer","name__orig":"consumer","Name":"Consumer","name_":"consumer","name-":"consumer","NAME":"CONSUMER","index$":0}, {"active":true,"entity":"consumer","key$":"BasicConsumerFlow","kind":"basic","name":"BasicConsumerFlow","param":{},"step":[]}, 'Consumer', {"DELETE /accounts/{account_id}/queues/{queue_id}/consumers/{consumer_id}":{"protocol":"http","parameters":[{"name":"consumer_id","in":"path","required":true,"schema":{"description":"A Resource identifier.","type":"string","example":"023e105f4ecef8ad9ca31a8372d0c353","maxLength":32,"readOnly":true,"x-auditable":true,"x-ref":"#/components/schemas/mq_identifier"},"index$":0},{"name":"queue_id","in":"path","required":true,"schema":{"description":"A Resource identifier.","type":"string","example":"023e105f4ecef8ad9ca31a8372d0c353","maxLength":32,"readOnly":true,"x-auditable":true,"x-ref":"#/components/schemas/mq_identifier"},"index$":1},{"name":"account_id","in":"path","required":true,"schema":{"description":"A Resource identifier.","type":"string","example":"023e105f4ecef8ad9ca31a8372d0c353","maxLength":32,"readOnly":true,"x-auditable":true,"x-ref":"#/components/schemas/mq_identifier"},"index$":2}]}})
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let consumer_ref01_data = Object.values(setup.data.existing.consumer)[0] as any

  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/consumer/ConsumerTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = CloudflareQueuesSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['consumer01','consumer02','consumer03','queue01','queue02','queue03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'CLOUDFLARE_QUEUES_TEST_CONSUMER_ENTID': idmap,
    'CLOUDFLARE_QUEUES_TEST_LIVE': 'FALSE',
    'CLOUDFLARE_QUEUES_TEST_EXPLAIN': 'FALSE',
    'CLOUDFLARE_QUEUES_APIKEY': '',
  })

  idmap = env['CLOUDFLARE_QUEUES_TEST_CONSUMER_ENTID']

  const live = 'TRUE' === env.CLOUDFLARE_QUEUES_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['CLOUDFLARE_QUEUES_TEST_CONSUMER_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new CloudflareQueuesSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.CLOUDFLARE_QUEUES_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.CLOUDFLARE_QUEUES_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
