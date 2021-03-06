output "aws_region" {
  value = var.aws_region

  sensitive = true
}

output "aws_vpc_id" {
  value = module.cloudwatch-alarm-to-slack.aws_vpc_id

  sensitive = true
}

output "aws_subnet_ids" {
  value = module.cloudwatch-alarm-to-slack.aws_subnet_ids

  sensitive = true
}

output "aws_security_group_ids" {
  value = module.cloudwatch-alarm-to-slack.aws_security_group_ids

  sensitive = true
}

output "aws_sns_topic_arn" {
  value = module.cloudwatch-alarm-to-slack.aws_sns_topic_arn

  sensitive = true
}

output "aws_iam_role_arn" {
  value = data.aws_iam_role.selected.arn

  sensitive = true
}

output "aws_s3_bucket" {
  value = module.cloudwatch-alarm-to-slack.aws_s3_bucket

  sensitive = true
}
