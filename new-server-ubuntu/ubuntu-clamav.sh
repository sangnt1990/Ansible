#!/bin/bash
apt update
apt-get install -y clamav clamav-daemon
systemctl stop clamav-daemon.service
systemctl stop clamav-freshclam.service
systemctl disable clamav-daemon.service
systemctl disable clamav-freshclam.service
sed -i 's#LocalSocket /var/run/clamav/clamd.ctl#\#LocalSocket /var/run/clamav/clamd.ctl#' /etc/clamav/clamd.conf
sed -i "11i TCPSocket 3310" /etc/clamav/clamd.conf
# echo 'Server ClamAV
# Site HCM enter: clamav1
# Site HN enter: clamav2
# Enter here:'
# read word
sed -i "12i TCPAddr clamav1\.vnpaycloud\.vn" /etc/clamav/clamd.conf
sed -i "13i ExcludePath \^\/sys\/" /etc/clamav/clamd.conf
sed -i "14i ExcludePath \^\/dev\/" /etc/clamav/clamd.conf
sed -i "15i ExcludePath \^\/proc\/" /etc/clamav/clamd.conf
#get script scan 
cd /usr/local/bin
wget https://raw.githubusercontent.com/TuNGO-86/clamav/main/ClamScan.sh --no-check-certificate
chmod +x ClamScan.sh
#Scheduler scan
cat > /etc/cron.d/clamav-scan <<"EOF"
0 2 * * 6 root /usr/local/bin/ClamScan.sh
EOF
# echo -e 'Time Scan Server:
# ThangPA: 0 0 * * 6
# LyTM   : 0 1 * * 6
# QuiNHN : 0 2 * * 6
# LongNCN: 0 3 * * 6
# TuND   : 30 0 * * 0
# ThongTH: 0 4 * * 6
# Enter time scan for cron (Ex: 0 0 * * 6): '
# read word
# sed -i "s/time/$word/" /etc/cron.d/clamav-scan
# echo 'Done'
