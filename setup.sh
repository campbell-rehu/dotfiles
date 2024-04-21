#!/bin/bash

set -e
CUSTOM_CONFIG_FILE_PATHS=($PWD/config/lvim/custom-config.lua $PWD/config/fish/custom-config.fish $PWD/config/alacritty/custom.toml $PWD/config/nvim/lua/campbellrehu/custom/init.lua)

if [[ $# -ge 1 ]]; then
    if [[ $1 != "--dry-run" ]]; then
        echo "Error: Invalid argument. Use --dry-run for dry run mode."
        echo "Usage: ./setup.sh [--dry-run]"
        exit 1
    fi
    curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- "$1" $PWD/config ~/.config echo ${CUSTOM_CONFIG_FILE_PATHS[*]}
    exit 0
else
  echo "$1"
  curl -sS https://raw.githubusercontent.com/campbell-rehu/sym-link-test/main/run.sh | bash -s -- $PWD/config ~/.config echo ${CUSTOM_CONFIG_FILE_PATHS[*]}
  exit 0
fi
