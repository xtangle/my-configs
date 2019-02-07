#!/usr/bin/env bash

set -e

backup ${HOME}/.vimrc
cp -f ${CONFIG_FILES}/Vim/.vimrc ${HOME}
