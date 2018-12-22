#!/usr/bin/env bash

set -e

killall -q tilda || true
mkdir -p ${HOME}/.config/tilda
rm -rf ${HOME}/.config/tilda/*
cp -f ${config_files}/Tilda/config_0 ${HOME}/.config/tilda
nohup tilda >/dev/null 2>&1 &
