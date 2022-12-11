#cloud-boothook
#!/bin/sh

sudo apt-get update -y
sudo apt-get upgrade -y

#Initialize Jenkins with saved Jenkins configuration
sudo mkdir /jenkins
cd /jenkins
sudo git clone https://$(cat /home/ubuntu/github.token)@github.com/NUS-Korea-Society/jenkins_home.git
sudo mv -f /jenkins/jenkins_home/* /jenkins/
sudo mv -f /jenkins/jenkins_home/.* /jenkins/
sudo rm -r /jenkins/jenkins_home
sudo chmod -R 777 /jenkins

#Clone backend files
cd /home/ubuntu
sudo rm -r nuskusa-*
sudo git clone "https://github.com/NUS-Korea-Society/nuskusa-infra-single.git"

#Run Backends
cd /home/ubuntu/nuskusa-infra-single
docker compose up -d

#Set-up 30 min period interval backup for MySQL DB
sudo chmod 777 makeBackup.sh
echo "*/30 * * * * sh /home/ubuntu/nuskusa-infra-single/makeBackup.sh" >> /home/ubuntu/crontab
crontab /home/ubuntu/crontab

#Run Jenkins
cd /home/ubuntu/nuskusa-infra-single/jenkins
docker compose up -d
