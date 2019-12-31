#!/usr/bin/env bash

set -e
source bootstrap-my-configs

if ! installed starship; then
  sudo -E snap install starship
else
  sudo -E snap refresh kotlin
fi
