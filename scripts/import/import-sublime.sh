#!/usr/bin/env bash

set -e

# copy configs
sublime_configs="${HOME}/.config/sublime-text-3/Packages/User"
mkdir -p "${sublime_configs}"
backup "${sublime_configs}/Default (Linux).sublime-keymap"
backup "${sublime_configs}/Preferences.sublime-settings"
cp -f "${CONFIG_FILES}/Sublime/"* "${sublime_configs}"

# adjust dpi scaling if high resolution
if [[ ${SCREEN_WIDTH} -gt 2560 ]]; then
  scale_factor=$(bc <<< "scale=2; 1 + 3 * ((${SCREEN_WIDTH} / 2560) - 1)")
  settings="${sublime_configs}/Preferences.sublime-settings"
  tmp_settings="${settings}.tmp"
  sed '/\/\//d' "${settings}" | jq ". + {dpi_scale: ${scale_factor}}" > "${tmp_settings}" \
    && mv "${tmp_settings}" "${settings}"
fi
