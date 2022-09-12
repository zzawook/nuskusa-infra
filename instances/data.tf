data "aws_caller_identity" "current" {}

data "aws_ami" "app" {
  most_recent = true
  owners      = [data.aws_caller_identity.current.id]

  dynamic "filter" {
    for_each = local.ami_filter[0]
    content {
      name   = lookup(filter.value, "name")
      values = lookup(filter.value, "values")
    }
  }
}

data "aws_ami" "infra" {
  most_recent = true
  owners      = [data.aws_caller_identity.current.id]

  dynamic "filter" {
    for_each = local.ami_filter[1]
    content {
      name   = lookup(filter.value, "name")
      values = lookup(filter.value, "values")
    }
  }
}

#data "template_file" "app_userdata" {
#  template = file("templates/app/userdata.sh")
#  vars     = {}
#}

#data "template_file" "infra_userdata" {
#  template = file("templates/infra/userdata.sh")
#  vars     = {}
#}
