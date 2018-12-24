#!/usr/bin/env bash

set -e

# stop tilda
killall -q tilda || true

# copy configs
mkdir -p ${HOME}/.config/tilda
backup ${HOME}/.config/tilda/config_0
cp -f ${config_files}/Tilda/config_0 ${HOME}/.config/tilda

# adjust positioning
width_ratio=0.75
height_ratio=0.65
width_pixels=$(bc <<< "${width_ratio} * ${screen_width} / 1")
height_pixels=$(bc <<< "${height_ratio} * ${screen_height} / 1")
x_pos=$(bc <<< "(${screen_width} - ${width_pixels}) / 2")
y_pos=0

sed -i -E \
  -e "s/(max_width)=.*/\1=${width_pixels}/" \
  -e "s/(max_height)=.*/\1=${height_pixels}/" \
  -e "s/(x_pos)=.*/\1=${x_pos}/" \
  -e "s/(y_pos)=.*/\1=${y_pos}/" \
  ${HOME}/.config/tilda/config_0

# start tilda
nohup tilda >/dev/null 2>&1 &
