#!/usr/bin/env bash

set -e

# add secret env variables (if the 'my-secrets' file exists in .rc)
source_in_profile "\${HOME}/.rc/my-secrets"
