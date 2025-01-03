# Cheatsheet

### Bird commands

- `birdc configure` - reload configuration files
- `birdc show status` - show BIRD status
- `birdc show symbols` - show all defined symbols in the BIRD configuration
- `birdc show interfaces` - list all network interfaces and their current status
- `birdc show protocols` - show brief information on BGP and other protocols
- `birdc show protocols all` - show BGP and other protocols, more details on every BGP neighbour
- `birdc show protocols all <protocol>` - show more details on one neighbour only
- `birdc show route` - show routing table
- `birdc show route all for <a.b.c.d>` - show detailed routing table entry for specific target
- `birdc show route filter <filter>` - show route filter info
- `birdc show route export <protocol>` - show routes advertised to specific BGP neighbour
- `birdc show route protocol <protocol>` - show routes received from specific BGP neighbour

### FRR (vtysh) commands

- `show running-config` - show currently running configuration
- `show interface  brief` - show interface status and configuration summary
- `show <ip|ipv6> route` - show ip routing table
- `show <ip|ipv6> route <a.b.c.d>` - show detailed routing table entry for specific target
- `show bgp <ipv4|ipv6>` - show BGP routing table for ipv4 or ipv6 address family
- `show bgp <ipv4|ipv6> <a.b.c.d>` - show detailed BGP routing table entry for specific target
- `show bgp summary` - show summary of BGP neighbor status
- `show bgp neighbors` - show detailed information about all BGP neighbours
- `show bgp neighbors <a.b.c.d>` - show detailed information about specific BGP neighbour
- `show bgp <ipv4|ipv6> neighbors <a.b.c.d> received-routes` - show routes advertised to specific BGP neighbor
- `show bgp <ipv4|ipv6> neighbors <a.b.c.d> advertised-routes` - show routes received from specific BGP neighbor

### Linux commands

#### Iproute2

- `ip link show` - show network interfaces status
- `ip link set <iface> <down|up>` - bring network inteface down or up
- `ip [-6] address show` - show ip addresses configured on all interfaces
- `ip [-6] address show dev <iface>` - show ip addresses configured on specific interface
- `ip [-6] route show` - show ip routing table
- `ip [-6] route get <a.b.c.d>` - show a single route for specific target
- `ip [-6] route get <a.b.c.d> fibmatch` - show full fib lookup matched routes for specific target
