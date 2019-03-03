#!/usr/bin/env bash

set -e

function git_clone {
  local -r repo="${1}"
  local -r dir="$(echo "${repo}" | grep -Po ".*/\K.*(?=\.git)")"
  if [[ ! -d "${dir}" ]]; then
    git clone "${repo}"
  fi
}

function git_clone_all {
  local -r projects_dir="${1}"
  cd "${projects_dir}"
  local -r username="$(cat "${HOME}/.gitconfig" | grep -Po "^\s+username = \K.*")"
  if [[ -z "${username}" ]]; then
    echo "Git username could not be parsed from ~/.gitconfig" >/dev/stderr
    exit 1
  fi
  echo "Cloning all git repositories from '${username}' to: ${projects_dir}"
  local -r repos_url="https://api.github.com/users/${username}/repos?per_page=1000"
  curl -s "${repos_url}" | grep -Poz '"clone_url": "\K.*(?=")' | while IFS= read -r -d '' repo; do git_clone "${repo}"; done
}

git_clone_all "${1:-${HOME}/Projects}"
