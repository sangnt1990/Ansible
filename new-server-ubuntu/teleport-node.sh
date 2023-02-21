#!/bin/bash
# curl -O https://get.gravitational.com/teleport-v10.0.2-linux-amd64-bin.tar.gz
# tar -xzf teleport-v10.0.2-linux-amd64-bin.tar.gz
# rm -rf teleport-v10.0.2-linux-amd64-bin.tar.gz
# cd teleport
# ./install
# cd ../
# rm -rf teleport/
username=$1
token=$2
# echo "1. jump02.vnpaycloud.vn
# 2. jump-sb.infiniband.vn
# 3. jump.infiniband.vn
# Hi, please choose the number of server: "
# read word
# if [ $word -eq 1 ]
# then
# touch /etc/systemd/system/teleport-node.service
# echo "[Unit]
# Description=Teleport Node Service
# After=network.target

# [Service]
# Type=simple
# Restart=on-failure
# ExecStart=/usr/local/bin/teleport start --roles=node --auth-server=jump02.vnpaycloud.vn:3025 --token=$token --labels hostname=[1m:"hostname"],env=$username --pid-file=/run/teleport.pid
# ExecReload=/bin/kill -HUP $MAINPID
# PIDFile=/run/teleport.pid

# [Install]
# WantedBy=multi-user.target" > /etc/systemd/system/teleport-node.service
# else
# if [ $word -eq 2 ]
# then
touch /etc/systemd/system/teleport-node.service
echo "[Unit]
Description=Teleport Node Service
After=network.target

[Service]
Type=simple
Restart=on-failure
ExecStart=/usr/local/bin/teleport start --roles=node --auth-server=jump-sb.infiniband.vn:3025 --token=$token --labels hostname=[1m:"hostname"],env=$username --pid-file=/run/teleport.pid
ExecReload=/bin/kill -HUP $MAINPID
PIDFile=/run/teleport.pid

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/teleport-node.service
# else
# if [ $word -eq 3 ]
# then
# touch /etc/systemd/system/teleport-node.service
# echo "[Unit]
# Description=Teleport Node Service
# After=network.target

# [Service]
# Type=simple
# Restart=on-failure
# ExecStart=/usr/local/bin/teleport start --roles=node --auth-server=jump.infiniband.vn:3025 --token=$token --labels hostname=[1m:"hostname"],env=$username --pid-file=/run/teleport.pid
# ExecReload=/bin/kill -HUP $MAINPID
# PIDFile=/run/teleport.pid

# [Install]
# WantedBy=multi-user.target" > /etc/systemd/system/teleport-node.service
# else
# echo "you enter an incorrect value, try again"
# fi
# fi
# fi
systemctl daemon-reload
systemctl enable teleport-node.service
systemctl start teleport-node.service
systemctl status teleport-node.service
