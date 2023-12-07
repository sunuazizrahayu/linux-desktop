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
  wget \
  unzip \
  nano \
  -y
printf "\n\n\n"


# xfce
echo "Install XFCE minimal"
sudo apt install \
  xfce4-appfinder \
  xfce4-panel \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  thunar \
  -y
printf "\n\n\n"

echo "Install XFCE additional"
sudo apt install \
  xfce4-power-manager \
  \
  pavucontrol \
  pulseaudio \
  xfce4-pulseaudio-plugin \
  \
  network-manager-gnome \
  -y

echo "Install XFCE Requirements"
sudo apt install \
  xorg \
  lightdm \
  -y
printf "\n\n\n"

