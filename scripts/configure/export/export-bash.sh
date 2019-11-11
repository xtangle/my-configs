#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Bash"

cp -f "${HOME}/.bashrc" "${MY_CONFIGS_FILES}/Bash"
cp -f "${HOME}/.bash_aliases" "${MY_CONFIGS_FILES}/Bash"
