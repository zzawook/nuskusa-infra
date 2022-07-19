module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "nuskusa_vpc"
  cidr = "10.0.0.0/16"

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  default_security_group_ingress = local.default_security_group_ingress
    default_security_group_egress = local.default_security_group_egress
  manage_default_security_group  = local.manage_default_security_group

  enable_nat_gateway = local.enable_nat_gateway
  enable_vpn_gateway = local.enable_vpn_gateway
  enable_ipv6        = local.enable_ipv6

  public_subnet_tags  = local.public_subnet_tags
  private_subnet_tags = local.private_subnet_tags
  vpc_tags            = local.vpc_tags
}
