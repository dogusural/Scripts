#!/bin/bash

programname=$0

IP=$(/sbin/ip route | awk '/default/ { print $3 }')

echo "Gateway IP is $IP"



nmap -n -sn $IP/24 -oG - | awk '/Up$/{print $2}' > tmp_1.txt

read -p "Unplug the device and press Enter ..."

sleep 3

nmap -n -sn $IP/24 -oG - | awk '/Up$/{print $2}' > tmp_2.txt

diff tmp_1.txt tmp_2.txt

rm -rf  tmp_1.txt tmp_2.txt