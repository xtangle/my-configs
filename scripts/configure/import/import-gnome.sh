#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Gnome"

backup "${MY_CONFIGS_FILES}/Gnome/gtk-3.0/gtk.css"
cp -f "${MY_CONFIGS_FILES}/Gnome/gtk-3.0/gtk.css" "${HOME}/.config/gtk-3.0/gtk.css"
