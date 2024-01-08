#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# update repo
echo "Updating repo"
sudo apt update
echo ""

# install requirements
echo "Install prequites"
sudo apt install \
  sudo \
  bash-completion \
  curl \
  wget \
  -y
echo ""

# install tools
echo "Install tools"
sudo apt install \
  htop \
  -y
echo ""

# install
echo "Install Cinnamon"
sudo apt install \
  cinnamon-core \
  -y

# remove cinnamon core unused package
sudo apt autoremove --purge zutty -y
sudo apt autoremove --purge malcontent -y
