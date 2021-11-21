#!/bin/bash

sudo apt update && sudo apt install nmap net-tools yakuake colordiff docker.io mysql-client filezilla python3 terraform terminator gparted git rkhunter virtualbox vagrant
sudo snap install go
mkdir ~/Bucket ~/Docker/ ~/Scripts ~/TestArea
sudo mkdir -p /opt/git/luis13cst /opt/tools /opt/vagrant/centos7
sudo chown ${USER}: /opt/git

# Git config
cat << EOF > /opt/git/.gitignore_global
# IDEs
.idea/

.vscode/
.history/
EOF

sudo chown ${USER}: /opt/git/ /opt/vagrant/ -R
git config --global core.excludesfile /opt/git/.gitignore_global



# Kubernetes
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo cp kubeval /usr/local/bin
