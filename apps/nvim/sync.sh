#!/usr/bin/env bash
set -euo pipefail
# source "./../../config.sh"
source "$DEV_ENV/scripts/utils.sh"

mkdir -p "$HOME/.config/nvim"
cp -r "$DEV_ENV/apps/nvim/config/" "$HOME/.config/nvim/"
success "Synced nvim config" 