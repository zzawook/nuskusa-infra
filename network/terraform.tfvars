env    = "nuskusa-prod"
name   = "nuskusa-prod"
owner  = "nuskusa_admin"
region = "ap-southeast-1"

vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.0.0/24"]
private_subnets = []

default_security_group_ingress = [
  {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "Allow MySQL"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
      description = "Allow DB UI"
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
  },
  {
      description = "Allow Jenkins"
      from_port = 8000
      to_port = 8000
      protocol = "tcp"
      cidr_blocks = "0.0.0.0/0"
  }
]
default_security_group_egress = [
  {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = "0.0.0.0/0"
    ipv6_cidr_blocks = "::/0"
  }
]
manage_default_security_group = true
default_security_group_name   = "nuskusa_vpc_default_sg"

enable_ipv6 = false

enable_nat_gateway = false
single_nat_gateway = false
enable_vpn_gateway = false

tags     = {}
vpc_tags = {}
private_subnet_tags = {
  "isPrivate" : true
}
public_subnet_tags = {
  "isPrivate" : false
}
