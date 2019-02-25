#!/usr/bin/env bash

set -e

# increase inotify limit
backup "/etc/sysctl.d/60-jetbrains.conf"
sudo cp -f "${CONFIG_FILES}/IntelliJ/60-jetbrains.conf" "/etc/sysctl.d"
