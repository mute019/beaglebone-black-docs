#!/bin/bash
##To run this script do
##1. chmod +x usbnet.sh 
##2. ./usbnet.sh 
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE
iptables -A FORWARD -i enx182c6505bbf2 -o enp2s0 -j ACCEPT
iptables -A FORWARD -i enp2s0 -o enx182c6505bbf2 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
