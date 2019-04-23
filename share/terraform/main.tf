terraform {
  required_version = ">= 0.9.3, != 0.9.5"

  backend "s3" {}
}

provider "aws" {
  region = "${var.aws_region}"
  version = "1.60"
}

data "aws_sns_topic" "selected" {
  name = "${var.infrastructure_name}"
}

data "aws_cloudwatch_log_group" "selected" {
  name = "${var.infrastructure_name}"
}
