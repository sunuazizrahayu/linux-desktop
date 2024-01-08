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

# tools
echo "Install prequites"
sudo apt install \
  sudo \
  bash-completion \
  curl \
  wget \
  -y

# install
echo "Install Cinnamon"
sudo apt install \
  cinnamon-core \
  -y
