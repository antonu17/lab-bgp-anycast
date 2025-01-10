#!/bin/bash

# interface towards router3.as102
ip -4 address add 192.168.102.2/24 dev eth1
ip -6 address add fc00:102:face::2/48 dev eth1
# local routes
ip -4 route add 10.0.0.0/8 via 192.168.102.1
ip -4 route add 172.16.0.0/12 via 192.168.102.1
ip -4 route add 192.168.0.0/16 via 192.168.102.1
ip -4 route add 111.11.0.0/16 via 192.168.102.1
ip -4 route add 222.22.0.0/16 via 192.168.102.1
ip -4 route add 1.1.1.0/24 via 192.168.102.1
ip -4 route add 2.2.2.0/24 via 192.168.102.1
ip -6 route add fc00::/7 via fc00:102:face::1
ip link set eth1 up
