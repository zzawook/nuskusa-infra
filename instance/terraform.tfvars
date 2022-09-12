bucket          = "nuskusa-tfbackend-s3"
vpc_backend_key = "prod/network/vpc/terraform.tfstate"
region          = "ap-southeast-1"

ami_filters = [{
  name   = "name",
  values = ["nuskusa-single-image"]
}]

instance_type = "t2.micro"

keyname    = "nuskusa_default_key"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCB6cL29VUQlHAuHSBW0zBqkOp5z9YhsnEvHNqmplfilt9uZXeWi+JUDg6r12OJP1XikoLuYUVN3jHf7VI+R0O4VXoLJkbH1yn3id1CY2pv16lf+m+qCdkcd2K5M62VwJpaMC4JW18MwnzXTeb4rui1bzu5KEtUa0rGWnNDAccgh/Y20emJnoZkMFXfTN3pk3V2cPBOj9Z2OmB8jwp0H9LN0Nsf3tL9Pd8wCRq3w5dni4SDNHy1eMcnbnw0bK1eXH+L5Blbi4dRGpxyJBt0hB69Q29YmyhpBoRQQI22mBgziWn+DZygqiG2WkaKWuEtmrPfO52SqzCzPaXWiBwEY4TSubchCChLJIIJJp2/GvK5ha/PP3xjhdaH0A3fJc84Ld738fXG/eFij5A8HIaG10qsr3mjaIO1PxQZ/5fBwhIPK4RJW7w2l3C7LhMSDKkaasjKx7fiDU7Pu1LAcBRZAKIX8UobmyCBSF9BoIEITz6pN2mlfUX3q60cw5esQMdhnIs= kjaehyeok21@kjaehyeok21-laptop"
monitoring = true
