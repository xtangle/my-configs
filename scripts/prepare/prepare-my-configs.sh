#!/usr/bin/env bash

set -e

# bootstraps the my-configs bootstrap script to be available in the path
bin_dir="\${HOME}/Projects/my-configs/scripts/bin"
import_dir="\${HOME}/Projects/my-configs/scripts/import"
export_dir="\${HOME}/Projects/my-configs/scripts/export"
mkdir -p "${HOME}/.rc"
cat > "${HOME}/.rc/my-configs" << EOL
export PATH="${bin_dir}:${import_dir}:${export_dir}:\${PATH}"
EOL
source_in_profile "\${HOME}/.rc/my-configs"
