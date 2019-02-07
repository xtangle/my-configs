#!/usr/bin/env bash

set -e

backup ${HOME}/.gitconfig
cp -f ${CONFIG_FILES}/Git/.gitconfig ${HOME}
