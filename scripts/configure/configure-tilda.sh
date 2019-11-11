#!/usr/bin/env bash

set -e
source bootstrap-my-configs

# start tilda on login
sudo ln -sf /usr/share/applications/tilda.desktop /etc/xdg/autostart/
