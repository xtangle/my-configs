#!/usr/bin/env bash

function scale_factor {
  if [[ -n "${QT_SCREEN_SCALE_FACTORS}" ]]; then
    scale="$(echo "${QT_SCREEN_SCALE_FACTORS}" | head -1 | awk -F '[=;]' '{print $2}')"
  fi
  [[ -z "${scale}" ]] && scale=1
  echo "${scale}"
}

export -f scale_factor
