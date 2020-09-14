FROM archlinux:latest
RUN echo y | pacman -Sy
RUN echo y | pacman -Syy wget curl git bash jq rclone aria2 openssl openssh
RUN echo root:123456789 |chpasswd root
RUN sed -i "s/#PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
#同步系统时间
RUN ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mkdir /etc/ct
RUN chgrp -R 0 /etc/ct
RUN chmod -R g+rwX /etc/ct

VOLUME /etc/ct
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 22 8080 51413
ENTRYPOINT ["/entrypoint.sh"]