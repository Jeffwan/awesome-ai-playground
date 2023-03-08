#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit
IFS=$'\n\t'

sudo apt update
sudo apt install wget git python3 python3-venv
