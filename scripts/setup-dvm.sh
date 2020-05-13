#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

source "${REPO_ROOT}/hack/ensure-packages.sh"
source "${REPO_ROOT}/hack/ensure-docker.sh"
source "${REPO_ROOT}/hack/ensure-azcli.sh"
source "${REPO_ROOT}/hack/ensure-azscert.sh"
