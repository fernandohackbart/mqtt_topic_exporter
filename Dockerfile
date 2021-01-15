FROM golang as builder
WORKDIR /go/src/mqtt-topic-exporter/
COPY main.go /go/src/mqtt-topic-exporter/
RUN go get -u github.com/prometheus/client_golang/prometheus &&  \
    go get -u github.com/prometheus/client_golang/prometheus/promhttp && \
    go get -u github.com/prometheus/common/log && \
    go get -u github.com/prometheus/common/version && \
    go get -u github.com/yosssi/gmq/mqtt && \
    go get -u github.com/yosssi/gmq/mqtt/client && \
    go get -u gopkg.in/alecthomas/kingpin.v2 && \
    go build
FROM debian
USER root
COPY --from=builder /go/src/mqtt-topic-exporter/mqtt-topic-exporter /usr/bin/mqtt-topic-exporter
EXPOSE 9981/tcp
ENV MQTT_SERVER mqtt://192.168.1.110:1883
ENV MQTT_TOPIC esp/dht/temperature
ENV MQTT_LOG_LEVEL warn
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
