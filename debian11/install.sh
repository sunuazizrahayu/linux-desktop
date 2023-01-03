#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Adding 'contrib non-free' on repo.."
sed -i 's/main contrib non-free/main/g' /etc/apt/sources.list
sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
#echo "Using setup config repo"
#cp $SCRIPT_DIR/remaster/etc/apt/sources.list /etc/apt/sources.list

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
  network-manager-pptp \
  network-manager-pptp-gnome \
  network-manager-l2tp \
  network-manager-l2tp-gnome \
  \
  gnome-icon-theme \
  mousepad \
  xarchiver thunar-archive-plugin \
  ristretto \
  \
  firefox-esr \
  \
  -y

echo "Install mounter ISO"
apt install gnome-disk-utility


# Fixing AMD Radeon Driver
echo "Installing AMD Radeon Driver"
apt install firmware-amd-graphics firmware-realtek libgl1-mesa-dri -y



printf "\n\nInstalling Fonts\n"
apt install \
  fonts-cantarell \
  fonts-ubuntu \
  fonts-takao fonts-mona \
  -y

printf "\nInstalling Microsoft Fonts\n"
apt install \
  ttf-mscorefonts-installer \
  -y
wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/d959d3196fb3937b36969013d96740e0/raw/429d8882b7c34e5dbd7b9cbc9d0079de5bd9e3aa/otherFonts.sh | bash
mv ~/.fonts/ /usr/share/fonts/ms-fonts
fc-cache -f -v
