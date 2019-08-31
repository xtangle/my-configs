#!/usr/bin/env bash

set -e

# copy configs
mkdir -p "${HOME}/.config/tilda"
backup "${HOME}/.config/tilda/config_0"
cp -f "${CONFIG_FILES}/Tilda/config_0" "${HOME}/.config/tilda"

# adjust positioning
width_ratio=0.75
height_ratio=0.7
width_pixels=$(bc <<< "${width_ratio} * ${SCREEN_WIDTH} / 1")
height_pixels=$(bc <<< "${height_ratio} * ${SCREEN_HEIGHT} / 1")
x_pos=$(bc <<< "(${SCREEN_WIDTH} - ${width_pixels}) / 2")
y_pos=0

sed -i -E \
  -e "s/(max_width)=.*/\1=${width_pixels}/" \
  -e "s/(max_height)=.*/\1=${height_pixels}/" \
  -e "s/(x_pos)=.*/\1=${x_pos}/" \
  -e "s/(y_pos)=.*/\1=${y_pos}/" \
  "${HOME}/.config/tilda/config_0"
