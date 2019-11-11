#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Tilda"

cp -f "${HOME}/.config/tilda/config_0" "${MY_CONFIGS_FILES}/Tilda"
