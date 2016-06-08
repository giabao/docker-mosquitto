#!/bin/sh

echo "running: confd -onetime -sync-only $1"
confd -onetime -sync-only $1

echo "running: mosquitto -c /etc/mosquitto/mosquitto.conf -d"
mosquitto -c /etc/mosquitto/mosquitto.conf -d

echo "running: confd $1"
confd $1
