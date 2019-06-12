# samsungtvd

Power control daemon for Samsung TV over ethernet

Listen on
```
mqtt://MQTT_ADDR:MQTT_PORT/samsungtv/<mac-addr-without-colons>/power/set
```
for ON and OFF messages and tries to power on TV using wake-on-lan and
shut down using websockets

Publish to
```
mqtt://MQTT_ADDR:MQTT_PORT/samsungtv/<mac-addr-without-colons>/power
```
ON or OFF message when any upnp client becomes alive or leaves the network

Openhab switch example:
```
Switch TV "Livingroom TV" <screen> (Livingroom) {mqtt=">[broker:samsungtv/54bd79d94f63/power/set:command:*:default],<[broker:samsungtv/54bd79d94f63/power:state:default]"}
```
where 54bd79d94f63 is the mac address of TV without colons (54:bd:79:d9:4f:63)

Docker create:
```
 docker create \
  --name samsungtvd \
  --mac-address 02:02:02:02:02:02 \
  --restart always \
  -v /var/lib/samsungtvd.json:/opt/tokens.json \
  -e MQTT_ADDR=192.168.0.1 \
  004helix/samsungtvd:latest
```
