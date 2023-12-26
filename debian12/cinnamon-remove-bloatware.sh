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
sudo apt remove debian-reference-common -y
sudo apt remove deja-dup -y #backup
sudo apt remove gnote -y
sudo apt remove yelp -y #help
sudo apt autoremove -y
printf "\n"

# remove Education
printf "remove Education \n"
sudo apt remove goldendict -y
sudo apt autoremove -y
printf "\n"

# remove Graphics
printf "remove Graphics \n"
sudo apt remove shotwell -y
sudo apt remove simple-scan -y #document scanner
sudo apt autoremove -y
printf "\n"

# remove Internet
printf "remove Internet \n"
sudo apt remove pidgin -y
sudo apt remove hexchat -y
sudo apt remove transmission-gtk -y
sudo apt autoremove -y
printf "\n"

# remove Multimedia
printf "remove Multimedia \n"
sudo apt remove brasero brasero-common -y #brasero
sudo apt remove cheese -y  #cheese
sudo apt remove gnome-sound-recorder -y #sound recorder
sudo apt remove totem -y  #videos
sudo apt autoremove -y

printf "Finish \n"
