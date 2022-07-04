module "nuskusa-app-asg" {
  source = "terraform-aws-modules/autoscaling/aws"
  count  = length(local.names)
  # Autoscaling group
  name = local.asg_names[count.index]

  min_size            = local.min_sizes[count.index]
  max_size            = local.max_sizes[count.index]
  desired_capacity    = local.desired_capacities[count.index]
  health_check_type   = local.health_check_type
  vpc_zone_identifier = local.public_subnet_ids


  # Launch template
  launch_template            = aws_launch_template.nuskusa_launch_template[count.index].name
  use_mixed_instances_policy = true
  create_launch_template     = false

  ebs_optimized     = local.ebs_optimized
  enable_monitoring = local.enable_monitorings[count.index]

  #ALB Attachment
  target_group_arns = local.target_group_arns[count.index]

    #Scaling Policy
    scaling_policies = {
        increase1 = {
            name = "Increment 1 Instance"
            adjustment_type = "ChangeInCapacity"
            policy_type = "SimpleScaling"
            scaling_adjustment = 1
            cooldown = 300
        },
        decrement1 = {
            name = "Decrement 1 Instance"
            adjustment_type = "ChangeInCapacity"
            policy_type = "SimpleScaling"
            scaling_adjustment = 1
            cooldown = 300
        }
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
  tags                   = {}
}
