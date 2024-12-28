# Network Topology

Understanding the network topology is fundamental to mastering routing principles and testing real-world configurations. This section outlines the design, which provides a comprehensive platform for learning, experimentation, and troubleshooting scenarios.

## High Level Design

- **Data Centers (DCs):**

  - Two data centers with servers connected to the redundant top of rack routers.
  - Top of rack routers connected to a customer edge router for external connectivity.
  - Local and global anycast prefixes are announced from each DC.

- **Transit Providers:**

  - Three transit providers (AS 101, AS 102, and AS 103) form the backbone of the network, providing interconnectivity between data centers and eyeball hosts.

- **Eyeball Hosts:**

  - Represent end-users connected to individual transit providers, simulating diverse access paths to the data centers.

![High Level](https://raw.githubusercontent.com/antonu17/lab-bgp-anycast/refs/heads/main/diagram-hld.drawio.svg)

## Topology details

The detailed topology diagram is your best friend thoughout the entire lab. You will find every little detail about the whole setup from physical links interconnecting the nodes to AS numbers and IP networks assigned to interfaces on each of the nodes.

![Details](https://raw.githubusercontent.com/antonu17/lab-bgp-anycast/refs/heads/main/diagram-details.drawio.svg)

## Implementation

The topology is built on containerlab, leveraging Debian Linux containers for all nodes to provide a lightweight and flexible testing environment. This approach simplifies setup, reduces resource consumption, and allows for quick iterations during testing. Routing software is carefully chosen to align with node roles: Bird is used for BGP on servers and private AS routers, while FRR is deployed on both data center edge routers and transit provider routers. This setup ensures a realistic emulation of diverse network functions and configurations.
