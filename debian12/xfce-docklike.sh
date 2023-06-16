#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# requirements
sudo apt install \
  xfce4-dev-tools make xorg-dev libglib2.0-dev libgtk-3-dev libwnck-3-dev \
  libxfce4ui-2-dev libxfce4panel-2.0-dev \
  g++ \
  -y

# install
wget https://archive.xfce.org/src/panel-plugins/xfce4-docklike-plugin/0.4/xfce4-docklike-plugin-0.4.0.tar.bz2
tar -xvjf xfce4-docklike-plugin-0.4.0.tar.bz2 && cd xfce4-docklike-plugin-0.4.0
./configure
make
sudo make install

sudo apt purge \
  xfce4-dev-tools make xorg-dev libglib2.0-dev libgtk-3-dev libwnck-3-dev \
  libxfce4ui-2-dev libxfce4panel-2.0-dev \
  g++ \
  -y
