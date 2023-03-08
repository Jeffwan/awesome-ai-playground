#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit
IFS=$'\n\t'

# Install dependencies. These commands has been moved to earlier stage
# sudo apt update
# sudo apt install wget git python3 python3-venv

pip install jupyter jupyterlab
