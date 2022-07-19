module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 3.0"

  name = "nuskusa"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = module.sns_topic.sns_topic_arn
  protocol  = "email"
  endpoint  = "nuskusa@gmail.com"
}
