#!/bin/bash

# forwarding
sysctl net.ipv4.ip_forward=1
sysctl net.ipv6.conf.all.forwarding=1
# ecmp policy
sysctl net.ipv4.fib_multipath_hash_policy=1
sysctl net.ipv6.fib_multipath_hash_policy=1
# lo
ip -4 address add 10.2.254.1/32 dev lo
ip -6 address add fc00:dc2::254:1/128 dev lo
# interface towards router2.dc2
ip -4 address add 10.2.8.1/30 dev eth1
ip -6 address add fc00:dc2::8:1/126 dev eth1
ip link set eth1 up
# interface towards router3.dc2
ip -4 address add 10.2.9.1/30 dev eth2
ip -6 address add fc00:dc2::9:1/126 dev eth2
ip link set eth2 up
# interface towards router2.as102
ip -4 address add 10.102.6.2/30 dev eth3
ip -6 address add fc00:102::6:2/126 dev eth3
ip link set eth3 up
# interface towards router1.as103
ip -4 address add 10.103.1.2/30 dev eth4
ip -6 address add fc00:103::1:2/126 dev eth4
ip link set eth4 up
# frr
service frr start
# nginx
hostname >/var/www/html/index.nginx-debian.html
service nginx start
