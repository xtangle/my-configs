#!/usr/bin/env bash

# shellcheck disable=2155

load_provision_vars

function get_screen_width {
  if [[ -n "${PROVISION_DISPLAY_WIDTH}" ]]; then
    echo "${PROVISION_DISPLAY_WIDTH}"
  else
    xdpyinfo | grep -oP 'dimensions:\s+\K\S+(?=x)'
  fi
}

function get_screen_height {
  if [[ -n "${PROVISION_DISPLAY_HEIGHT}" ]]; then
    echo "${PROVISION_DISPLAY_HEIGHT}"
  else
    xdpyinfo | grep -oP 'dimensions:\s+\S+x\K\S+'
  fi
}

export SCREEN_WIDTH=$(get_screen_width)
export SCREEN_HEIGHT=$(get_screen_height)
