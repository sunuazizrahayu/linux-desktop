# libreoffice
sudo apt purge libreoffice* -y
sudo rm -rf /var/lib/libreoffice
sudo rm -rf /usr/lib/libreoffice
sudo rm -rf /etc/libreoffice
sudo apt autoremove

# unused tools
sudo apt purge thunderbird -y
