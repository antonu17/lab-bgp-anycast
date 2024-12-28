#!/bin/bash

build_images() {
  docker build --target base --tag node-base .
  docker build --target bird --tag node-bird .
  docker build --target frr --tag node-frr .
}

if ! command -v clab >/dev/null 2>&1; then
  echo "deb [trusted=yes] https://netdevops.fury.site/apt/ /" | \
  sudo tee -a /etc/apt/sources.list.d/netdevops.list
  sudo apt update && sudo apt install containerlab
fi

if ! docker image inspect node-base >/dev/null 2>&1; then
  build_images
fi

[ "$1" == "--rebuild" ] && build_images

sudo clab destroy
sudo clab deploy
