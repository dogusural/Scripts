#!/bin/sh
PROGRAM=qrencode
OUTPUT=wifi.png

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $PROGRAM|grep "install ok installed")
echo Checking for $PROGRAM: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "No somelib. Setting up somelib."
  sudo apt-get --force-yes --yes install $PROGRAM
fi

qrencode -o $OUTPUT "WIFI:T:WPA;S:sep-guest;P:xxxxx;;"
echo "$OUTPUT has been created"
