#!/usr/bin/env bash

set -e

SUBL_USER_CFGS="${HOME}/.config/sublime-text-3/Packages/User"
mkdir -p ${SUBL_USER_CFGS}
backup ${SUBL_USER_CFGS}/*

cp -f ${config_files}/Sublime/* ${SUBL_USER_CFGS}
