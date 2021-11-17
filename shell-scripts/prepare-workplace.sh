#!/bin/bash

sudo apt update && sudo apt install nmap net-tools yakuake colordiff docker.io go mysql-client filezilla python3 terraform terminator gparted git rkhunter virtualbox vagrant
mkdir ~/Bucket ~/Docker/ ~/Scripts ~/TestArea
sudo mkdir -p /opt/git/luis13cst /opt/tools /opt/vagrant/centos7

cat << EOF > /opt/git/.gitignore_global
# IDEs
.idea/

.vscode/
.history/
EOF

chown ${USER}: /opt/git/ /opt/vagrant/ -R

# Kubernetes
wget https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar xf kubeval-linux-amd64.tar.gz
sudo cp kubeval /usr/local/bin
