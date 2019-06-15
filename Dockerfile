FROM debian:9.9

MAINTAINER Frederic GRACIA <gracia.frederic@gmail.com>

ENV VERSION=3.6.1

RUN apt-get update && \
    apt-get install -y curl bzip2
RUN apt-get clean

COPY ./startup.sh /startup.sh
RUN chmod +x /startup.sh

WORKDIR /opt
RUN curl -o teamspeak3-server_linux_amd64.tar.bz2 http://dl.4players.de/ts/releases/${VERSION}/teamspeak3-server_linux_amd64-${VERSION}.tar.bz2
RUN tar xfj teamspeak3-server_linux_amd64.tar.bz2 && mv teamspeak3-server_linux_amd64 teamspeak
RUN rm -f teamspeak3-server_linux_amd64.tar.bz2

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

VOLUME ["/data"]

CMD ["/startup.sh"]
