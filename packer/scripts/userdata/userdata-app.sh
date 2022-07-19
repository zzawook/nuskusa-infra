#cloud-boothook
#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y

#Clone backend files
cd /home/ubuntu
sudo git clone "https://github.com/NUS-Korea-Society/nuskusa-backend.git"

#Run cwagent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ubuntu/download/config.json -s

#Run cdagent
sudo service codedeploy-agent start

sudo touch temp.json
sudo chmod 777 temp.json
aws ec2 describe-instances --filters "Name=tag:Name,Values=nuskusa_infra_asg" >> temp.json

#Run Backends
cd /home/ubuntu/nuskusa-backend
docker compose up -d

