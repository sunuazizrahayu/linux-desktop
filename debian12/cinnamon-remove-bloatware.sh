#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# remove Games
printf "remove Games \n"
sudo apt autoremove --purge gnome-games -y
printf "\n"


# remove Accessories
printf "remove Accessories \n"
sudo apt remove deja-dup -y #backup
sudo apt remove debian-reference-common -y
sudo apt remove gnote -y
sudo apt remove yelp -y #help
sudo apt autoremove -y
printf "\n"

# remove Education
printf "remove Education \n"
sudo apt autoremove --purge goldendict -y
printf "\n"

# remove Graphics
printf "remove Graphics \n"
sudo apt autoremove --purge simple-scan -y #document scanner
sudo apt autoremove --purge shotwell -y
sudo apt autoremove -y
printf "\n"

# remove Internet
printf "remove Internet \n"
sudo apt autoremove --purge hexchat -y
sudo apt autoremove --purge pidgin -y
sudo apt autoremove --purge remmina -y #remmina (remote desktop control)
sudo apt autoremove --purge transmission-gtk transmission-common -y
sudo apt autoremove -y
printf "\n"

# remove Multimedia
printf "remove Multimedia \n"
sudo apt remove brasero brasero-common -y #brasero
sudo apt remove cheese cheese-common -y  #cheese
sudo apt remove gnome-sound-recorder -y #sound recorder
sudo apt remove totem totem-common -y  #videos
sudo apt autoremove -y
printf "\n"

# remove Administrator
printf "remove Administrator \n"
sudo apt remove gnome-logs -y #Logs
sudo apt remove gnome-software -y #software
sudo apt remove malcontent -y #parental controls
sudo apt remove mlterm mlterm-common mlterm-tiny -y #multilanguage terminal
sudo apt remove xterm -y #xterm terminal
sudo apt remove xiterm+thai -y #thai x terminal
sudo apt autoremove -y
printf "\n"

# remove Preferences
printf "remove Preferences \n"
sudo apt autoremove --purge anthy anthy-common kasumi -y #anthy dictionary editor
sudo apt remove ibus -y #Ibus Preferences
sudo apt remove im-config -y #input method
sudo apt remove mozc-utils-gui mozc-data mozc-server -y #mozc
sudo apt remove uim uim-data uim-xim uim-mozc -y
sudo apt autoremove -y
printf "\n"

# remove system
printf "remove System Data \n"
sudo apt autoremove --purge mate-themes mate-icon-theme -y #mate theme



printf "Finish \n"
