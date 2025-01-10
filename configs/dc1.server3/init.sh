#!/bin/bash

# ecmp policy
sysctl net.ipv4.fib_multipath_hash_policy=1
sysctl net.ipv6.fib_multipath_hash_policy=1
# lo
ip -4 address add 10.1.255.3/32 dev lo
ip -6 address add fc00:dc1::255:3/128 dev lo
# interface towards router2.dc1
ip -4 address add 10.1.5.2/30 dev eth1
ip -6 address add fc00:dc1::5:2/126 dev eth1
ip link set eth1 up
# interface towards router3.dc1
ip -4 address add 10.1.6.2/30 dev eth2
ip -6 address add fc00:dc1::6:2/126 dev eth2
ip link set eth2 up
# local anycast addresses
ip -4 address add 111.11.3.0/24 dev lo
ip -4 address add 111.11.1.0/24 dev lo
ip -6 address add fc00:11:3::/64 dev lo
ip -6 address add fc00:11:1::/64 dev lo
# global anycast addresses
ip -4 address add 1.1.1.0/24 dev lo
ip -4 address add 2.2.2.0/24 dev lo
ip -6 address add fc00:aa::/48 dev lo
# bird
service bird start
# nginx
hostname >/var/www/html/index.nginx-debian.html
service nginx start
