#!/usr/bin/env bash -x

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

# source input.env
source $1

${REPO_ROOT}/scripts/e2e.sh
