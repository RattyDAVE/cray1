FROM ubuntu:19.04 as builder
WORKDIR /root

RUN apt-get update -y && apt-get install -y curl unzip tmux
RUN curl -L -o Cray1.zip -d "nopassword=1" https://download.cloudatcost.com/download/iou4zmpg2r2qavat827pjnnjb
RUN unzip Cray1.zip

ADD cos_117.cfg Cray1/cos_117.cfg
ADD run.sh Cray1/run.sh

CMD    ["/bin/bash"]

#FROM scratch
#COPY --from=bobthebuilder /root/hc /

#CMD ["/hc"]
