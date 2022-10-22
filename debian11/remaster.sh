#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

printf "\n\nInstalling Fonts\n"
apt install \
  fonts-cantarell \
  fonts-ubuntu \
  -y


printf "\n\n\nConfigure touchpad..\n"
rm /etc/X11/xorg.conf.d/99-libinput.conf > /dev/null
cat << EOF > /etc/X11/xorg.conf.d/99-libinput.conf
Section "InputClass"
    Identifier "libinput touchpad catchall"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "True"
    Option "NaturalScrolling" "True"
EndSection
EOF



# hide mail reader
echo "hide mail reader..."
sed -i 's/OnlyShowIn=XFCE;/OnlyShowIn=XFCEx;/g' /usr/share/applications/xfce4-mail-reader.desktop

# configure firefox
echo "configure firefox.."
echo "removing title bar"
sed -i 's/pref("browser.tabs.inTitlebar", 1);//g' /etc/firefox-esr/firefox-esr.js
cat << EOF >> /etc/firefox-esr/firefox-esr.js
pref("browser.tabs.inTitlebar", 1);
EOF

echo "enable doh"
sed -i 's/pref("network.trr.mode", 2);//g' /etc/firefox-esr/firefox-esr.js
sed -i 's/pref("network.trr.uri", "1.1.1.1");//g' /etc/firefox-esr/firefox-esr.js
cat << EOF >> /etc/firefox-esr/firefox-esr.js
pref("network.trr.mode", 2);
pref("network.trr.uri", "1.1.1.1");
EOF


# copy master `skel`
echo "Copying skel"
cp -R $SCRIPT_DIR/remaster/. /

# copy master `skel` to each user
input="/etc/passwd"
while IFS= read -r line
do
  if [[ "$line" == *':/home/'* ]]; then
    USER=$(echo $line | sed 's/:.*//')
    #echo $USER
    echo "Copying skel to user: " $USER
    cp -R $SCRIPT_DIR/remaster/etc/skel/.config/ /home/$USER/
    chown -R $USER:$USER /home/$USER/.config/
  fi
done < "$input"


printf "\n\n\nFinish.\n\n"
