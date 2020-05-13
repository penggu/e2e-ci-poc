#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

REPO_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
cd "${REPO_ROOT}" || exit 1

# source input.env
source $1

KNOWN_HOSTS_OPTIONS='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR'

scp -i ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS_OPTIONS} $1 azureuser@${DVM_HOST}:~/input.env &
wait

scp -i ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS_OPTIONS} -r * azureuser@${DVM_HOST}:~ &
wait

ssh -q -t -i ${SSH_PRIVATE_KEY} ${KNOWN_HOSTS_OPTIONS} azureuser@${DVM_HOST} "sudo chmod +x ~/scripts/setup-dvm.sh; ~/scripts/setup-dvm.sh"
