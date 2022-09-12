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

ami_filter_single = [
    {
        name = "name",
        values = ["nuskusa-single-image"]
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
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCB6cL29VUQlHAuHSBW0zBqkOp5z9YhsnEvHNqmplfilt9uZXeWi+JUDg6r12OJP1XikoLuYUVN3jHf7VI+R0O4VXoLJkbH1yn3id1CY2pv16lf+m+qCdkcd2K5M62VwJpaMC4JW18MwnzXTeb4rui1bzu5KEtUa0rGWnNDAccgh/Y20emJnoZkMFXfTN3pk3V2cPBOj9Z2OmB8jwp0H9LN0Nsf3tL9Pd8wCRq3w5dni4SDNHy1eMcnbnw0bK1eXH+L5Blbi4dRGpxyJBt0hB69Q29YmyhpBoRQQI22mBgziWn+DZygqiG2WkaKWuEtmrPfO52SqzCzPaXWiBwEY4TSubchCChLJIIJJp2/GvK5ha/PP3xjhdaH0A3fJc84Ld738fXG/eFij5A8HIaG10qsr3mjaIO1PxQZ/5fBwhIPK4RJW7w2l3C7LhMSDKkaasjKx7fiDU7Pu1LAcBRZAKIX8UobmyCBSF9BoIEITz6pN2mlfUX3q60cw5esQMdhnIs= kjaehyeok21@kjaehyeok21-laptop"

#Target Group & ALB

#AutoScaling Group
asg_names          = ["nuskusa_app_asg", "nuskusa_infra_asg"]
min_sizes          = [1, 0] #[2, 1]
max_sizes          = [1, 0] #[5, 1]
desired_capacities = [1, 0] #[2, 1]
health_check_type  = "EC2"

ebs_optimized      = false
enable_monitorings = [false, false]

update_default_version = true
