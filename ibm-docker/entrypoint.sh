#!/bin/bash
cat << EOF > /usr/local/etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": 8080,
    "listen":"127.0.0.1",
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "ad806487-2d26-4636-98b6-ab85cc8521f7",
          "alterId": 4       
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
      "path": "/ws"
      }     
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
# start nginx
nginx
# Run V2Ray
/etc/init.d/gov2 start
#/usr/bin/v2ray -config /usr/local/etc/v2ray/config.json >/dev/null 2>&1 &
#gost -L ws://:7070?path=/gows >/dev/null 2>&1 &
ss-server -s 127.0.0.1 -p 9090  -k peng  -m chacha20-ietf-poly1305 -t 300 -d 8.8.8.8 -u --plugin v2ray-plugin --plugin-opts "server;path=/peng;loglevel=none" >/dev/null 2>&1 &
#brook wsserver -l 127.0.0.1:6060 --path /brook -p peng >/dev/null 2>&1 &
tail -f /dev/null
