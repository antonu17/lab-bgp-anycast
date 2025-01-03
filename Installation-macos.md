# Installation guide for macOS

For clean installation on macOS you can follow this guide.

#### Step 1. Install lima-vm and docker client

The Lima is very simple and convenient automation tool for running Linux VMs on macOS. I recommend using lima for its automatic file sharing and port forwarding mechanism.

```
brew install lima docker
```

#### Step 2. Create VM with docker server and activate docker context

```
limactl create --name=default --vm-type=qemu --cpus=4 --memory=8 --disk 80 --mount-type=reverse-sshfs --mount-writable template://docker-rootful
limactl start default
docker context create lima-default --docker "host=unix://$HOME/.lima/default/sock/docker.sock"
docker context use lima-default
```

#### Step 3. Clone the lab repository

```
git clone https://github.com/antonu17/lab-bgp-network.git
cd lab-bgp-network
```

#### Step 4. Deploy lab topology on containerlab

This step will ensure containerlab software is installed on the VM, build docker images, and deploy the lab topology.
Examine the [launch.sh](./launch.sh) script for details.

```
lima ./launch.sh
```

#### Step 5. Run edgeshark (optional)

Follow [Edgeshark documentation](https://edgeshark.siemens.io/#/getting-started?id=optional-capture-plugin) to install external capture plugin `cshargextcap` for Wireshark, and AppleScript that enables the packetflix:// URL schema handling.

```
wget -q --no-cache -O - \
  https://github.com/siemens/edgeshark/raw/main/deployments/wget/docker-compose.yaml \
  | DOCKER_DEFAULT_PLATFORM= docker compose -f - up
```

Navigate to http://localhost:5001 and explore your containers virtual networking.

#### Step 6. Access topology nodes

Since the topology nodes are regular containers, you can connect to them just like to any other container.

```
docker exec -it clab-bgp-router1.dc1 bash
```
