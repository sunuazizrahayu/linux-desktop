#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# requirements
apt install xfce4-dev-tools make xorg-dev libglib2.0-dev libgtk-3-dev libwnck-3-dev \
  libxfce4ui-2-dev libxfce4panel-2.0-dev \
  g++
