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
FROM alpine
USER root
COPY --from=builder /go/src/mqtt-topic-exporter/mqtt-topic-exporter /usr/local/bin/mqtt-topic-exporter
ENTRYPOINT ["/bin/sh"]
#ENTRYPOINT ["/usr/local/bin/mqtt-topic-exporter","--web.listen-address=':9981'","--web.telemetry-path='metrics'"]

#  -h, --help                     Show context-sensitive help (also try --help-long and --help-man).
#
#                                 Address on which to expose metrics and web interface.
#
#                                 Path under which to expose metrics.
#      --mqtt.retain-time="1m"    Retain duration for a topic
#      --mqtt.server=MQTT.SERVER  MQTT Server address URI mqtts://user:pass@host:port
#      --mqtt.topic=MQTT.TOPIC    Watch MQTT topic
#      --log.level="info"         Only log messages with the given severity or above. Valid levels: [debug, info, warn, error, fatal]
#      --log.format="logger:stderr"
#                                 Set the log target and format. Example: "logger:syslog?appname=bob&local=7" or "logger:stdout?json=true"
#      --version                  Show application version.
