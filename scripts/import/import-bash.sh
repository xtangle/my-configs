#!/usr/bin/env bash

set -e

backup ${HOME}/.bashrc
cp -f ${config_files}/Bash/.bashrc ${HOME}
