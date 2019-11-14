terraform {
  required_version = ">= 0.12"

  backend "s3" {
  }
}

provider "aws" {
  version = "2.14.0"

  region = var.aws_region
}

module "cloudwatch-alarm-to-slack" {
  source = "github.com/antifragile-systems/antifragile-serverless"

  infrastructure_name = var.infrastructure_name
  name = var.name

  aws_region = var.aws_region
}

data "aws_caller_identity" "current" {
}

data "aws_iam_role" "selected" {
  name = module.cloudwatch-alarm-to-slack.aws_iam_role_name
}

resource "aws_iam_role_policy" "cloudwatch-alarm-to-slack" {
  name = var.name
  role = data.aws_iam_role.selected.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:CreateLogStream"
            ],
            "Resource": [
                "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/${var.infrastructure_name}/${var.name}*:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:*:${data.aws_caller_identity.current.account_id}:log-group:/${var.infrastructure_name}/${var.name}*:*:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "xray:PutTraceSegments",
                "xray:PutTelemetryRecords"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}
EOF
}
