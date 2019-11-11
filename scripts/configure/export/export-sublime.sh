#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for Sublime"

sublime_configs="${HOME}/.config/sublime-text-3/Packages/User"
cp -f "${sublime_configs}/Preferences.sublime-settings" "${MY_CONFIGS_FILES}/Sublime"
cp -f "${sublime_configs}/Default (Linux).sublime-keymap" "${MY_CONFIGS_FILES}/Sublime"

# don't include dpi scale in exported configs, it is configured automatically in import-sublime.sh
settings="${MY_CONFIGS_FILES}/Sublime/Preferences.sublime-settings"
tmp_settings="${settings}.tmp"
sed '/\/\//d' "${settings}" | jq 'del(.dpi_scale)' > "${tmp_settings}" \
  && mv "${tmp_settings}" "${settings}"
