FROM alpine:edge
WORKDIR /root

RUN apk --update --no-cache add curl unzip tmux openssh bash supervisor && rm -rf /var/cache/apk/* \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd \
  && sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  && sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
  && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
  && /usr/bin/ssh-keygen -A \
  && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key \
  && echo "[program:sshd]" > /etc/supervisor.d/supervisor-sshd.ini \
  && echo "command=/usr/sbin/sshd -D" >> /etc/supervisor.d/supervisor-sshd.ini \
  && curl -L -o Cray1.zip -d "nopassword=1" https://download.cloudatcost.com/download/iou4zmpg2r2qavat827pjnnjb \
  && unzip Cray1.zip \
  && cos_117.cfg Cray1/cos_117.cfg \
  && run.sh Cray1/run.sh \
  && chmod 755 Cray1/run.sh \
  && echo "[program:cray1]" > /etc/supervisor.d/supervisor-sshd.ini \
  && echo "command=/root/Cray1/run.sh" >> /etc/supervisor.d/supervisor-sshd.ini 

EXPOSE 22

#CMD    ["/bin/bash", "Cray1/run.sh"]

#ENTRYPOINT ["busybox", "sh"]
CMD ["/usr/bin/supervisord"]

