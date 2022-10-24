#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#echo "Adding 'contrib non-free' on repo.."
#sed -i 's/main contrib non-free/main/g' /etc/apt/sources.list
#sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
echo "Using setup config repo"
cp $SCRIPT_DIR/remaster/etc/apt/sources.list /etc/apt/sources.list

echo "Updating repo"
apt update

# tools
echo "Install prequites"
apt install \
  sudo \
  bash-completion \
  curl \
  wget \
  lsb-release \
  git \
  \
  -y

# install mine deps
apt install \
  xfce4-whiskermenu-plugin \
  xfce4-appfinder \
  xfce4-panel \
  xfce4-session \
  xfce4-settings \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4 \
  thunar \
  \
  xfce4-power-manager \
  xfce4-pulseaudio-plugin \
  xfce4-notifyd \
  \
  network-manager-gnome \
  network-manager-openvpn \
  network-manager-openvpn-gnome \
  \
  mousepad \
  xarchiver thunar-archive-plugin \
  ristretto \
  \
  firefox-esr \
  \
  -y

# Fixing AMD Radeon Driver
echo "Installing AMD Radeon Driver"
apt install firmware-amd-graphics libgl1-mesa-dri -y
