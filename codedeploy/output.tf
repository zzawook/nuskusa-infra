output "test" {
    value = data.terraform_remote_state.asg.outputs.app-alb-target-group-names[0]
}
