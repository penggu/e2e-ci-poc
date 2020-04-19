#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

ensure_package() {
    if ! [ -x "$(command -v ${2})" ]; then
        if [[ "${OSTYPE}" == "linux-gnu" ]]; then
            echo "${2} not found, installing"
            sudo apt-get update
            sudo apt-get install -y $1
        else
            echo "Missing required binary in path: $2"
            return 2
        fi
    fi
}

ensure_package jq jq
