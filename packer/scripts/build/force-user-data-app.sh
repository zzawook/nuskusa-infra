#!/bin/bash

sudo rm -rf /var/lib/cloud/*
sudo cloud-init init
sudo cloud-init modules -m final

echo "#!/bin/bash" >> /etc/rc.local
echo "sudo -u ubuntu /home/ubuntu/userdata-app.sh || exit 1" >> /etc/rc.local

sudo chmod +x /home/ubuntu/userdata-app.sh
sudo chmod a+x /etc/rc.local
