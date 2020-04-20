#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

git clone https://github.com/${AKSE_REPO} -b ${AKSE_BRANCH}

if [[ "${OSTYPE}" == "linux-gnu" ]]; then
    if sudo test -f "/var/lib/waagent/Certificates.pem"; then
        sudo cp /var/lib/waagent/Certificates.pem ${REPO_ROOT}/aks-engine/Certificates.pem
    fi
fi