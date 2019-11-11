#!/usr/bin/env bash

set -e
source bootstrap-my-configs

# install useful packages that are needed in other installation scripts
sudo -E apt-get -qy install lynx yadm
