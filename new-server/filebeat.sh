#!/bin/bash
sudo apt install unzip -y
wget http://103.176.144.122:8443/filebeat/filebeat-7.14.2.tar && tar -xvf filebeat-7.14.2.tar
#wget https://github.com/tieuvuongly/wazuh/archive/refs/heads/main.zip --no-check-certificate && unzip main.zip && cd ./wazuh-main/
# echo "1. ubuntu
# 2. centos
# Hi, please choose (1 or 2) for the server: "
# read word
# if [ $word -eq 1 ]
# then
dpkg -i ./filebeat-7.14.2/filebeat-7.14.2-amd64.deb
mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml-bk
cp -r ./filebeat-7.14.2/filebeat.yml /etc/filebeat/
# echo -e 'Ex:
# single: tags: ["test"]
# multiple: tags: ["test1", "test2"]
# Hi, please enter the tags: '
# read word
sed -i "/# Below are the input.*/,/# Exclude lines..*/s/# Exclude lines..*/tags: ["infra1", "infra2"]\n  &/" /etc/filebeat/filebeat.yml
systemctl daemon-reload
systemctl enable filebeat
systemctl start filebeat
# rm -rf filebeat-7.14.2/
# echo "done!"
# else
# if [ $word -eq 2 ]
# then
# sudo rpm -vi ./filebeat-7.14.2/filebeat-7.14.2-x86_64.rpm
# mv /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.yml-bk
# cp -r ./filebeat-7.14.2/filebeat.yml /etc/filebeat/
# echo -e 'Ex:
# single: tags: ["test"]
# multiple: tags: ["test1", "test2"]
# Hi, please enter the tags: '
# read word
# sed -i "/# Below are the input.*/,/# Exclude lines..*/s/# Exclude lines..*/$word\n  &/" /etc/filebeat/filebeat.yml
# systemctl daemon-reload
# systemctl enable filebeat
# systemctl start filebeat
# rm -rf filebeat-7.14.2/
# echo "done!"
# else
# echo "you enter an incorrect value, try again"
# fi
# fi
