locals {
  #Launch Template
  region = var.region

  names        = ["${var.name}-app", "${var.name}-infra"]
  descriptions = ["${var.name}-app-lt", "${var.name}-infra-lt"]

  instance_type = var.instance_type
  ami_id        = [data.aws_ami.app.id, data.aws_ami.infra.id]
  ami_filter    = [var.ami_filter_app, var.ami_filter_infra]

  monitoring = var.monitoring

  public_subnet_ids      = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.default_security_group_id]

    role_name = "${var.name}-role"
    trusted_role_services = var.trusted_role_services
    custom_role_policy_arns = var.custom_role_policy_arns

  user_data = ["${base64encode(data.template_file.app_userdata.rendered)}", "${base64encode(data.template_file.infra_userdata.rendered)}"]

  #Key Pair
  keyname    = var.keyname
  public_key = var.public_key

  #Target Group & ALB
  vpc_id          = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  security_groups = [data.terraform_remote_state.vpc.outputs.default_security_group_id]

  #AutoScaling Group
  asg_names          = var.asg_names
  min_sizes          = var.min_sizes
  max_sizes          = var.max_sizes
  desired_capacities = var.desired_capacities
  health_check_type  = var.health_check_type
  target_group_arns  = [module.nuskusa_app_alb.target_group_arns, module.nuskusa_infra_alb.target_group_arns]

  ebs_optimized      = var.ebs_optimized
  enable_monitorings = var.enable_monitorings

  update_default_version = var.update_default_version

}
