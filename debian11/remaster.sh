#!/bin/sh

## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

printf "Configure touchpad.."
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


# copy skel
input="/etc/passwd"
while IFS= read -r line
do
  if [[ "$line" == *':/home/'* ]]; then
    USER=$(echo $line | sed 's/:.*//')
    #echo $USER
    echo "Copying skel to user: " $(USER)
    cp -R $SCRIPT_DIR/remaster/. /home/$USER/
  fi
done < "$input"


printf "\n\n\nFinish.\n\n"
