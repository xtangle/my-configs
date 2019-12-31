#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Started exporting all configs"

# executes all files in the export directory except this one
eval "$(find "${MY_CONFIGS_SCRIPTS}/configure/export" -maxdepth 1 -type f ! -name 'export-all.sh' -exec echo \'{}\'';' \;)"

echo ">> Finished exporting all configs"
