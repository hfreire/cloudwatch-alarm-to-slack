output "aws_region" {
  value = "${var.aws_region}"
}

output "aws_sns_topic_arn" {
  value = "${data.aws_sns_topic.selected.arn}"
}

output "aws_cloudwatch_log_group_name" {
  value = "${data.aws_cloudwatch_log_group.selected.name}"
}
