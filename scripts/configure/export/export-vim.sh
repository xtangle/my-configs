#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Vim"

cp -f "${HOME}/.vimrc" "${MY_CONFIGS_FILES}/Vim"
