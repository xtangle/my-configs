#!/usr/bin/env bash

# this script provisions apps and configuration specific to my tastes, and is intended to run
# as the last step in the provisioning process of my other repo: <TODO: PUT REPO LINK>

source ${HOME}/Projects/my-configs/scripts/bootstrap/bootstrap.sh
bootstrap

reset_results_file

run configure-my-configs.sh
run configure-tilda.sh

${config_scripts}/bin/import-configs.sh

print_results
