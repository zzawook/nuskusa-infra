#!/usr/bin/env bash

set -euf -o pipefail

apt-get install -y software-properties-common
apt-get install -y htop jq awscli curl wget git
