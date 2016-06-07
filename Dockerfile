FROM debian:jessie

RUN echo deb http://repo.mosquitto.org/debian jessie main > /etc/apt/sources.list.d/mosquitto-jessie.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 30993623 && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mosquitto && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/* && \
    adduser --system --disabled-password --disabled-login mosquitto

USER mosquitto

EXPOSE 1883

CMD ["mosquitto"]
