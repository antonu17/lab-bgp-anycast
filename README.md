# BGP Network Lab

Welcome to the Lab!

This Network Lab is designed for learning and troubleshooting networking concepts, including routing protocol BGP, anycast configurations, and multihoming scenarios.

By completing this lab, you will gain practical expertise in configuring and troubleshooting BGP using FRR and Bird.
FRR (Free Range Routing) and Bird Internet Routing Daemon (Bird) are two popular open-source routing software suites widely used in networking.

## Content

- Installation guide for macOS. See [Installation](./Installation-macOS.md) page.
- Topology description and design. See [Topology](./Topology.md) page.
- Containerlab topoloty definition and configuration files.
- Configuration and troubleshooting scenarious. See [Tasks](./Tasks.md) page.

## Requirements

- Containerlab installed on the machine. Follow the [Containerlab documentation](https://containerlab.dev/install/) to get up and running. For macOS users, it is recommended to install Containerlab on a fresh virtual machine (VM) for the best experience, as Docker for Mac can cause performance and compatibility issues, especially with networking in virtualized environments.

- Recommended to install [Edgeshark integration](https://containerlab.dev/manual/wireshark/#edgeshark-integration) for Containerlab to get visualized communication flows between the containers.


## Deployment

#### Step 1. Clone the repository on a containerlab host.

```
git clone https://github.com/antonu17/lab-bgp-network.git
cd lab-bgp-network
```

#### Step 2. Build container images

```
docker build --target base --tag node-base .
docker build --target bird --tag node-bird .
docker build --target frr --tag node-frr .
```

#### Step 3. Deploy containerlab topology

```
sudo clab deploy
```

#### Step 4. Access topology nodes

Since the topology nodes are regular containers, you can connect to them just like to any other container.

```
docker exec -it clab-bgp-router1.dc1 bash
```

## Tasks

Follow instructions in [Tasks](./Tasks.md)
