#!/bin/bash

# forwarding
sysctl net.ipv4.ip_forward=1
sysctl net.ipv6.conf.all.forwarding=1
# ecmp policy
sysctl net.ipv4.fib_multipath_hash_policy=0
sysctl net.ipv6.fib_multipath_hash_policy=1
# lo
ip -4 address add 10.1.254.3/32 dev lo
ip -6 address add fc00:dc1::254:3/128 dev lo
# interface towards server1.dc1
ip -4 address add 10.1.2.1/30 dev eth1
ip -6 address add fc00:dc1::2:1/126 dev eth1
ip link set eth1 up
# interface towards server2.dc1
ip -4 address add 10.1.4.1/30 dev eth2
ip -6 address add fc00:dc1::4:1/126 dev eth2
ip link set eth2 up
# interface towards server3.dc1
ip -4 address add 10.1.6.1/30 dev eth3
ip -6 address add fc00:dc1::6:1/126 dev eth3
ip link set eth3 up
# interface towards router2.dc1
ip -4 address add 10.1.7.1/30 dev eth4
ip -6 address add fc00:dc1::7:1/126 dev eth4
ip link set eth4 up
# interface towards router1.dc1
ip -4 address add 10.1.9.2/30 dev eth5
ip -6 address add fc00:dc1::9:2/126 dev eth5
ip link set eth5 up
# bird
service bird start
# nginx
hostname >/var/www/html/index.nginx-debian.html
service nginx start
