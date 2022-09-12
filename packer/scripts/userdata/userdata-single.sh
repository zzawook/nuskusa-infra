#cloud-boothook
#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y

#Clone backend files
cd /home/ubuntu

sudo rm -r nuskusa-*

sudo git clone "https://github.com/NUS-Korea-Society/nuskusa-backend.git"
sudo git clone "https://github.com/NUS-Korea-Society/nuskusa-infra-single.git"
sudo rm nuskusa-backend/docker-compose.yml
sudo rm -r nuskusa-backend/codedeploy
sudo mv nuskusa-infra-single/docker-compose.yml nuskusa-backend/
sudo mv nuskusa-infra-single/mysql nuskusa-backend/
sudo mv nuskusa-infra-single/codedeploy nuskusa-backend/

#Run cwagent
#sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/home/ubuntu/download/config.json -s

#Run cdagent
sudo service codedeploy-agent start

#Run Backends
cd /home/ubuntu/nuskusa-backend
docker compose up -d

