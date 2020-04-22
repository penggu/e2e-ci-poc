#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

source "${REPO_ROOT}/env/defaults.env"
source "${REPO_ROOT}/hack/test-variables.sh" > env/test.env
source "${REPO_ROOT}/env/test.env"
source "${REPO_ROOT}/hack/cloud-variables.sh" > env/cloud.env
source "${REPO_ROOT}/env/cloud.env"

source "${REPO_ROOT}/hack/akse-clone.sh"
source "${REPO_ROOT}/hack/akse-build.sh"
source "${REPO_ROOT}/hack/cloud-register.sh"
source "${REPO_ROOT}/hack/akse-e2e.sh"
