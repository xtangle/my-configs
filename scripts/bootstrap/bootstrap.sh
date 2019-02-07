#!/usr/bin/env bash

function bootstrap {
  export CONFIG_FILES="${HOME}/Projects/my-configs/files"
  export CONFIG_SCRIPTS="${HOME}/Projects/my-configs/scripts"

  export PATH="${CONFIG_SCRIPTS}/configure:${CONFIG_SCRIPTS}/import:${CONFIG_SCRIPTS}/export:${PATH}"

  # set a different provision results file to not overwrite the one from devbox
  export RESULTS_FILE="${HOME}/.provision-results.user.csv"

  # sources all files in the bootstrap directory of vagrant-scripts except bootstrap.sh
  eval "$(find "${HOME}/vagrant-scripts/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)"

  # sources all files in the bootstrap directory of my-configs except bootstrap.sh
  eval "$(find "${CONFIG_SCRIPTS}/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)"
}

export -f bootstrap
