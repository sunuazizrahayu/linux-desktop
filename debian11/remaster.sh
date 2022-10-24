#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


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

printf "\nConfiguring SuperL open whiskermenu\n"
cp -r $SCRIPT_DIR/remaster/etc/xdg/autostart/ /etc/xdg/



# hide mail reader
printf "\nhide mail reader..."
sed -i 's/OnlyShowIn=XFCE;/OnlyShowIn=XFCEx;/g' /usr/share/applications/xfce4-mail-reader.desktop

# configure firefox
printf "\n\nconfiguring firefox..."
cp $SCRIPT_DIR/remaster/etc/firefox-esr/firefox-esr.js /etc/firefox-esr/firefox-esr.js

# copy master `skel`
printf "\n\nCOPYING skel\n"
cp -R $SCRIPT_DIR/remaster/etc/skel/. /etc/skel

# copy master `skel` to each user
input="/etc/passwd"
while IFS= read -r line
do
  if [[ "$line" == *':/home/'* ]]; then
    USER=$(echo $line | sed 's/:.*//')
    echo "Copying skel to user: " $USER
    cp -R $SCRIPT_DIR/remaster/etc/skel/.config/ /home/$USER/
    chown -R $USER:$USER /home/$USER/.config/
  fi
done < "$input"


printf "\n\nFinish.\n"
