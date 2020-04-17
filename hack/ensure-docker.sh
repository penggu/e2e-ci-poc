#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

installMoby() {
  UBUNTU_RELEASE=$(lsb_release -r -s)
  curl -s https://packages.microsoft.com/config/ubuntu/${UBUNTU_RELEASE}/prod.list >/tmp/microsoft-prod.list
  cp /tmp/microsoft-prod.list /etc/apt/sources.list.d/
  curl -s https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/tmp/microsoft.gpg
  cp /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
  apt-get update
  apt-get install -y moby-engine moby-cli
  groupadd docker
  usermod -aG docker $USER
}

ensure_docker() {
  if ! [ -x "$(command -v docker)" ]; then
    if [[ "${OSTYPE}" == "linux-gnu" ]]; then
      echo "docker not found, installing"
      sudo installMoby
    else
      echo "Missing required binary in path: $2"
      return 2
    fi
  fi
}

ensure_docker
