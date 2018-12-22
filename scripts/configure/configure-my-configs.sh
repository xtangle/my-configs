#!/usr/bin/env bash

set -e

# add import-configs.sh and export-configs.sh to PATH
mkdir -p ${HOME}/.rc
cat > ${HOME}/.rc/my-configs << EOL
export PATH=${config_scripts}/bin:\${PATH}
EOL

if ! contains "source ${HOME}/.rc/my-configs" ${HOME}/.profile ; then
  echo -e "source ${HOME}/.rc/my-configs" >> ${HOME}/.profile
fi
