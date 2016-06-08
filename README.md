# mosquitto
based on alpine:3.4, intend for using in rancher.

## dev & test localy

#### build local
```
git clone ???
cd docker-mosquitto
docker build --rm -t mosquitto-conf:1.4.8 conf/
docker build --rm -t mosquitto:1.4.8-alpine mosquitto/
```

#### test local
+ example generate password file (user is `admin`, password is `123`)
```
docker run --rm -it --entrypoint mosquitto_passwd mosquitto:1.4.8-alpine -c /dev/stdout admin
$6$9fg/ocPdmXjiCuYn$i1TZ3v/4EooliIAskHZ/YS4/go36QRxsUYrZKf1eYBzud/LXffSv5f1A522ETiMByZlUd+O1J/4uaq0K0E3aGw==
```

+ example run mosquitto-conf with confd's `env` backend
```
docker run --rm -it --name mosquitto-conf \
    -e SELF_SERVICE_METADATA_MOSQUITTO_CONF_ALLOW_ANONYMOUS=false \
    -e SELF_SERVICE_METADATA_MOSQUITTO_USERS_0_USERNAME=admin \
    -e SELF_SERVICE_METADATA_MOSQUITTO_USERS_0_PASSWORD='$6$9fg/ocPdmXjiCuYn$i1TZ3v/4EooliIAskHZ/YS4/go36QRxsUYrZKf1eYBzud/LXffSv5f1A522ETiMByZlUd+O1J/4uaq0K0E3aGw==' \
    mosquitto-conf:1.4.8 \
    -backend env
```

+ run mosquitto
```
docker run --rm -it --volumes-from mosquitto-conf -p 1883:1883 mosquitto:1.4.8-alpine
```

+ then use a mqtt client to test
