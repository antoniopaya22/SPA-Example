#!/usr/bin/env bash

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -S

yes Y  | cp config/access.conf /etc/fwknop/
yes Y  | cp config/fwknopd.conf /etc/fwknop/

#fwknopd -f

while true; do
    sleep 100
done