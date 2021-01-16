# Running the container and exporting the content

## Running the container

```bash
docker run -d --name esp-dht-temperature --restart unless-stopped -p 9981:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/dht/temperature --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1 
docker run -d --name esp-dht-humidity --restart unless-stopped -p 9982:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/dht/humidity --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1
docker run -d --name esp-bmp180-pressure --restart unless-stopped -p 9983:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/bmp180/pressure --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1
docker run -d --name esp-bmp180-sealevelpressure --restart unless-stopped -p 9984:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/bmp180/sealevelpressure --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1
docker run -d --name esp-bmp180-altitude --restart unless-stopped -p 9985:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/bmp180/altitude --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1
docker run -d --name esp-bmp180-temperature --restart unless-stopped -p 9986:9981 --env MQTT_SERVER=mqtt://192.168.1.110:1883 --env MQTT_TOPIC=esp/bmp180/temperature --env MQTT_LOG_LEVEL=warn fernandohackbart/mqtt_topic_exporter:0.0.1
```

## Configuring Prometheus

```bash
cat >> /opt/prometheus/prometheus.yml <<EOF
  - job_name: 'esp-garden-sensors'
    scrape_interval: 8s
    static_configs:
    - targets: ['localhost:9981'] 
    - targets: ['localhost:9982'] 
    - targets: ['localhost:9983'] 
    - targets: ['localhost:9984'] 
    - targets: ['localhost:9985'] 
    - targets: ['localhost:9986'] 
EOF
```