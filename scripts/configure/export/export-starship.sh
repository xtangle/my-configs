#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Starship"

cp -f "${HOME}/.config/starship.toml" "${MY_CONFIGS_FILES}/Starship"
