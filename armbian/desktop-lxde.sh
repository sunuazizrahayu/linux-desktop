#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# update repository
echo "Update Repository"
sudo apt update
printf "\n\n\n"


# install requirements
echo "Install Requirements"
sudo apt install \
  bash-completion \
  -y
printf "\n\n\n"


# install lxde
echo "Install LXDE"
sudo apt install \
  lxde \
  xorg \
  -y
