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
echo "Install XFCE minimal"
apt install \
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

# xfce panel addtional
echo "Install XFCE additional"
apt install \
  xfce4-netload-plugin \
  xfce4-notifyd \
  xfce4-power-manager \
  xfce4-pulseaudio-plugin \
  xfce4-whiskermenu-plugin \
  -y

# xfce thunar mounting android file_transfer
apt install gvfs gvfs-fuse gvfs-backends -y

echo "Install Networking"
apt install \
  network-manager-gnome \
  network-manager-openvpn \
  network-manager-openvpn-gnome \
  network-manager-pptp \
  network-manager-pptp-gnome \
  network-manager-l2tp \
  network-manager-l2tp-gnome \
  -y

echo "Install Software"
apt install \
  mousepad \
  ristretto \
  xarchiver \
  thunar-archive-plugin \
  \
  xcape \
  -y

echo "Install appearance support"
apt install \
  fonts-cantarell \
  fonts-noto-core \
  fonts-noto-color-emoji \
  \
  gnome-icon-theme \
  tango-icon-theme \
  -y

echo "Remove unused"
apt purge zutty -y

echo "Generate Fonts cache"
fc-cache -f -v


wget -c https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop-environment/main/debian12/de-xfce-2-install-plugin-docklike.sh
wget -c https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop-environment/main/debian12/install-software.sh
