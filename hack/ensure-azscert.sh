#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..

ensure() {
  if sudo test -f "/var/lib/waagent/Certificates.pem"; then
    sudo cp /var/lib/waagent/Certificates.pem /usr/local/share/ca-certificates/azsCertificate.crt
    sudo update-ca-certificates
    sudo cp /var/lib/waagent/Certificates.pem ${REPO_ROOT}/aks-engine/Certificates.pem
  fi
}

ensure
