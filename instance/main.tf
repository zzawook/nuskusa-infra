module "ec2-single-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "nuskusa-single-instance"

  ami           = data.aws_ami.single.id
  instance_type = local.instance_type
  key_name      = local.keyname
  monitoring    = local.monitoring

  subnet_id = local.subnet_ids[0]

  root_block_device = local.root_block_device
}
