#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

ensure_azcli() {
  if ! [ -x "$(command -v az)" ]; then
    if [[ "${OSTYPE}" == "linux-gnu" ]]; then
      echo "az not found, installing"
      curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
      sudo sed -i -e "\$aREQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt" /etc/environment
    else
      echo "Missing required binary in path: $2"
      return 2
    fi
  fi
}

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
ensure_azcli
