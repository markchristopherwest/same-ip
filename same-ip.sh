#!/bin/bash

this_ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
IFS='.' read -a myarray <<< "$this_ip"

echo "OCTET: ${myarray[3]}"
ip addr add 192.168.50.${myarray[3]} dev eth1
ip addr add 192.168.51.${myarray[3]} dev eth2


service network stop
service network start