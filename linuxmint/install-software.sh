#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi



# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text sublime-merge -y



# Install Docker
printf "\n\nInstall Docker...\n"
sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y

# access docker without `sudo`
printf "\n\nAdd User Docker...\n"
sudo usermod -aG docker $(whoami)



# Firefox ESR
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo apt-get update
sudo apt install firefox-esr -y

# Install htop
sudo apt install htop -y

# Install speedtest
sudo rm /etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg
sudo rm /etc/apt/sources.list.d/ookla_speedtest-cli.list

sudo curl -fsSL "https://packagecloud.io/ookla/speedtest-cli/gpgkey" | gpg --dearmor > /etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg
sudo chmod 0644 /etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg
echo \
  "deb [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/ubuntu/ "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" main
deb-src [signed-by=/etc/apt/keyrings/ookla_speedtest-cli-archive-keyring.gpg] https://packagecloud.io/ookla/speedtest-cli/ubuntu/ "$(. /etc/os-release && echo "$UBUNTU_CODENAME")" main" \
| sudo tee /etc/apt/sources.list.d/ookla_speedtest-cli.list > /dev/null

sudo apt update
sudo apt install speedtest -y
