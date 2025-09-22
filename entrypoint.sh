/gluetun-entrypoint &

sleep 30

curl --preproxy socks5://127.0.0.1:8888 ipinfo.io
