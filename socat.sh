#!/usr/bin/env bash

#https://github.com/clarketm/proxy-list.git

IP=$(grep "\+ $" proxy-list.txt | cut -d" " -f1 | shuf | head -n1)

geoiplookup $(echo $IP | cut -d":" -f1)
sleep 3
echo "chromium  --proxy-server=127.0.0.1:8081  --user-data-dir=$HOME/.config/chromium_proxy"
socat  TCP4-LISTEN:8081,fork,reuseaddr SOCKS4:10.152.152.10:${IP},socksport=9050
