#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Git"

backup "${HOME}/.gitconfig"
cp -f "${MY_CONFIGS_FILES}/Git/.gitconfig" "${HOME}"
