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
printf "\n\n\n"

echo "Install XFCE Requirements"
sudo apt install \
  xorg \
  lightdm \
  -y
printf "\n\n\n"


echo "Install Software"
sudo apt install \
  mousepad \
  ristretto \
  \
  xarchiver \
  thunar-archive-plugin \
  -y
printf "\n\n\n"


echo "Install appearance support"
sudo apt install \
  fonts-cantarell \
  fonts-noto-core \
  fonts-noto-color-emoji \
  -y
printf "\n\n\n"



# install vnc
echo "Install VNC"
sudo apt install x11vnc -y

sudo x11vnc -storepasswd vnc /etc/x11vnc.passwd
sudo rm /etc/systemd/system/x11vnc.service
sudo wget https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop/main/armbian-kiosk/x11vnc.service -O /etc/systemd/system/x11vnc.service

sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc
printf "\n\n\n"



echo "Done."
