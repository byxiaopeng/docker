FROM debian:latest
#更新源
RUN apt-get -y update && apt-get -y upgrade
RUN apt install wget curl bash git unzip cron vim nginx -y

#同步系统时间

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN mkdir /tmp/v2ray
RUN curl -L -H "Cache-Control: no-cache" -o /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray
RUN install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray
RUN install -m 755 /tmp/v2ray/v2ctl /usr/bin/v2ctl
RUN rm -rf /tmp/v2ray

# V2Ray new configuration
RUN install -d /usr/local/etc/v2ray

RUN mkdir /run/nginx
ADD default.conf /etc/nginx/conf.d/default.conf

#RUN git clone https://github.com/xiongbao/we.dog
#RUN mv we.dog/* /var/lib/nginx/html/
#RUN rm -rf /we.dog
ADD gov2 /etc/init.d/gov2
RUN chmod +x /etc/init.d/gov2
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
