# samsungtvd

Power control daemon for Samsung TV over ethernet

Listen on
```
mqtt://MQTT_HOST:MQTT_PORT/samsungtv/<mac-addr-without-colons>/power/set
```
for ON and OFF messages and tries to power on TV using wake-on-lan and
shut down using websockets

Publish to
```
mqtt://MQTT_HOST:MQTT_PORT/samsungtv/<mac-addr-without-colons>/power
```
ON or OFF message when any upnp client becomes alive or leaves the network

Docker create:
```
 docker create \
  --name samsungtvd \
  --mac-address 02:02:02:02:02:02 \
  --restart always \
  -v /var/lib/samsungtvd.json:/opt/tokens.json \
  -e MQTT_HOST=192.168.0.1 \
  004helix/samsungtvd:latest
```
