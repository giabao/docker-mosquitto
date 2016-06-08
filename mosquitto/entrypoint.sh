#!/bin/sh

while [ ! -f "/etc/mosquitto/mosquitto.conf" ]; do
    sleep 1
done

exec "$@"
