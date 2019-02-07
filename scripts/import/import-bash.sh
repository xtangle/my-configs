#!/usr/bin/env bash

set -e

backup ${HOME}/.bashrc
cp -f ${CONFIG_FILES}/Bash/.bashrc ${HOME}

backup ${HOME}/.bash_aliases
cp -f ${CONFIG_FILES}/Bash/.bash_aliases ${HOME}
