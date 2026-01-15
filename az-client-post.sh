
#!/bin/bash

#Install Packages
apt update 
apt install -y pdsh fio git

#Setup PDSH variables
weka user login david AZURe_*321!
echo 'export PDSH_RCMD_TYPE=ssh' >> /home/weka/.bashrc
echo 'export WCOLL=~/weka_client.host'  >> /home/weka/.bashrc
weka cluster servers list --role=client -o hostname --no-header > /home/weka/weka_clients.host
weka user delete david

#Setup SSH 
sudo -u weka echo "   StrictHostKeyChecking no" >> /home/weka/.ssh/config

# Install WEKA Tools
sudo -u weka mkdir /home/weka/tools
sudo -u weka git clone https://github.com/weka/tools /home/weka/tools
