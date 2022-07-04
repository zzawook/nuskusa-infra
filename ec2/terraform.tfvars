env    = "prod"
name   = "nuskusa"
owner  = "nuskusa"
tags   = {}
region = "ap-southeast-1"

#AMI
ami_owners = ["canonical"]
ami_filters = [
  {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
]

#EC2
instance_type = "t2.micro"
keyname       = "nuskusa_ec2keypair"
monitoring    = true

#Remote State
backendbucket = "nuskusa-tfbackend-s3"
statekey      = "prod/network/vpc/terraform.tfstate"
