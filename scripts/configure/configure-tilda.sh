#!/usr/bin/env bash

set -e
source bootstrap-my-configs

# start tilda on login
# delay is needed for transparency to work
mkdir -p "${HOME}/.config/autostart"
sudo cp -f /usr/share/applications/tilda.desktop "${HOME}/.config/autostart"
sudo chown -R vagrant "${HOME}/.config/autostart"
chmod 664 "${HOME}/.config/autostart/tilda.desktop"
sed -i 's/^Exec=.*/Exec=bash -c \"sleep 5; exec tilda\"/' "${HOME}/.config/autostart/tilda.desktop"
