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

# Other things to do:
# Before running this script: Install Packer
# Set up AWS Account(Admin Right), Role (CodeDeploy)
# Enter AWS credential location to packer build
# Set environment variable for MYSQL_ROOT_PASSWORD, MYSQL_USER, MYSQL_DATABASE, MYSQL_PASSWORD
