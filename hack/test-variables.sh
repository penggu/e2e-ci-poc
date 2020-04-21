#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

jq .env ${CLUSTER_DEFINITION} | jq -r 'keys[] as $k | "export \($k)=\"\(.[$k])\""'
