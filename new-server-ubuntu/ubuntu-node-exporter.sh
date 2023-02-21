#!/bin/bash
#Use with user root
#export GIT_SSL_NO_VERIFY=1
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz --no-check-certificate
#cd node_exporter
tar xvf node_exporter-1.3.1.linux-amd64.tar.gz
sudo cp node_exporter-1.3.1.linux-amd64/node_exporter /usr/local/bin
sudo useradd -rs /bin/false node_exporter
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-1.3.1.linux-amd64.tar.gz node_exporter-1.3.1.linux-amd64
sudo mkdir /var/lib/node_exporter
cat  > /etc/systemd/system/node_exporter.service <<"EOF"
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter \
        --collector.textfile.directory=/var/lib/node_exporter

[Install]
WantedBy=multi-user.target


EOF

sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
cd /usr/local/bin/
wget https://raw.githubusercontent.com/TuNGO-86/Script-Install/main/apt.sh --no-check-certificate
sudo chmod +x apt.sh
cat > /etc/cron.d/prom-apt <<"EOF"
0 0 * * 0 root /usr/local/bin/apt.sh >/var/lib/node_exporter/apt.prom.new && mv /var/lib/node_exporter/apt.prom.new /var/lib/node_exporter/apt.prom

EOF

echo "Installation succeeded!"
