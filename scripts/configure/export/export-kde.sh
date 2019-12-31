#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Exporting configuration for KDE"

echo ">> Exporting configuration for Dolphin"
cp -f "${HOME}/.local/share/kxmlgui5/dolphin/dolphinui.rc" "${MY_CONFIGS_FILES}/KDE/dolphin"
