#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# tools
apt install sudo curl wget lsb-release -y

# install mine deps
apt install \
  # Installing Minimal XFCE \
  xfce4-appfinder \
  xfce4-panel \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  \
  # XFCE Software \
  thunar \
  mousepad \
  xarchiver \
  \
  # Install plugin sound + brightness \
  xfce4-power-manager \
  xfce4-pulseaudio-plugin \
  xfce4-notifyd \
  \
  # Install Network Manager \
  network-manager-gnome \
  network-manager-openvpn \
  network-manager-openvpn-gnome \
  \
  # other \
  firefox-esr \
  chromium \
  \
  -y
