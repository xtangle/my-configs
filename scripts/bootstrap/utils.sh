#!/usr/bin/env bash

# shellcheck disable=2155

function get_screen_width {
  if [[ -n "${DISPLAY_WIDTH}" ]]; then
    echo "${DISPLAY_WIDTH}"
  else
    xdpyinfo | grep -oP 'dimensions:\s+\K\S+(?=x)'
  fi
}

function get_screen_height {
  if [[ -n "${DISPLAY_HEIGHT}" ]]; then
    echo "${DISPLAY_HEIGHT}"
  else
    xdpyinfo | grep -oP 'dimensions:\s+\S+x\K\S+'
  fi
}

export SCREEN_WIDTH=$(get_screen_width)
export SCREEN_HEIGHT=$(get_screen_height)
