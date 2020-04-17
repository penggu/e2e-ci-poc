#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ensure() {
  if [ -f /var/lib/waagent/Certificates.pem ]; then
    cp /var/lib/waagent/Certificates.pem /usr/local/share/ca-certificates/azsCertificate.crt
    update-ca-certificates
  fi
}

ensure
