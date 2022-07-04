data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = var.backendbucket
    key    = var.statekey
    region = var.region
  }
}
