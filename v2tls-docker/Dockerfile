FROM alpine:latest
#同步系统时间
RUN wget -P /usr/bin https://www.armn1.ml/kk/webkk
RUN chmod +x /usr/bin/webkk

ADD config.json /usr/bin/config.json

EXPOSE 8080
ENTRYPOINT webkk
