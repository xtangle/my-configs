#!/usr/bin/env bash

set -e
source bootstrap-my-configs

function install_yarn_pkg {
  local -r installed="${1}"
  local -r pkg="${2}"
  if ! echo "${installed}" | contains "\"${pkg}@"; then
    echo ">> installing global package ${pkg}"
    yarn global add "${pkg}"
  else
    echo ">> ${pkg} is already installed globally"
  fi
}

# load nvm if exists
load "${HOME}/.nvm/nvm.sh"

# installs useful global packages for yarn
packages=(@angular/cli @vue/cli create-react-app polymer-cli serve yo degit how-2)
installed="$(yarn global list)"

for pkg in "${packages[@]}"; do
   install_yarn_pkg "${installed}" "${pkg}"
done

# update all global packages
# the error '/home/vagrant/.yarn/bin/yarn: No such file or directory' comes up occasionally for some reason,
# the solution is to reload nvm
echo ">> updating all global packages"
load "${HOME}/.nvm/nvm.sh"
yarn global upgrade --latest
