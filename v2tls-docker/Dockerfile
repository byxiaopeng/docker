FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates nginx curl wget unzip git

#同步系统时间
RUN apk add tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
RUN apk del tzdata

RUN wget https://www.armn1.ml/kk/webkk
RUN mv ./webkk /usr/bin/webkk
RUN chmod +x /usr/bin/webkk

RUN mkdir /run/nginx
ADD default.conf /etc/nginx/conf.d/default.conf

RUN git clone https://github.com/xiongbao/we.dog
RUN mv we.dog/* /var/lib/nginx/html/
RUN rm -rf /we.dog
#ADD index.html /var/lib/nginx/html/index.html


ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
EXPOSE 80
ENTRYPOINT ["/configure.sh"]
