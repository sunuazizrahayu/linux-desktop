#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

printf "\nInstall requirements to install software...\n"
apt install wget curl \
  lsb-release \
  htop \
  -y

# install adb + fastboot
printf "\nInstall android tools...\n"
apt install android-sdk-platform-tools -y

printf "\nAdd Sublime repo...\n"
rm /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
rm /etc/apt/sources.list.d/sublime-text.list
wget -qO- https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
sudo apt update
sudo apt install sublime-text sublime-merge -y


# https://docs.docker.com/engine/install/debian/
printf "\n\nInstall Docker...\n"
rm /etc/apt/trusted.gpg.d/docker.gpg
rm /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg  > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list  > /dev/null
sudo apt update 
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y
sudo systemctl start docker
sudo systemctl disable docker
