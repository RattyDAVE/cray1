FROM ubuntu:18.04 as bobthebuilder
WORKDIR /root

RUN apt-get update -y && apt-get install -y gcc && \
        echo "#include <stdio.h>" > helloworld.c && \
        echo 'int main() {printf("Hello, World!");return 0;}' >> helloworld.c && \
        gcc -static -o hc helloworld.c && \
        apt-get -y purge gcc && \
        apt-get -y autoclean && apt-get -y autoremove && \
        apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
        rm -rf /var/lib/apt/lists/*

FROM scratch
COPY --from=bobthebuilder /root/hc /

CMD ["/hc"]
