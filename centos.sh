echo "Updating repo...\n"
sudo yum check-update

echo "Removing Apache"
sudo yum erase -y httpd httpd-tools apr apr-util

echo "Install Requirements..."
sudo yum install -y nano bash-completion

echo "\n\nInstalling Docker...\n"
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
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker

echo "Done..."
