#!/usr/bin/env bash

source ${HOME}/Projects/my-configs/scripts/bootstrap/bootstrap.sh
bootstrap

run import-bash.sh
run import-git.sh
run import-tilda.sh
run import-sublime.sh
run import-vim.sh
