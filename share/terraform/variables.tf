variable "infrastructure_name" {
  default = "antifragile-infrastructure"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "name" {
  default = "cloudwatch-alarm-to-slack"
}

variable "state_aws_region" {
}

variable "state_aws_s3_bucket" {
}
