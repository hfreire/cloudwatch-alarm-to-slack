terraform {
  required_version = ">= 0.12"

  backend "s3" {
  }
}

module "cloudwatch-alarm-to-slack" {
  source = "github.com/antifragile-systems/antifragile-serverless"

  infrastructure_name = var.infrastructure_name
}
