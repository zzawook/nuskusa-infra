resource "aws_launch_template" "nuskusa_launch_template" {

  count = length(local.names)

  name        = local.names[count.index]
  description = local.descriptions[count.index]

  image_id      = local.ami_id[count.index]
  instance_type = element(local.instance_type, count.index)

  monitoring {
    enabled = local.monitoring
  }

  key_name = aws_key_pair.nuskusa_default_key.key_name

  #    network_interfaces {
  #    subnet_id = element(local.public_subnet_ids, count.index % length(local.public_subnet_ids))
  #    security_groups = local.security_groups
  #  }

  vpc_security_group_ids = local.vpc_security_group_ids
  iam_instance_profile {
    name = module.iam.iam_instance_profile_name
  }
  #user_data = element(local.user_data, count.index)
}


module "iam" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 4.3"

  create_role             = true
  create_instance_profile = true
  role_name               = local.role_name
  role_requires_mfa       = false

  trusted_role_services   = local.trusted_role_services
  custom_role_policy_arns = local.custom_role_policy_arns
}
