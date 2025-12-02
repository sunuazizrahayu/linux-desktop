#!/bin/sh
set -e

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

echo "[1] Update and install dnscrypt-proxy..."
sudo apt update
sudo apt install -y dnscrypt-proxy


echo "[2] Turn Off DNS management by NetworkManager..."
FILE_CONFIG_NETWORK=/etc/NetworkManager/conf.d/dns.conf
sudo rm -f $FILE_CONFIG_NETWORK
sudo tee $FILE_CONFIG_NETWORK >/dev/null <<EOF
[main]
dns=none
EOF



echo "[3] Configure /etc/resolv.conf..."
sudo rm -f /etc/resolv.conf
echo "# DNSCrypt-Proxy
nameserver 127.0.2.1
options edns0" | sudo tee /etc/resolv.conf > /dev/null


echo "[4] Restart NetworkManager..."
sudo systemctl restart NetworkManager


echo "FINISH"
