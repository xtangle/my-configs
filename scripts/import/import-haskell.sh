#!/usr/bin/env bash

set -e

mkdir "${HOME}/.stack"
backup "${HOME}/.stack/config.yaml"
cp -f "${CONFIG_FILES}/Haskell/Stack/config.yaml" "${HOME}/.stack/config.yaml"
