locals {

  #EC2
  ec2name            = format("%s-ec2", var.name)
  instance_type      = var.instance_type
  keyname            = var.keyname
  monitoring         = var.monitoring
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  azs                = data.terraform_remote_state.vpc.azs
  default_sg_id      = data.terraform_remote_state.vpc.default_security_group_id
  userdata           = data.template_file.userdata.rendered

  #AMI
  ami         = data.aws_ami.this.id
  ami_owners  = var.ami_owners
  ami_filters = var.ami_filters


}
