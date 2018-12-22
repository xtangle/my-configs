#!/usr/bin/env bash

set -e

backup ${HOME}/.gitconfig
cp -f ${config_files}/Git/.gitconfig ${HOME}
