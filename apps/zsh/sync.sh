#!/usr/bin/env bash
source "scripts/utils.sh"

cp "$DEV_ENV/apps/zsh/zshrc" "$HOME/.zshrc"
success "Synced .zshrc" 