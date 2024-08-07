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
apt install xcape -y

printf "\nInstall OCS-URL"
dpkg -i $SCRIPT_DIR/ocs-url*.deb; apt install --fix-broken -y


# hide mail reader
printf "\n\nhide mail reader..."
sed -i 's/OnlyShowIn=XFCE;/OnlyShowIn=XFCEx;/g' /usr/share/applications/xfce4-mail-reader.desktop

# configure firefox
printf "\n\nconfiguring firefox..."
cp $SCRIPT_DIR/remaster/etc/firefox-esr/firefox-esr.js /etc/firefox-esr/firefox-esr.js

# copy master `skel`
printf "\n\nCOPYING skel\n"
cp -R $SCRIPT_DIR/remaster/etc/skel/. /etc/skel

# copy master `skel` to each user
#input="/etc/passwd"
#while IFS= read -r line
#do
#  if [[ "$line" == *':/home/'* ]]; then
#    USER=$(echo $line | sed 's/:.*//')
#    echo "Copying skel to user: " $USER
#    cp -R $SCRIPT_DIR/remaster/etc/skel/.config/ /home/$USER/
#    chown -R $USER:$USER /home/$USER/.config/
#  fi
#done < "$input"

getent passwd | while IFS=: read -r USER _ _ _ _ HOME _; do
  case "$HOME" in
    /home/*)
      echo "Copying skel to user: $USER"
      cp -R "$SCRIPT_DIR/remaster/etc/skel/.config/" "$HOME/"
      chown -R $USER:$USER "$HOME/.config/"
      ;;
  esac
done


printf "\n\nFinish.\n"
