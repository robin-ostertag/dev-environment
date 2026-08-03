#!/usr/bin/env bash
source "scripts/utils.sh"

mkdir -p "$HOME/.config/nvim"
cp "linux/init.lua" "$HOME/.config/nvim/init.lua"
success "Synced nvim config" 