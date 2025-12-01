#!/bin/sh

# remove old office: libreoffice
sudo apt purge libreoffice* -y
sudo rm -rf /var/lib/libreoffice
sudo rm -rf /usr/lib/libreoffice
sudo rm -rf /etc/libreoffice
sudo apt autoremove

# install onlyoffice
wget -qO- https://github.com/sunuazizrahayu/linux-desktop/raw/refs/heads/main/linuxmint-de7/onlyoffice/onlyoffice.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/onlyoffice.gpg > /dev/null
echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list
sudo apt update
sudo apt install onlyoffice-desktopeditors -y
