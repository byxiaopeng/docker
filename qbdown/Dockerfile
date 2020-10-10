FROM archlinux:latest
RUN echo y | pacman -Sy
RUN echo y | pacman -S wget curl git jq rclone qbittorrent-nox
#同步系统时间
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir /etc/ct

VOLUME /root/.config/qBittorrent

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 1234 8999
ENTRYPOINT ["/entrypoint.sh"]
