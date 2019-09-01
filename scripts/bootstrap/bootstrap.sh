#!/usr/bin/env bash

function bootstrap {
  export CONFIG_FILES="${HOME}/Projects/my-configs/files"
  export CONFIG_SCRIPTS="${HOME}/Projects/my-configs/scripts"

  # adds configure, import, and export directories to PATH
  export PATH="${CONFIG_SCRIPTS}/configure:${CONFIG_SCRIPTS}/import:${CONFIG_SCRIPTS}/export:${PATH}"

  # set a different provision results file and logs directory to not overwrite the one from devbox
  export RESULTS_FILE="${HOME}/devbox/out/provision-results.my-configs.csv"
  export LOGS_DIR="${HOME}/devbox/out/logs.my-configs"

  # sources all files in the bootstrap directory of devbox scripts except bootstrap.sh
  eval "$(find "${HOME}/devbox/scripts/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)"

  # sources all files in the bootstrap directory of my-configs except bootstrap.sh
  eval "$(find "${CONFIG_SCRIPTS}/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)"

  export HAS_BOOTSTRAPED="true"
}

export -f bootstrap
