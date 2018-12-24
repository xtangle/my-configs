#!/usr/bin/env bash

set -e

backup ${HOME}/.bashrc
cp -f ${config_files}/Bash/.bashrc ${HOME}

backup ${HOME}/.bash_aliases
cp -f ${config_files}/Bash/.bash_aliases ${HOME}
