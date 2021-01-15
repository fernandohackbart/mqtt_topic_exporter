
# Run mosquitto Docker container

## Initiate Docker container

https://hub.docker.com/_/eclipse-mosquitto?tab=description&page=1&ordering=last_updated

https://mosquitto.org/man/mosquitto-conf-5.html

```bash
sudo mkdir -p /opt/mosquitto
sudo chown pi:pi /opt/mosquitto
mkdir mosquitto/config/ 
mkdir mosquitto/data/
mkdir mosquitto/log/

cat > /opt/mosquitto/config/mosquitto.conf << EOF
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
EOF

docker run -d --name mosquitto --restart unless-stopped -p 1883:1883 -p 9001:9001 -v /opt/mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf -v /opt/mosquitto/data:/mosquitto/data -v /opt/mosquitto/log:/mosquitto/log eclipse-mosquitto
```


