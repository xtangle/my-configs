#!/usr/bin/env bash

# this script provisions apps and configuration specific to my tastes, and is intended to run
# as the last step in the provisioning process of my other repo: https://github.com/xtangle/devbox

# shellcheck source=/dev/null
source "${HOME}/Projects/my-configs/scripts/bootstrap/bootstrap.sh"
bootstrap

reset_results_file
clear_logs_dir

run configure-my-configs.sh
run configure-my-secrets.sh
run configure-tilda.sh
run configure-yarn.sh
run configure-intellij.sh

"${CONFIG_SCRIPTS}/import-configs.sh"

run git-clone-all.sh
run git-pull-all.sh

print_results
