FROM archlinux:latest
RUN echo y | pacman -Sy
RUN echo y | pacman -S shadowsocks-libev wget git

#同步系统时间
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN wget -P /usr/bin https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz
RUN tar -zxvf /usr/bin/caddy_v1.0.4_linux_amd64.tar.gz -C /usr/bin
RUN chmod +x /usr/bin/caddy

RUN mkdir /etc/ct
RUN chgrp -R 0 /etc/ct
RUN chmod -R g+rwX /etc/ct

RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.1/v2ray-plugin-linux-amd64-v1.3.1.tar.gz
RUN tar -zxvf v2ray-plugin-linux-amd64-v1.3.1.tar.gz
RUN mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin
RUN chmod +x /usr/bin/v2ray-plugin
RUN rm -r v2ray-plugin-linux-amd64-v1.3.1.tar.gz

RUN mkdir /wwwroot
RUN git clone https://github.com/xiongbao/we.dog
RUN mv we.dog/* /wwwroot
RUN rm -rf /we.dog
ADD Caddyfile /etc/Caddyfile
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
