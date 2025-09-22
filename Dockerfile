FROM qmcgaw/gluetun:latest

RUN apk update && \
RUN apk --no-cache add dpkg curl wget unzip net-tools socat

ENV VPN_SERVICE_PROVIDER=private internet access
ENV OPENVPN_USER=${OPENVPN_USER}
ENV OPENVPN_PASSWORD=${OPENVPN_PASSWORD}
ENV SERVER_REGIONS=${SERVER_NAMES}
ENV VPN_TYPE=openvpn
ENV HTTPPROXY=on

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN chmod +x /gluetun-entrypoint

EXPOSE 8888

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
