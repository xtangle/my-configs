#!/usr/bin/env bash

set -e
source bootstrap-my-configs

installed_version="$(find "${HOME}" -maxdepth 1 -type d -name ".IntelliJIdea*" | sort -r | head -1 | grep -Po 'IntelliJIdea\K.*')"

if [[ -z "${installed_version}" ]]; then
  echo ">> IntelliJ is not installed!"
  exit 1
fi

# increase inotify limit
backup "/etc/sysctl.d/60-jetbrains.conf"
sudo cp -f "${MY_CONFIGS_FILES}/IntelliJ/60-jetbrains.conf" "/etc/sysctl.d"

# sometimes, IntelliJ on Linux does not pick up your custom keymaps
# to fix this, keymaps needs to be copied to this folder: "${HOME}/.config/JetBrains/IntelliJIdea${installed_version}/jba_config/linux.keymaps"
cp -f "${MY_CONFIGS_FILES}/IntelliJ/Jacky_s Keymap.xml" "${HOME}/.config/JetBrains/IntelliJIdea${installed_version}/jba_config/linux.keymaps"
