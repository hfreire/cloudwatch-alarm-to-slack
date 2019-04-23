/*
 * Copyright (c) 2019, Hugo Freire <hugo@antifragile.systems>.
 *
 * This source code is licensed under the license found in the
 * LICENSE.md file in the root directory of this source tree.
 */

describe('Handler', () => {
  let subject
  let Slack

  beforeAll(() => {
    Slack = require('../src/slack-request')
    jest.mock('../src/slack-request')
  })

  describe('when handling a SNS event', () => {
    const url = 'https://hooks.slack.com/services/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'
    const event = require('./sns-event-cloudwatch-notification.json')

    beforeAll(() => {
      process.env.SLACK_WEBHOOK_URL = url
    })

    beforeEach(() => {
      subject = require('../src/handler')
    })

    it('should not throw an error', async () => {
      await subject(event)
    })

    it('should send only one slack message', async () => {
      await subject(event)

      expect(Slack.post).toHaveBeenCalledTimes(1)
    })

    it('should send slack message to webhook url', async () => {
      await subject(event)

      expect(Slack.post.mock.calls[ 0 ][ 0 ]).toHaveProperty('url', url)
    })
  })
})
