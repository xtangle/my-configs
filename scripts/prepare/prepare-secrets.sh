#!/usr/bin/env bash

set -e
source bootstrap-my-configs

# add secret env variables
source_in_profile "\${HOME}/.rc/secrets"
