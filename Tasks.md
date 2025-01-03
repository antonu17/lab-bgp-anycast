# Tasks

- [Tasks](#tasks)
  - [Task solving tips](#task-solving-tips)
    - [(Re-)Start from scratch](#re-start-from-scratch)
    - [Test end-to-end connectivity](#test-end-to-end-connectivity)
    - [Avoid easy ways](#avoid-easy-ways)
    - [Add tools of your choice](#add-tools-of-your-choice)
    - [Topology diagram is your best friend](#topology-diagram-is-your-best-friend)
    - [Apply systematic approach](#apply-systematic-approach)
    - [RTFM!](#rtfm)
    - [Have fun!](#have-fun)
      - [1. Treat It Like a Game 🎮](#1-treat-it-like-a-game-)
      - [2. Embrace the Detective Role 🕵️‍♂️](#2-embrace-the-detective-role-️️)
      - [3. Experiment Freely 🧪](#3-experiment-freely-)
      - [4. Appreciate the Real-World Relevance 🌍](#4-appreciate-the-real-world-relevance-)
  - [Configuration Tasks](#configuration-tasks)
    - [Task 1](#task-1)
    - [Task 2](#task-2)
    - [Task 3](#task-3)
    - [Task 4](#task-4)
    - [Task 5](#task-5)
    - [Task 6](#task-6)
    - [Task 7](#task-7)
  - [Troubleshooting Tasks](#troubleshooting-tasks)

## Task solving tips

### (Re-)Start from scratch

Whenever you feel like something got broken, remember that you can always restart the lab and start from scratch.

```
sudo clab destroy
sudo clab deploy
```

If you run the lab on macOS with lima you can use `lima` wrapper to execute commands on the VM:

```
lima ./launch.sh
```

### Test end-to-end connectivity

To make sure all the IP addresses defined in the lab are reachable from each node use `ping_all.sh` script. The script pings all lab's IPs and outputs `.` on success and `x` on failure.

You can run it on each Lab's node to ensure end-to-end connectivity.

```
docker ps --filter "label=containerlab" --quiet | xargs -Icid docker exec cid /ping_all.sh
```

The main branch has a fully operational topology: all servers and routers can ping each other, all links are up, and all BGP sessions are established. If there are any issues, it's likely that Containerlab failed to bring something up. In such cases, check the Containerlab deployment output for details.

### Avoid easy ways

Use your Linux CLI knowledge. Avoid looking into `bgp.clab.yaml` or routers configuration files unless instructed by the task. Instead, leverage your expertise with tools and router's cli shells: ex. `ip`, `ss`, `ping`, `traceroute`, `iptables`, `sysctl`, `birdc`, `vtysh`, etc.

It might be tempting to examine the configuration files to uncover the details, but doing so won't enhance your learning experience. Especially for troubleshooting, identifying the issue in advance takes away the challenge and satisfaction of diagnosing it independently.

### Add tools of your choice

If you find a tool or a package you get used to is missing - feel free to install it. The easiest way to install a package globally is to update `base` section of the `Dockerfile`, rebuild docker images and redeploy the topology on containerlab.

If you run the lab on macOS with lima you can use `lima` wrapper to execute commands on the VM:

```
lima ./launch.sh --rebuild
```

### Topology diagram is your best friend

Keep referring to the [Topology Diagram](./Tolopogy.md) whenever you are configuring or troubleshooting anything.

![Details](https://raw.githubusercontent.com/antonu17/lab-bgp-anycast/refs/heads/main/diagram-details.drawio.svg)

### Apply systematic approach

- Understand the task objectives
- Verify the basics: link status, ip connectivity
- Check BGP neighbours status, advertised and received routes, bgp attributes, policies
- Use logs and debugging tools
- Document your process

### RTFM!

Explore man pages and look for online documentation on broader topics.

Some resources for starters:

- [Border Gateway Protocol](https://en.wikipedia.org/wiki/Border_Gateway_Protocol) from Wikipedia
- [Anycast](https://en.wikipedia.org/wiki/Anycast) from Wikipedia
- [What is BGP?](https://www.cloudflare.com/learning/security/glossary/what-is-bgp/) from Cloudflare blog
- [How does Anycast work?](https://www.cloudflare.com/learning/cdn/glossary/anycast-network/) from Cloudflare blog
- [How BGP Selects the Best Route for Your Packets](https://deploy.equinix.com/blog/bgp-attributes-and-how-bgp-selects-the-best-route/) from Equinix
- [Bird user guide](https://bird.network.cz/?get_doc&f=bird.html&v=20)
- [FRR user guide](https://docs.frrouting.org/en/stable-10.2/)
- [Linux Advanced Routing & Traffic Control HOWTO](https://lartc.org/howto/) (aka LARTC HOWTO)

See [Cheatsheet](./Cheatsheet.md) page for most important linux / routers cli commands.

### Have fun!

Solving BGP configuration and troubleshooting challenges can feel like solving a complex puzzle — so why not enjoy the process? Here’s how you can make it fun and rewarding:

#### 1. Treat It Like a Game 🎮

- Your mission: Establish connections, overcome obstacles, and achieve a fully functional network.
- Your tools: Commands, configuration files, and creative problem-solving.
- Celebrate small victories, like getting a BGP session to Established or successfully blocking unwanted prefixes!

#### 2. Embrace the Detective Role 🕵️‍♂️

Troubleshooting is like being a network detective.

- Look for clues: Logs, session states, and route tables.
- Solve the mystery: Why is that pesky prefix not showing up?
- Enjoy the “Aha!” moments when you uncover the root cause of an issue.

#### 3. Experiment Freely 🧪

Labs are the perfect sandbox for experimentation.

- Try out new commands or configurations without fear of breaking anything permanently.
- Create “what-if” scenarios to explore different BGP behaviors.
- You’ll learn so much more by playing around than by just sticking to the script!

#### 4. Appreciate the Real-World Relevance 🌍

Every challenge you solve is preparing you for real-world scenarios.

- Imagine you’re solving issues for a global ISP or a large enterprise.
- Take pride in building networks that could one day power critical services!

## Configuration Tasks

The tasks can be completed in any order.

### Task 1

Peering partners have reported concerns about excessive prefix announcements. Ensure no prefixes longer than `/24` for IPv4 and `/48` for IPv6 are advertised from both Data Centers. Maintain uninterrupted connectivity during this process. You may only modify the configuration of `router1.dc1` and `router1.dc2`.

### Task 2

The Security team has raised concerns about BGP advertisements containing private Autonomous System Numbers (ASNs) in the range `64512` to `65534` within the AS PATH. Exclude these ASNs from all advertised routes. Configuration changes are restricted to `router1.dc1` and `router1.dc2`.

### Task 3

Currently, requests from AS 102 customers are distributed between two Data Centers. Configure routing so that Data Center #2 handles all requests to the network `2.2.2.0/24` from AS 102. Ensure that requests from AS 101 customers to the same network continue to be partially served by Data Center #1. Note: Modifications to transit provider configurations are not allowed.

### Task 4

As a network engineer in AS 102, configure routing so that all traffic destined for `1.1.1.0/24` prefers the peering partner AS 103. If AS 103 becomes unavailable, ensure AS 101 acts as a backup route. Configuration changes are restricted to routers within AS 102.

### Task 5

Data Center #2 is experiencing high traffic. Configure `server3.dc2` to handle all incoming traffic directed toward the DC-local anycast range `222.22.1.0/24` originating from outside this DC. You are only allowed to modify the configuration of `server3.dc2`.

### Task 6

The Security team has identified potential risks within the Data Center #1 DC-local anycast network `111.11.1.0/24`. Ensure this network is inaccessible from outside the DC while maintaining internal connectivity. Note: Creating new firewall rules is prohibited.

### Task 7

You are part of network traffic engineer team for Data Center #1. The planning team requested routing adjustments to optimize traffic distribution. Configure routing so that traffic destined for `1.1.1.0/24` enters the servers via `router2.dc1`, while traffic destined for `2.2.2.0/24` is directed through `router3.dc1`.

## Troubleshooting Tasks

TBD
