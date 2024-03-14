#Install Packages
sudo apt get update 
sudo apt install -y pdsh git

#Login to WEKA Admin
read -sp 'WEKA Admin Password: ' passvar
weka user login admin $passvar

#Setup PDSH variables
echo 'export PDSH_RCMD_TYPE=ssh' >> ~/.bashrc
echo 'export WCOLL=~/weka_cluster.host'  >> ~/.bashrc
weka cluster servers list --role=backend -o hostname --no-header > ~/weka_cluster.host
weka cluster servers list --role=client -o hostname --no-header > ~/weka_clients.host

#Setup SSH 
echo "   StrictHostKeyChecking no" >> ~/.ssh/config

# Install WEKA Tools
mkdir ~/tools
git clone https://github.com/weka/tools ~/tools
