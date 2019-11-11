#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Haskell"

cp -f "${HOME}/.stack/config.yaml" "${MY_CONFIGS_FILES}/Haskell/Stack"
