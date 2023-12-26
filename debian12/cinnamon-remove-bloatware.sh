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
  deja-dup \
  gnote \
  yelp \
  -y
sudo apt autoremove -y
printf "\n"

# remove Education
printf "remove Education \n"
sudo apt remove \
  goldendict \
  -y
sudo apt autoremove -y
printf "\n"

# remove Graphics
printf "remove Graphics \n"
sudo apt remove \
  shotwell \
  -y
sudo apt autoremove -y
printf "\n"


printf "Finish \n"
