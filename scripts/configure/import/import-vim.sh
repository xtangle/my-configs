#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Vim"

backup "${HOME}/.vimrc"
cp -f "${MY_CONFIGS_FILES}/Vim/.vimrc" "${HOME}"
