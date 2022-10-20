#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


printf "Add Sublime repo...\n"
rm /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
rm /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

printf "Add VSCode...\n"
rm /etc/apt/trusted.gpg.d/vscode.gpg
rm /etc/apt/sources.list.d/vscode.list
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/vscode.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list


printf "Beekeeper SQL Editor..\n"
rm /etc/apt/trusted.gpg.d/beekeeper.gpg
rm /etc/apt/sources.list.d/beekeeper-studio-app.list
wget -qO- https://deb.beekeeperstudio.io/beekeeper.key | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/beekeeper.gpg
echo 'deb https://deb.beekeeperstudio.io stable main' | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list

printf "Install Docker...\n"
rm /etc/apt/trusted.gpg.d/docker.gpg
rm /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list


printf "\nUpdating repo list..\n"
apt update

printf "\n\nInstalling Software...\n"
apt install \
  sublime-text sublime-merge \
  code \
  docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose \
  -y

printf "\nSoftware Installed...\n"
