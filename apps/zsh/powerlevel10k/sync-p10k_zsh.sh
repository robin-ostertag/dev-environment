#!/usr/bin/env bash
source "scripts/utils.sh"

cp "$DEV_ENV/apps/zsh/powerlevel10k/p10k.zsh" "$HOME/.p10k.zsh"

success "Synced .p10k.zsh (Oh My Zsh p10k theme config)"