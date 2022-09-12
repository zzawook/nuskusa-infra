locals {
  bucket          = var.bucket
  vpc_backend_key = var.vpc_backend_key

  region        = var.region
  ami_filters   = var.ami_filters
  instance_type = var.instance_type
  keyname       = var.keyname
  public_key    = var.public_key
  monitoring    = var.monitoring

  vpc_id = data.terraform_remote_state.vpc.outputs.default_security_group_id
}
