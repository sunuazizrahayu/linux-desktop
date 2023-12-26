#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# remove Games
printf "remove Games \n"
sudo apt remove gnome-games -y
sudo apt autoremove -y
printf "\n"


# remove Accessories
printf "remove Accessories \n"
sudo apt remove \
  debian-reference-common \
  -y
printf "\n"

printf "auto remove & unused associated \n"
sudo apt autoremove -y

printf "Finish \n"
