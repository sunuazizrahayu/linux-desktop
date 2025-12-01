#!/bin/sh

# get debian codename
#DEBIAN_CODENAME=$(grep -o 'DEBIAN_CODENAME=[^ ]*' /etc/os-release | cut -d= -f2)


# install sublime
printf "\nAdd Sublime repo...\n"
sudo rm /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
sudo rm /etc/apt/sources.list.d/sublime-text.list
wget -qO- https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
sudo apt update
sudo apt install sublime-text sublime-merge -y

# install docker
# https://docs.docker.com/engine/install/debian/
printf "\n\nInstall Docker...\n"
sudo rm /etc/apt/trusted.gpg.d/docker.gpg
sudo rm /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg  > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/debian "$(. /etc/os-release && echo "$DEBIAN_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# symlink command `docker compose` to `docker-compose`
printf "\n\nLink command docker compose...\n"
sudo ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/local/bin/docker-compose

# add user on docker
printf "\n\nAdd User Docker...\n"
sudo usermod -aG docker $(whoami)

# prevent autostart docker
printf "\n\nPrevent autostart Docker...\n"
sudo systemctl disable docker
