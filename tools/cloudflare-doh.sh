#!/bin/sh
## check for sudo/root
if ! [ $(id -u) = 0 ]; then
  echo "This script must run with sudo, try again..."
  exit 1
fi

# source: https://developers.cloudflare.com/1.1.1.1/encryption/dns-over-https/dns-over-https-client/
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -P /tmp
sudo dpkg -i /tmp/cloudflared-linux-amd64.deb

# verify `cloudflared` daemon is installed
cloudflared --version
sleep 1

# check network
dig +short @127.0.0.1 -p5553 cloudflare.com AAAA

# create cloudflared service
sudo tee /etc/systemd/system/cloudflared-proxy-dns.service >/dev/null <<EOF
[Unit]
Description=DNS over HTTPS (DoH) proxy client
Wants=network-online.target nss-lookup.target
Before=nss-lookup.target

[Service]
AmbientCapabilities=CAP_NET_BIND_SERVICE
CapabilityBoundingSet=CAP_NET_BIND_SERVICE
DynamicUser=yes
ExecStart=/usr/local/bin/cloudflared proxy-dns

[Install]
WantedBy=multi-user.target
EOF

# enable cloudflared service
sudo systemctl enable --now cloudflared-proxy-dns


# set network manager
sudo tee /etc/NetworkManager/conf.d/dns.conf >/dev/null <<EOF
[main]
dns=none
EOF

# remove current config
sudo rm -f /etc/resolv.conf
echo nameserver 127.0.0.1 | sudo tee /etc/resolv.conf >/dev/null

# restart network service
sudo systemctl restart NetworkManager

# check network
dig +short @127.0.0.1 cloudflare.com AAAA
