#!/bin/bash

sudo rm -rf /var/lib/cloud/*
sudo cloud-init init
sudo cloud-init modules -m final

echo "#!/bin/bash" >> /etc/rc.local
echo "sudo bash /home/ubuntu/userdata-infra.sh || exit 1" >> /etc/rc.local

sudo chmod +x /home/ubuntu/userdata-infra.sh
sudo chmod a+x /etc/rc.local
