#!/usr/bin/env bash

set -e

backup ${HOME}/.vimrc
cp -f ${config_files}/Vim/.vimrc ${HOME}
