#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# remove Games
echo "remove Games"
sudo apt remove gnome-games -y


# remove Accessories
echo "remove Accessories"
sudo apt remove \
  debian-reference-common \
  -y

echo "auto remove & unused associated"
sudo apt autoremove -y
