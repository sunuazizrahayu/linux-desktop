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
  xfconf \
  xfdesktop4 \
  xfwm4 \
  thunar
