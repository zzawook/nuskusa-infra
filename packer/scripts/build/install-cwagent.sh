#!/bin/bash

sudo mkdir /home/ubuntu/download

#Download cwagent installer & cwagent config file
cd /home/ubuntu/download
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb \
    -P /home/ubuntu/download

sudo wget https://raw.githubusercontent.com/NUS-Korea-Society/nuskusa-infra-tf/main/scaling/templates/config.json \
    -P /home/ubuntu/download

#Depackage cwagent
sudo dpkg -i -E /home/ubuntu/download/amazon-cloudwatch-agent.deb

