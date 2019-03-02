#!/usr/bin/env bash

set -e

# load nvm if exists
load "${HOME}/.nvm/nvm.sh"

# installs useful global packages for yarn
packages=(@angular/cli @vue/cli create-react-app polymer-cli serve yo degit how-2)
yarn global --silent add "${packages[@]}" 2>/dev/null
yarn global --silent upgrade --latest 2>/dev/null
