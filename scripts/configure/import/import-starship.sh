#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Starship"

mkdir -p "${HOME}/.config"
backup "${HOME}/.config/starship.toml"
cp -f "${MY_CONFIGS_FILES}/Starship/starship.toml" "${HOME}/.config"
