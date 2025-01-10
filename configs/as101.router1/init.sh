#!/bin/bash

# forwarding
sysctl net.ipv4.ip_forward=1
sysctl net.ipv6.conf.all.forwarding=1
# ecmp policy
sysctl net.ipv4.fib_multipath_hash_policy=1
sysctl net.ipv6.fib_multipath_hash_policy=1
# lo
ip -4 address add 10.101.254.1/32 dev lo
ip -6 address add fc00:101::254:1/128 dev lo
# interface towards router1.dc1
ip -4 address add 10.101.1.1/30 dev eth1
ip -6 address add fc00:101::1:1/126 dev eth1
ip link set eth1 up
# interface towards server1.as102
ip -4 address add 10.102.2.2/30 dev eth2
ip -6 address add fc00:102::2:2/126 dev eth2
ip link set eth2 up
# interface towards eyeball.as101
ip -4 address add 192.168.101.1/24 dev eth3
ip -6 address add fc00:101:face::1/48 dev eth3
ip link set eth3 up
# frr
service frr start
# nginx
hostname >/var/www/html/index.nginx-debian.html
service nginx start
