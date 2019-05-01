# A :star: lambda for sending your CloudWatch :alarm_clock: alarms into Slack

[![Build Status](https://travis-ci.org/hfreire/cloudwatch-alarm-to-slack.svg?branch=master)](https://travis-ci.org/hfreire/cloudwatch-alarm-to-slack)
[![Coverage Status](https://coveralls.io/repos/github/hfreire/cloudwatch-alarm-to-slack/badge.svg?branch=master)](https://coveralls.io/github/hfreire/cloudwatch-alarm-to-slack?branch=master)
[![Known Vulnerabilities](https://snyk.io/test/github/hfreire/cloudwatch-alarm-to-slack/badge.svg)](https://snyk.io/test/github/hfreire/cloudwatch-alarm-to-slack)
[![](https://img.shields.io/github/release/hfreire/cloudwatch-alarm-to-slack.svg)](https://github.com/hfreire/cloudwatch-alarm-to-slack/releases)

> Uses [AWS SNS](https://aws.amazon.com/sns) to send [AWS CloudWatch](https://aws.amazon.com/cloudwatch) alarms to trigger [AWS Lambda](https://aws.amazon.com/lambda) code that pushes them to Slack.

### How to deploy

#### Deploy it from your terminal
Deploying it from your terminal requires [terraform](https://www.terraform.io) installed on your system and an [antifragile infrastructure](https://github.com/antifragile-systems/antifragile-infrastructure) setup available in your [AWS](https://aws.amazon.com) account.

##### Clone the GitHub repo
```
git clone https://github.com/hfreire/cloudwatch-alarm-to-slack.git
```

##### Change current directory
```
cd cloudwatch-alarm-to-slack
```

##### Run the NPM script that will deploy all functions
```
npm run deploy
```

#### Available deployment environment variables
Variable | Description | Required | Default value
:---:|:---:|:---:|:---:
SLACK_WEBHOOK_URL | The Slack incoming webhook URL to send the alarm message. | true | `undefined`

### How to contribute
You can contribute either with code (e.g., new features, bug fixes and documentation) or by [donating 5 EUR](https://paypal.me/hfreire/5). You can read the [contributing guidelines](CONTRIBUTING.md) for instructions on how to contribute with code. 

All donation proceedings will go to the [Sverige för UNHCR](https://sverigeforunhcr.se), a swedish partner of the [UNHCR - The UN Refugee Agency](http://www.unhcr.org), a global organisation dedicated to saving lives, protecting rights and building a better future for refugees, forcibly displaced communities and stateless people.

### License
Read the [license](./LICENSE.md) for permissions and limitations.
