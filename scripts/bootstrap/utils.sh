#!/usr/bin/env bash

function get_screen_width {
  if [[ -n "${display_width}" ]]; then
    echo "${display_width}"
  else
    echo "$(xdpyinfo | grep -oP 'dimensions:\s+\K\S+(?=x)')"
  fi
}

function get_screen_height {
  if [[ -n "${display_height}" ]]; then
    echo "${display_height}"
  else
    echo "$(xdpyinfo | grep -oP 'dimensions:\s+\S+x\K\S+')"
  fi
}

export screen_width=$(get_screen_width)
export screen_height=$(get_screen_height)
