#Install Packages
sudo apt install -y pdsh git fio

#Setup PDSH variables
echo 'export PDSH_RCMD_TYPE=ssh' >> ~/.bashrc
echo 'export WCOLL=~/weka_cluster.host'  >> ~/.bashrc
weka cluster servers list -o hostname --no-header > ~/weka_cluster.host
source .bashrc

#Setup SSH 
echo "   StrictHostKeyChecking no" >> ~/.ssh/config

# Install WEKA Tools
mkdir ~/tools
git clone https://github.com/weka/tools ~/tools
