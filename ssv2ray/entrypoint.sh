#!/bin/sh
nohup caddy -conf="/etc/Caddyfile"   >/etc/ct/caddy.txt 2>&1 &
ss-server -s 127.0.0.1 -p 9090  -k peng  -m chacha20-ietf-poly1305 -t 300 -d 8.8.8.8 -u --plugin v2ray-plugin --plugin-opts "server;path=/peng;loglevel=none"
