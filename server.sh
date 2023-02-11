# run as root

# fix locales

locale-gen

# upgrade
apt update
apt upgrade -y

# install requirements
apt install curl wget git bash-completion lsb-release -y

# nginx
apt install nginx -y

# install docker --> https://docs.docker.com/engine/install/debian/
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# create user
adduser <username>

# add user to sudo
adduser <username> sudo

# login to newuser
login <username>
