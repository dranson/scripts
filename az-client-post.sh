#!/bin/bash

#Install Packages
apt update 
apt install -y pdsh fio git

#Setup PDSH variables
weka user login david AZURe_*321!
echo 'export PDSH_RCMD_TYPE=ssh' >> /home/weka/.bashrc
echo 'export WCOLL=~/weka_client.host'  >> /home/weka/.bashrc
weka cluster servers list --role=client -o hostname --no-header > /home/weka/weka_clients.host

#Setup SSH 
sudo -u weka echo "   StrictHostKeyChecking no" >> /home/weka/.ssh/config

# Install WEKA Tools
sudo -u weka mkdir /home/weka/tools
sudo -u weka git clone https://github.com/weka/tools /home/weka/tools

# Setup to run FIO
chmod 777 /mnt/weka
mkdir /mnt/weka/fio
sudo -u weka mkdir /home/weka/fio
sudo -u weka curl -o /home/weka/fio/fio-read.job https://raw.githubusercontent.com/dranson/scripts/main/fio-read.job
sudo -u weka curl -o /home/weka/fio/fio-write.job https://raw.githubusercontent.com/dranson/scripts/main/fio-write.job
sudo -u weka curl -o /home/weka/fio/fio-read-iops.job https://raw.githubusercontent.com/dranson/scripts/main/fio-read-iops.job
sudo -u weka curl -o /home/weka/fio/fio-write-iops.job https://raw.githubusercontent.com/dranson/scripts/main/fio-write-iops.job
