variable "region" {}
variable "name" {}

variable "instance_type" {}
variable "monitoring" {}

variable "ami_filter_app" {}
variable "ami_filter_infra" {}

variable "trusted_role_services" {}
variable "custom_role_policy_arns" {}

variable "backend_s3" {}
variable "vpc_key" {}

variable "keyname" {}
variable "public_key" {}

variable "asg_names" {}
variable "min_sizes" {}
variable "max_sizes" {}
variable "desired_capacities" {}
variable "health_check_type" {}

variable "ebs_optimized" {}
variable "enable_monitorings" {}

variable "update_default_version" {}
