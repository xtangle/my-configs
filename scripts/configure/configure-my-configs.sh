#!/usr/bin/env bash

set -e

# add bin directory in my-configs to PATH
mkdir -p "${HOME}/.rc"
cat > "${HOME}/.rc/my-configs" << EOL
export PATH=${CONFIG_SCRIPTS}/bin:\${PATH}
EOL
if ! contains "source ${HOME}/.rc/my-configs" "${HOME}/.profile" ; then
  echo -e "source ${HOME}/.rc/my-configs" >> "${HOME}/.profile"
fi
