FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
RUN apt install wget curl bash git unzip cron vim nginx shadowsocks-libev -y

#同步系统时间

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN mkdir /tmp/v2ray
RUN curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
RUN install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray
RUN install -m 755 /tmp/v2ray/v2ctl /usr/bin/v2ctl
RUN rm -rf /tmp/v2ray

RUN mkdir /etc/gost
RUN wget -P /etc/gost https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
RUN gunzip /etc/gost/gost-linux-amd64-2.11.1.gz
RUN chmod +x /etc/gost/gost-linux-amd64-2.11.1
RUN mv /etc/gost/gost-linux-amd64-2.11.1 /usr/bin/gost

RUN wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.1/v2ray-plugin-linux-amd64-v1.3.1.tar.gz
RUN tar -zxvf v2ray-plugin-linux-amd64-v1.3.1.tar.gz
RUN mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin
RUN chmod +x /usr/bin/v2ray-plugin
RUN rm -r v2ray-plugin-linux-amd64-v1.3.1.tar.gz



RUN wget https://github.com/txthinking/brook/releases/download/v20200909/brook_linux_amd64
RUN mv brook_linux_amd64 /usr/bin/brook
RUN chmod +x /usr/bin/brook
# V2Ray new configuration
RUN install -d /usr/local/etc/v2ray

RUN mkdir /run/nginx
RUN rm -rf /etc/nginx/sites-enabled/default
ADD default.conf /etc/nginx/conf.d/default.conf

#RUN git clone https://github.com/xiongbao/we.dog
#RUN mv we.dog/* /var/lib/nginx/html/
#RUN rm -rf /we.dog
#ADD gov2 /etc/init.d/gov2
#RUN chmod +x /etc/init.d/gov2
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
