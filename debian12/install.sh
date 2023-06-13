#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

echo "Updating repo"
apt update

# tools
echo "Install prequites"
apt install \
  sudo \
  bash-completion \
  curl \
  wget \
  -y

# xfce
echo "Install XFCE"
apt install \
  xfce4-appfinder \
  xfce4-panel \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfce4-whiskermenu-plugin \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  thunar \
  -y

echo "Install XFCE Networking"
apt install \
  network-manager-gnome \
  network-manager-openvpn \
  network-manager-openvpn-gnome \
  network-manager-pptp \
  network-manager-pptp-gnome \
  network-manager-l2tp \
  network-manager-l2tp-gnome \
  -y

echo "Install XFCE additional"
apt install \
  mousepad \
  ristretto \
  xarchiver \
  thunar-archive-plugin \
  -y

echo "Install fonts"
apt install \
  fonts-cantarell \
  -y
echo "Generate Fonts cache"
fc-cache -f -v