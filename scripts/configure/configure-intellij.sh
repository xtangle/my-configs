#!/usr/bin/env bash

set -e
source bootstrap-my-configs

# increase inotify limit
backup "/etc/sysctl.d/60-jetbrains.conf"
sudo cp -f "${MY_CONFIGS_FILES}/IntelliJ/60-jetbrains.conf" "/etc/sysctl.d"
