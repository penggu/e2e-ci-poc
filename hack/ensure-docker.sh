#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

installMoby() {
  UBUNTU_RELEASE=$(lsb_release -r -s)
  curl -s https://packages.microsoft.com/config/ubuntu/${UBUNTU_RELEASE}/prod.list >/tmp/microsoft-prod.list
  sudo cp /tmp/microsoft-prod.list /etc/apt/sources.list.d/
  curl -s https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >/tmp/microsoft.gpg
  sudo cp /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo apt-get update
  sudo apt-get install -y moby-engine moby-cli
  sudo usermod -aG docker $USER
}

ensure_docker() {
  if ! [ -x "$(command -v docker)" ]; then
    if [[ "${OSTYPE}" == "linux-gnu" ]]; then
      echo "docker not found, installing"
      installMoby
    else
      echo "Missing required binary in path: $2"
      return 2
    fi
  fi
}

ensure_docker
