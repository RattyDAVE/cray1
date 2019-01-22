FROM alpine:edge
WORKDIR /root

RUN apk --update --no-cache add curl unzip tmux busybox-extras && rm -rf /var/cache/apk/* && \
    curl -L -o Cray1.zip -d "nopassword=1" https://download.cloudatcost.com/download/iou4zmpg2r2qavat827pjnnjb  && \
    unzip Cray1.zip  && \
    rm Cray1.zip

ADD cos_117.cfg Cray1/cos_117.cfg
ADD run.sh Cray1/run.sh

RUN chmod 755 Cray1/run.sh  && \
    echo "root:root" | chpasswd
    
RUN apk --update --no-cache add bash openssh && rm -rf /var/cache/apk/*
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
    
EXPOSE 22

CMD    ["Cray1/run.sh"]

#ENTRYPOINT ["busybox", "sh"]
#CMD ["/usr/bin/supervisord"]
