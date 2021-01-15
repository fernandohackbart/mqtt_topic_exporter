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
