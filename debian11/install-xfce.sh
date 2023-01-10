#!/bin/bash

cd ~/Downloads

sudo apt install intltool xorg-dev golang-gir-gio-2.0-dev libgtk-3-dev libwnck-3-dev libxfce4ui-2-dev libxfce4panel-2.0-dev

wget https://archive.xfce.org/src/panel-plugins/xfce4-docklike-plugin/0.4/xfce4-docklike-plugin-0.4.0.tar.bz2
tar -xvjf xfce4-docklike-plugin-0.4.0.tar.bz2 && cd xfce4-docklike-plugin-0.4.0
./configure
make
sudo make install
