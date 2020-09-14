#!/bin/bash
/usr/sbin/sshd
chmod +x /etc/ct/core
chmod +x /etc/ct/move.sh
chmod +x /etc/ct/delete.sh
chmod +x /etc/ct/upload.sh
chmod +x /etc/ct/clean.sh
#更新bt
bash <(curl -fsSL https://raw.githubusercontent.com/P3TERX/aria2.conf/master/tracker.sh) "/etc/ct/aria2.conf"
aria2c --conf-path=/etc/ct/aria2.conf
