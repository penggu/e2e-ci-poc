#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

sudo apt-get update
sudo apt-get install -y git

git clone https://github.com/jadarsie/e2e-ci-poc -b master
