# CMAK docker image

Docker image for [CMAK](https://github.com/yahoo/CMAK) - Yahoo's Cluster Manager for Apache Kafka (renamed from kafka-manager)

## Run

```
docker run -d --name cmak -p 9000:9000 -e ZK_HOSTS=zookeeper:2181 srvz/cmak:3.0.0.5
```

or

```
docker run -d --name cmak -p 9000:9000 -v /path/to/application.conf:/app/conf/application.conf srvz/cmak:3.0.0.5
```

to override default configuration ([application.conf](https://github.com/yahoo/CMAK/blob/master/conf/application.conf))

## Run single node kafka for local development

```
docker-compose up -d
```

## Supported ENV variables ([see more](https://github.com/yahoo/CMAK#configuration))

```
# specify cmak startup options
CMAK_ARGS="-Dconfig.file=/app/conf/application.conf -Dhttp.port=9000"
ZK_HOSTS="zookeeper:2181"
APPLICATION_SECRET=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c 64)
KAFKA_MANAGER_AUTH_ENABLED=true
KAFKA_MANAGER_USERNAME=admin
KAFKA_MANAGER_PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c 32)
```

