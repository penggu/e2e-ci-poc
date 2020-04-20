#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

git clone https://github.com/jadarsie/e2e-ci-poc -b one-time

REPO_ROOT=e2e-ci-poc
source "${REPO_ROOT}/hack/ensure-packages.sh"
source "${REPO_ROOT}/hack/ensure-docker.sh"
source "${REPO_ROOT}/hack/ensure-azcli.sh"
source "${REPO_ROOT}/hack/ensure-azscert.sh"
