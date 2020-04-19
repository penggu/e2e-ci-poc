#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

# source input.env
source $1

mkdir -p ${REPO_ROOT}/results

KNOWN_HOSTS_OPTIONS='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR'

scp -i ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS_OPTIONS} azureuser@${DVM_HOST}:~/e2e-ci-poc/aks-engine/test/e2e/kubernetes/junit.xml ${REPO_ROOT}/results/junit.xml
