FROM alpine:latest
LABEL maintainer "Raman Shyshniou <rommer@ibuffed.com>"

COPY . /opt
WORKDIR /opt
RUN apk --no-cache add py3-six py3-websocket-client py3-paho-mqtt

ENTRYPOINT ["/opt/samsungtvd"]
