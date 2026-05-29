#!/usr/bin/env bash
source "scripts/utils.sh"

target="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/spaceship-prompt"
url="https://github.com/spaceship-prompt/spaceship-prompt.git"
clone_repo $url $target

# Symlink spaceship.zsh-theme to your oh-my-zsh custom themes directory:
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

success "Installed Oh My Zsh Spaceship theme"

#TODO: sync config file
#"$HOME/dev-environment/scripts/sync-p10k_zsh.sh"