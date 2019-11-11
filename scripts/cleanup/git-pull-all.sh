#!/usr/bin/env bash

set -e

function git_pull {
  pushd "${1}" >/dev/null
  if git ls-remote >/dev/null 2>&1; then
    echo "In: $(pwd)"
    # shellcheck disable=SC2015
    yes | git fetch \
      && [[ "$(git rev-parse HEAD)" != "$(git rev-parse "@{u}")" ]] \
      && git pull \
      || true
  fi
  popd >/dev/null
}

# run 'git pull' in every subdirectory of Projects if a remote is configured
function git_pull_all {
  local -r projects_dir="$(realpath "${1}")"
  cd "${projects_dir}"
  echo ">> Updating all git repositories in: ${projects_dir}"
  find . -maxdepth 1 -type d -print0 | while IFS= read -r -d '' dir; do git_pull "${dir}"; done
}

git_pull_all "${1:-${HOME}/Projects}"
