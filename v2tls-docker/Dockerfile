FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates nginx wget git bash

#同步系统时间
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apk del tzdata

RUN mkdir /run/nginx
ADD default.conf /etc/nginx/conf.d/default.conf

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
EXPOSE 8080
ENTRYPOINT ["/configure.sh"]
