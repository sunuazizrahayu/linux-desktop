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

printf "\nInstalling Microsoft Fonts\n"
apt install \
  ttf-mscorefonts-installer \
  -y
wget -q -O - https://gist.githubusercontent.com/Blastoise/72e10b8af5ca359772ee64b6dba33c91/raw/2d7ab3caa27faa61beca9fbf7d3aca6ce9a25916/clearType.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/b74e06f739610c4a867cf94b27637a56/raw/96926e732a38d3da860624114990121d71c08ea1/tahoma.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/64ba4acc55047a53b680c1b3072dd985/raw/6bdf69384da4783cc6dafcb51d281cb3ddcb7ca0/segoeUI.sh | bash
wget -q -O - https://gist.githubusercontent.com/Blastoise/d959d3196fb3937b36969013d96740e0/raw/429d8882b7c34e5dbd7b9cbc9d0079de5bd9e3aa/otherFonts.sh | bash
mv ~/.fonts/ /usr/share/fonts/
fc-cache -f -v


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
cp /etc/firefox-esr/firefox-esr.js.ori /etc/firefox-esr/firefox-esr.js

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
