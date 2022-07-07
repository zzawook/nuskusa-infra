name   = "nuskusa"
region = "ap-southeast-1"

instance_type = ["t2.micro", "t2.micro"]
monitoring    = true

ami_filter_app = [
  {
    name   = "name"
    values = ["nuskusa-app-image"]
  }
]

ami_filter_infra = [
  {
    name   = "name"
    values = ["nuskusa-infra-image"]
  }
]

trusted_role_services = ["ec2.amazonaws.com"]
custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonInspector2FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
]

#Remote Backend
backend_s3 = "nuskusa-tfbackend-s3"
vpc_key    = "prod/network/vpc/terraform.tfstate"

#Key Pair
keyname    = "nuskusa_default_key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqkf5N5faS8NsxSd8Klcp1qVrdxCCjLMqc4KYnIM5PPpiZaZO2jraiq6PXj6DrAhhed8Ka/E7HXrIo2t3QPCAwjxhmCQ5ZQjVQ9rn7pAWt4wz/sV7e+NTUp1GFTw9MbwaAYnFxwxYYY7C341uDgILSkHRMMY5VCWhl5v5/QHTIG1InA/D4gPoZdVmjrvzowvAOQ1t/hdVAfS0NdXAkbygbuIhxxHsRoXqrlfRnjY+hoAUfGtvlJYUH70zA0a/FFH10qDkpLMgPwlqrkfKVArbSLpjapEx5jGsmhXXUeJ8ZlL+MF/CINcIfzyC5VmgOqNNscQ+ORlnpOwrCYMthcAfqLh40F7w5BjMfQSofOzi23d+URt5vWUkQFa4HhhaOBi4hDhxBTthu2VMBD2Ladl/Plw5iavYn/s7P0Ywz0dYvF+QQOg////flmNk9Pf+X2ltkayI1H2X+Ohoijo/KEWXzMpXB/l+tq5ttcl9lNbJXmPE30mTflG7t9phesOrBr/eIn5MvqF+CwJLtohvp2Lif4N3EkYlVAUGxaMyripQd2KzFpgqaBjj29aUlEavZLdwtHWgcv7eTpYIm2bimr57t8BAdShFaRqFIJ4En2UHJrLX9KGLsl+61f+jCKZVyfwIzCPQ6giHFcCnkz76lRvZOmlG8OWLWeYnfc+vO/oeaxw== kjaehyeok21@kjaehyeok21-laptop"

#Target Group & ALB

#AutoScaling Group
asg_names          = ["nuskusa_app_asg", "nuskusa_infra_asg"]
min_sizes          = [1, 1]
max_sizes          = [5, 5]
desired_capacities = [1, 1]
health_check_type  = "EC2"

ebs_optimized      = false
enable_monitorings = [false, false]

update_default_version = true
