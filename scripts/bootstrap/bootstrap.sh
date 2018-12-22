#!/usr/bin/env bash

function bootstrap {
  export config_files="${HOME}/Projects/my-configs/files"
  export config_scripts="${HOME}/Projects/my-configs/scripts"

  export PATH="${config_scripts}/configure:${config_scripts}/import:${config_scripts}/export:${PATH}"

  # set a different provision results file to not overwrite the existing one
  export RESULTS_FILE="${HOME}/.provision-results.user.csv"

  # sources all files in the bootstrap directory of vagrant-scripts except bootstrap.sh
  eval $(find "${HOME}/vagrant-scripts/bootstrap" -maxdepth 1 -type f ! -name 'bootstrap.sh' -exec echo source \'{}\'';' \;)
}

export -f bootstrap
