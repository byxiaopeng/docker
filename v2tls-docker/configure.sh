#!/bin/sh
#显示时间
date

cat << EOF > /usr/local/etc/webkk/config.json
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
/usr/local/bin/webkk -config /usr/local/etc/v2ray/config.json
