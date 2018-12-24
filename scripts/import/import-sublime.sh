#!/usr/bin/env bash

set -e

# copy configs
sublime_configs="${HOME}/.config/sublime-text-3/Packages/User"
mkdir -p ${sublime_configs}
backup "${sublime_configs}/Default (Linux).sublime-keymap"
backup "${sublime_configs}/Preferences.sublime-settings"
cp -f ${config_files}/Sublime/* ${sublime_configs}

# adjust dpi scaling if high resolution
if [[ ${screen_width} -gt 2560 ]]; then
  scale_factor=$(bc <<< "scale=2; 1 + 3 * ((${screen_width} / 2560) - 1)")
  cat <<< "$(cat "${sublime_configs}/Preferences.sublime-settings" | sed '/\/\//d' | jq ". + {dpi_scale: ${scale_factor}}")" > ${sublime_configs}/Preferences.sublime-settings
fi
