#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

apt wget git install lsb-release -y


printf "\nAdd Sublime repo...\n"
rm /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
rm /etc/apt/sources.list.d/sublime-text.list
wget -qO- https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
apt update && apt install sublime-text sublime-merge -y


# printf "\n\nAdd VSCode...\n"
# rm /etc/apt/trusted.gpg.d/vscode.gpg
# rm /etc/apt/sources.list.d/vscode.list
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/vscode.gpg > /dev/null
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
# apt update && apt install code -y


printf "\n\nBeekeeper SQL Editor...\n"
rm /etc/apt/trusted.gpg.d/beekeeper.gpg
rm /etc/apt/sources.list.d/beekeeper-studio-app.list
wget -qO- https://deb.beekeeperstudio.io/beekeeper.key | sudo gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/beekeeper.gpg > /dev/null
echo 'deb [signed-by=/etc/apt/trusted.gpg.d/beekeeper.gpg] https://deb.beekeeperstudio.io stable main' | sudo tee /etc/apt/sources.list.d/beekeeper-studio-app.list > /dev/null
apt update && apt install beekeeper-studio -y


printf "\n\nInstall Docker...\n"
rm /etc/apt/trusted.gpg.d/docker.gpg
rm /etc/apt/sources.list.d/docker.list
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg  > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list  > /dev/null
apt update && apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose -y


#printf "\n\nInstall Penguin\n"
#rm /etc/apt/trusted.gpg.d/penguins-eggs.gpg
#rm /etc/apt/sources.list.d/penguins-eggs.list
#curl -fsSL https://pieroproietti.github.io/penguins-eggs-ppa/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/penguins-eggs.gpg
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/penguins-eggs.gpg] https://pieroproietti.github.io/penguins-eggs-ppa ./" | sudo tee /etc/apt/sources.list.d/penguins-eggs.list > /dev/null
#apt update && apt install eggs -y


printf "\nUpdating repo list..\n"
apt update

printf "\n\nInstalling some Software...\n"
apt install \
  chromium \
  -y

printf "\nSoftware Installed...\n"
