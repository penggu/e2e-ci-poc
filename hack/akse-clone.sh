#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

git clone https://github.com/${AKSE_REPO} -b ${AKSE_BRANCH}
