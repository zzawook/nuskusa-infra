terraform {
  backend "s3" {
    bucket      = "nuskusa-tfbackend-s3"
    key         = "prod/instance/terraform.tfstate"
    region      = "ap-southeast-1"
    max_retries = 3
  }
}
