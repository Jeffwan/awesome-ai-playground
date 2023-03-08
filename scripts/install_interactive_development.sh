#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit
IFS=$'\n\t'
export AWS_DEFAULT_OUTPUT="json"

# Install dependencies. These commands has been moved to earlier stage
# sudo apt update
# sudo apt install wget git python3 python3-venv

pip3 install jupyter jupyterlab