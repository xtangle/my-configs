#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for KDE"

echo ">> Importing configuration for Dolphin"
mkdir -p "${HOME}/.local/share/kxmlgui5/dolphin/"
backup "${HOME}/.local/share/kxmlgui5/dolphin/dolphinui.rc"
cp -f "${MY_CONFIGS_FILES}/KDE/dolphin/dolphinui.rc" "${HOME}/.local/share/kxmlgui5/dolphin"
