region = "ap-southeast-1"

s3-bucket      = "nuskusa-tfbackend-s3"
cd-bucket-key  = "prod/codedeploy/terraform.tfstate"
asg-bucket-key = "prod/scaling/terraform.tfstate"

codedeploy_role_arn = "arn:aws:iam::790298725222:role/nuskusa_codedeploy"
