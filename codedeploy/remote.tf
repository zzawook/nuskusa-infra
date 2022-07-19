data "terraform_remote_state" "asg" {
  backend = "s3"
  config = {
    bucket = var.s3-bucket
    key    = var.asg-bucket-key
    region = var.region
  }
}


