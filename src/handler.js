/*
 * Copyright (c) 2019, Hugo Freire <hugo@exec.sh>.
 *
 * This source code is licensed under the license found in the
 * LICENSE.md file in the root directory of this source tree.
 */

const WEBHOOK_URL = process.env.SLACK_WEBHOOK_URL

const SlackRequest = require('./slack-request')

const buildMessage = (notification, timestamp, region) => {
  if (!notification || !timestamp || !region) {
    throw new Error('invalid params')
  }

  const { AlarmName, NewStateValue, Trigger, NewStateReason, OldStateValue } = notification
  const { Statistic, MetricName, ComparisonOperator, Threshold, EvaluationPeriods, Period } = Trigger

  let _event
  let color
  switch (NewStateValue) {
    case 'INSUFFICIENT':
    case 'OK':
      _event = 'Ended'
      color = '#36a64f'
      break
    case 'ALARM':
      _event = 'Started'
      color = '#d00000'
  }

  return {
    username: 'CloudWatch',
    icon_url: 'https://raw.githubusercontent.com/hfreire/cloudwatch-alarm-to-slack/share/slack/icon.png',
    text: `${_event} <https://console.aws.amazon.com/cloudwatch/home?region=${region}#alarm:alarmFilter=ANY;name=${encodeURIComponent(AlarmName)}|${AlarmName}> alarm`,
    attachments: [
      {
        color,
        fields: [
          { title: 'Name', 'value': AlarmName, 'short': true },
          { title: 'Description', 'value': NewStateReason, 'short': false },
          {
            title: 'Trigger',
            value: `${Statistic} ${MetricName} ${ComparisonOperator} ${Threshold} ${EvaluationPeriods} of ${Period} seconds`,
            short: false
          },
          { title: 'Previous State', 'value': OldStateValue, 'short': true },
          { title: 'Current State', 'value': NewStateReason, 'short': true }
        ],
        ts: timestamp
      }
    ]
  }
}

module.exports = async (event) => {
  const notification = JSON.parse(event.Records[ 0 ].Sns.Message)
  const timestamp = (new Date(event.Records[ 0 ].Sns.Timestamp)).getTime() / 1000
  const region = event.Records[ 0 ].EventSubscriptionArn.split(':')[ 3 ]

  const options = {
    url: WEBHOOK_URL,
    json: buildMessage(notification, timestamp, region)
  }

  await SlackRequest.post(options)
}
