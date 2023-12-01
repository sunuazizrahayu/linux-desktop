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
  -y
printf "\n\n\n"


# install xfce
echo "Install XFCE"
sudo apt install \
  xorg \
  lightdm \
  xfce4-panel \
  xfce4-session \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  -y
printf "\n\n\n"


# install vnc
echo "Install VNC"
sudo apt install x11vnc -y

sudo x11vnc -storepasswd /etc/x11vnc.passwd
sudo rm /etc/systemd/system/x11vnc.service
sudo wget https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop/main/armbian-kiosk/x11vnc.service -O /etc/systemd/system/x11vnc.service

sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc
printf "\n\n\n"


# testing
echo "install desktop testing"
sudo apt install \
  pavucontrol \
  pulseaudio \
  xfce4-pulseaudio-plugin \
  \
  network-manager-gnome \
  -y
printf "\n\n\n"


# apps
echo "install Apps"
sudo apt install chromium -y
printf "\n\n\n"


# finish
echo "install done."
