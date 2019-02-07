#!/usr/bin/env bash

set -e

sublime_configs="${HOME}/.config/sublime-text-3/Packages/User"
cp -f "${sublime_configs}/Preferences.sublime-settings" ${CONFIG_FILES}/Sublime
cp -f "${sublime_configs}/Default (Linux).sublime-keymap" ${CONFIG_FILES}/Sublime

# don't include dpi scale in exported configs, it is configured automatically in import-sublime.sh
cat <<< "$(cat "${sublime_configs}/Preferences.sublime-settings" | sed '/\/\//d' | jq 'del(.dpi_scale)')" > ${sublime_configs}/Preferences.sublime-settings
