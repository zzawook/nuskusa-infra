#!/bin/bash

cd ~

sudo apt-get update -y
sudo apt-get upgrade -y

#Download cwagent installer
cd download
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb \
    -o ~/download/amazon-cloudwatch-agent.deb

#Depackage cwagent
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

#Clone backend files
cd ..
git clone "https://github.com/NUS-Korea-Society/nuskusa_backend.git"

#Run cwagent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:nuskusa_infra/.cwagent/config.json

#Run Backends
cd nuskusa_backend
docker compose up -d
