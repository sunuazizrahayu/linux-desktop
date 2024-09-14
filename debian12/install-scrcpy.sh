#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi


# for Debian/Ubuntu
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
                 gcc git pkg-config meson ninja-build libsdl2-dev \
                 libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-dev \
                 -y

# get code
version="2.6.1"
wget https://github.com/Genymobile/scrcpy/archive/refs/tags/v$version.zip -P /tmp
wget https://github.com/Genymobile/scrcpy/releases/download/v$version/scrcpy-server-v$version -P /tmp

# install
current_dir=$(pwd)
cd /tmp
unzip v$version.zip
cd scrcpy-$version
sudo ./install_release.sh

# set server
sudo cp /tmp/scrcpy-server-v$version /usr/local/share/scrcpy/scrcpy-server
cd "$current_dir"
