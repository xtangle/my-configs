#!/usr/bin/env bash

set -e
source bootstrap-my-configs

curl -s https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
