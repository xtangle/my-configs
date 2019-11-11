#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Git"

cp -f "${HOME}/.gitconfig" "${MY_CONFIGS_FILES}/Git"
