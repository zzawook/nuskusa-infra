resource "aws_autoscaling_policy" "memory-tracking" {
    count = length(local.names)    

    name                   = "nuskusa_memory_tracking_policy"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = local.asg_names[count.index]

    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
        customized_metric_specification {
            metric_dimension {
                name = "AutoScalingGroupName"
                value = module.nuskusa-asg["${count.index}"].autoscaling_group_name
            }
            metric_name = "MemoryUtilization"
            namespace = "nuskusa/custom_metrics"
            statistic = "Average"
            unit = "Percent"
        }
        target_value = 70.0
        disable_scale_in = false
    }
}
