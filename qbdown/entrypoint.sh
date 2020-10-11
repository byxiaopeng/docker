#!/bin/sh
chmod +x /root/.config/qBittorrent/qb_auto.sh
cp /root/.config/qBittorrent/rclone.conf /root/.rclone.conf
echo y | qbittorrent-nox --webui-port=80
