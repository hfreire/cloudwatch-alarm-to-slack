output "aws_region" {
  value = "${var.aws_region}"

  sensitive = true
}

output "aws_sns_topic_arn" {
  value = "${data.aws_sns_topic.selected.arn}"

  sensitive = true
}

output "aws_cloudwatch_log_group_name" {
  value = "${data.aws_cloudwatch_log_group.selected.name}"

  sensitive = true
}
