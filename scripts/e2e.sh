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

source "${REPO_ROOT}/hack/akse-clone.sh"
source "${REPO_ROOT}/hack/akse-build.sh"
source "${REPO_ROOT}/hack/ensure-azscert.sh"

source "${REPO_ROOT}/hack/cloud.sh" > env/cloud.env
source "${REPO_ROOT}/env/cloud.env"
source "${REPO_ROOT}/hack/cloud-register.sh"

source "${REPO_ROOT}/hack/akse-e2e.sh"
