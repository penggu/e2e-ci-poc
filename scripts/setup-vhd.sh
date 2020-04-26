#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

source "./packer.env"
source "./ensure-packages.sh"
source "./ensure-docker.sh"
source "./ensure-azcli.sh"

git clone https://github.com/azure/aks-engine /opt/aks-engine
(cd /opt/aks-engine && git fetch --tags)

docker pull ${DEV_IMAGE}
