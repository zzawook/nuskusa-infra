data "aws_caller_identity" "current" {}

data "aws_ami" "single" {
  most_recent = true
  owners      = [data.aws_caller_identity.current.id]

  dynamic "filter" {
    for_each = local.ami_filters
    content {
      name   = lookup(filter.value, "name")
      values = lookup(filter.value, "values")
    }
  }
}
