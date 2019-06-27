#!/bin/bash

# print the ipv4 address on enp0s3
echo -n "enp0s3: "
ifconfig enp0s3 | grep 'inet ' |awk '{print $2}'|sed 's,/.*,,'

# verifies internet connection and prints public ip
echo -n "External IP: "
curl icanhazip.com
echo ''
exit
