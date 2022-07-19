#cloud-boothook
#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y

#Clone backend files
cd /home/ubuntu
sudo git clone "https://github.com/NUS-Korea-Society/nuskusa-infra.git"

sudo su ubuntu

#Run cwagent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ubuntu/download/config.json -s

sudo su

#Run cdagent
sudo service codedeploy-agent start

#Run Backends
cd /home/ubuntu/nuskusa-infra
docker compose up -d

