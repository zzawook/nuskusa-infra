module "nuskusa_infra_asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  # Autoscaling group
  name = local.asg_names[1]

  min_size            = local.min_sizes[1]
  max_size            = local.max_sizes[1]
  desired_capacity    = local.desired_capacities[1]
  health_check_type   = local.health_check_type
  vpc_zone_identifier = local.public_subnet_ids

  #Enabled
  # enabled = false

  # Launch template
  launch_template            = aws_launch_template.nuskusa_launch_template[1].name
  use_mixed_instances_policy = true
  create_launch_template     = false

  ebs_optimized     = local.ebs_optimized
  enable_monitoring = local.enable_monitorings[1]

  #ALB Attachment
  target_group_arns = local.target_group_arns[1]

  #Scaling Policy
  scaling_policies = {
    cpu_tracking = {
      name        = "nuskusa_cpu_tracking_policy"
      policy_type = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 70.0
      }
    },
  }

  # IAM role & instand profile
  #  create_iam_instance_profile = true
  #  iam_role_name               = "example-asg"
  #  iam_role_description        = "IAM role example"
  #  iam_role_tags = {
  #    CustomIamRole = "Yes"
  #  }
  #  iam_role_policies = {
  #    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  #  }

  update_default_version = local.update_default_version
  use_name_prefix        = false
  tags                   = {}
}
