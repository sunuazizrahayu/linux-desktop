#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

rm -rf centos.sh || true
wget https://raw.githubusercontent.com/sunuazizrahayu/linux-desktop-environment/main/centos.sh

rm -rf centos_exec.sh || true
nohup bash centos.sh &
