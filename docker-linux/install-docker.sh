#!/bin/bash
# Setup scripts for new linux installation
# docs:
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script
# https://docs.docker.com/engine/install/linux-postinstall/
# usage: sudo ./install-docker

# Install docker
origin_dir=$(pwd)
cd /tmp || exit 1
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh

# create docker group
sudo groupadd docker
sudo usermod -aG docker "$USER"

cd "$origin_dir" || exit 1
echo "Done!"
echo "To add additional users, run: sudo usermod -aG docker <user>"
echo "login and out to update access"

