#!/bin/bash

#Install network (e.g. VPC, Subnet...)
cd network

terraform init
terraform apply --auto-approve


#Create Launch Group, Target Group, ALB, and AutoScaling
cd scaling

terraform init
terraform apply --auto-approve

#Create CodeDeploy Pipeline
cd ../codedeploy

terraform init
terraform apply --auto-approve

# Other things I did:
# Set up AWS Account(Admin Right), Role (CodeDeploy)
