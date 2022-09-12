output "app-asg-name" {
    value = module.nuskusa_app_asg.autoscaling_group_name
}

output "infra-asg-name" {
    value = module.nuskusa_infra_asg.autoscaling_group_name
}

output "app-alb-target-group-names" {
    value = module.nuskusa_app_alb.target_group_names
}

output "infra-alb-target-group-names" {
    value = module.nuskusa_infra_alb.target_group_names
}
