#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Started importing all configs"

# executes all files in the import directory except this one
eval "$(find "${MY_CONFIGS_SCRIPTS}/configure/import" -maxdepth 1 -type f ! -name 'import-all.sh' -exec echo \'{}\'';' \;)"

echo ">> Finished importing all configs"
