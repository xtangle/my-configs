#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Haskell"

mkdir -p "${HOME}/.stack"
backup "${HOME}/.stack/config.yaml"
cp -f "${MY_CONFIGS_FILES}/Haskell/Stack/config.yaml" "${HOME}/.stack/config.yaml"
