#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# install xfce
sudo apt install \
  xorg \
  xfce4-panel \
  xfce4-session \
  xfce4-terminal \
  xfconf \
  xfdesktop4 \
  xfwm4

# install vnc
sudo apt install \
  lightdm \
  x11vnc
sudo x11vnc -storepasswd /etc/x11vnc.passwd
echo -e "[Unit]\nDescription=Start x11vnc at startup.\nAfter=multi-user.target\n\n[Service]\nType=simple\nExecStart=x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.passwd -rfbport 5900 -shared\n\n[Install]\nWantedBy=multi-user.target" | sudo tee /etc/systemd/system/x11vnc.service > /dev/null
sudo systemctl daemon-reload 
sudo systemctl start x11vnc 

# testing
sudo apt install \
  armbian-config \
  \
  pulseaudio \
  xfce4-pulseaudio-plugin \
  \
  network-manager-gnome

# display
sudo apt install chromium
