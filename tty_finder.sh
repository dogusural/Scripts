#!/bin/bash


ls /dev/tty* > tmp1.txt

read -p "Unplug the device and press Enter ..."
sleep 1

ls /dev/tty* > tmp2.txt
diff tmp1.txt tmp2.txt
rm -rf tmp1.txt tmp2.txt