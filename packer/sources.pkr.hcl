source "amazon-ebs" "ubuntu-app" {
  ami_name      = format("nuskusa-app-image-%s", local.version)
  instance_type = "t2.micro"
  region        = "ap-southeast-1"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
}

source "amazon-ebs" "ubuntu-infra" {
  ami_name      = format("nuskusa-infra-image-%s", local.version)
  instance_type = "t2.micro"
  region        = "ap-southeast-1"
  source_ami_filter {
    filters = {
      virtualization-type = "hvm"
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"]
    most_recent = true
  }
  ssh_username = "ubuntu"
}

locals {
  created_at = timestamp()
  version    = formatdate("YYYYMMDDhhmm", local.created_at)
}
