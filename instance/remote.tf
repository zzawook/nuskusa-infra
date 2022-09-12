data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = local.bucket
    key    = local.vpc_backend_key
    region = local.region
  }
}
