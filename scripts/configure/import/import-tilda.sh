#!/usr/bin/env bash

set -e
source bootstrap-my-configs

echo ">> Importing configuration for Tilda"

# stop tilda
echo ">> Stopping Tilda"
kill_program tilda

# copy configs
mkdir -p "${HOME}/.config/tilda"
backup "${HOME}/.config/tilda/config_0"
cp -f "${MY_CONFIGS_FILES}/Tilda/config_0" "${HOME}/.config/tilda"

# adjust positioning
scale="$(scale_factor)"
width_ratio=0.8
height_ratio=0.7
width_pixels=$(bc <<< "${width_ratio} * ${PROVISION_DISPLAY_WIDTH} / ${scale}")
height_pixels=$(bc <<< "${height_ratio} * ${PROVISION_DISPLAY_HEIGHT} / ${scale}")
x_pos=$(bc <<< "((${PROVISION_DISPLAY_WIDTH} / ${scale}) - ${width_pixels}) / 2")
y_pos=0

sed -i -E \
  -e "s/(max_width)=.*/\1=${width_pixels}/" \
  -e "s/(max_height)=.*/\1=${height_pixels}/" \
  -e "s/(x_pos)=.*/\1=${x_pos}/" \
  -e "s/(y_pos)=.*/\1=${y_pos}/" \
  "${HOME}/.config/tilda/config_0"

# start tilda
echo ">> Starting Tilda"
run_in_background tilda # this does not work, requires X-server to be running (thru ssh)
