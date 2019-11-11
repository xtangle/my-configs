#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Bash"

backup "${HOME}/.bashrc"
cp -f "${MY_CONFIGS_FILES}/Bash/.bashrc" "${HOME}"

backup "${HOME}/.bash_aliases"
cp -f "${MY_CONFIGS_FILES}/Bash/.bash_aliases" "${HOME}"
