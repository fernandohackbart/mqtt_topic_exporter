#!/bin/sh
/usr/bin/mqtt-topic-exporter --mqtt.server=${MQTT_SERVER} --mqtt.topic=${MQTT_TOPIC} --log.level=${MQTT_LOG_LEVEL}
