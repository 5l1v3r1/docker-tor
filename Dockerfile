FROM debian:jessie

MAINTAINER opsxcq <opsxcq@thestorm.com.br>

RUN apt-get update && \
    apt-get upgrade -y &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    ntpdate \
    tor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --system --uid 666 -M --shell /usr/sbin/nologin tor

COPY ./torrc /etc/tor/torrc
COPY main.sh /

USER tor

ENTRYPOINT ["/main.sh"]
CMD ["default"]
