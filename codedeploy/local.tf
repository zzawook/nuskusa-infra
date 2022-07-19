locals {
  region = var.region

  s3-bucket      = var.s3-bucket
  cd-bucket-key  = var.cd-bucket-key
  asg-bucket-key = var.asg-bucket-key

  codedeploy_role_arn = var.codedeploy_role_arn
}
