variable "env" {}
variable "name" {}
variable "owner" {}
variable "region" {}

variable "vpc_cidr" {}
variable "private_subnets" {}
variable "public_subnets" {}

variable "default_security_group_ingress" {}
variable "default_security_group_egress" {}
variable "manage_default_security_group" {}
variable "default_security_group_name" {}

variable "enable_ipv6" {}

variable "enable_nat_gateway" {}
variable "single_nat_gateway" {}
variable "enable_vpn_gateway" {}

variable "tags" {}
variable "vpc_tags" {}
variable "private_subnet_tags" {}
variable "public_subnet_tags" {}
