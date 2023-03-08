#!/bin/bash

# init
NC='\033[0m'
YELLOW='\033[1;33m'



echo -e "${YELLOW}Updating repo...${NC}"
yum check-update
echo ""

echo -e "${YELLOW}Removing Apache...${NC}"
yum erase -y httpd httpd-tools apr apr-util
echo ""

echo -e "${YELLOW}Install Requirements...${NC}"
yum install -y epel-release
yum install -y nano curl wget bash-completion htop
echo ""

echo -e "${YELLOW}Install NGINX...${NC}"
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo ""

echo -e "${YELLOW}Installing Docker...${NC}"
yum remove -y docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
systemctl start docker
systemctl enable docker
echo ""


echo -e "${YELLOW}Getting WARP...${NC}"
wget https://github.com/fscarmen/warp/raw/main/menu.sh
wget https://github.com/sunuazizrahayu/linux-conf/raw/main/warp.py

echo -e "${YELLOW}Install Speedtest...${NC}"
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | bash && yum install -y speedtest

echo -e "${YELLOW}Done...${NC}"
