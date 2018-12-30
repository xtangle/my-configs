#!/usr/bin/env bash

set -e

# loads nvm
[[ -s ${HOME}/.nvm/nvm.sh ]] && . ${HOME}/.nvm/nvm.sh

# installs useful global packages for yarn
packages=(@angular/cli @vue/cli create-react-app polymer-cli yo degit how-2)
yarn global --silent add "${packages[@]}" 2>/dev/null
yarn global --silent upgrade --latest 2>/dev/null
