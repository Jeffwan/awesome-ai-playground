#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit
IFS=$'\n\t'
export AWS_DEFAULT_OUTPUT="json"

# Install common dependencies
sudo apt update
sudo apt install -y wget git python3 python3-pip python3-venv
