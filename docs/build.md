# Build process

## Build the container

```bash
docker build . -t mqtt_topic_exporter
```

## Push de container to the repo

```bash
docker tag mqtt_topic_exporter fernandohackbart/mqtt_topic_exporter:0.0.1
docker login
docker push fernandohackbart/mqtt_topic_exporter:0.0.1
```

## Run the container

```bash
docker run -it -p 9981:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/dht/temperature --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1 
docker run -d --name esp-dht-temp --restart unless-stopped -p 9981:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/dht/temperature --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1 
```