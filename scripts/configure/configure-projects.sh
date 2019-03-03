#!/usr/bin/env bash

set -e

function git_pull {
  cd "${1}"
  if git ls-remote >/dev/null 2>&1; then
    echo "In: $(pwd)"
    # shellcheck disable=SC2015
    yes | git fetch \
      && [[ "$(git rev-parse HEAD)" != "$(git rev-parse "@{u}")" ]] \
      && git pull \
      || true
  fi
}

echo "Updating git repositories in: ${HOME}/Projects"

# run 'git pull' in every subdirectory of Projects if a remote is configured
find "${HOME}/Projects" -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dir; do git_pull "${dir}"; done
