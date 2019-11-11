#!/usr/bin/env bash

source bootstrap-devbox

export MY_CONFIGS_DIR="${HOME}/Projects/my-configs"
export MY_CONFIGS_FILES="${MY_CONFIGS_DIR}/files"
export MY_CONFIGS_SCRIPTS="${MY_CONFIGS_DIR}/scripts"

# sources all files in the bootstrap directory of my-configs except this one
eval "$(find "${MY_CONFIGS_SCRIPTS}/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)"

export MY_CONFIGS_HAS_BOOTSTRAPED="true"
