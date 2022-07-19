locals {
  region = var.region

  name = var.name
  azs  = ["${local.region}a", "${local.region}b"]

  #cidr
  cidr            = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  default_security_group_ingress = var.default_security_group_ingress
    default_security_group_egress = var.default_security_group_egress
  manage_default_security_group  = var.manage_default_security_group

  enable_ipv6 = var.enable_ipv6

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags                = merge(var.tags, { Owner = var.owner, Environment = var.env })
  vpc_tags            = merge(var.vpc_tags, { Name = format("%s-vpc", var.name) })
  private_subnet_tags = merge(var.private_subnet_tags, { Name = format("%s-private-subnet", var.name) })
  public_subnet_tags  = merge(var.public_subnet_tags, { Name = format("%s-public-subnet", var.name) })
}
