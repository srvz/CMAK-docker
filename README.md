# CMAK docker

<p align="left">
  <a href="https://hub.docker.com/r/srvz/cmak">
    <img src="https://img.shields.io/docker/v/srvz/cmak" />
  </a>
  <a href="https://hub.docker.com/r/srvz/cmak">
    <img alt="Docker Image Size (latest by date)" src="https://img.shields.io/docker/image-size/srvz/cmak">
  </a>
</p>

Docker image for [CMAK](https://github.com/yahoo/CMAK) (Yahoo's Cluster Manager for Apache Kafka renamed from kafka-manager)


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

**Tips:** After the container startup, you need manually add cluster from the web interface

## Supported ENV variables with examples ([see more](https://github.com/yahoo/CMAK#configuration))

```
# specify cmak startup options
CMAK_ARGS="-Dconfig.file=/app/conf/application.conf -Dhttp.port=9000"
ZK_HOSTS=zookeeper:2181
# if not specified, it will be automatically generated
APPLICATION_SECRET=AwPU1lFBxD8Z2HAOYeaRuwolwyZsBFG1obJXMDWUCuZPP8orNUFodH6cgB5ayQc6
# enable basic auth
KAFKA_MANAGER_AUTH_ENABLED=true
KAFKA_MANAGER_USERNAME=kafka
KAFKA_MANAGER_PASSWORD=5D8F73FA-64FC-4622-8401-ACD605429F9A
```

