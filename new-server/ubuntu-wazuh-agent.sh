#!/bin/bash
sudo apt install unzip -y
wget http://103.176.144.122:8443/wazuh/wazuh-agent-4.3.1.tar && tar -xvf wazuh-agent-4.3.1.tar && cd ./wazuh-agent-4.3.1/
#wget https://github.com/tieuvuongly/wazuh/archive/refs/heads/main.zip --no-check-certificate && unzip main.zip && cd ./wazuh-main/
# echo "1. wazuh-node-hcm: 10.2.33.33
# 2. wazuh-node-hni: 10.16.33.33
# Hi, please choose (1 or 2) for the server wazuh: "
# read word
# if [ $word -eq 1 ]
# then
WAZUH_MANAGER='wazuh1.vnpaycloud.vn' WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent-4.3.1.deb
mv /var/ossec/etc/ossec.conf /var/ossec/etc/ossec.conf-bk-$(date +%F)
cp -r ./ossec-hcm.conf /var/ossec/etc/ossec.conf && chown root:ossec /var/ossec/etc/ossec.conf
systemctl daemon-reload
systemctl start wazuh-agent.service
systemctl enable wazuh-agent.service
# /var/ossec/bin/manage_agents
#cd .. && rm -rf wazuh-main/
# cd .. && rm -rf wazuh-agent-4.3.1/
# echo "done!"
# else
#         if [ $word -eq 2 ]
#         then
#         WAZUH_MANAGER='wazuh2.vnpaycloud.vn' WAZUH_AGENT_GROUP='default' dpkg -i ./wazuh-agent-4.3.1.deb
#         mv /var/ossec/etc/ossec.conf /var/ossec/etc/ossec.conf-bk-$(date +%F)
#         cp -r ./ossec-hni.conf /var/ossec/etc/ossec.conf && chown root:ossec /var/ossec/etc/ossec.conf
#         #rm -rf wazuh-agent-4.3.1/
#         systemctl daemon-reload
#         systemctl start wazuh-agent.service
#         systemctl enable wazuh-agent.service
#         /var/ossec/bin/manage_agents
#         #cd .. && rm -rf wazuh-main/
#         cd .. && rm -rf wazuh-agent-4.3.1/
#         echo "done!"
#         else
#         echo "you enter an incorrect value, try again"
#         fi
# fi
