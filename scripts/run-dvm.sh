#!/usr/bin/env bash -x

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

# source input.env
source $1

KNOWN_HOSTS_OPTIONS='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR'

ssh -t -i ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS_OPTIONS} azureuser@${DVM_HOST} "source ~/input.env; ~/e2e-ci-poc/scripts/e2e.sh"
