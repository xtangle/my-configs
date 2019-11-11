#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Sublime"

# copy configs
sublime_configs="${HOME}/.config/sublime-text-3/Packages/User"
mkdir -p "${sublime_configs}"
backup "${sublime_configs}/Default (Linux).sublime-keymap"
backup "${sublime_configs}/Preferences.sublime-settings"
cp -f "${MY_CONFIGS_FILES}/Sublime/"* "${sublime_configs}"

# adjust dpi scaling if high resolution
if [[ ${PROVISION_DISPLAY_WIDTH} -gt 2560 ]]; then
  scale_factor=$(bc <<< "scale=2; 1 + 3 * ((${PROVISION_DISPLAY_WIDTH} / 2560) - 1)")
  settings="${sublime_configs}/Preferences.sublime-settings"
  tmp_settings="${settings}.tmp"
  sed '/\/\//d' "${settings}" | jq ". + {ui_scale: ${scale_factor}}" > "${tmp_settings}" \
    && mv "${tmp_settings}" "${settings}"
fi
