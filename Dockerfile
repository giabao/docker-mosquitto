FROM alpine:3.4

RUN apk add --no-cache mosquitto

ADD https://github.com/giabao/confd/releases/download/v0.12.0-alpha3.1/confd-0.12.0-alpha3.1-alpine-amd64 /bin/confd
ADD ./confd /etc/confd
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh /bin/confd && \
  chown -R mosquitto: /etc/mosquitto

USER mosquitto
EXPOSE 1883

CMD ["/entrypoint.sh", "-backend=rancher --prefix=/2015-12-19"]
