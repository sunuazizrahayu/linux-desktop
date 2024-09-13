#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

printf "\nAdd VitexSoftware repo...\n"
rm /etc/apt/trusted.gpg.d/vitexsoftware.gpg
rm /etc/apt/sources.list.d/vitexsoftware.list
wget -qO- https://repo.vitexsoftware.com/keyring.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/vitexsoftware.gpg > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/vitexsoftware.gpg] https://repo.vitexsoftware.com bookworm main" | sudo tee /etc/apt/sources.list.d/vitexsoftware.list
