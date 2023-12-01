#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

echo "Install XFCE"
# install xfce
sudo apt install \
  xorg \
  xfce4-panel \
  xfce4-session \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  -y

echo "Install VNC"
# install vnc
sudo apt install \
  lightdm \
  x11vnc \
  -y

sudo x11vnc -storepasswd /etc/x11vnc.passwd
wget -O https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop/main/armbian-kiosk/x11vnc.service /tmp/x11vnc.service
sudo cp /tmp/x11vnc.service /etc/systemd/system/x11vnc.service

sudo systemctl daemon-reload
sudo systemctl enable x11vnc.service
sudo systemctl start x11vnc

# testing
sudo apt install \
  pavucontrol \
  pulseaudio \
  xfce4-pulseaudio-plugin \
  \
  network-manager-gnome

# apps
sudo apt install chromium
