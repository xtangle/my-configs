#!/usr/bin/env bash

set -e

# add bin directory in my-configs to PATH
mkdir -p "${HOME}/.rc"
cat > "${HOME}/.rc/my-configs" << EOL
export PATH=${CONFIG_SCRIPTS}/bin:\${PATH}
EOL
source_in_profile "\${HOME}/.rc/my-configs"
