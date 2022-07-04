module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = local.ec2name

  ami                    = local.ami
  instance_type          = local.instance_type
  key_name               = local.keyname
  monitoring             = local.monitoring
  availability_zone      = element(local.azs, 0)
  subnet_id              = element(local.private_subnet_ids, 0)
  iam_instance_profile   = module.iam.name
  vpc_security_group_ids = [module.ssh.security_group_id, local.default_sg_id]
  user_data              = local.userdata
}

module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services   = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}
