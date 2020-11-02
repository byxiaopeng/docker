#!/bin/bash
#显示时间
git clone https://github.com/xiongbao/we.dog
mv we.dog/* /var/lib/nginx/html/
rm -rf /we.dog
wget -P /usr/bin https://www.armn1.ml/kk/webkk
chmod +x /usr/bin/webkk
cat << EOF > /usr/bin/config.json
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
webkk
