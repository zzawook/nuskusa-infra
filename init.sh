#!/bin/bash

#Install network (e.g. VPC, Subnet...)
cd network

terraform init
terraform apply --auto-approve

#Install Packer
cd ..
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer

#Create Launch Group, Target Group, ALB, and AutoScaling
cd ../scaling

terraform init
terraform apply --auto-approve

#Create CloudWatch Alarm and AutoScaling Actions
cd ../cloudwatch

terraform init
terraform apply --auto-approve
