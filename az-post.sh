#!/bin/bash

#Install Packages
sudo apt update 
sudo apt install -y pdsh git

#Setup PDSH variables
weka user login david AZURe_*321!
echo 'export PDSH_RCMD_TYPE=ssh' >> /home/weka/.bashrc
echo 'export WCOLL=~/weka_cluster.host'  >> /home/weka/.bashrc
weka cluster servers list --role=backend -o hostname --no-header > /home/weka/weka_cluster.host
weka cluster servers list --role=client -o hostname --no-header > /home/weka/weka_clients.host
weka user delete david

#Setup SSH 
echo "   StrictHostKeyChecking no" >> /home/weka/.ssh/config
chown weka /home/weka/.ssh/config;chmod 400 /home/weka/.ssh/config

# Install WEKA Tools
mkdir /home/weka/tools
git clone https://github.com/weka/tools /home/weka/tools
