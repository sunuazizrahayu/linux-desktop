# libreoffice
sudo apt purge libreoffice* -y
sudo apt purge libuno-* libunoloader-java -y
sudo apt purge fonts-opensymbol -y
sudo rm -rf /var/lib/libreoffice
sudo rm -rf /usr/lib/libreoffice
sudo apt autoremove

# unused tools
sudo apt purge thunderbird hexchat -y
