echo "Updating repo..."
sudo yum check-update
echo ""

echo "Removing Apache"
sudo yum erase -y httpd httpd-tools apr apr-util
echo ""

echo "Upgrade.."
sudo yum check-update
sudo yum upgrade -y
echo ""



echo "Install Requirements..."
sudo yum install -y epel-release
sudo yum install -y nano curl wget bash-completion
echo ""

echo "Install NGINX"
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Installing Docker..."
sudo yum remove -y docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-engine
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
sudo systemctl start docker
sudo systemctl enable docker
echo ""


echo "Getting WARP"
wget https://github.com/fscarmen/warp/raw/main/menu.sh
wget https://github.com/sunuazizrahayu/linux-conf/raw/main/warp.py

echo "Install Speedtest"
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh | sudo bash && sudo yum install -y speedtest

echo "Done..."
