#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# update repo
printf "Updating repo...\n"
apt update

# prepare
printf "\nInstall requirements to install software...\n"
apt install wget curl lsb-release


# install software
rm -rf install-software.sh || true
wget https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop-environment/main/debian11/install-software.sh

