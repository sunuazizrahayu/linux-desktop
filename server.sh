# run as root

# fix locales
dpkg-reconfigure locales
locale-gen

# upgrade
apt update
apt upgrade -y

# install requirements
apt install curl wget git bash-completion
