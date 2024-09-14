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
                 libswresample-dev libusb-1.0-0 libusb-1.0-0-dev

# get code
wget https://github.com/Genymobile/scrcpy/archive/refs/tags/v2.6.1.zip -P /tmp
wget https://github.com/Genymobile/scrcpy/releases/download/v2.6.1/scrcpy-server-v2.6.1 -P /tmp

# install
current_dir=$(pwd)
cd /tmp
unzip v2.6.1.zip
cd scrcpy-2.6.1
./install_release.sh

# set server
cp scrcpy-server-v2.6.1 /usr/local/share/scrcpy/scrcpy-server
cd "$current_dir"
